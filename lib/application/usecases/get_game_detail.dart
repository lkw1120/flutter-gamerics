/// 게임 상세 정보 조회 UseCase
library get_game_detail;

import 'package:gamerics/core/error/either.dart';
import 'package:gamerics/core/error/failures.dart';
import 'package:gamerics/domain/entities/game.dart';
import 'package:gamerics/domain/repositories/game_repository.dart';

/// 게임 상세 정보 조회 UseCase
/// 
/// 게임 ID를 기반으로 상세 정보를 조회하는 비즈니스 로직을 캡슐화합니다.
class GetGameDetail {
  GetGameDetail(this._repository);

  final GameRepository _repository;

  Future<Either<Failure, Game>> call(int gameId) {
    return _repository.getGameById(gameId);
  }
}

