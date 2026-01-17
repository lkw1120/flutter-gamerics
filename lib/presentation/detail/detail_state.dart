/// Game Detail 화면 상태
library detail_state;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gamerics/domain/entities/collection_item.dart';
import 'package:gamerics/domain/entities/game.dart';
import 'package:gamerics/domain/entities/game_screenshot.dart';
import 'package:gamerics/domain/entities/game_video.dart';

part 'detail_state.freezed.dart';

/// Game Detail 화면 상태
@freezed
sealed class DetailState with _$DetailState {
  const factory DetailState({
    Game? game,
    @Default([]) List<GameScreenshot> screenshots,
    @Default([]) List<GameVideo> videos,
    @Default([]) List<Game> similarGames,
    @Default([]) List<Game> sameDeveloperGames,
    CollectionItem? collectionItem,
    @Default(false) bool isLoadingGame,
    @Default(false) bool isLoadingScreenshots,
    @Default(false) bool isLoadingVideos,
    @Default(false) bool isLoadingCollection,
    @Default(false) bool isLoadingSimilarGames,
    @Default(false) bool isLoadingSameDeveloperGames,
    @Default(false) bool isDescriptionExpanded,
    @Default(false) bool isInitialLoading,
    @Default(0.0) double loadingProgress,
    String? errorMessage,
  }) = _DetailState;
}

