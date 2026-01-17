/// Explore 화면 ViewModel
library explore_viewmodel;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamerics/application/usecases/get_games.dart';
import 'package:gamerics/core/error/failure_message_handler.dart';
import 'package:gamerics/core/error/failures.dart';
import 'package:gamerics/presentation/explore/widgets/explore_categories_data.dart';
import 'package:gamerics/presentation/explore/widgets/explore_category.dart';
import 'package:gamerics/presentation/explore/explore_state.dart';

/// Explore ViewModel
class ExploreViewModel extends StateNotifier<ExploreState> {
  ExploreViewModel(this._getGames)
    : super(
        ExploreState(
          selectedCategoryId: ExploreCategories.defaultCategoryId,
          selectedCategoryTitle: ExploreCategories.defaultCategory.title,
          isInitialLoading: true,
        ),
      ) {
    _applyCategory(ExploreCategories.defaultCategoryId);
  }

  final GetGames _getGames;
  ExploreQuery? _currentQuery;
  int _nextPage = 1;
  bool _hasMore = true;

  Future<void> selectCategory(String categoryId) async {
    if (state.selectedCategoryId == categoryId && state.games.isNotEmpty) {
      return;
    }
    await _applyCategory(categoryId);
  }

  Future<void> refresh() async {
    final target =
        state.selectedCategoryId ?? ExploreCategories.defaultCategoryId;
    await _applyCategory(target);
  }

  Future<void> loadMore() async {
    if (!_hasMore || state.isLoadingMore || state.isInitialLoading) return;
    state = state.copyWith(isLoadingMore: true, errorMessage: null);
    await _fetchPage(reset: false);
  }

  Future<void> _applyCategory(String categoryId) async {
    final category = ExploreCategories.getCategory(categoryId);
    _currentQuery = category.queryBuilder(DateTime.now());
    _nextPage = 1;
    _hasMore = true;

    state = state.copyWith(
      selectedCategoryId: category.id,
      selectedCategoryTitle: category.title,
      games: [],
      isInitialLoading: true,
      isLoadingMore: false,
      canLoadMore: true,
      errorMessage: null,
    );

    await _fetchPage(reset: true);
  }

  Future<void> _fetchPage({required bool reset}) async {
    final query = _currentQuery;
    if (query == null) return;

    final page = _nextPage;
    final result = await _getGames(
      page: page,
      ordering: query.ordering,
      dates: query.dates,
      platforms: query.platforms,
      genres: query.genres,
      developers: query.developers,
    );

    result.fold(
      (failure) {
        state = state.copyWith(
          isInitialLoading: false,
          isLoadingMore: false,
          canLoadMore: _hasMore,
          errorMessage: _getErrorMessage(failure),
        );
      },
      (paginatedResult) {
        final updatedGames = reset
            ? paginatedResult.results
            : [...state.games, ...paginatedResult.results];
        _hasMore = paginatedResult.hasNext;
        if (_hasMore) {
          _nextPage = page + 1;
        }

        state = state.copyWith(
          games: updatedGames,
          isInitialLoading: false,
          isLoadingMore: false,
          canLoadMore: _hasMore,
          errorMessage: null,
        );
      },
    );
  }

  String _getErrorMessage(Failure failure) {
    return FailureMessageHandler.getUserMessage(failure);
  }
}
