/// 컬렉션 로컬 데이터소스
library collection_local_datasource;

import 'dart:convert';
import 'package:gamerics/core/error/exceptions.dart';
import 'package:gamerics/data/database/app_database.dart';
import 'package:gamerics/domain/entities/collection_item.dart' as domain;
import 'package:gamerics/domain/entities/game.dart';
import 'package:drift/drift.dart';

/// 컬렉션 로컬 데이터소스 인터페이스
abstract class CollectionLocalDataSource {
  Future<domain.CollectionItem?> getCollectionItem(int gameId);

  Future<List<domain.CollectionItem>> getAllCollectionItems({
    domain.PlayStatus? playStatus,
  });

  Future<List<domain.CollectionItem>> getFavorites();

  Stream<List<domain.CollectionItem>> watchAllCollectionItems({
    domain.PlayStatus? playStatus,
  });

  Stream<List<domain.CollectionItem>> watchFavorites();

  Future<void> saveCollectionItem(domain.CollectionItem item);

  Future<void> deleteCollectionItem(int gameId);

  /// 모든 컬렉션 아이템 삭제
  Future<void> clearAll();
}

/// 컬렉션 로컬 데이터소스 구현 (Drift)
class CollectionLocalDataSourceImpl implements CollectionLocalDataSource {
  CollectionLocalDataSourceImpl(this._db);

  final AppDatabase _db;

  domain.CollectionItem _toEntity(CollectionItem data) {
    Game? game;
    
    // Game 정보가 모두 있으면 Game 엔티티 생성
    if (data.gameName != null) {
      game = Game(
        id: data.gameId,
        name: data.gameName!,
        backgroundImageUrl: data.gameBackgroundImageUrl,
        rating: data.gameRating,
        metacritic: data.gameMetacritic,
        released: data.gameReleased != null
            ? DateTime.fromMillisecondsSinceEpoch(data.gameReleased!)
            : null,
        genres: _parseJsonList<String>(data.gameGenres) ?? [],
        genreIds: _parseJsonList<int>(data.gameGenreIds) ?? [],
        platforms: _parseJsonList<String>(data.gamePlatforms) ?? [],
        tags: _parseJsonList<String>(data.gameTags) ?? [],
        developerIds: _parseJsonList<int>(data.gameDeveloperIds) ?? [],
        description: data.gameDescription,
      );
    }
    
    return domain.CollectionItem(
      gameId: data.gameId,
      isFavorite: data.isFavorite,
      playStatus: domain.PlayStatus.values[data.playStatusIndex],
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt),
      game: game,
    );
  }

  CollectionItemsCompanion _toCompanion(domain.CollectionItem item) {
    final game = item.game;
    
    return CollectionItemsCompanion(
      gameId: Value(item.gameId),
      isFavorite: Value(item.isFavorite),
      playStatusIndex: Value(item.playStatus.index),
      updatedAt: Value(item.updatedAt.millisecondsSinceEpoch),
      gameName: Value(game?.name),
      gameBackgroundImageUrl: Value(game?.backgroundImageUrl),
      gameRating: Value(game?.rating),
      gameMetacritic: Value(game?.metacritic),
      gameReleased: Value(game?.released?.millisecondsSinceEpoch),
      gameGenres: Value(_toJsonList(game?.genres)),
      gameGenreIds: Value(_toJsonList(game?.genreIds)),
      gamePlatforms: Value(_toJsonList(game?.platforms)),
      gameTags: Value(_toJsonList(game?.tags)),
      gameDeveloperIds: Value(_toJsonList(game?.developerIds)),
      gameDescription: Value(game?.description),
    );
  }

  List<T>? _parseJsonList<T>(String? jsonString) {
    if (jsonString == null) return null;
    try {
      final list = jsonDecode(jsonString) as List;
      if (T == int) {
        return list.map((e) => (e as num).toInt() as T).toList();
      } else if (T == String) {
        return list.map((e) => e.toString() as T).toList();
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  String? _toJsonList<T>(List<T>? list) {
    if (list == null || list.isEmpty) return null;
    try {
      return jsonEncode(list);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<domain.CollectionItem?> getCollectionItem(int gameId) async {
    try {
      final query = _db.select(_db.collectionItems)
        ..where((t) => t.gameId.equals(gameId));
      final result = await query.getSingleOrNull();
      return result != null ? _toEntity(result) : null;
    } catch (e) {
      throw LocalStorageException('Failed to get collection item: $e');
    }
  }

  @override
  Future<List<domain.CollectionItem>> getAllCollectionItems({
    domain.PlayStatus? playStatus,
  }) async {
    try {
      final query = _db.select(_db.collectionItems);

      if (playStatus != null) {
        query.where((t) => t.playStatusIndex.equals(playStatus.index));
      }

      final results = await query.get();
      return results.map(_toEntity).toList();
    } catch (e) {
      throw LocalStorageException('Failed to get all collection items: $e');
    }
  }

  @override
  Future<List<domain.CollectionItem>> getFavorites() async {
    try {
      final query = _db.select(_db.collectionItems)
        ..where((t) => t.isFavorite.equals(true));
      final results = await query.get();
      return results.map(_toEntity).toList();
    } catch (e) {
      throw LocalStorageException('Failed to get favorites: $e');
    }
  }

  @override
  Future<void> saveCollectionItem(domain.CollectionItem item) async {
    try {
      await _db.into(_db.collectionItems).insert(
        _toCompanion(item),
        mode: InsertMode.insertOrReplace,
      );
    } catch (e) {
      throw LocalStorageException('Failed to save collection item: $e');
    }
  }

  @override
  Stream<List<domain.CollectionItem>> watchAllCollectionItems({
    domain.PlayStatus? playStatus,
  }) {
    try {
      final query = _db.select(_db.collectionItems);

      if (playStatus != null) {
        query.where((t) => t.playStatusIndex.equals(playStatus.index));
      }

      return query.watch().map((results) => results.map(_toEntity).toList());
    } catch (e) {
      throw LocalStorageException('Failed to watch collection items: $e');
    }
  }

  @override
  Stream<List<domain.CollectionItem>> watchFavorites() {
    try {
      final query = _db.select(_db.collectionItems)
        ..where((t) => t.isFavorite.equals(true));
      return query.watch().map((results) => results.map(_toEntity).toList());
    } catch (e) {
      throw LocalStorageException('Failed to watch favorites: $e');
    }
  }

  @override
  Future<void> deleteCollectionItem(int gameId) async {
    try {
      await (_db.delete(_db.collectionItems)
            ..where((t) => t.gameId.equals(gameId)))
          .go();
    } catch (e) {
      throw LocalStorageException('Failed to delete collection item: $e');
    }
  }

  @override
  Future<void> clearAll() async {
    try {
      await _db.delete(_db.collectionItems).go();
    } catch (e) {
      throw LocalStorageException('Failed to clear collection items: $e');
    }
  }
}

