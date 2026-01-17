/// 최근 검색어 저장 UseCase
library save_recent_search;

import 'package:gamerics/core/error/either.dart';
import 'package:gamerics/core/error/failures.dart';
import 'package:gamerics/domain/repositories/recent_search_repository.dart';

/// 최근 검색어 저장 UseCase
/// 
/// 검색어를 최근 검색어 목록에 저장하는 비즈니스 로직을 캡슐화합니다.
class SaveRecentSearch {
  SaveRecentSearch(this._repository);

  final RecentSearchRepository _repository;

  Future<Either<Failure, void>> call(String query) {
    return _repository.saveRecentSearch(query);
  }
}

