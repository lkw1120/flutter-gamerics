/// 게임 검색 UseCase
library search_games;

import 'package:gamerics/core/error/either.dart';
import 'package:gamerics/core/error/failures.dart';
import 'package:gamerics/domain/entities/game.dart';
import 'package:gamerics/domain/entities/paginated_result.dart';
import 'package:gamerics/domain/repositories/game_repository.dart';

/// 게임 검색 UseCase
/// 
/// 검색어를 기반으로 게임을 검색하는 비즈니스 로직을 캡슐화합니다.
class SearchGames {
  SearchGames(this._repository);

  final GameRepository _repository;

  Future<Either<Failure, PaginatedResult<Game>>> call({
    required String query,
    int page = 1,
    int pageSize = 20,
  }) {
    return _repository.searchGames(
      query: query,
      page: page,
      pageSize: pageSize,
    );
  }
}

