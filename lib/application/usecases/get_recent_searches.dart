/// 최근 검색어 조회 UseCase
library get_recent_searches;

import 'package:gamerics/core/error/either.dart';
import 'package:gamerics/core/error/failures.dart';
import 'package:gamerics/domain/repositories/recent_search_repository.dart';

/// 최근 검색어 조회 UseCase
/// 
/// 최근 검색어 목록을 조회하는 비즈니스 로직을 캡슐화합니다.
class GetRecentSearches {
  GetRecentSearches(this._repository);

  final RecentSearchRepository _repository;

  Future<Either<Failure, List<String>>> call() {
    return _repository.getRecentSearches();
  }
}

