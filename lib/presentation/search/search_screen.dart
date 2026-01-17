/// Search 화면
library search_screen;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gamerics/core/config/app_config.dart';
import 'package:gamerics/core/config/app_strings.dart';
import 'package:gamerics/core/widgets/error_widget.dart';
import 'package:gamerics/providers/providers.dart';
import 'package:gamerics/presentation/search/search_state.dart';
import 'package:gamerics/presentation/search/search_viewmodel.dart';
import 'package:gamerics/presentation/widgets/game_horizontal_card.dart';

/// Search 화면
class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  static const List<String> _quickQueries = [
    'Action RPG',
    'Metroidvania',
    'Co-op play',
    'Indie gems',
    'JRPG',
    'Strategy simulation',
  ];

  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  final _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      final state = ref.read(searchViewModelProvider);
      final viewModel = ref.read(searchViewModelProvider.notifier);

      if (!state.isLoading && state.hasMore) {
        viewModel.loadMore();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchViewModelProvider);
    final viewModel = ref.read(searchViewModelProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => context.pop(),
                  ),
                  Expanded(child: _buildSearchBar(context, state, viewModel)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: state.query.isEmpty
                  ? _buildSuggestions(context, state, viewModel)
                  : _buildResultHeader(state),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: _buildBody(context, state, viewModel),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(
    BuildContext context,
    SearchState state,
    SearchViewModel viewModel,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          const Icon(Icons.search),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _searchController,
              focusNode: _searchFocusNode,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search games...',
              ),
              onChanged: viewModel.updateQuery,
              onSubmitted: (_) => viewModel.saveSearchQuery(),
              textInputAction: TextInputAction.search,
            ),
          ),
          if (state.query.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                _searchController.clear();
                viewModel.updateQuery('');
                _searchFocusNode.requestFocus();
              },
            ),
        ],
      ),
    );
  }

  Widget _buildSuggestions(
    BuildContext context,
    SearchState state,
    SearchViewModel viewModel,
  ) {
    // 최근 검색어가 있으면 최근 검색어만 표시, 없으면 제안 키워드 표시
    final hasRecentSearches = state.recentSearches.isNotEmpty;
    final queries = hasRecentSearches ? state.recentSearches : _quickQueries;
    final title = hasRecentSearches ? 'Recent searches' : 'Suggested searches';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: queries
                .map(
                  (query) => hasRecentSearches
                      ? _buildRecentSearchChip(
                          context,
                          query,
                          viewModel,
                        )
                      : ActionChip(
                          label: Text(query),
                          onPressed: () {
                            _searchController.text = query;
                            viewModel.updateQuery(query);
                          },
                        ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentSearchChip(
    BuildContext context,
    String query,
    SearchViewModel viewModel,
  ) {
    return InputChip(
      label: Text(query),
      onPressed: () {
        _searchController.text = query;
        viewModel.updateQuery(query);
      },
      onDeleted: () {
        viewModel.deleteRecentSearch(query);
      },
    );
  }

  Widget _buildResultHeader(SearchState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            'Search results',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(width: 8),
          if (state.isLoading)
            const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          else if (state.totalCount > 0)
            Text(
              '${state.totalCount} items',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          const Spacer(),
          Text(
            '"${state.query}"',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    SearchState state,
    SearchViewModel viewModel,
  ) {
    if (state.query.isEmpty) {
      return const Center(child: Text(AppStrings.searchStart));
    }

    final trimmedQuery = state.query.trim();
    if (trimmedQuery.isNotEmpty &&
        trimmedQuery.length < AppConfig.searchMinLength &&
        state.results.isEmpty &&
        !state.isLoading) {
      return Center(
        child: Text(AppStrings.searchMinLength(AppConfig.searchMinLength)),
      );
    }

    if (state.errorMessage != null) {
      return AppErrorWidget(
        message: state.errorMessage!,
        onRetry: () {
          final query = state.query;
          viewModel.updateQuery('');
          viewModel.updateQuery(query);
        },
      );
    }

    if (state.isLoading && state.results.isEmpty) {
      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemCount: 6,
        itemBuilder: (context, index) {
          return const GameHorizontalCardSkeleton();
        },
      );
    }

    if (state.results.isEmpty) {
      return const Center(child: Text(AppStrings.searchNoResults));
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemCount: state.results.length + (state.hasMore && state.isLoading ? 3 : 0),
      itemBuilder: (context, index) {
        if (index >= state.results.length) {
          return Padding(
            padding: EdgeInsets.only(bottom: index == state.results.length + 2 ? 0 : 16),
            child: const GameHorizontalCardSkeleton(),
          );
        }

        final game = state.results[index];
        return Padding(
          padding: EdgeInsets.only(
            bottom: index == state.results.length - 1 && !state.isLoading ? 0 : 16,
          ),
          child: GameHorizontalCard(
          game: game,
          onTap: () {
            context.push('/game/${game.id}');
          },
          ),
        );
      },
    );
  }
}
