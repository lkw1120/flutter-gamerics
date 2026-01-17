/// 게임 리포지토리 구현
library game_repository_impl;

import 'package:gamerics/core/config/app_config.dart';
import 'package:gamerics/core/error/either.dart';
import 'package:gamerics/core/error/exceptions.dart';
import 'package:gamerics/core/error/failures.dart';
import 'package:gamerics/data/datasources/game_cache_local_datasource.dart';
import 'package:gamerics/data/datasources/rawg_remote_datasource.dart';
import 'package:gamerics/data/models/remote/game_model.dart';
import 'package:gamerics/data/models/remote/game_screenshot_model.dart';
import 'package:gamerics/data/models/remote/game_video_model.dart';
import 'package:gamerics/data/models/remote/paginated_result_model.dart';
import 'package:gamerics/domain/entities/game.dart';
import 'package:gamerics/domain/entities/game_screenshot.dart';
import 'package:gamerics/domain/entities/game_video.dart';
import 'package:gamerics/domain/entities/paginated_result.dart';
import 'package:gamerics/domain/repositories/game_repository.dart';

/// 게임 리포지토리 구현
/// 
/// 원격 데이터소스를 사용하여 게임 데이터를 조회하고,
/// DTO를 엔티티로 변환하여 반환합니다.
/// 게임 상세 정보는 로컬 캐시를 통해 TTL 내 재사용합니다.
class GameRepositoryImpl implements GameRepository {
  GameRepositoryImpl(
    this._remoteDataSource,
    this._gameCacheLocalDataSource,
  );

  final RawgRemoteDataSource _remoteDataSource;
  final GameCacheLocalDataSource _gameCacheLocalDataSource;

  @override
  Future<Either<Failure, PaginatedResult<Game>>> getGames({
    int page = 1,
    int pageSize = 20,
    String? ordering,
    String? dates,
    List<int>? platforms,
    List<int>? genres,
    List<int>? developers,
  }) async {
    try {
      final response = await _remoteDataSource.getGames(
        page: page,
        pageSize: pageSize,
        ordering: ordering,
        dates: dates,
        platforms: platforms,
        genres: genres,
        developers: developers,
      );

      try {
        final model = PaginatedResultModel<GameModel>.fromJson(
          response,
          (json) {
            try {
              return GameModel.fromJson(json as Map<String, dynamic>);
            } catch (e) {
              throw ParsingException('Failed to parse game: $e');
            }
          },
        );

        return Right(
          model.toEntity<Game>((gameModel) => gameModel.toEntity()),
        );
      } catch (e) {
        if (e is ParsingException) {
          rethrow;
        }
        throw ParsingException('Failed to parse paginated result: $e');
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(
        message: e.message,
        statusCode: e.statusCode,
      ));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PaginatedResult<Game>>> searchGames({
    required String query,
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      final response = await _remoteDataSource.searchGames(
        query: query,
        page: page,
        pageSize: pageSize,
      );

      try {
        final model = PaginatedResultModel<GameModel>.fromJson(
          response,
          (json) {
            try {
              return GameModel.fromJson(json as Map<String, dynamic>);
            } catch (e) {
              throw ParsingException('Failed to parse game: $e');
            }
          },
        );

        return Right(
          model.toEntity<Game>((gameModel) => gameModel.toEntity()),
        );
      } catch (e) {
        if (e is ParsingException) {
          rethrow;
        }
        throw ParsingException('Failed to parse search results: $e');
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(
        message: e.message,
        statusCode: e.statusCode,
      ));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Game>> getGameById(int id) async {
    CachedGame? cached;
    
    try {
      // 1. 캐시 확인
      cached = await _gameCacheLocalDataSource.getGame(id);
      if (cached != null) {
        final age = DateTime.now().difference(cached.cachedAt);
        // TTL 체크
        if (age.inHours < AppConfig.gameCacheTTLHours) {
          return Right(cached.game);
        }
      }

      // 2. API 호출
      final response = await _remoteDataSource.getGameById(id);
      try {
        final model = GameModel.fromJson(response);
        final game = model.toEntity();

        // 3. 캐시 저장
        try {
          await _gameCacheLocalDataSource.saveGame(id, game);
        } catch (e) {
          // 캐시 저장 실패는 무시 (API 호출은 성공했으므로)
        }

        return Right(game);
      } catch (e) {
        throw ParsingException('Failed to parse game detail: $e');
      }
    } on ServerException catch (e) {
      // API 실패 시 캐시가 있으면 반환 (stale-while-revalidate)
      if (cached != null) {
        return Right(cached.game);
      }
      return Left(ServerFailure(
        message: e.message,
        statusCode: e.statusCode,
      ));
    } on NetworkException catch (e) {
      // 네트워크 실패 시 캐시가 있으면 반환
      if (cached != null) {
        return Right(cached.game);
      }
      return Left(NetworkFailure(message: e.message));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GameScreenshot>>> getGameScreenshots(
    int gameId,
  ) async {
    try {
      final response = await _remoteDataSource.getGameScreenshots(gameId);
      final results = response['results'] as List<dynamic>?;

      if (results == null) {
        return Right([]);
      }

      try {
        final screenshots = results
            .map((json) {
              try {
                return GameScreenshotModel.fromJson(
                  json as Map<String, dynamic>,
                );
              } catch (e) {
                throw ParsingException('Failed to parse screenshot: $e');
              }
            })
            .map((model) => model.toEntity())
            .toList();

        return Right(screenshots);
      } catch (e) {
        if (e is ParsingException) {
          rethrow;
        }
        throw ParsingException('Failed to parse screenshots: $e');
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(
        message: e.message,
        statusCode: e.statusCode,
      ));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GameVideo>>> getGameVideos(int gameId) async {
    try {
      final response = await _remoteDataSource.getGameVideos(gameId);
      final results = response['results'] as List<dynamic>?;

      if (results == null) {
        return Right([]);
      }

      try {
        final videos = results
            .map((json) {
              try {
                return GameVideoModel.fromJson(json as Map<String, dynamic>);
              } catch (e) {
                throw ParsingException('Failed to parse video: $e');
              }
            })
            .map((model) => model.toEntity())
            .where((video) => video.videoUrl.isNotEmpty)
            .toList();

        return Right(videos);
      } catch (e) {
        if (e is ParsingException) {
          rethrow;
        }
        throw ParsingException('Failed to parse videos: $e');
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(
        message: e.message,
        statusCode: e.statusCode,
      ));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearGameCache() async {
    try {
      await _gameCacheLocalDataSource.clearAll();
      return const Right(null);
    } on LocalStorageException catch (e) {
      return Left(LocalStorageFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}

