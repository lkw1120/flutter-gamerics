/// 게임 리포지토리 인터페이스
library game_repository;

import 'package:gamerics/core/error/either.dart';
import 'package:gamerics/domain/entities/game.dart';
import 'package:gamerics/domain/entities/game_screenshot.dart';
import 'package:gamerics/domain/entities/game_video.dart';
import 'package:gamerics/domain/entities/paginated_result.dart';
import 'package:gamerics/core/error/failures.dart';

/// 게임 리포지토리 인터페이스
/// 
/// RAWG API를 통한 게임 데이터 조회 기능을 정의합니다.
/// 비동기 작업의 결과는 Either 타입으로 반환됩니다.
abstract class GameRepository {
  /// 게임 목록 조회
  /// 
  /// [page] 페이지 번호 (1부터 시작)
  /// [pageSize] 페이지당 항목 수
  /// [ordering] 정렬 기준 (예: '-added', '-rating')
  /// [dates] 출시일 범위 (예: '2024-01-01,2024-12-31')
  /// [platforms] 플랫폼 ID 목록
  /// [genres] 장르 ID 목록
  /// [developers] 개발사 ID 목록
  Future<Either<Failure, PaginatedResult<Game>>> getGames({
    int page = 1,
    int pageSize = 20,
    String? ordering,
    String? dates,
    List<int>? platforms,
    List<int>? genres,
    List<int>? developers,
  });

  /// 게임 검색
  /// 
  /// [query] 검색어
  /// [page] 페이지 번호
  /// [pageSize] 페이지당 항목 수
  Future<Either<Failure, PaginatedResult<Game>>> searchGames({
    required String query,
    int page = 1,
    int pageSize = 20,
  });

  /// 게임 상세 정보 조회
  /// 
  /// [id] 게임 ID
  Future<Either<Failure, Game>> getGameById(int id);

  /// 게임 스크린샷 조회
  /// 
  /// [gameId] 게임 ID
  Future<Either<Failure, List<GameScreenshot>>> getGameScreenshots(
    int gameId,
  );

  /// 게임 프로모션/플레이 영상 조회
  /// 
  /// [gameId] 게임 ID
  Future<Either<Failure, List<GameVideo>>> getGameVideos(int gameId);

  /// 게임 상세 캐시 전체 삭제
  Future<Either<Failure, void>> clearGameCache();
}

