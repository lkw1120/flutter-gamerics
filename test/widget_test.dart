// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamerics/core/error/either.dart';
import 'package:gamerics/core/error/failures.dart';
import 'package:gamerics/domain/entities/collection_item.dart';
import 'package:gamerics/domain/entities/game.dart';
import 'package:gamerics/domain/entities/game_screenshot.dart';
import 'package:gamerics/domain/entities/game_video.dart';
import 'package:gamerics/domain/entities/paginated_result.dart';
import 'package:gamerics/domain/repositories/collection_repository.dart';
import 'package:gamerics/domain/repositories/game_repository.dart';
import 'package:gamerics/main.dart';
import 'package:gamerics/providers/providers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App starts successfully', (WidgetTester tester) async {
    final fakeGameRepository = _FakeGameRepository();
    final fakeCollectionRepository = _FakeCollectionRepository();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          gameRepositoryProvider.overrideWithValue(fakeGameRepository),
          collectionRepositoryProvider.overrideWithValue(
            fakeCollectionRepository,
          ),
        ],
        child: const GamericsApp(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}

class _FakeGameRepository implements GameRepository {
  static final Game _sampleGame = Game(
    id: 1,
    name: 'Sample Game',
    backgroundImageUrl: 'https://example.com/sample.jpg',
    rating: 4.5,
    metacritic: 88,
    released: DateTime(2024, 1, 1),
    genres: ['Action'],
    platforms: ['PC'],
    tags: ['Indie'],
  );

  static final _paginatedResult = PaginatedResult<Game>(
    results: [_sampleGame],
    count: 1,
  );

  static final _screenshots = [
    GameScreenshot(
      id: 1,
      imageUrl: 'https://example.com/sample.jpg',
      width: 1920,
      height: 1080,
    ),
  ];

  static final _videos = [
    GameVideo(
      id: 1,
      name: 'Official Trailer',
      previewImageUrl: 'https://example.com/video-preview.jpg',
      videoUrl: 'https://example.com/video.mp4',
    ),
  ];

  @override
  Future<Either<Failure, PaginatedResult<Game>>> getGames({
    int page = 1,
    int pageSize = 20,
    String? ordering,
    String? dates,
    List<int>? platforms,
    List<int>? genres,
    List<int>? developers,
  }) async {
    return Right(_paginatedResult);
  }

  @override
  Future<Either<Failure, Game>> getGameById(int id) async {
    return Right(_sampleGame);
  }

  @override
  Future<Either<Failure, List<GameScreenshot>>> getGameScreenshots(
    int gameId,
  ) async {
    return Right(_screenshots);
  }

  @override
  Future<Either<Failure, List<GameVideo>>> getGameVideos(int gameId) async {
    return Right(_videos);
  }

  @override
  Future<Either<Failure, PaginatedResult<Game>>> searchGames({
    required String query,
    int page = 1,
    int pageSize = 20,
  }) async {
    return Right(_paginatedResult);
  }

  @override
  Future<Either<Failure, void>> clearGameCache() async {
    // 테스트에서는 별도 캐시 없음
    return const Right(null);
  }
}

class _FakeCollectionRepository implements CollectionRepository {
  final List<CollectionItem> _items = [
    CollectionItem(
      gameId: 1,
      isFavorite: true,
      playStatus: PlayStatus.playing,
      updatedAt: DateTime.now(),
    ),
  ];

  CollectionItem? _findItem(int gameId) {
    for (final item in _items) {
      if (item.gameId == gameId) {
        return item;
      }
    }
    return null;
  }

  @override
  Future<Either<Failure, CollectionItem?>> getCollectionItem(int gameId) async {
    return Right(_findItem(gameId));
  }

  @override
  Future<Either<Failure, List<CollectionItem>>> getAllCollectionItems({
    PlayStatus? playStatus,
  }) async {
    final filtered = playStatus == null
        ? _items
        : _items.where((item) => item.playStatus == playStatus).toList();
    return Right(filtered);
  }

  @override
  Future<Either<Failure, List<CollectionItem>>> getFavorites() async {
    return Right(
      _items.where((item) => item.isFavorite).toList(),
    );
  }

  @override
  Future<Either<Failure, void>> saveCollectionItem(CollectionItem item) async {
    _items.removeWhere((element) => element.gameId == item.gameId);
    _items.add(item);
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> deleteCollectionItem(int gameId) async {
    _items.removeWhere((item) => item.gameId == gameId);
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> toggleFavorite(int gameId, {Game? game}) async {
    final existing = _findItem(gameId);
    if (existing != null) {
      final updated = existing.copyWith(
        isFavorite: !existing.isFavorite,
        updatedAt: DateTime.now(),
      );
      await saveCollectionItem(updated);
    }
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> updatePlayStatus(
    int gameId,
    PlayStatus playStatus, {
    Game? game,
  }) async {
    final existing = _findItem(gameId);
    if (existing != null) {
      final updated = existing.copyWith(
        playStatus: playStatus,
        updatedAt: DateTime.now(),
      );
      await saveCollectionItem(updated);
    }
    return const Right(null);
  }

  @override
  Stream<List<CollectionItem>> watchAllCollectionItems({PlayStatus? playStatus}) {
    final filtered = playStatus == null
        ? _items
        : _items.where((item) => item.playStatus == playStatus).toList();
    return Stream.value(filtered);
  }

  @override
  Stream<List<CollectionItem>> watchFavorites() {
    return Stream.value(
      _items.where((item) => item.isFavorite).toList(),
    );
  }

  @override
  Future<Either<Failure, void>> clearAll() async {
    _items.clear();
    return const Right(null);
  }
}
