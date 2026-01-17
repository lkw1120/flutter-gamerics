/// 게임 캐시 로컬 데이터소스
library game_cache_local_datasource;

import 'dart:convert';
import 'package:gamerics/core/error/exceptions.dart';
import 'package:gamerics/data/database/app_database.dart';
import 'package:gamerics/domain/entities/game.dart';
import 'package:drift/drift.dart';

/// 게임 캐시 로컬 데이터소스 인터페이스
abstract class GameCacheLocalDataSource {
  /// 게임 캐시 조회
  /// 
  /// [gameId] 게임 ID
  Future<CachedGame?> getGame(int gameId);

  /// 게임 캐시 저장
  /// 
  /// [gameId] 게임 ID
  /// [game] 게임 정보
  Future<void> saveGame(int gameId, Game game);

  /// 게임 캐시 삭제
  /// 
  /// [gameId] 게임 ID
  Future<void> deleteGame(int gameId);

  /// 모든 게임 캐시 삭제
  Future<void> clearAll();
}

/// 캐시된 게임 정보
class CachedGame {
  final Game game;
  final DateTime cachedAt;

  CachedGame({
    required this.game,
    required this.cachedAt,
  });
}

/// 게임 캐시 로컬 데이터소스 구현 (Drift)
class GameCacheLocalDataSourceImpl implements GameCacheLocalDataSource {
  GameCacheLocalDataSourceImpl(this._db);

  final AppDatabase _db;

  Game _toEntity(GameCacheData data) {
    return Game(
      id: data.gameId,
      name: data.gameName,
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

  GameCacheCompanion _toCompanion(int gameId, Game game) {
    return GameCacheCompanion(
      gameId: Value(gameId),
      gameName: Value(game.name),
      gameBackgroundImageUrl: Value(game.backgroundImageUrl),
      gameRating: Value(game.rating),
      gameMetacritic: Value(game.metacritic),
      gameReleased: Value(game.released?.millisecondsSinceEpoch),
      gameGenres: Value(_toJsonList(game.genres)),
      gameGenreIds: Value(_toJsonList(game.genreIds)),
      gamePlatforms: Value(_toJsonList(game.platforms)),
      gameTags: Value(_toJsonList(game.tags)),
      gameDeveloperIds: Value(_toJsonList(game.developerIds)),
      gameDescription: Value(game.description),
      cachedAt: Value(DateTime.now().millisecondsSinceEpoch),
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
  Future<CachedGame?> getGame(int gameId) async {
    try {
      final query = _db.select(_db.gameCache)
        ..where((t) => t.gameId.equals(gameId));
      final result = await query.getSingleOrNull();
      if (result == null) return null;
      
      return CachedGame(
        game: _toEntity(result),
        cachedAt: DateTime.fromMillisecondsSinceEpoch(result.cachedAt),
      );
    } catch (e) {
      throw LocalStorageException('Failed to get game cache: $e');
    }
  }

  @override
  Future<void> saveGame(int gameId, Game game) async {
    try {
      await _db.into(_db.gameCache).insert(
        _toCompanion(gameId, game),
        mode: InsertMode.insertOrReplace,
      );
    } catch (e) {
      throw LocalStorageException('Failed to save game cache: $e');
    }
  }

  @override
  Future<void> deleteGame(int gameId) async {
    try {
      await (_db.delete(_db.gameCache)
            ..where((t) => t.gameId.equals(gameId)))
          .go();
    } catch (e) {
      throw LocalStorageException('Failed to delete game cache: $e');
    }
  }

  @override
  Future<void> clearAll() async {
    try {
      await _db.delete(_db.gameCache).go();
    } catch (e) {
      throw LocalStorageException('Failed to clear game cache: $e');
    }
  }
}

