/// Game Detail 화면 ViewModel
library detail_viewmodel;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamerics/application/usecases/get_collection_item.dart';
import 'package:gamerics/application/usecases/get_game_detail.dart';
import 'package:gamerics/application/usecases/get_game_screenshots.dart';
import 'package:gamerics/application/usecases/get_game_videos.dart';
import 'package:gamerics/application/usecases/get_games.dart';
import 'package:gamerics/application/usecases/toggle_favorite.dart';
import 'package:gamerics/application/usecases/update_play_status.dart';
import 'package:gamerics/core/error/failure_message_handler.dart';
import 'package:gamerics/core/error/failures.dart';
import 'package:gamerics/domain/entities/collection_item.dart';
import 'package:gamerics/presentation/detail/detail_state.dart';

/// Detail ViewModel
class DetailViewModel extends StateNotifier<DetailState> {
  DetailViewModel({
    required int gameId,
    required GetGameDetail getGameDetail,
    required GetGameScreenshots getGameScreenshots,
    required GetGameVideos getGameVideos,
    required GetGames getGames,
    required GetCollectionItem getCollectionItem,
    required ToggleFavorite toggleFavorite,
    required UpdatePlayStatus updatePlayStatus,
  }) : _gameId = gameId,
       _getGameDetail = getGameDetail,
       _getGameScreenshots = getGameScreenshots,
       _getGameVideos = getGameVideos,
       _getGames = getGames,
       _getCollectionItem = getCollectionItem,
       _toggleFavorite = toggleFavorite,
       _updatePlayStatus = updatePlayStatus,
       super(const DetailState()) {
    loadGameData();
  }

  final int _gameId;
  final GetGameDetail _getGameDetail;
  final GetGameScreenshots _getGameScreenshots;
  final GetGameVideos _getGameVideos;
  final GetGames _getGames;
  final GetCollectionItem _getCollectionItem;
  final ToggleFavorite _toggleFavorite;
  final UpdatePlayStatus _updatePlayStatus;

  /// 게임 데이터 로드 (순차적 호출 + 딜레이)
  Future<void> loadGameData() async {
    state = state.copyWith(
      isInitialLoading: true,
      loadingProgress: 0.0,
      errorMessage: null,
    );
    
    try {
      // 1. 게임 정보 로드 (필수, 비슷한 게임/같은 개발사 게임 로드에 필요)
      await _loadGame();
      state = state.copyWith(loadingProgress: 0.2);
      await Future.delayed(const Duration(milliseconds: 50));
      
      // 2. 스크린샷 로드
      await _loadScreenshots();
      state = state.copyWith(loadingProgress: 0.4);
      await Future.delayed(const Duration(milliseconds: 50));
      
      // 3. 비디오 로드
      await _loadVideos();
      state = state.copyWith(loadingProgress: 0.6);
      await Future.delayed(const Duration(milliseconds: 50));
      
      // 4. 컬렉션 아이템 로드
      await _loadCollectionItem();
      state = state.copyWith(loadingProgress: 0.8);
      await Future.delayed(const Duration(milliseconds: 50));
      
      // 5. 게임 정보가 있으면 비슷한 게임과 같은 개발사 게임 로드
      if (state.game != null) {
        var similarGamesLoaded = false;
        var sameDeveloperGamesLoaded = false;
        
        await Future.wait([
          _loadSimilarGames().then((_) {
            similarGamesLoaded = true;
            if (sameDeveloperGamesLoaded) {
              state = state.copyWith(loadingProgress: 1.0);
            } else {
              state = state.copyWith(loadingProgress: 0.9);
            }
          }),
          _loadSameDeveloperGames().then((_) {
            sameDeveloperGamesLoaded = true;
            if (similarGamesLoaded) {
              state = state.copyWith(loadingProgress: 1.0);
            } else {
              state = state.copyWith(loadingProgress: 0.9);
            }
          }),
        ]);
      }
      state = state.copyWith(loadingProgress: 1.0);
    } finally {
      state = state.copyWith(isInitialLoading: false);
    }
  }

  /// 게임 정보 로드
  Future<void> _loadGame() async {
    state = state.copyWith(isLoadingGame: true, errorMessage: null);

    final result = await _getGameDetail(_gameId);

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoadingGame: false,
          errorMessage: _getErrorMessage(failure),
        );
      },
      (game) {
        state = state.copyWith(isLoadingGame: false, game: game);
        // 게임 정보가 로드되면 비슷한 게임과 같은 개발사 게임도 로드
        _loadSimilarGames();
        _loadSameDeveloperGames();
      },
    );
  }

  /// 스크린샷 로드
  Future<void> _loadScreenshots() async {
    state = state.copyWith(isLoadingScreenshots: true);

    final result = await _getGameScreenshots(_gameId);

    result.fold(
      (failure) {
        state = state.copyWith(isLoadingScreenshots: false);
      },
      (screenshots) {
        state = state.copyWith(
          isLoadingScreenshots: false,
          screenshots: screenshots,
        );
      },
    );
  }

  /// 프로모션/플레이 영상 로드
  Future<void> _loadVideos() async {
    state = state.copyWith(isLoadingVideos: true);

    final result = await _getGameVideos(_gameId);

    result.fold(
      (failure) {
        state = state.copyWith(isLoadingVideos: false);
      },
      (videos) {
        state = state.copyWith(isLoadingVideos: false, videos: videos);
      },
    );
  }

  /// 컬렉션 아이템 로드
  Future<void> _loadCollectionItem() async {
    state = state.copyWith(isLoadingCollection: true);

    final result = await _getCollectionItem(_gameId);

    result.fold(
      (failure) {
        state = state.copyWith(isLoadingCollection: false);
      },
      (item) {
        state = state.copyWith(
          isLoadingCollection: false,
          collectionItem:
              item ??
              CollectionItem(gameId: _gameId, updatedAt: DateTime.now()),
        );
      },
    );
  }

  /// 비슷한 게임 로드
  Future<void> _loadSimilarGames() async {
    final game = state.game;
    if (game == null || game.genreIds.isEmpty) {
      return;
    }

    state = state.copyWith(isLoadingSimilarGames: true);

    // 첫 번째 장르를 사용하여 비슷한 게임 검색
    final result = await _getGames(
      page: 1,
      pageSize: 10,
      ordering: '-rating',
      genres: [game.genreIds.first],
    );

    result.fold(
      (failure) {
        state = state.copyWith(isLoadingSimilarGames: false);
      },
      (paginatedResult) {
        // 현재 게임을 제외한 게임들만 필터링
        final similarGames = paginatedResult.results
            .where((g) => g.id != _gameId)
            .take(8)
            .toList();

        state = state.copyWith(
          isLoadingSimilarGames: false,
          similarGames: similarGames,
        );
      },
    );
  }

  /// 같은 개발사의 게임 로드
  Future<void> _loadSameDeveloperGames() async {
    final game = state.game;
    if (game == null || game.developerIds.isEmpty) {
      return;
    }

    state = state.copyWith(isLoadingSameDeveloperGames: true);

    // 첫 번째 개발사를 사용하여 같은 개발사의 게임 검색
    final result = await _getGames(
      page: 1,
      pageSize: 10,
      ordering: '-rating',
      developers: [game.developerIds.first],
    );

    result.fold(
      (failure) {
        state = state.copyWith(isLoadingSameDeveloperGames: false);
      },
      (paginatedResult) {
        // 현재 게임을 제외한 게임들만 필터링
        final sameDeveloperGames = paginatedResult.results
            .where((g) => g.id != _gameId)
            .take(8)
            .toList();

        state = state.copyWith(
          isLoadingSameDeveloperGames: false,
          sameDeveloperGames: sameDeveloperGames,
        );
      },
    );
  }

  /// 설명 펼치기/접기 토글
  void toggleDescription() {
    state = state.copyWith(isDescriptionExpanded: !state.isDescriptionExpanded);
  }

  /// 즐겨찾기 토글
  Future<void> toggleFavorite() async {
    final result = await _toggleFavorite(_gameId, game: state.game);

    result.fold(
      (failure) {
        state = state.copyWith(errorMessage: _getErrorMessage(failure));
      },
      (_) {
        _loadCollectionItem();
      },
    );
  }

  /// 플레이 상태 업데이트
  Future<void> updatePlayStatus(PlayStatus playStatus) async {
    final result = await _updatePlayStatus(_gameId, playStatus, game: state.game);

    result.fold(
      (failure) {
        state = state.copyWith(errorMessage: _getErrorMessage(failure));
      },
      (_) {
        _loadCollectionItem();
      },
    );
  }

  String _getErrorMessage(Failure failure) {
    return FailureMessageHandler.getUserMessage(failure);
  }
}
