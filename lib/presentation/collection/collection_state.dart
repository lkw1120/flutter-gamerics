/// Collection 화면 상태
library collection_state;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gamerics/domain/entities/collection_item.dart';

part 'collection_state.freezed.dart';

/// Collection 화면 상태
@freezed
sealed class CollectionState with _$CollectionState {
  const factory CollectionState({
    @Default(0) int selectedTabIndex,
    @Default([]) List<CollectionItem> favoritesItems,
    @Default([]) List<CollectionItem> playingItems,
    @Default([]) List<CollectionItem> finishedItems,
    @Default(false) bool isLoadingFavorites,
    @Default(false) bool isLoadingPlaying,
    @Default(false) bool isLoadingFinished,
    @Default(null) String? errorMessage,
  }) = _CollectionState;
}

