import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamerics/providers/providers.dart';
import 'package:gamerics/presentation/explore/widgets/explore_categories_data.dart';
import 'package:gamerics/presentation/explore/widgets/explore_drawer_items.dart';

class ExploreDrawer extends ConsumerWidget {
  const ExploreDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(exploreViewModelProvider);
    final viewModel = ref.read(exploreViewModelProvider.notifier);

    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            const ListTile(
              title: Text(
                'Discover',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Pick a focus to refresh the feed'),
            ),
            const Divider(),
            ...ExploreCategories.drawerSections.map(
              (section) => _DrawerSectionTile(
                section: section,
                selectedId: state.selectedCategoryId,
                onCategorySelected: (id) {
                  Navigator.of(context).maybePop();
                  viewModel.selectCategory(id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerSectionTile extends StatelessWidget {
  const _DrawerSectionTile({
    required this.section,
    required this.selectedId,
    required this.onCategorySelected,
  });

  final ExploreDrawerSection section;
  final String? selectedId;
  final ValueChanged<String> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        section.title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      shape: const Border(),
      collapsedShape: const Border(),
      children: section.items
          .map(
            (item) => _DrawerItemTile(
              item: item,
              selectedId: selectedId,
              onCategorySelected: onCategorySelected,
            ),
          )
          .toList(),
    );
  }
}

class _DrawerItemTile extends StatelessWidget {
  const _DrawerItemTile({
    required this.item,
    required this.selectedId,
    required this.onCategorySelected,
  });

  final ExploreDrawerItem item;
  final String? selectedId;
  final ValueChanged<String> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    if (item.hasChildren) {
      return ExpansionTile(
        title: Text(item.title),
        shape: const Border(),
        collapsedShape: const Border(),
        children: item.children
            .map(
              (child) => _DrawerItemTile(
                item: child,
                selectedId: selectedId,
                onCategorySelected: onCategorySelected,
              ),
            )
            .toList(),
      );
    }

    return ListTile(
      title: Text(item.title),
      subtitle: item.subtitle != null
          ? Text(item.subtitle!, style: const TextStyle(fontSize: 12))
          : null,
      enabled: item.categoryId != null && !item.isPlaceholder,
      selected: item.categoryId != null && item.categoryId == selectedId,
      onTap: item.categoryId == null
          ? null
          : () {
              onCategorySelected(item.categoryId!);
            },
      trailing: item.categoryId == null && item.isPlaceholder
          ? const Icon(Icons.lock_clock, size: 16)
          : null,
    );
  }
}
