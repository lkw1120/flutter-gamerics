/// 앱 라우팅 설정
library router;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gamerics/presentation/collection/collection_screen.dart';
import 'package:gamerics/presentation/detail/detail_screen.dart';
import 'package:gamerics/presentation/explore/explore_screen.dart';
import 'package:gamerics/presentation/search/search_screen.dart';
import 'package:gamerics/presentation/settings/settings_screen.dart';
import 'package:gamerics/presentation/common/main_navigation.dart';

/// 앱 라우터
final appRouter = GoRouter(
  initialLocation: '/explore',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        final path = state.uri.path;
        final isMainRoute =
            path == '/explore' || path == '/collection' || path == '/settings';

        if (isMainRoute) {
          return MainNavigation(child: child);
        }

        return child;
      },
      routes: [
        GoRoute(
          path: '/explore',
          name: 'explore',
          builder: (context, state) => const ExploreScreen(),
        ),
        GoRoute(
          path: '/collection',
          name: 'collection',
          builder: (context, state) => const CollectionScreen(),
        ),
        GoRoute(
          path: '/settings',
          name: 'settings',
          builder: (context, state) => const SettingsScreen(),
        ),
        GoRoute(
          path: '/search',
          name: 'search',
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: '/game/:id',
          name: 'game-detail',
          builder: (context, state) {
            final id = int.parse(state.pathParameters['id']!);
            return DetailScreen(
              key: ValueKey('game-detail-$id'),
              gameId: id,
            );
          },
        ),
      ],
    ),
  ],
);
