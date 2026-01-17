/// 게임 스크린샷 조회 UseCase
library get_game_screenshots;

import 'package:gamerics/core/error/either.dart';
import 'package:gamerics/core/error/failures.dart';
import 'package:gamerics/domain/entities/game_screenshot.dart';
import 'package:gamerics/domain/repositories/game_repository.dart';

/// 게임 스크린샷 조회 UseCase
/// 
/// 게임 ID를 기반으로 스크린샷 목록을 조회하는 비즈니스 로직을 캡슐화합니다.
class GetGameScreenshots {
  GetGameScreenshots(this._repository);

  final GameRepository _repository;

  Future<Either<Failure, List<GameScreenshot>>> call(int gameId) {
    return _repository.getGameScreenshots(gameId);
  }
}

