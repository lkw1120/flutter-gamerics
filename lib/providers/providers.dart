/// 전역 Provider 설정
library providers;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamerics/data/datasources/collection_local_datasource.dart';
import 'package:gamerics/data/datasources/game_cache_local_datasource.dart';
import 'package:gamerics/data/datasources/rawg_remote_datasource.dart';
import 'package:gamerics/data/repositories/collection_repository_impl.dart';
import 'package:gamerics/data/repositories/game_repository_impl.dart';
import 'package:gamerics/domain/repositories/collection_repository.dart';
import 'package:gamerics/domain/repositories/game_repository.dart';
import 'package:gamerics/data/datasources/rawg_api_client.dart';
import 'package:gamerics/data/database/app_database.dart';
import 'package:gamerics/data/datasources/recent_search_local_datasource.dart';
import 'package:gamerics/data/repositories/recent_search_repository_impl.dart';
import 'package:gamerics/domain/repositories/recent_search_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gamerics/application/usecases/get_games.dart';
import 'package:gamerics/application/usecases/search_games.dart';
import 'package:gamerics/application/usecases/get_recent_searches.dart';
import 'package:gamerics/application/usecases/save_recent_search.dart';
import 'package:gamerics/application/usecases/delete_recent_search.dart';
import 'package:gamerics/application/usecases/get_collection_item.dart';
import 'package:gamerics/application/usecases/get_game_detail.dart';
import 'package:gamerics/application/usecases/get_game_screenshots.dart';
import 'package:gamerics/application/usecases/get_game_videos.dart';
import 'package:gamerics/application/usecases/toggle_favorite.dart';
import 'package:gamerics/application/usecases/update_play_status.dart';
import 'package:gamerics/presentation/explore/explore_viewmodel.dart';
import 'package:gamerics/presentation/explore/explore_state.dart';
import 'package:gamerics/presentation/search/search_viewmodel.dart';
import 'package:gamerics/presentation/search/search_state.dart';
import 'package:gamerics/presentation/detail/detail_viewmodel.dart';
import 'package:gamerics/presentation/detail/detail_state.dart';
import 'package:gamerics/presentation/collection/collection_viewmodel.dart';
import 'package:gamerics/presentation/collection/collection_state.dart';

// ============================================================================
// Infrastructure Providers (Repository, DataSource)
// ============================================================================

/// RAWG API 클라이언트 Provider
final rawgApiClientProvider = Provider<RawgApiClient>((ref) {
  return RawgApiClient();
});

/// RAWG 원격 데이터소스 Provider
final rawgRemoteDataSourceProvider =
    Provider<RawgRemoteDataSource>((ref) {
  return RawgRemoteDataSourceImpl(ref.watch(rawgApiClientProvider));
});

/// 게임 리포지토리 Provider
final gameRepositoryProvider = Provider<GameRepository>((ref) {
  return GameRepositoryImpl(
    ref.watch(rawgRemoteDataSourceProvider),
    ref.watch(gameCacheLocalDataSourceProvider),
  );
});

/// Drift 데이터베이스 Provider
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

/// 컬렉션 로컬 데이터소스 Provider
final collectionLocalDataSourceProvider =
    Provider<CollectionLocalDataSource>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return CollectionLocalDataSourceImpl(db);
});

/// 게임 캐시 로컬 데이터소스 Provider
final gameCacheLocalDataSourceProvider =
    Provider<GameCacheLocalDataSource>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return GameCacheLocalDataSourceImpl(db);
});

/// 컬렉션 리포지토리 Provider
final collectionRepositoryProvider = Provider<CollectionRepository>((ref) {
  final dataSource = ref.watch(collectionLocalDataSourceProvider);
  return CollectionRepositoryImpl(dataSource);
});

/// SharedPreferences Provider
final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) {
  return SharedPreferences.getInstance();
});

/// 최근 검색어 로컬 데이터소스 Provider
final recentSearchLocalDataSourceProvider =
    FutureProvider<RecentSearchLocalDataSource>((ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return RecentSearchLocalDataSourceImpl(prefs);
});

/// 최근 검색어 리포지토리 Provider
final recentSearchRepositoryProvider =
    FutureProvider<RecentSearchRepository>((ref) async {
  final dataSource = await ref.watch(recentSearchLocalDataSourceProvider.future);
  return RecentSearchRepositoryImpl(dataSource);
});

// ============================================================================
// ViewModel Providers
// ============================================================================

/// Explore ViewModel Provider
final exploreViewModelProvider =
    StateNotifierProvider<ExploreViewModel, ExploreState>((ref) {
      final getGames = GetGames(ref.watch(gameRepositoryProvider));
      return ExploreViewModel(getGames);
    });

/// Search ViewModel Provider
final searchViewModelProvider =
    StateNotifierProvider<SearchViewModel, SearchState>((ref) {
      final searchGames = SearchGames(ref.watch(gameRepositoryProvider));
      
      // 최근 검색어 관련 UseCase 생성 (FutureProvider이므로 비동기 처리)
      final recentSearchRepoAsync = ref.watch(recentSearchRepositoryProvider);
      
      // maybeWhen을 사용하여 데이터가 있을 때만 UseCase 생성
      GetRecentSearches? getRecentSearches;
      SaveRecentSearch? saveRecentSearch;
      DeleteRecentSearch? deleteRecentSearch;
      
      recentSearchRepoAsync.maybeWhen(
        data: (repo) {
          getRecentSearches = GetRecentSearches(repo);
          saveRecentSearch = SaveRecentSearch(repo);
          deleteRecentSearch = DeleteRecentSearch(repo);
        },
        orElse: () {
          // 로딩 중이거나 에러 상태일 때는 null 유지
        },
      );
      
      return SearchViewModel(
        searchGames: searchGames,
        getRecentSearches: getRecentSearches,
        saveRecentSearch: saveRecentSearch,
        deleteRecentSearch: deleteRecentSearch,
      );
    });

/// Detail ViewModel Provider
final detailViewModelProvider =
    StateNotifierProvider.family<DetailViewModel, DetailState, int>((
      ref,
      gameId,
    ) {
      final getGameDetail = GetGameDetail(ref.watch(gameRepositoryProvider));
      final getGameScreenshots = GetGameScreenshots(
        ref.watch(gameRepositoryProvider),
      );
      final getGameVideos = GetGameVideos(ref.watch(gameRepositoryProvider));
      final getGames = GetGames(ref.watch(gameRepositoryProvider));
      final collectionRepo = ref.watch(collectionRepositoryProvider);

      final getCollectionItem = GetCollectionItem(collectionRepo);
      final toggleFavorite = ToggleFavorite(collectionRepo);
      final updatePlayStatus = UpdatePlayStatus(collectionRepo);

      return DetailViewModel(
        gameId: gameId,
        getGameDetail: getGameDetail,
        getGameScreenshots: getGameScreenshots,
        getGameVideos: getGameVideos,
        getGames: getGames,
        getCollectionItem: getCollectionItem,
        toggleFavorite: toggleFavorite,
        updatePlayStatus: updatePlayStatus,
      );
    });

/// Collection ViewModel Provider
final collectionViewModelProvider =
    StateNotifierProvider.family<
      CollectionViewModel,
      CollectionState,
      CollectionRepository
    >((ref, collectionRepo) {
      return CollectionViewModel(collectionRepo);
    });

