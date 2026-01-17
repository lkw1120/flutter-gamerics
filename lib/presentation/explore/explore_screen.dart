/// Explore 화면
library explore_screen;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gamerics/core/utils/image_aspect_ratio_resolver.dart';
import 'package:gamerics/core/widgets/error_widget.dart';
import 'package:gamerics/domain/entities/game.dart';
import 'package:gamerics/providers/providers.dart';
import 'package:gamerics/presentation/explore/explore_state.dart';
import 'package:gamerics/presentation/widgets/game_card.dart';
import 'package:go_router/go_router.dart';

class ExploreScreen extends ConsumerStatefulWidget {
  const ExploreScreen({super.key});

  @override
  ConsumerState<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen> {
  final ScrollController _scrollController = ScrollController();
  final Map<int, double> _aspectRatios = {};
  final Map<int, Future<double>> _aspectRatioRequests = {};

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 400) {
      ref.read(exploreViewModelProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(exploreViewModelProvider);
    final viewModel = ref.read(exploreViewModelProvider.notifier);

    return RefreshIndicator(
      onRefresh: () => viewModel.refresh(),
      child: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: _buildSlivers(context, state),
      ),
    );
  }

  List<Widget> _buildSlivers(BuildContext context, ExploreState state) {
    final slivers = <Widget>[
      SliverAppBar(
        floating: true,
        pinned: true,
        titleSpacing: 0,
        leading: Builder(
          builder: (ctx) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.maybeOf(ctx)?.openDrawer(),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Explore'),
            if (state.selectedCategoryTitle != null)
              Text(
                state.selectedCategoryTitle!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => context.push('/search'),
          ),
        ],
      ),
    ];

    if (state.errorMessage != null && state.games.isEmpty) {
      slivers.add(
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: AppErrorWidget(
              message: state.errorMessage!,
              onRetry: () =>
                  ref.read(exploreViewModelProvider.notifier).refresh(),
            ),
          ),
        ),
      );
      return slivers;
    }

    if (state.isInitialLoading && state.games.isEmpty) {
      slivers.addAll(_buildSkeletonSlivers());
      return slivers;
    }

    slivers.add(
      SliverLayoutBuilder(
        builder: (context, constraints) {
          final crossAxisExtent = constraints.crossAxisExtent;
          if (crossAxisExtent <= 0) {
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          }
          return SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            sliver: SliverMasonryGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childCount: state.games.length + (state.isLoadingMore ? 2 : 0),
              itemBuilder: (context, index) {
                if (index >= state.games.length) {
                  return const _LoadingCard();
                }
                final game = state.games[index];
                final ratio = _aspectRatios[game.id];
                if (ratio == null) {
                  _prefetchAspectRatio(game, context);
                  return const GameCardSkeleton();
                }
                return GameCard(
                  game: game,
                  width: double.infinity,
                  aspectRatio: ratio,
                  onTap: () => context.push('/game/${game.id}'),
                );
              },
            ),
          );
        },
      ),
    );

    if (state.errorMessage != null && state.games.isNotEmpty) {
      slivers.add(
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: AppErrorWidget(
              message: state.errorMessage!,
              onRetry: () =>
                  ref.read(exploreViewModelProvider.notifier).loadMore(),
            ),
          ),
        ),
      );
    }

    if (!state.canLoadMore) {
      slivers.add(
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
      );
    }

    return slivers;
  }

  void _prefetchAspectRatio(Game game, BuildContext context) {
    if (_aspectRatios.containsKey(game.id) ||
        _aspectRatioRequests.containsKey(game.id)) {
      return;
    }

    final imageUrl = game.backgroundImageUrl;
    if (imageUrl == null) {
      _aspectRatios[game.id] = GameCard.defaultAspectRatio;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {});
        }
      });
      return;
    }

    _aspectRatioRequests[game.id] =
        ImageAspectRatioResolver.resolve(imageUrl, context: context).then((
          ratio,
        ) {
          if (mounted) {
            setState(() {
              _aspectRatios[game.id] = ratio;
            });
          } else {
            _aspectRatios[game.id] = ratio;
          }
          _aspectRatioRequests.remove(game.id);
          return ratio;
        });
  }

  List<Widget> _buildSkeletonSlivers() {
    return [
      SliverLayoutBuilder(
        builder: (context, constraints) {
          final crossAxisExtent = constraints.crossAxisExtent;
          if (crossAxisExtent <= 0) {
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          }
          return SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            sliver: SliverMasonryGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childCount: 16,
              itemBuilder: (context, index) {
                return const GameCardSkeleton();
              },
            ),
          );
        },
      ),
    ];
  }
}

class _LoadingCard extends StatelessWidget {
  const _LoadingCard();

  @override
  Widget build(BuildContext context) {
    return const GameCardSkeleton();
  }
}
