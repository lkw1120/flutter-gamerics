/// 최근 검색어 리포지토리 인터페이스
library recent_search_repository;

import 'package:gamerics/core/error/either.dart';
import 'package:gamerics/core/error/failures.dart';

/// 최근 검색어 리포지토리 인터페이스
/// 
/// 로컬 저장소(SharedPreferences)를 통한 최근 검색어 관리 기능을 정의합니다.
/// 비동기 작업의 결과는 Either 타입으로 반환됩니다.
abstract class RecentSearchRepository {
  /// 최근 검색어 목록 조회
  /// 
  /// 저장된 최근 검색어 목록을 반환합니다. (최대 10개, 최신순)
  Future<Either<Failure, List<String>>> getRecentSearches();

  /// 최근 검색어 저장
  /// 
  /// [query] 저장할 검색어
  /// 기존에 같은 검색어가 있으면 제거하고 맨 위에 추가합니다.
  /// 최대 10개를 유지하며, 초과시 가장 오래된 검색어를 제거합니다.
  Future<Either<Failure, void>> saveRecentSearch(String query);

  /// 모든 최근 검색어 삭제
  Future<Either<Failure, void>> clearRecentSearches();

  /// 개별 최근 검색어 삭제
  /// 
  /// [query] 삭제할 검색어
  Future<Either<Failure, void>> deleteRecentSearch(String query);
}

