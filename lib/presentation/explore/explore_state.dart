/// Explore 화면 상태
library explore_state;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gamerics/domain/entities/game.dart';

part 'explore_state.freezed.dart';

/// Explore 화면 상태
@freezed
sealed class ExploreState with _$ExploreState {
  const factory ExploreState({
    @Default([]) List<Game> games,
    @Default(null) String? selectedCategoryId,
    @Default(null) String? selectedCategoryTitle,
    @Default(false) bool isInitialLoading,
    @Default(false) bool isLoadingMore,
    @Default(true) bool canLoadMore,
    @Default(null) String? errorMessage,
  }) = _ExploreState;
}
