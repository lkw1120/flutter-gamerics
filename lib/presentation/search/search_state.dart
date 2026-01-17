/// Search 화면 상태
library search_state;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gamerics/domain/entities/game.dart';

part 'search_state.freezed.dart';

/// Search 화면 상태
@freezed
sealed class SearchState with _$SearchState {
  const factory SearchState({
    @Default('') String query,
    @Default([]) List<Game> results,
    @Default(false) bool isLoading,
    @Default(false) bool hasMore,
    @Default(1) int currentPage,
    @Default([]) List<String> recentSearches,
    @Default(null) String? errorMessage,
  }) = _SearchState;
}

