/// Drift 데이터베이스
library app_database;

import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

/// 컬렉션 아이템 테이블
class CollectionItems extends Table {
  // 컬렉션 정보
  IntColumn get gameId => integer()();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  IntColumn get playStatusIndex => integer().withDefault(const Constant(0))();
  IntColumn get updatedAt => integer()();
  
  // 게임 정보 (Game 엔티티 전체)
  TextColumn get gameName => text().nullable()();
  TextColumn get gameBackgroundImageUrl => text().nullable()();
  RealColumn get gameRating => real().nullable()();
  IntColumn get gameMetacritic => integer().nullable()();
  IntColumn get gameReleased => integer().nullable()();
  TextColumn get gameGenres => text().nullable()(); // JSON array as string
  TextColumn get gameGenreIds => text().nullable()(); // JSON array as string
  TextColumn get gamePlatforms => text().nullable()(); // JSON array as string
  TextColumn get gameTags => text().nullable()(); // JSON array as string
  TextColumn get gameDeveloperIds => text().nullable()(); // JSON array as string
  TextColumn get gameDescription => text().nullable()();

  @override
  Set<Column> get primaryKey => {gameId};
}

/// 게임 캐시 테이블
class GameCache extends Table {
  IntColumn get gameId => integer()();
  
  // 게임 정보 (Game 엔티티 전체)
  TextColumn get gameName => text()();
  TextColumn get gameBackgroundImageUrl => text().nullable()();
  RealColumn get gameRating => real().nullable()();
  IntColumn get gameMetacritic => integer().nullable()();
  IntColumn get gameReleased => integer().nullable()();
  TextColumn get gameGenres => text().nullable()(); // JSON array as string
  TextColumn get gameGenreIds => text().nullable()(); // JSON array as string
  TextColumn get gamePlatforms => text().nullable()(); // JSON array as string
  TextColumn get gameTags => text().nullable()(); // JSON array as string
  TextColumn get gameDeveloperIds => text().nullable()(); // JSON array as string
  TextColumn get gameDescription => text().nullable()();
  
  // 캐시 정보
  IntColumn get cachedAt => integer()(); // millisecondsSinceEpoch

  @override
  Set<Column> get primaryKey => {gameId};
}

/// Drift 데이터베이스
@DriftDatabase(tables: [CollectionItems, GameCache])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'gamerics.db'));
    return NativeDatabase(file);
  });
}

