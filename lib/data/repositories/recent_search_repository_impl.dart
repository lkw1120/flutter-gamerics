/// 최근 검색어 리포지토리 구현
library recent_search_repository_impl;

import 'package:gamerics/core/error/either.dart';
import 'package:gamerics/core/error/exceptions.dart';
import 'package:gamerics/core/error/failures.dart';
import 'package:gamerics/data/datasources/recent_search_local_datasource.dart';
import 'package:gamerics/domain/repositories/recent_search_repository.dart';

/// 최근 검색어 리포지토리 구현
/// 
/// 로컬 데이터소스(SharedPreferences)를 사용하여 최근 검색어를 관리합니다.
class RecentSearchRepositoryImpl implements RecentSearchRepository {
  RecentSearchRepositoryImpl(this._localDataSource);

  final RecentSearchLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, List<String>>> getRecentSearches() async {
    try {
      final searches = await _localDataSource.getRecentSearches();
      return Right(searches);
    } on LocalStorageException catch (e) {
      return Left(LocalStorageFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveRecentSearch(String query) async {
    try {
      await _localDataSource.saveRecentSearch(query);
      return const Right(null);
    } on LocalStorageException catch (e) {
      return Left(LocalStorageFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearRecentSearches() async {
    try {
      await _localDataSource.clearRecentSearches();
      return const Right(null);
    } on LocalStorageException catch (e) {
      return Left(LocalStorageFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteRecentSearch(String query) async {
    try {
      await _localDataSource.deleteRecentSearch(query);
      return const Right(null);
    } on LocalStorageException catch (e) {
      return Left(LocalStorageFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}

