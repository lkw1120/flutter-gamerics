/// Explore 카테고리 모델
class ExploreCategory {
  ExploreCategory({
    required this.id,
    required this.title,
    this.subtitle,
    required this.queryBuilder,
  });

  final String id;
  final String title;
  final String? subtitle;
  final ExploreQuery Function(DateTime now) queryBuilder;
}

/// Explore 쿼리 모델
class ExploreQuery {
  const ExploreQuery({
    this.ordering,
    this.dates,
    this.platforms,
    this.genres,
    this.developers,
  });

  final String? ordering;
  final String? dates;
  final List<int>? platforms;
  final List<int>? genres;
  final List<int>? developers;
}

