/// 플레이 상태 업데이트 UseCase
library update_play_status;

import 'package:gamerics/core/error/either.dart';
import 'package:gamerics/core/error/failures.dart';
import 'package:gamerics/domain/entities/collection_item.dart';
import 'package:gamerics/domain/entities/game.dart';
import 'package:gamerics/domain/repositories/collection_repository.dart';

/// 플레이 상태 업데이트 UseCase
/// 
/// 게임의 플레이 상태를 업데이트하는 비즈니스 로직을 캡슐화합니다.
class UpdatePlayStatus {
  UpdatePlayStatus(this._repository);

  final CollectionRepository _repository;

  Future<Either<Failure, void>> call(int gameId, PlayStatus playStatus, {Game? game}) {
    return _repository.updatePlayStatus(gameId, playStatus, game: game);
  }
}

