/// Collection 화면 ViewModel
library collection_viewmodel;

import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamerics/core/error/failure_message_handler.dart';
import 'package:gamerics/core/error/failures.dart';
import 'package:gamerics/domain/entities/collection_item.dart';
import 'package:gamerics/domain/repositories/collection_repository.dart';
import 'package:gamerics/presentation/collection/collection_state.dart';

/// Collection ViewModel
class CollectionViewModel extends StateNotifier<CollectionState> {
  CollectionViewModel(this._repository) : super(const CollectionState()) {
    _subscribeToStreams();
  }

  final CollectionRepository _repository;
  StreamSubscription<List<CollectionItem>>? _favoritesSubscription;
  StreamSubscription<List<CollectionItem>>? _playingSubscription;
  StreamSubscription<List<CollectionItem>>? _finishedSubscription;

  /// 모든 탭 데이터 스트림 구독
  void _subscribeToStreams() {
    // 초기 로딩 상태 설정 (첫 스트림 이벤트 전까지 스켈레톤 표시)
    state = state.copyWith(
      isLoadingFavorites: true,
      isLoadingPlaying: true,
      isLoadingFinished: true,
    );

    // Favorites 스트림 구독
    _favoritesSubscription = _repository.watchFavorites().listen(
      (items) {
        state = state.copyWith(
          favoritesItems: items,
          isLoadingFavorites: false,
          errorMessage: null,
        );
      },
      onError: (error) {
        state = state.copyWith(
          isLoadingFavorites: false,
          errorMessage: _getErrorMessageFromError(error),
        );
      },
    );

    // Playing 스트림 구독
    _playingSubscription = _repository
        .watchAllCollectionItems(playStatus: PlayStatus.playing)
        .listen(
      (items) {
        state = state.copyWith(
          playingItems: items,
          isLoadingPlaying: false,
          errorMessage: null,
        );
      },
      onError: (error) {
        state = state.copyWith(
          isLoadingPlaying: false,
          errorMessage: _getErrorMessageFromError(error),
        );
      },
    );

    // Finished 스트림 구독
    _finishedSubscription = _repository
        .watchAllCollectionItems(playStatus: PlayStatus.finished)
        .listen(
      (items) {
        state = state.copyWith(
          finishedItems: items,
          isLoadingFinished: false,
          errorMessage: null,
        );
      },
      onError: (error) {
        state = state.copyWith(
          isLoadingFinished: false,
          errorMessage: _getErrorMessageFromError(error),
        );
      },
    );
  }

  /// 탭 변경
  void changeTab(int index) {
    state = state.copyWith(selectedTabIndex: index);
  }

  /// 새로고침 (스트림이 자동으로 업데이트되므로 실제로는 필요 없지만, 호환성을 위해 유지)
  Future<void> refresh() async {
    // Drift 스트림이 DB 변경을 자동으로 반영하므로,
    // 별도의 재조회 로직은 필요하지 않습니다.
    // 호환성을 위해 메서드 시그니처만 유지합니다.
  }

  String _getErrorMessageFromError(dynamic error) {
    if (error is Failure) {
      return FailureMessageHandler.getUserMessage(error);
    }
    return 'An unexpected error occurred';
  }

  @override
  void dispose() {
    _favoritesSubscription?.cancel();
    _playingSubscription?.cancel();
    _finishedSubscription?.cancel();
    super.dispose();
  }
}
