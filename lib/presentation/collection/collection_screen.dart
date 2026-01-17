/// Collection 화면
library collection_screen;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gamerics/core/config/app_strings.dart';
import 'package:gamerics/core/widgets/error_widget.dart';
import 'package:gamerics/domain/entities/collection_item.dart';
import 'package:gamerics/presentation/collection/collection_state.dart';
import 'package:gamerics/presentation/collection/collection_viewmodel.dart';
import 'package:gamerics/providers/providers.dart';
import 'package:gamerics/presentation/widgets/game_horizontal_card.dart';

/// Collection 화면
class CollectionScreen extends ConsumerStatefulWidget {
  const CollectionScreen({super.key});

  @override
  ConsumerState<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends ConsumerState<CollectionScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late TabController _tabController;
  bool _wasPaused = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_onTabChanged);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      _wasPaused = true;
    } else if (state == AppLifecycleState.resumed && _wasPaused) {
      _wasPaused = false;
      _refreshIfNeeded();
    }
  }

  void _refreshIfNeeded() {
    if (!mounted) return;
    final collectionRepo = ref.read(collectionRepositoryProvider);
    final viewModel = ref.read(
      collectionViewModelProvider(collectionRepo).notifier,
    );
    viewModel.refresh();
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) {
      return;
    }
    final collectionRepo = ref.read(collectionRepositoryProvider);
      final viewModel = ref.read(
        collectionViewModelProvider(collectionRepo).notifier,
      );
      final state = ref.read(collectionViewModelProvider(collectionRepo));
      if (_tabController.index != state.selectedTabIndex) {
        viewModel.changeTab(_tabController.index);
      }
  }

  @override
  Widget build(BuildContext context) {
    final collectionRepo = ref.watch(collectionRepositoryProvider);
        final state = ref.watch(collectionViewModelProvider(collectionRepo));
        final viewModel = ref.read(
          collectionViewModelProvider(collectionRepo).notifier,
        );

        if (_tabController.index != state.selectedTabIndex) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              _tabController.animateTo(state.selectedTabIndex);
            }
          });
        }

        return Scaffold(
          appBar: AppBar(title: const Text('Collection')),
          body: _buildBody(context, state, viewModel),
    );
  }

  Widget _buildBody(
    BuildContext context,
    CollectionState state,
    CollectionViewModel viewModel,
  ) {
    return RefreshIndicator(
      onRefresh: () => viewModel.refresh(),
      child: Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Favorites'),
            Tab(text: 'Playing'),
            Tab(text: 'Finished'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
                _buildTabContent(context, state, viewModel, 0),
                _buildTabContent(context, state, viewModel, 1),
                _buildTabContent(context, state, viewModel, 2),
            ],
          ),
        ),
      ],
      ),
    );
  }

  Widget _buildTabContent(
    BuildContext context,
    CollectionState state,
    CollectionViewModel viewModel,
    int tabIndex,
  ) {
    final List<CollectionItem> items;
    final bool isLoading;
    final bool isCurrentTab;

    switch (tabIndex) {
      case 0:
        items = state.favoritesItems;
        isLoading = state.isLoadingFavorites;
        isCurrentTab = state.selectedTabIndex == 0;
        break;
      case 1:
        items = state.playingItems;
        isLoading = state.isLoadingPlaying;
        isCurrentTab = state.selectedTabIndex == 1;
        break;
      case 2:
        items = state.finishedItems;
        isLoading = state.isLoadingFinished;
        isCurrentTab = state.selectedTabIndex == 2;
        break;
      default:
        items = [];
        isLoading = false;
        isCurrentTab = false;
    }

    if (isCurrentTab && state.errorMessage != null && !isLoading && items.isEmpty) {
      return AppErrorWidget(
        message: state.errorMessage!,
        onRetry: () => viewModel.refresh(),
      );
    }

    if (isLoading && items.isEmpty) {
      return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: index == 5 ? 0 : 16),
            child: const GameHorizontalCardSkeleton(),
          );
        },
      );
    }

    if (items.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: const Center(child: Text(AppStrings.collectionEmpty)),
          ),
        ],
      );
    }

    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemCount: items.length + (isLoading ? 3 : 0),
      itemBuilder: (context, index) {
        if (index >= items.length) {
          return Padding(
            padding: EdgeInsets.only(bottom: index == items.length + 2 ? 0 : 16),
            child: const GameHorizontalCardSkeleton(),
          );
        }

        final item = items[index];
        final game = item.game;

        return Padding(
          padding: EdgeInsets.only(bottom: index == items.length - 1 && !isLoading ? 0 : 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (game != null)
                GameHorizontalCard(
                  game: game,
                  onTap: () async {
                    await context.push('/game/${game.id}');
                    if (mounted) {
                      _refreshIfNeeded();
                    }
                  },
                )
              else
                const GameHorizontalCardSkeleton(),
            ],
          ),
        );
      },
    );
  }

}
