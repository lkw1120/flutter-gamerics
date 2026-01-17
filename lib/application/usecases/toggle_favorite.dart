/// 즐겨찾기 토글 UseCase
library toggle_favorite;

import 'package:gamerics/core/error/either.dart';
import 'package:gamerics/core/error/failures.dart';
import 'package:gamerics/domain/entities/game.dart';
import 'package:gamerics/domain/repositories/collection_repository.dart';

/// 즐겨찾기 토글 UseCase
/// 
/// 게임의 즐겨찾기 상태를 토글하는 비즈니스 로직을 캡슐화합니다.
class ToggleFavorite {
  ToggleFavorite(this._repository);

  final CollectionRepository _repository;

  Future<Either<Failure, void>> call(int gameId, {Game? game}) {
    return _repository.toggleFavorite(gameId, game: game);
  }
}

