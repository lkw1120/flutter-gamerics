/// 게임 목록 조회 UseCase
library get_games;

import 'package:gamerics/core/error/either.dart';
import 'package:gamerics/core/error/failures.dart';
import 'package:gamerics/domain/entities/game.dart';
import 'package:gamerics/domain/entities/paginated_result.dart';
import 'package:gamerics/domain/repositories/game_repository.dart';

/// 게임 목록 조회 UseCase
/// 
/// 게임 목록을 조회하는 비즈니스 로직을 캡슐화합니다.
/// 필터링, 정렬, 페이지네이션 파라미터를 받아 게임 목록을 반환합니다.
class GetGames {
  GetGames(this._repository);

  final GameRepository _repository;

  Future<Either<Failure, PaginatedResult<Game>>> call({
    int page = 1,
    int pageSize = 20,
    String? ordering,
    String? dates,
    List<int>? platforms,
    List<int>? genres,
    List<int>? developers,
  }) {
    return _repository.getGames(
      page: page,
      pageSize: pageSize,
      ordering: ordering,
      dates: dates,
      platforms: platforms,
      genres: genres,
      developers: developers,
    );
  }
}

