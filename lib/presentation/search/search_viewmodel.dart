/// Search 화면 ViewModel
library search_viewmodel;

import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamerics/application/usecases/search_games.dart';
import 'package:gamerics/application/usecases/get_recent_searches.dart';
import 'package:gamerics/application/usecases/save_recent_search.dart';
import 'package:gamerics/application/usecases/delete_recent_search.dart';
import 'package:gamerics/core/config/app_config.dart';
import 'package:gamerics/core/error/failure_message_handler.dart';
import 'package:gamerics/core/error/failures.dart';
import 'package:gamerics/presentation/search/search_state.dart';

/// Search ViewModel
class SearchViewModel extends StateNotifier<SearchState> {
  SearchViewModel({
    required SearchGames searchGames,
    GetRecentSearches? getRecentSearches,
    SaveRecentSearch? saveRecentSearch,
    DeleteRecentSearch? deleteRecentSearch,
  }) : _searchGames = searchGames,
       _getRecentSearches = getRecentSearches,
       _saveRecentSearch = saveRecentSearch,
       _deleteRecentSearch = deleteRecentSearch,
       super(const SearchState()) {
    _init();
  }

  final SearchGames _searchGames;
  final GetRecentSearches? _getRecentSearches;
  final SaveRecentSearch? _saveRecentSearch;
  final DeleteRecentSearch? _deleteRecentSearch;
  Timer? _debounceTimer;

  void _init() {
    // UseCase가 준비되면 최근 검색어 로드
    if (_getRecentSearches != null) {
      _loadRecentSearches();
    }
  }

  /// 검색어 업데이트 (디바운스 적용)
  void updateQuery(String query) {
    state = state.copyWith(query: query);

    _debounceTimer?.cancel();
    
        final trimmedQuery = query.trim();
        if (trimmedQuery.isEmpty) {
          state = state.copyWith(results: [], currentPage: 1, hasMore: false, totalCount: 0);
      return;
    }
    
    if (trimmedQuery.length < AppConfig.searchMinLength) {
          state = state.copyWith(
            results: [],
            currentPage: 1,
            hasMore: false,
            totalCount: 0,
            errorMessage: null,
          );
      return;
    }
    
    _debounceTimer = Timer(
      Duration(milliseconds: AppConfig.searchDebounceMs),
      () {
        _search(trimmedQuery);
      },
    );
  }

  /// 게임 검색
  Future<void> _search(String query) async {
    state = state.copyWith(isLoading: true, errorMessage: null, currentPage: 1);

    final result = await _searchGames(query: query, page: 1);

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: _getErrorMessage(failure),
        );
      },
      (paginatedResult) {
        state = state.copyWith(
          isLoading: false,
          results: paginatedResult.results,
          hasMore: paginatedResult.hasNext,
          totalCount: paginatedResult.count,
        );
      },
    );
  }

  /// 더 많은 결과 로드
  Future<void> loadMore() async {
    if (state.isLoading || !state.hasMore || state.query.isEmpty) {
      return;
    }

    state = state.copyWith(isLoading: true);

    final nextPage = state.currentPage + 1;
    final result = await _searchGames(query: state.query, page: nextPage);

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: _getErrorMessage(failure),
        );
      },
      (paginatedResult) {
        state = state.copyWith(
          isLoading: false,
          results: [...state.results, ...paginatedResult.results],
          hasMore: paginatedResult.hasNext,
          currentPage: nextPage,
        );
      },
    );
  }

  /// 최근 검색어 로드
  Future<void> _loadRecentSearches() async {
    final getRecentSearches = _getRecentSearches;
    if (getRecentSearches == null) return;
    
    final result = await getRecentSearches();
    
    result.fold(
      (_) {
        // 에러 발생 시 조용히 무시 (최근 검색어는 선택적 기능)
      },
      (searches) {
        state = state.copyWith(recentSearches: searches);
      },
    );
  }

  /// 최근 검색어 저장 (엔터 입력 시 호출)
  Future<void> saveSearchQuery() async {
    final trimmedQuery = state.query.trim();
    if (trimmedQuery.isEmpty) return;
    
    await _saveToRecentSearches(trimmedQuery);
  }

  /// 최근 검색어 저장
  Future<void> _saveToRecentSearches(String query) async {
    final saveRecentSearch = _saveRecentSearch;
    if (saveRecentSearch == null) return;
    
    final trimmedQuery = query.trim();
    if (trimmedQuery.isEmpty) return;
    
    // 에러 발생 시 조용히 무시 (최근 검색어는 선택적 기능)
    await saveRecentSearch(trimmedQuery);
    
    // 저장 후 최근 검색어 다시 로드하여 UI 업데이트
    await _loadRecentSearches();
  }

  /// 개별 최근 검색어 삭제
  Future<void> deleteRecentSearch(String query) async {
    final deleteRecentSearch = _deleteRecentSearch;
    if (deleteRecentSearch == null) return;
    
    // 에러 발생 시 조용히 무시 (최근 검색어는 선택적 기능)
    await deleteRecentSearch(query);
    
    // 삭제 후 최근 검색어 다시 로드하여 UI 업데이트
    await _loadRecentSearches();
  }

  String _getErrorMessage(Failure failure) {
    return FailureMessageHandler.getUserMessage(failure);
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }
}
