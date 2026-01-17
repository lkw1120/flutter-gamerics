/// Game Detail 화면
library detail_screen;

import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamerics/presentation/widgets/app_cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:gamerics/core/config/app_strings.dart';
import 'package:gamerics/core/widgets/error_widget.dart';
import 'package:gamerics/domain/entities/collection_item.dart';
import 'package:gamerics/providers/providers.dart';
import 'package:gamerics/presentation/detail/detail_viewmodel.dart';
import 'package:gamerics/presentation/detail/detail_state.dart';
import 'package:gamerics/presentation/widgets/game_section.dart';
import 'package:gamerics/presentation/widgets/animated_progress_bar.dart';
import 'package:gamerics/presentation/detail/widgets/collapsing_title.dart';
import 'package:gamerics/presentation/detail/widgets/detail_screen_helpers.dart';

/// Game Detail 화면
class DetailScreen extends ConsumerWidget {
  const DetailScreen({super.key, required this.gameId});

  final int gameId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
        final state = ref.watch(detailViewModelProvider(gameId));
        final viewModel = ref.read(detailViewModelProvider(gameId).notifier);
        return _buildContent(context, state, viewModel);
  }

  Widget _buildContent(
    BuildContext context,
    DetailState state,
    DetailViewModel viewModel,
  ) {
    // 초기 로딩 중이면 로딩 화면 표시
    if (state.isInitialLoading) {
      return Scaffold(
        body: Stack(
          children: [
            const Center(
              child: CircularProgressIndicator(),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AnimatedProgressBar(
                progress: state.loadingProgress,
              ),
            ),
          ],
        ),
      );
    }

    if (state.errorMessage != null && state.game == null) {
      return Scaffold(
        appBar: AppBar(),
        body: AppErrorWidget(
          message: state.errorMessage!,
          onRetry: () => viewModel.loadGameData(),
        ),
      );
    }

    final game = state.game;
    if (game == null) {
      return const Scaffold(
        body: Center(child: Text(AppStrings.detailUnableToLoad)),
      );
    }

    final detailSections = <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(game.name, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: [
                if (game.rating != null)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        game.rating!.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                if (game.metacritic != null)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: DetailScreenHelpers.getMetacriticColor(game.metacritic!),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          game.metacritic.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Metacritic',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                if (game.released != null)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.calendar_today, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        DateFormat('MMM d, yyyy').format(game.released!),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(height: 16),
    ];

    if (game.platforms.isNotEmpty) {
      detailSections.addAll([
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Platforms',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: game.platforms
                    .map(
                      (platform) => Chip(
                        label: Text(platform),
                        avatar: const Icon(Icons.computer, size: 18),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ]);
    }

    if (game.genres.isNotEmpty) {
      detailSections.addAll([
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Genres',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: game.genres
                    .map(
                      (genre) => Chip(
                        label: Text(genre),
                        avatar: const Icon(Icons.category, size: 18),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ]);
    }

    if (game.tags.isNotEmpty) {
      detailSections.addAll([
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tags',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: game.tags
                    .map(
                      (tag) => Chip(
                        label: Text(tag),
                        visualDensity: VisualDensity.compact,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ]);
    }

    if (game.description != null) {
      detailSections.addAll([
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                game.description!,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: state.isDescriptionExpanded ? null : 3,
                overflow: state.isDescriptionExpanded
                    ? null
                    : TextOverflow.ellipsis,
              ),
              TextButton(
                onPressed: () => viewModel.toggleDescription(),
                child: Text(
                  state.isDescriptionExpanded ? 'Collapse' : 'Read more',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ]);
    }

    detailSections.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DetailScreenHelpers.buildActionButton(
                context,
                icon: state.collectionItem?.isFavorite == true
                    ? Icons.favorite
                    : Icons.favorite_border,
                label: 'Favorite',
                color: state.collectionItem?.isFavorite == true
                    ? Colors.red
                    : null,
                onTap: () => viewModel.toggleFavorite(),
              ),
              Container(
                width: 1,
                height: 40,
                color: Theme.of(
                  context,
                ).colorScheme.outline.withValues(alpha: 0.2),
              ),
              DetailScreenHelpers.buildActionButton(
                context,
                icon: DetailScreenHelpers.getPlayStatusIcon(state.collectionItem?.playStatus),
                label: DetailScreenHelpers.getPlayStatusLabel(state.collectionItem?.playStatus),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: const Icon(Icons.close),
                            title: const Text('Not started'),
                            onTap: () {
                              viewModel.updatePlayStatus(PlayStatus.notPlayed);
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.play_circle_outline),
                            title: const Text('Playing'),
                            onTap: () {
                              viewModel.updatePlayStatus(PlayStatus.playing);
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.check_circle_outline),
                            title: const Text('Finished'),
                            onTap: () {
                              viewModel.updatePlayStatus(PlayStatus.finished);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );

    if (state.isLoadingVideos) {
      detailSections.add(
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    } else if (state.videos.isNotEmpty) {
      detailSections.addAll([
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Promotional videos',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 210,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: state.videos.length,
            itemBuilder: (context, index) {
              final video = state.videos[index];
              final isLast = index == state.videos.length - 1;
              return Padding(
                padding: EdgeInsets.only(right: isLast ? 0 : 12),
                child: GestureDetector(
                  onTap: () => DetailScreenHelpers.showVideoViewer(context, state.videos, index),
                  child: SizedBox(
                    width: 320,
                    child: Stack(
                      children: [
                        AppCachedNetworkImage(
                          imageUrl: video.previewImageUrl,
                          width: 320,
                          height: 210,
                          fit: BoxFit.cover,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.black87],
                              ),
                            ),
                          ),
                        ),
                        const Positioned.fill(
                          child: Center(
                            child: Icon(
                              Icons.play_circle_fill,
                              size: 56,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 16,
                          right: 16,
                          bottom: 16,
                          child: Text(
                            video.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
      ]);
    }

    if (state.isLoadingScreenshots || state.screenshots.isNotEmpty) {
      detailSections.addAll([
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Screenshots',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: state.isLoadingScreenshots
                ? 3
                : state.screenshots.length,
            itemBuilder: (context, index) {
              if (state.isLoadingScreenshots) {
                return Padding(
                  padding: EdgeInsets.only(right: index < 2 ? 12 : 0),
                  child: const AppImagePlaceholder(
                    width: 300,
                    height: 200,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                );
              }
              final screenshot = state.screenshots[index];
              final isLast = index == state.screenshots.length - 1;
              return Padding(
                padding: EdgeInsets.only(right: isLast ? 0 : 12),
                child: GestureDetector(
                  onTap: () =>
                      DetailScreenHelpers.showScreenshotViewer(context, index, state.screenshots),
                  child: AppCachedNetworkImage(
                    imageUrl: screenshot.imageUrl,
                    height: 200,
                    width: 300,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ]);
    }

    if (state.isLoadingSimilarGames || state.similarGames.isNotEmpty) {
      detailSections.add(
        GameSection(
          title: 'Similar games',
          games: state.similarGames,
          isLoading: state.isLoadingSimilarGames,
        ),
      );
    }

    if (state.isLoadingSameDeveloperGames ||
        state.sameDeveloperGames.isNotEmpty) {
      detailSections.add(
        GameSection(
          title: 'More from this developer',
          games: state.sameDeveloperGames,
          isLoading: state.isLoadingSameDeveloperGames,
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsetsDirectional.only(
                start: Platform.isIOS ? 16 : 56,
                bottom: 16,
                end: 16,
              ),
              title: CollapsingTitle(title: game.name),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  if (game.backgroundImageUrl != null)
                    AppCachedNetworkImage(
                      imageUrl: game.backgroundImageUrl!,
                      fit: BoxFit.cover,
                      showLoader: false,
                    )
                  else
                    Container(color: Colors.grey[300]),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black54],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: detailSections,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                top: 32,
                bottom: MediaQuery.of(context).padding.bottom + 32,
              ),
              child: Center(
                child: Text(
                  'Game data is provided by RAWG.io',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
