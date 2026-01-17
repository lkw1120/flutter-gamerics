/// 컬렉션 리포지토리 구현
library collection_repository_impl;

import 'package:gamerics/core/error/either.dart';
import 'package:gamerics/core/error/exceptions.dart';
import 'package:gamerics/core/error/failures.dart';
import 'package:gamerics/data/datasources/collection_local_datasource.dart';
import 'package:gamerics/domain/entities/collection_item.dart';
import 'package:gamerics/domain/entities/game.dart';
import 'package:gamerics/domain/repositories/collection_repository.dart';

/// 컬렉션 리포지토리 구현
/// 
/// 로컬 데이터소스(Drift)를 사용하여 컬렉션 데이터를 관리합니다.
class CollectionRepositoryImpl implements CollectionRepository {
  CollectionRepositoryImpl(this._localDataSource);

  final CollectionLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, CollectionItem?>> getCollectionItem(
    int gameId,
  ) async {
    try {
      final item = await _localDataSource.getCollectionItem(gameId);
      return Right(item);
    } on LocalStorageException catch (e) {
      return Left(LocalStorageFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CollectionItem>>> getAllCollectionItems({
    PlayStatus? playStatus,
  }) async {
    try {
      final items = await _localDataSource.getAllCollectionItems(
        playStatus: playStatus,
      );
      return Right(items);
    } on LocalStorageException catch (e) {
      return Left(LocalStorageFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CollectionItem>>> getFavorites() async {
    try {
      final items = await _localDataSource.getFavorites();
      return Right(items);
    } on LocalStorageException catch (e) {
      return Left(LocalStorageFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearAll() async {
    try {
      await _localDataSource.clearAll();
      return const Right(null);
    } on LocalStorageException catch (e) {
      return Left(LocalStorageFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Stream<List<CollectionItem>> watchAllCollectionItems({
    PlayStatus? playStatus,
  }) {
    try {
      return _localDataSource.watchAllCollectionItems(playStatus: playStatus);
    } catch (e) {
      // Stream 에러는 빈 리스트를 emit하여 처리
      return Stream.value([]);
    }
  }

  @override
  Stream<List<CollectionItem>> watchFavorites() {
    try {
      return _localDataSource.watchFavorites();
    } catch (e) {
      // Stream 에러는 빈 리스트를 emit하여 처리
      return Stream.value([]);
    }
  }

  @override
  Future<Either<Failure, void>> saveCollectionItem(
    CollectionItem item,
  ) async {
    try {
      await _localDataSource.saveCollectionItem(item);
      return const Right(null);
    } on LocalStorageException catch (e) {
      return Left(LocalStorageFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCollectionItem(int gameId) async {
    try {
      await _localDataSource.deleteCollectionItem(gameId);
      return const Right(null);
    } on LocalStorageException catch (e) {
      return Left(LocalStorageFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> toggleFavorite(int gameId, {Game? game}) async {
    try {
      final existing = await _localDataSource.getCollectionItem(gameId);
      final now = DateTime.now();

      if (existing == null) {
        final newItem = CollectionItem(
          gameId: gameId,
          isFavorite: true,
          playStatus: PlayStatus.notPlayed,
          updatedAt: now,
          game: game,
        );
        await _localDataSource.saveCollectionItem(newItem);
      } else {
        // Game 정보가 제공되면 업데이트, 없으면 기존 Game 정보 유지
        final updated = existing.copyWith(
          isFavorite: !existing.isFavorite,
          updatedAt: now,
          game: game ?? existing.game,
        );
        await _localDataSource.saveCollectionItem(updated);
      }

      return const Right(null);
    } on LocalStorageException catch (e) {
      return Left(LocalStorageFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updatePlayStatus(
    int gameId,
    PlayStatus playStatus, {
    Game? game,
  }) async {
    try {
      final existing = await _localDataSource.getCollectionItem(gameId);
      final now = DateTime.now();

      if (existing == null) {
        final newItem = CollectionItem(
          gameId: gameId,
          isFavorite: false,
          playStatus: playStatus,
          updatedAt: now,
          game: game,
        );
        await _localDataSource.saveCollectionItem(newItem);
      } else {
        // Game 정보가 제공되면 업데이트, 없으면 기존 Game 정보 유지
        final updated = existing.copyWith(
          playStatus: playStatus,
          updatedAt: now,
          game: game ?? existing.game,
        );
        await _localDataSource.saveCollectionItem(updated);
      }

      return const Right(null);
    } on LocalStorageException catch (e) {
      return Left(LocalStorageFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}

