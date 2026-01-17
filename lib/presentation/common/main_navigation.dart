/// 메인 네비게이션 위젯
library main_navigation;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gamerics/presentation/explore/widgets/explore_drawer.dart';

/// 메인 네비게이션 위젯
///
/// Bottom Navigation Bar를 포함한 메인 네비게이션 구조를 제공합니다.
class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.path;
    final bool isExplore = currentLocation.startsWith('/explore');

    int getCurrentIndex() {
      if (isExplore) return 0;
      if (currentLocation.startsWith('/collection')) return 1;
      if (currentLocation.startsWith('/settings')) return 2;
      return 0;
    }

    void onTap(int index) {
      switch (index) {
        case 0:
          context.go('/explore');
          break;
        case 1:
          context.go('/collection');
          break;
        case 2:
          context.go('/settings');
          break;
      }
    }

    return Scaffold(
      drawer: isExplore ? const ExploreDrawer() : null,
      drawerEnableOpenDragGesture: isExplore,
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: getCurrentIndex(),
        onDestinationSelected: onTap,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.collections_outlined),
            selectedIcon: Icon(Icons.collections),
            label: 'Collection',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
