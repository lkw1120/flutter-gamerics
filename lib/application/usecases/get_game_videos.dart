/// 게임 비디오 조회 UseCase
library get_game_videos;

import 'package:gamerics/core/error/either.dart';
import 'package:gamerics/core/error/failures.dart';
import 'package:gamerics/domain/entities/game_video.dart';
import 'package:gamerics/domain/repositories/game_repository.dart';

/// 게임 상세 화면에서 사용할 프로모션/플레이 영상을 조회한다.
/// 게임 ID 를 받아 RAWG API 의 movies 엔드포인트 데이터를 반환한다.
class GetGameVideos {
  /// [GetGameVideos] 생성자
  /// 
  /// [repository] 를 주입받아 호출 시점에 실제 데이터를 요청한다.
  const GetGameVideos(this.repository);

  /// 게임 ID([gameId])로 영상을 조회하고 Either 결과를 반환한다.
  /// 실패 시 [Failure], 성공 시 [List<GameVideo>] 를 전달한다.
  Future<Either<Failure, List<GameVideo>>> call(int gameId) {
    return repository.getGameVideos(gameId);
  }

  /// 게임 데이터 저장소
  final GameRepository repository;
}


