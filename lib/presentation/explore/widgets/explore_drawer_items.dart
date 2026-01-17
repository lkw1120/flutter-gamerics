/// Explore Drawer 섹션 모델
class ExploreDrawerSection {
  const ExploreDrawerSection({required this.title, required this.items});

  final String title;
  final List<ExploreDrawerItem> items;
}

/// Explore Drawer 아이템 모델
class ExploreDrawerItem {
  const ExploreDrawerItem.leaf({
    required this.title,
    required this.categoryId,
    this.subtitle,
  }) : children = const [],
       isPlaceholder = false;

  const ExploreDrawerItem.group({required this.title, required this.children})
    : categoryId = null,
      subtitle = null,
      isPlaceholder = false;

  const ExploreDrawerItem.placeholder({required this.title, this.subtitle})
    : categoryId = null,
      children = const [],
      isPlaceholder = true;

  final String title;
  final String? subtitle;
  final String? categoryId;
  final List<ExploreDrawerItem> children;
  final bool isPlaceholder;

  bool get hasChildren => children.isNotEmpty;
  bool get isLeaf => categoryId != null;
}

