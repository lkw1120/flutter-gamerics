/// 개별 최근 검색어 삭제 UseCase
library delete_recent_search;

import 'package:gamerics/core/error/either.dart';
import 'package:gamerics/core/error/failures.dart';
import 'package:gamerics/domain/repositories/recent_search_repository.dart';

/// 개별 최근 검색어 삭제 UseCase
class DeleteRecentSearch {
  DeleteRecentSearch(this._repository);

  final RecentSearchRepository _repository;

  /// 개별 최근 검색어 삭제
  /// 
  /// [query] 삭제할 검색어
  Future<Either<Failure, void>> call(String query) {
    return _repository.deleteRecentSearch(query);
  }
}

