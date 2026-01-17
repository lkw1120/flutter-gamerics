import 'package:intl/intl.dart';
import 'package:gamerics/presentation/explore/widgets/explore_category.dart';
import 'package:gamerics/presentation/explore/widgets/explore_drawer_items.dart';

/// Explore 카테고리 데이터 및 유틸리티
class ExploreCategories {
  static final DateFormat _fmt = DateFormat('yyyy-MM-dd');

  static String get defaultCategoryId => 'new_last_30';

  static ExploreCategory get defaultCategory => _categories[defaultCategoryId]!;

  static ExploreCategory getCategory(String id) =>
      _categories[id] ?? defaultCategory;

  static List<ExploreDrawerSection> get drawerSections => _sections;

  static final Map<String, ExploreCategory> _categories = {
    'new_last_30': ExploreCategory(
      id: 'new_last_30',
      title: 'Last 30 days',
      subtitle: 'Latest releases from the past month',
      queryBuilder: (now) {
        final start = now.subtract(const Duration(days: 30));
        return ExploreQuery(ordering: '-released', dates: _range(start, now));
      },
    ),
    'new_this_week': ExploreCategory(
      id: 'new_this_week',
      title: 'This week',
      subtitle: 'Fresh games released this week',
      queryBuilder: (now) {
        final start = _startOfWeek(now);
        final end = start.add(const Duration(days: 6));
        return ExploreQuery(ordering: '-released', dates: _range(start, end));
      },
    ),
    'new_next_week': ExploreCategory(
      id: 'new_next_week',
      title: 'Next week',
      subtitle: "What's coming very soon",
      queryBuilder: (now) {
        final start = _startOfWeek(now).add(const Duration(days: 7));
        final end = start.add(const Duration(days: 6));
        return ExploreQuery(ordering: '-released', dates: _range(start, end));
      },
    ),
    'new_calendar': ExploreCategory(
      id: 'new_calendar',
      title: 'Release calendar',
      subtitle: 'Upcoming highlights for the next 60 days',
      queryBuilder: (now) {
        final end = now.add(const Duration(days: 60));
        return ExploreQuery(ordering: '-added', dates: _range(now, end));
      },
    ),
    'top_best_year': ExploreCategory(
      id: 'top_best_year',
      title: 'Best of the year',
      subtitle: 'Highest rated games of the year',
      queryBuilder: (now) {
        final start = DateTime(now.year, 1, 1);
        final end = DateTime(now.year, 12, 31);
        return ExploreQuery(ordering: '-rating', dates: _range(start, end));
      },
    ),
    'top_popular_2024': ExploreCategory(
      id: 'top_popular_2024',
      title: 'Popular in 2024',
      subtitle: 'Most talked-about releases this year',
      queryBuilder: (_) {
        final start = DateTime(2024, 1, 1);
        final end = DateTime(2024, 12, 31);
        return ExploreQuery(ordering: '-added', dates: _range(start, end));
      },
    ),
    'top_all_time': ExploreCategory(
      id: 'top_all_time',
      title: 'All-time top 250',
      subtitle: 'Legendary games everyone should play',
      queryBuilder: (_) => const ExploreQuery(ordering: '-rating'),
    ),
    'platform_pc': ExploreCategory(
      id: 'platform_pc',
      title: 'PC',
      queryBuilder: (_) =>
          const ExploreQuery(ordering: '-added', platforms: [4]),
    ),
    'platform_ps4': ExploreCategory(
      id: 'platform_ps4',
      title: 'PlayStation 4',
      queryBuilder: (_) =>
          const ExploreQuery(ordering: '-added', platforms: [18]),
    ),
    'platform_xbox_one': ExploreCategory(
      id: 'platform_xbox_one',
      title: 'Xbox One',
      queryBuilder: (_) =>
          const ExploreQuery(ordering: '-added', platforms: [1]),
    ),
    'platform_switch': ExploreCategory(
      id: 'platform_switch',
      title: 'Nintendo Switch',
      queryBuilder: (_) =>
          const ExploreQuery(ordering: '-added', platforms: [7]),
    ),
    'platform_ios': ExploreCategory(
      id: 'platform_ios',
      title: 'iOS',
      queryBuilder: (_) =>
          const ExploreQuery(ordering: '-added', platforms: [3]),
    ),
    'platform_android': ExploreCategory(
      id: 'platform_android',
      title: 'Android',
      queryBuilder: (_) =>
          const ExploreQuery(ordering: '-added', platforms: [21]),
    ),
    'genre_free_online': ExploreCategory(
      id: 'genre_free_online',
      title: 'Free Online Games',
      subtitle: 'Jump into free-to-play experiences',
      queryBuilder: (_) => const ExploreQuery(
        ordering: '-rating',
        genres: [59], // Massively Multiplayer as best approximation
      ),
    ),
    'genre_action': ExploreCategory(
      id: 'genre_action',
      title: 'Action',
      queryBuilder: (_) => const ExploreQuery(ordering: '-rating', genres: [4]),
    ),
    'genre_strategy': ExploreCategory(
      id: 'genre_strategy',
      title: 'Strategy',
      queryBuilder: (_) =>
          const ExploreQuery(ordering: '-rating', genres: [10]),
    ),
    'genre_rpg': ExploreCategory(
      id: 'genre_rpg',
      title: 'RPG',
      queryBuilder: (_) => const ExploreQuery(ordering: '-rating', genres: [5]),
    ),
    'genre_shooter': ExploreCategory(
      id: 'genre_shooter',
      title: 'Shooter',
      queryBuilder: (_) => const ExploreQuery(ordering: '-rating', genres: [2]),
    ),
    'genre_adventure': ExploreCategory(
      id: 'genre_adventure',
      title: 'Adventure',
      queryBuilder: (_) => const ExploreQuery(ordering: '-rating', genres: [3]),
    ),
    'genre_puzzle': ExploreCategory(
      id: 'genre_puzzle',
      title: 'Puzzle',
      queryBuilder: (_) => const ExploreQuery(ordering: '-rating', genres: [7]),
    ),
    'genre_racing': ExploreCategory(
      id: 'genre_racing',
      title: 'Racing',
      queryBuilder: (_) => const ExploreQuery(ordering: '-rating', genres: [1]),
    ),
    'genre_sports': ExploreCategory(
      id: 'genre_sports',
      title: 'Sports',
      queryBuilder: (_) =>
          const ExploreQuery(ordering: '-rating', genres: [14]),
    ),
  };

  static final List<ExploreDrawerSection> _sections = [
    ExploreDrawerSection(
      title: 'New Releases',
      items: const [
        ExploreDrawerItem.leaf(
          title: 'Last 30 days',
          categoryId: 'new_last_30',
        ),
        ExploreDrawerItem.leaf(title: 'This week', categoryId: 'new_this_week'),
        ExploreDrawerItem.leaf(title: 'Next week', categoryId: 'new_next_week'),
        ExploreDrawerItem.leaf(
          title: 'Release calendar',
          categoryId: 'new_calendar',
        ),
      ],
    ),
    ExploreDrawerSection(
      title: 'Top',
      items: const [
        ExploreDrawerItem.leaf(
          title: 'Best of the year',
          categoryId: 'top_best_year',
        ),
        ExploreDrawerItem.leaf(
          title: 'Popular in 2024',
          categoryId: 'top_popular_2024',
        ),
        ExploreDrawerItem.leaf(
          title: 'All time top 250',
          categoryId: 'top_all_time',
        ),
      ],
    ),
    ExploreDrawerSection(
      title: 'Platforms',
      items: const [
        ExploreDrawerItem.leaf(title: 'PC', categoryId: 'platform_pc'),
        ExploreDrawerItem.leaf(
          title: 'PlayStation 4',
          categoryId: 'platform_ps4',
        ),
        ExploreDrawerItem.leaf(
          title: 'Xbox One',
          categoryId: 'platform_xbox_one',
        ),
        ExploreDrawerItem.leaf(
          title: 'Nintendo Switch',
          categoryId: 'platform_switch',
        ),
        ExploreDrawerItem.leaf(title: 'iOS', categoryId: 'platform_ios'),
        ExploreDrawerItem.leaf(
          title: 'Android',
          categoryId: 'platform_android',
        ),
      ],
    ),
    ExploreDrawerSection(
      title: 'Genres',
      items: const [
        ExploreDrawerItem.leaf(
          title: 'Free Online Games',
          categoryId: 'genre_free_online',
        ),
        ExploreDrawerItem.leaf(title: 'Action', categoryId: 'genre_action'),
        ExploreDrawerItem.leaf(title: 'Strategy', categoryId: 'genre_strategy'),
        ExploreDrawerItem.leaf(title: 'RPG', categoryId: 'genre_rpg'),
        ExploreDrawerItem.leaf(title: 'Shooter', categoryId: 'genre_shooter'),
        ExploreDrawerItem.leaf(
          title: 'Adventure',
          categoryId: 'genre_adventure',
        ),
        ExploreDrawerItem.leaf(title: 'Puzzle', categoryId: 'genre_puzzle'),
        ExploreDrawerItem.leaf(title: 'Racing', categoryId: 'genre_racing'),
        ExploreDrawerItem.leaf(title: 'Sports', categoryId: 'genre_sports'),
      ],
    ),
    ExploreDrawerSection(
      title: 'Browse',
      items: const [
        ExploreDrawerItem.placeholder(title: 'Stores'),
        ExploreDrawerItem.placeholder(title: 'Collections'),
        ExploreDrawerItem.placeholder(title: 'Reviews'),
        ExploreDrawerItem.placeholder(title: 'Creators'),
        ExploreDrawerItem.placeholder(title: 'Tags'),
        ExploreDrawerItem.placeholder(title: 'Developers'),
        ExploreDrawerItem.placeholder(title: 'Publishers'),
      ],
    ),
  ];

  static DateTime _startOfWeek(DateTime date) {
    final weekday = date.weekday; // 1=Mon
    return DateTime(date.year, date.month, date.day - (weekday - 1));
  }

  static String _range(DateTime start, DateTime end) =>
      '${_fmt.format(start)},${_fmt.format(end)}';
}

