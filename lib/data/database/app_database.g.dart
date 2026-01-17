// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CollectionItemsTable extends CollectionItems
    with TableInfo<$CollectionItemsTable, CollectionItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollectionItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _gameIdMeta = const VerificationMeta('gameId');
  @override
  late final GeneratedColumn<int> gameId = GeneratedColumn<int>(
    'game_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _playStatusIndexMeta = const VerificationMeta(
    'playStatusIndex',
  );
  @override
  late final GeneratedColumn<int> playStatusIndex = GeneratedColumn<int>(
    'play_status_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _gameNameMeta = const VerificationMeta(
    'gameName',
  );
  @override
  late final GeneratedColumn<String> gameName = GeneratedColumn<String>(
    'game_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gameBackgroundImageUrlMeta =
      const VerificationMeta('gameBackgroundImageUrl');
  @override
  late final GeneratedColumn<String> gameBackgroundImageUrl =
      GeneratedColumn<String>(
        'game_background_image_url',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _gameRatingMeta = const VerificationMeta(
    'gameRating',
  );
  @override
  late final GeneratedColumn<double> gameRating = GeneratedColumn<double>(
    'game_rating',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gameMetacriticMeta = const VerificationMeta(
    'gameMetacritic',
  );
  @override
  late final GeneratedColumn<int> gameMetacritic = GeneratedColumn<int>(
    'game_metacritic',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gameReleasedMeta = const VerificationMeta(
    'gameReleased',
  );
  @override
  late final GeneratedColumn<int> gameReleased = GeneratedColumn<int>(
    'game_released',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gameGenresMeta = const VerificationMeta(
    'gameGenres',
  );
  @override
  late final GeneratedColumn<String> gameGenres = GeneratedColumn<String>(
    'game_genres',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gameGenreIdsMeta = const VerificationMeta(
    'gameGenreIds',
  );
  @override
  late final GeneratedColumn<String> gameGenreIds = GeneratedColumn<String>(
    'game_genre_ids',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gamePlatformsMeta = const VerificationMeta(
    'gamePlatforms',
  );
  @override
  late final GeneratedColumn<String> gamePlatforms = GeneratedColumn<String>(
    'game_platforms',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gameTagsMeta = const VerificationMeta(
    'gameTags',
  );
  @override
  late final GeneratedColumn<String> gameTags = GeneratedColumn<String>(
    'game_tags',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gameDeveloperIdsMeta = const VerificationMeta(
    'gameDeveloperIds',
  );
  @override
  late final GeneratedColumn<String> gameDeveloperIds = GeneratedColumn<String>(
    'game_developer_ids',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gameDescriptionMeta = const VerificationMeta(
    'gameDescription',
  );
  @override
  late final GeneratedColumn<String> gameDescription = GeneratedColumn<String>(
    'game_description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    gameId,
    isFavorite,
    playStatusIndex,
    updatedAt,
    gameName,
    gameBackgroundImageUrl,
    gameRating,
    gameMetacritic,
    gameReleased,
    gameGenres,
    gameGenreIds,
    gamePlatforms,
    gameTags,
    gameDeveloperIds,
    gameDescription,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'collection_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<CollectionItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('game_id')) {
      context.handle(
        _gameIdMeta,
        gameId.isAcceptableOrUnknown(data['game_id']!, _gameIdMeta),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('play_status_index')) {
      context.handle(
        _playStatusIndexMeta,
        playStatusIndex.isAcceptableOrUnknown(
          data['play_status_index']!,
          _playStatusIndexMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('game_name')) {
      context.handle(
        _gameNameMeta,
        gameName.isAcceptableOrUnknown(data['game_name']!, _gameNameMeta),
      );
    }
    if (data.containsKey('game_background_image_url')) {
      context.handle(
        _gameBackgroundImageUrlMeta,
        gameBackgroundImageUrl.isAcceptableOrUnknown(
          data['game_background_image_url']!,
          _gameBackgroundImageUrlMeta,
        ),
      );
    }
    if (data.containsKey('game_rating')) {
      context.handle(
        _gameRatingMeta,
        gameRating.isAcceptableOrUnknown(data['game_rating']!, _gameRatingMeta),
      );
    }
    if (data.containsKey('game_metacritic')) {
      context.handle(
        _gameMetacriticMeta,
        gameMetacritic.isAcceptableOrUnknown(
          data['game_metacritic']!,
          _gameMetacriticMeta,
        ),
      );
    }
    if (data.containsKey('game_released')) {
      context.handle(
        _gameReleasedMeta,
        gameReleased.isAcceptableOrUnknown(
          data['game_released']!,
          _gameReleasedMeta,
        ),
      );
    }
    if (data.containsKey('game_genres')) {
      context.handle(
        _gameGenresMeta,
        gameGenres.isAcceptableOrUnknown(data['game_genres']!, _gameGenresMeta),
      );
    }
    if (data.containsKey('game_genre_ids')) {
      context.handle(
        _gameGenreIdsMeta,
        gameGenreIds.isAcceptableOrUnknown(
          data['game_genre_ids']!,
          _gameGenreIdsMeta,
        ),
      );
    }
    if (data.containsKey('game_platforms')) {
      context.handle(
        _gamePlatformsMeta,
        gamePlatforms.isAcceptableOrUnknown(
          data['game_platforms']!,
          _gamePlatformsMeta,
        ),
      );
    }
    if (data.containsKey('game_tags')) {
      context.handle(
        _gameTagsMeta,
        gameTags.isAcceptableOrUnknown(data['game_tags']!, _gameTagsMeta),
      );
    }
    if (data.containsKey('game_developer_ids')) {
      context.handle(
        _gameDeveloperIdsMeta,
        gameDeveloperIds.isAcceptableOrUnknown(
          data['game_developer_ids']!,
          _gameDeveloperIdsMeta,
        ),
      );
    }
    if (data.containsKey('game_description')) {
      context.handle(
        _gameDescriptionMeta,
        gameDescription.isAcceptableOrUnknown(
          data['game_description']!,
          _gameDescriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {gameId};
  @override
  CollectionItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CollectionItem(
      gameId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_id'],
      )!,
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      playStatusIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}play_status_index'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      gameName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}game_name'],
      ),
      gameBackgroundImageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}game_background_image_url'],
      ),
      gameRating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}game_rating'],
      ),
      gameMetacritic: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_metacritic'],
      ),
      gameReleased: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_released'],
      ),
      gameGenres: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}game_genres'],
      ),
      gameGenreIds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}game_genre_ids'],
      ),
      gamePlatforms: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}game_platforms'],
      ),
      gameTags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}game_tags'],
      ),
      gameDeveloperIds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}game_developer_ids'],
      ),
      gameDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}game_description'],
      ),
    );
  }

  @override
  $CollectionItemsTable createAlias(String alias) {
    return $CollectionItemsTable(attachedDatabase, alias);
  }
}

class CollectionItem extends DataClass implements Insertable<CollectionItem> {
  final int gameId;
  final bool isFavorite;
  final int playStatusIndex;
  final int updatedAt;
  final String? gameName;
  final String? gameBackgroundImageUrl;
  final double? gameRating;
  final int? gameMetacritic;
  final int? gameReleased;
  final String? gameGenres;
  final String? gameGenreIds;
  final String? gamePlatforms;
  final String? gameTags;
  final String? gameDeveloperIds;
  final String? gameDescription;
  const CollectionItem({
    required this.gameId,
    required this.isFavorite,
    required this.playStatusIndex,
    required this.updatedAt,
    this.gameName,
    this.gameBackgroundImageUrl,
    this.gameRating,
    this.gameMetacritic,
    this.gameReleased,
    this.gameGenres,
    this.gameGenreIds,
    this.gamePlatforms,
    this.gameTags,
    this.gameDeveloperIds,
    this.gameDescription,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['game_id'] = Variable<int>(gameId);
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['play_status_index'] = Variable<int>(playStatusIndex);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || gameName != null) {
      map['game_name'] = Variable<String>(gameName);
    }
    if (!nullToAbsent || gameBackgroundImageUrl != null) {
      map['game_background_image_url'] = Variable<String>(
        gameBackgroundImageUrl,
      );
    }
    if (!nullToAbsent || gameRating != null) {
      map['game_rating'] = Variable<double>(gameRating);
    }
    if (!nullToAbsent || gameMetacritic != null) {
      map['game_metacritic'] = Variable<int>(gameMetacritic);
    }
    if (!nullToAbsent || gameReleased != null) {
      map['game_released'] = Variable<int>(gameReleased);
    }
    if (!nullToAbsent || gameGenres != null) {
      map['game_genres'] = Variable<String>(gameGenres);
    }
    if (!nullToAbsent || gameGenreIds != null) {
      map['game_genre_ids'] = Variable<String>(gameGenreIds);
    }
    if (!nullToAbsent || gamePlatforms != null) {
      map['game_platforms'] = Variable<String>(gamePlatforms);
    }
    if (!nullToAbsent || gameTags != null) {
      map['game_tags'] = Variable<String>(gameTags);
    }
    if (!nullToAbsent || gameDeveloperIds != null) {
      map['game_developer_ids'] = Variable<String>(gameDeveloperIds);
    }
    if (!nullToAbsent || gameDescription != null) {
      map['game_description'] = Variable<String>(gameDescription);
    }
    return map;
  }

  CollectionItemsCompanion toCompanion(bool nullToAbsent) {
    return CollectionItemsCompanion(
      gameId: Value(gameId),
      isFavorite: Value(isFavorite),
      playStatusIndex: Value(playStatusIndex),
      updatedAt: Value(updatedAt),
      gameName: gameName == null && nullToAbsent
          ? const Value.absent()
          : Value(gameName),
      gameBackgroundImageUrl: gameBackgroundImageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(gameBackgroundImageUrl),
      gameRating: gameRating == null && nullToAbsent
          ? const Value.absent()
          : Value(gameRating),
      gameMetacritic: gameMetacritic == null && nullToAbsent
          ? const Value.absent()
          : Value(gameMetacritic),
      gameReleased: gameReleased == null && nullToAbsent
          ? const Value.absent()
          : Value(gameReleased),
      gameGenres: gameGenres == null && nullToAbsent
          ? const Value.absent()
          : Value(gameGenres),
      gameGenreIds: gameGenreIds == null && nullToAbsent
          ? const Value.absent()
          : Value(gameGenreIds),
      gamePlatforms: gamePlatforms == null && nullToAbsent
          ? const Value.absent()
          : Value(gamePlatforms),
      gameTags: gameTags == null && nullToAbsent
          ? const Value.absent()
          : Value(gameTags),
      gameDeveloperIds: gameDeveloperIds == null && nullToAbsent
          ? const Value.absent()
          : Value(gameDeveloperIds),
      gameDescription: gameDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(gameDescription),
    );
  }

  factory CollectionItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CollectionItem(
      gameId: serializer.fromJson<int>(json['gameId']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      playStatusIndex: serializer.fromJson<int>(json['playStatusIndex']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      gameName: serializer.fromJson<String?>(json['gameName']),
      gameBackgroundImageUrl: serializer.fromJson<String?>(
        json['gameBackgroundImageUrl'],
      ),
      gameRating: serializer.fromJson<double?>(json['gameRating']),
      gameMetacritic: serializer.fromJson<int?>(json['gameMetacritic']),
      gameReleased: serializer.fromJson<int?>(json['gameReleased']),
      gameGenres: serializer.fromJson<String?>(json['gameGenres']),
      gameGenreIds: serializer.fromJson<String?>(json['gameGenreIds']),
      gamePlatforms: serializer.fromJson<String?>(json['gamePlatforms']),
      gameTags: serializer.fromJson<String?>(json['gameTags']),
      gameDeveloperIds: serializer.fromJson<String?>(json['gameDeveloperIds']),
      gameDescription: serializer.fromJson<String?>(json['gameDescription']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'gameId': serializer.toJson<int>(gameId),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'playStatusIndex': serializer.toJson<int>(playStatusIndex),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'gameName': serializer.toJson<String?>(gameName),
      'gameBackgroundImageUrl': serializer.toJson<String?>(
        gameBackgroundImageUrl,
      ),
      'gameRating': serializer.toJson<double?>(gameRating),
      'gameMetacritic': serializer.toJson<int?>(gameMetacritic),
      'gameReleased': serializer.toJson<int?>(gameReleased),
      'gameGenres': serializer.toJson<String?>(gameGenres),
      'gameGenreIds': serializer.toJson<String?>(gameGenreIds),
      'gamePlatforms': serializer.toJson<String?>(gamePlatforms),
      'gameTags': serializer.toJson<String?>(gameTags),
      'gameDeveloperIds': serializer.toJson<String?>(gameDeveloperIds),
      'gameDescription': serializer.toJson<String?>(gameDescription),
    };
  }

  CollectionItem copyWith({
    int? gameId,
    bool? isFavorite,
    int? playStatusIndex,
    int? updatedAt,
    Value<String?> gameName = const Value.absent(),
    Value<String?> gameBackgroundImageUrl = const Value.absent(),
    Value<double?> gameRating = const Value.absent(),
    Value<int?> gameMetacritic = const Value.absent(),
    Value<int?> gameReleased = const Value.absent(),
    Value<String?> gameGenres = const Value.absent(),
    Value<String?> gameGenreIds = const Value.absent(),
    Value<String?> gamePlatforms = const Value.absent(),
    Value<String?> gameTags = const Value.absent(),
    Value<String?> gameDeveloperIds = const Value.absent(),
    Value<String?> gameDescription = const Value.absent(),
  }) => CollectionItem(
    gameId: gameId ?? this.gameId,
    isFavorite: isFavorite ?? this.isFavorite,
    playStatusIndex: playStatusIndex ?? this.playStatusIndex,
    updatedAt: updatedAt ?? this.updatedAt,
    gameName: gameName.present ? gameName.value : this.gameName,
    gameBackgroundImageUrl: gameBackgroundImageUrl.present
        ? gameBackgroundImageUrl.value
        : this.gameBackgroundImageUrl,
    gameRating: gameRating.present ? gameRating.value : this.gameRating,
    gameMetacritic: gameMetacritic.present
        ? gameMetacritic.value
        : this.gameMetacritic,
    gameReleased: gameReleased.present ? gameReleased.value : this.gameReleased,
    gameGenres: gameGenres.present ? gameGenres.value : this.gameGenres,
    gameGenreIds: gameGenreIds.present ? gameGenreIds.value : this.gameGenreIds,
    gamePlatforms: gamePlatforms.present
        ? gamePlatforms.value
        : this.gamePlatforms,
    gameTags: gameTags.present ? gameTags.value : this.gameTags,
    gameDeveloperIds: gameDeveloperIds.present
        ? gameDeveloperIds.value
        : this.gameDeveloperIds,
    gameDescription: gameDescription.present
        ? gameDescription.value
        : this.gameDescription,
  );
  CollectionItem copyWithCompanion(CollectionItemsCompanion data) {
    return CollectionItem(
      gameId: data.gameId.present ? data.gameId.value : this.gameId,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      playStatusIndex: data.playStatusIndex.present
          ? data.playStatusIndex.value
          : this.playStatusIndex,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      gameName: data.gameName.present ? data.gameName.value : this.gameName,
      gameBackgroundImageUrl: data.gameBackgroundImageUrl.present
          ? data.gameBackgroundImageUrl.value
          : this.gameBackgroundImageUrl,
      gameRating: data.gameRating.present
          ? data.gameRating.value
          : this.gameRating,
      gameMetacritic: data.gameMetacritic.present
          ? data.gameMetacritic.value
          : this.gameMetacritic,
      gameReleased: data.gameReleased.present
          ? data.gameReleased.value
          : this.gameReleased,
      gameGenres: data.gameGenres.present
          ? data.gameGenres.value
          : this.gameGenres,
      gameGenreIds: data.gameGenreIds.present
          ? data.gameGenreIds.value
          : this.gameGenreIds,
      gamePlatforms: data.gamePlatforms.present
          ? data.gamePlatforms.value
          : this.gamePlatforms,
      gameTags: data.gameTags.present ? data.gameTags.value : this.gameTags,
      gameDeveloperIds: data.gameDeveloperIds.present
          ? data.gameDeveloperIds.value
          : this.gameDeveloperIds,
      gameDescription: data.gameDescription.present
          ? data.gameDescription.value
          : this.gameDescription,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CollectionItem(')
          ..write('gameId: $gameId, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('playStatusIndex: $playStatusIndex, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('gameName: $gameName, ')
          ..write('gameBackgroundImageUrl: $gameBackgroundImageUrl, ')
          ..write('gameRating: $gameRating, ')
          ..write('gameMetacritic: $gameMetacritic, ')
          ..write('gameReleased: $gameReleased, ')
          ..write('gameGenres: $gameGenres, ')
          ..write('gameGenreIds: $gameGenreIds, ')
          ..write('gamePlatforms: $gamePlatforms, ')
          ..write('gameTags: $gameTags, ')
          ..write('gameDeveloperIds: $gameDeveloperIds, ')
          ..write('gameDescription: $gameDescription')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    gameId,
    isFavorite,
    playStatusIndex,
    updatedAt,
    gameName,
    gameBackgroundImageUrl,
    gameRating,
    gameMetacritic,
    gameReleased,
    gameGenres,
    gameGenreIds,
    gamePlatforms,
    gameTags,
    gameDeveloperIds,
    gameDescription,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CollectionItem &&
          other.gameId == this.gameId &&
          other.isFavorite == this.isFavorite &&
          other.playStatusIndex == this.playStatusIndex &&
          other.updatedAt == this.updatedAt &&
          other.gameName == this.gameName &&
          other.gameBackgroundImageUrl == this.gameBackgroundImageUrl &&
          other.gameRating == this.gameRating &&
          other.gameMetacritic == this.gameMetacritic &&
          other.gameReleased == this.gameReleased &&
          other.gameGenres == this.gameGenres &&
          other.gameGenreIds == this.gameGenreIds &&
          other.gamePlatforms == this.gamePlatforms &&
          other.gameTags == this.gameTags &&
          other.gameDeveloperIds == this.gameDeveloperIds &&
          other.gameDescription == this.gameDescription);
}

class CollectionItemsCompanion extends UpdateCompanion<CollectionItem> {
  final Value<int> gameId;
  final Value<bool> isFavorite;
  final Value<int> playStatusIndex;
  final Value<int> updatedAt;
  final Value<String?> gameName;
  final Value<String?> gameBackgroundImageUrl;
  final Value<double?> gameRating;
  final Value<int?> gameMetacritic;
  final Value<int?> gameReleased;
  final Value<String?> gameGenres;
  final Value<String?> gameGenreIds;
  final Value<String?> gamePlatforms;
  final Value<String?> gameTags;
  final Value<String?> gameDeveloperIds;
  final Value<String?> gameDescription;
  const CollectionItemsCompanion({
    this.gameId = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.playStatusIndex = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.gameName = const Value.absent(),
    this.gameBackgroundImageUrl = const Value.absent(),
    this.gameRating = const Value.absent(),
    this.gameMetacritic = const Value.absent(),
    this.gameReleased = const Value.absent(),
    this.gameGenres = const Value.absent(),
    this.gameGenreIds = const Value.absent(),
    this.gamePlatforms = const Value.absent(),
    this.gameTags = const Value.absent(),
    this.gameDeveloperIds = const Value.absent(),
    this.gameDescription = const Value.absent(),
  });
  CollectionItemsCompanion.insert({
    this.gameId = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.playStatusIndex = const Value.absent(),
    required int updatedAt,
    this.gameName = const Value.absent(),
    this.gameBackgroundImageUrl = const Value.absent(),
    this.gameRating = const Value.absent(),
    this.gameMetacritic = const Value.absent(),
    this.gameReleased = const Value.absent(),
    this.gameGenres = const Value.absent(),
    this.gameGenreIds = const Value.absent(),
    this.gamePlatforms = const Value.absent(),
    this.gameTags = const Value.absent(),
    this.gameDeveloperIds = const Value.absent(),
    this.gameDescription = const Value.absent(),
  }) : updatedAt = Value(updatedAt);
  static Insertable<CollectionItem> custom({
    Expression<int>? gameId,
    Expression<bool>? isFavorite,
    Expression<int>? playStatusIndex,
    Expression<int>? updatedAt,
    Expression<String>? gameName,
    Expression<String>? gameBackgroundImageUrl,
    Expression<double>? gameRating,
    Expression<int>? gameMetacritic,
    Expression<int>? gameReleased,
    Expression<String>? gameGenres,
    Expression<String>? gameGenreIds,
    Expression<String>? gamePlatforms,
    Expression<String>? gameTags,
    Expression<String>? gameDeveloperIds,
    Expression<String>? gameDescription,
  }) {
    return RawValuesInsertable({
      if (gameId != null) 'game_id': gameId,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (playStatusIndex != null) 'play_status_index': playStatusIndex,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (gameName != null) 'game_name': gameName,
      if (gameBackgroundImageUrl != null)
        'game_background_image_url': gameBackgroundImageUrl,
      if (gameRating != null) 'game_rating': gameRating,
      if (gameMetacritic != null) 'game_metacritic': gameMetacritic,
      if (gameReleased != null) 'game_released': gameReleased,
      if (gameGenres != null) 'game_genres': gameGenres,
      if (gameGenreIds != null) 'game_genre_ids': gameGenreIds,
      if (gamePlatforms != null) 'game_platforms': gamePlatforms,
      if (gameTags != null) 'game_tags': gameTags,
      if (gameDeveloperIds != null) 'game_developer_ids': gameDeveloperIds,
      if (gameDescription != null) 'game_description': gameDescription,
    });
  }

  CollectionItemsCompanion copyWith({
    Value<int>? gameId,
    Value<bool>? isFavorite,
    Value<int>? playStatusIndex,
    Value<int>? updatedAt,
    Value<String?>? gameName,
    Value<String?>? gameBackgroundImageUrl,
    Value<double?>? gameRating,
    Value<int?>? gameMetacritic,
    Value<int?>? gameReleased,
    Value<String?>? gameGenres,
    Value<String?>? gameGenreIds,
    Value<String?>? gamePlatforms,
    Value<String?>? gameTags,
    Value<String?>? gameDeveloperIds,
    Value<String?>? gameDescription,
  }) {
    return CollectionItemsCompanion(
      gameId: gameId ?? this.gameId,
      isFavorite: isFavorite ?? this.isFavorite,
      playStatusIndex: playStatusIndex ?? this.playStatusIndex,
      updatedAt: updatedAt ?? this.updatedAt,
      gameName: gameName ?? this.gameName,
      gameBackgroundImageUrl:
          gameBackgroundImageUrl ?? this.gameBackgroundImageUrl,
      gameRating: gameRating ?? this.gameRating,
      gameMetacritic: gameMetacritic ?? this.gameMetacritic,
      gameReleased: gameReleased ?? this.gameReleased,
      gameGenres: gameGenres ?? this.gameGenres,
      gameGenreIds: gameGenreIds ?? this.gameGenreIds,
      gamePlatforms: gamePlatforms ?? this.gamePlatforms,
      gameTags: gameTags ?? this.gameTags,
      gameDeveloperIds: gameDeveloperIds ?? this.gameDeveloperIds,
      gameDescription: gameDescription ?? this.gameDescription,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (gameId.present) {
      map['game_id'] = Variable<int>(gameId.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (playStatusIndex.present) {
      map['play_status_index'] = Variable<int>(playStatusIndex.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (gameName.present) {
      map['game_name'] = Variable<String>(gameName.value);
    }
    if (gameBackgroundImageUrl.present) {
      map['game_background_image_url'] = Variable<String>(
        gameBackgroundImageUrl.value,
      );
    }
    if (gameRating.present) {
      map['game_rating'] = Variable<double>(gameRating.value);
    }
    if (gameMetacritic.present) {
      map['game_metacritic'] = Variable<int>(gameMetacritic.value);
    }
    if (gameReleased.present) {
      map['game_released'] = Variable<int>(gameReleased.value);
    }
    if (gameGenres.present) {
      map['game_genres'] = Variable<String>(gameGenres.value);
    }
    if (gameGenreIds.present) {
      map['game_genre_ids'] = Variable<String>(gameGenreIds.value);
    }
    if (gamePlatforms.present) {
      map['game_platforms'] = Variable<String>(gamePlatforms.value);
    }
    if (gameTags.present) {
      map['game_tags'] = Variable<String>(gameTags.value);
    }
    if (gameDeveloperIds.present) {
      map['game_developer_ids'] = Variable<String>(gameDeveloperIds.value);
    }
    if (gameDescription.present) {
      map['game_description'] = Variable<String>(gameDescription.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionItemsCompanion(')
          ..write('gameId: $gameId, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('playStatusIndex: $playStatusIndex, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('gameName: $gameName, ')
          ..write('gameBackgroundImageUrl: $gameBackgroundImageUrl, ')
          ..write('gameRating: $gameRating, ')
          ..write('gameMetacritic: $gameMetacritic, ')
          ..write('gameReleased: $gameReleased, ')
          ..write('gameGenres: $gameGenres, ')
          ..write('gameGenreIds: $gameGenreIds, ')
          ..write('gamePlatforms: $gamePlatforms, ')
          ..write('gameTags: $gameTags, ')
          ..write('gameDeveloperIds: $gameDeveloperIds, ')
          ..write('gameDescription: $gameDescription')
          ..write(')'))
        .toString();
  }
}

class $GameCacheTable extends GameCache
    with TableInfo<$GameCacheTable, GameCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _gameIdMeta = const VerificationMeta('gameId');
  @override
  late final GeneratedColumn<int> gameId = GeneratedColumn<int>(
    'game_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gameNameMeta = const VerificationMeta(
    'gameName',
  );
  @override
  late final GeneratedColumn<String> gameName = GeneratedColumn<String>(
    'game_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _gameBackgroundImageUrlMeta =
      const VerificationMeta('gameBackgroundImageUrl');
  @override
  late final GeneratedColumn<String> gameBackgroundImageUrl =
      GeneratedColumn<String>(
        'game_background_image_url',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _gameRatingMeta = const VerificationMeta(
    'gameRating',
  );
  @override
  late final GeneratedColumn<double> gameRating = GeneratedColumn<double>(
    'game_rating',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gameMetacriticMeta = const VerificationMeta(
    'gameMetacritic',
  );
  @override
  late final GeneratedColumn<int> gameMetacritic = GeneratedColumn<int>(
    'game_metacritic',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gameReleasedMeta = const VerificationMeta(
    'gameReleased',
  );
  @override
  late final GeneratedColumn<int> gameReleased = GeneratedColumn<int>(
    'game_released',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gameGenresMeta = const VerificationMeta(
    'gameGenres',
  );
  @override
  late final GeneratedColumn<String> gameGenres = GeneratedColumn<String>(
    'game_genres',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gameGenreIdsMeta = const VerificationMeta(
    'gameGenreIds',
  );
  @override
  late final GeneratedColumn<String> gameGenreIds = GeneratedColumn<String>(
    'game_genre_ids',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gamePlatformsMeta = const VerificationMeta(
    'gamePlatforms',
  );
  @override
  late final GeneratedColumn<String> gamePlatforms = GeneratedColumn<String>(
    'game_platforms',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gameTagsMeta = const VerificationMeta(
    'gameTags',
  );
  @override
  late final GeneratedColumn<String> gameTags = GeneratedColumn<String>(
    'game_tags',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gameDeveloperIdsMeta = const VerificationMeta(
    'gameDeveloperIds',
  );
  @override
  late final GeneratedColumn<String> gameDeveloperIds = GeneratedColumn<String>(
    'game_developer_ids',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gameDescriptionMeta = const VerificationMeta(
    'gameDescription',
  );
  @override
  late final GeneratedColumn<String> gameDescription = GeneratedColumn<String>(
    'game_description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<int> cachedAt = GeneratedColumn<int>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    gameId,
    gameName,
    gameBackgroundImageUrl,
    gameRating,
    gameMetacritic,
    gameReleased,
    gameGenres,
    gameGenreIds,
    gamePlatforms,
    gameTags,
    gameDeveloperIds,
    gameDescription,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<GameCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('game_id')) {
      context.handle(
        _gameIdMeta,
        gameId.isAcceptableOrUnknown(data['game_id']!, _gameIdMeta),
      );
    }
    if (data.containsKey('game_name')) {
      context.handle(
        _gameNameMeta,
        gameName.isAcceptableOrUnknown(data['game_name']!, _gameNameMeta),
      );
    } else if (isInserting) {
      context.missing(_gameNameMeta);
    }
    if (data.containsKey('game_background_image_url')) {
      context.handle(
        _gameBackgroundImageUrlMeta,
        gameBackgroundImageUrl.isAcceptableOrUnknown(
          data['game_background_image_url']!,
          _gameBackgroundImageUrlMeta,
        ),
      );
    }
    if (data.containsKey('game_rating')) {
      context.handle(
        _gameRatingMeta,
        gameRating.isAcceptableOrUnknown(data['game_rating']!, _gameRatingMeta),
      );
    }
    if (data.containsKey('game_metacritic')) {
      context.handle(
        _gameMetacriticMeta,
        gameMetacritic.isAcceptableOrUnknown(
          data['game_metacritic']!,
          _gameMetacriticMeta,
        ),
      );
    }
    if (data.containsKey('game_released')) {
      context.handle(
        _gameReleasedMeta,
        gameReleased.isAcceptableOrUnknown(
          data['game_released']!,
          _gameReleasedMeta,
        ),
      );
    }
    if (data.containsKey('game_genres')) {
      context.handle(
        _gameGenresMeta,
        gameGenres.isAcceptableOrUnknown(data['game_genres']!, _gameGenresMeta),
      );
    }
    if (data.containsKey('game_genre_ids')) {
      context.handle(
        _gameGenreIdsMeta,
        gameGenreIds.isAcceptableOrUnknown(
          data['game_genre_ids']!,
          _gameGenreIdsMeta,
        ),
      );
    }
    if (data.containsKey('game_platforms')) {
      context.handle(
        _gamePlatformsMeta,
        gamePlatforms.isAcceptableOrUnknown(
          data['game_platforms']!,
          _gamePlatformsMeta,
        ),
      );
    }
    if (data.containsKey('game_tags')) {
      context.handle(
        _gameTagsMeta,
        gameTags.isAcceptableOrUnknown(data['game_tags']!, _gameTagsMeta),
      );
    }
    if (data.containsKey('game_developer_ids')) {
      context.handle(
        _gameDeveloperIdsMeta,
        gameDeveloperIds.isAcceptableOrUnknown(
          data['game_developer_ids']!,
          _gameDeveloperIdsMeta,
        ),
      );
    }
    if (data.containsKey('game_description')) {
      context.handle(
        _gameDescriptionMeta,
        gameDescription.isAcceptableOrUnknown(
          data['game_description']!,
          _gameDescriptionMeta,
        ),
      );
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {gameId};
  @override
  GameCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameCacheData(
      gameId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_id'],
      )!,
      gameName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}game_name'],
      )!,
      gameBackgroundImageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}game_background_image_url'],
      ),
      gameRating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}game_rating'],
      ),
      gameMetacritic: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_metacritic'],
      ),
      gameReleased: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_released'],
      ),
      gameGenres: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}game_genres'],
      ),
      gameGenreIds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}game_genre_ids'],
      ),
      gamePlatforms: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}game_platforms'],
      ),
      gameTags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}game_tags'],
      ),
      gameDeveloperIds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}game_developer_ids'],
      ),
      gameDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}game_description'],
      ),
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $GameCacheTable createAlias(String alias) {
    return $GameCacheTable(attachedDatabase, alias);
  }
}

class GameCacheData extends DataClass implements Insertable<GameCacheData> {
  final int gameId;
  final String gameName;
  final String? gameBackgroundImageUrl;
  final double? gameRating;
  final int? gameMetacritic;
  final int? gameReleased;
  final String? gameGenres;
  final String? gameGenreIds;
  final String? gamePlatforms;
  final String? gameTags;
  final String? gameDeveloperIds;
  final String? gameDescription;
  final int cachedAt;
  const GameCacheData({
    required this.gameId,
    required this.gameName,
    this.gameBackgroundImageUrl,
    this.gameRating,
    this.gameMetacritic,
    this.gameReleased,
    this.gameGenres,
    this.gameGenreIds,
    this.gamePlatforms,
    this.gameTags,
    this.gameDeveloperIds,
    this.gameDescription,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['game_id'] = Variable<int>(gameId);
    map['game_name'] = Variable<String>(gameName);
    if (!nullToAbsent || gameBackgroundImageUrl != null) {
      map['game_background_image_url'] = Variable<String>(
        gameBackgroundImageUrl,
      );
    }
    if (!nullToAbsent || gameRating != null) {
      map['game_rating'] = Variable<double>(gameRating);
    }
    if (!nullToAbsent || gameMetacritic != null) {
      map['game_metacritic'] = Variable<int>(gameMetacritic);
    }
    if (!nullToAbsent || gameReleased != null) {
      map['game_released'] = Variable<int>(gameReleased);
    }
    if (!nullToAbsent || gameGenres != null) {
      map['game_genres'] = Variable<String>(gameGenres);
    }
    if (!nullToAbsent || gameGenreIds != null) {
      map['game_genre_ids'] = Variable<String>(gameGenreIds);
    }
    if (!nullToAbsent || gamePlatforms != null) {
      map['game_platforms'] = Variable<String>(gamePlatforms);
    }
    if (!nullToAbsent || gameTags != null) {
      map['game_tags'] = Variable<String>(gameTags);
    }
    if (!nullToAbsent || gameDeveloperIds != null) {
      map['game_developer_ids'] = Variable<String>(gameDeveloperIds);
    }
    if (!nullToAbsent || gameDescription != null) {
      map['game_description'] = Variable<String>(gameDescription);
    }
    map['cached_at'] = Variable<int>(cachedAt);
    return map;
  }

  GameCacheCompanion toCompanion(bool nullToAbsent) {
    return GameCacheCompanion(
      gameId: Value(gameId),
      gameName: Value(gameName),
      gameBackgroundImageUrl: gameBackgroundImageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(gameBackgroundImageUrl),
      gameRating: gameRating == null && nullToAbsent
          ? const Value.absent()
          : Value(gameRating),
      gameMetacritic: gameMetacritic == null && nullToAbsent
          ? const Value.absent()
          : Value(gameMetacritic),
      gameReleased: gameReleased == null && nullToAbsent
          ? const Value.absent()
          : Value(gameReleased),
      gameGenres: gameGenres == null && nullToAbsent
          ? const Value.absent()
          : Value(gameGenres),
      gameGenreIds: gameGenreIds == null && nullToAbsent
          ? const Value.absent()
          : Value(gameGenreIds),
      gamePlatforms: gamePlatforms == null && nullToAbsent
          ? const Value.absent()
          : Value(gamePlatforms),
      gameTags: gameTags == null && nullToAbsent
          ? const Value.absent()
          : Value(gameTags),
      gameDeveloperIds: gameDeveloperIds == null && nullToAbsent
          ? const Value.absent()
          : Value(gameDeveloperIds),
      gameDescription: gameDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(gameDescription),
      cachedAt: Value(cachedAt),
    );
  }

  factory GameCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameCacheData(
      gameId: serializer.fromJson<int>(json['gameId']),
      gameName: serializer.fromJson<String>(json['gameName']),
      gameBackgroundImageUrl: serializer.fromJson<String?>(
        json['gameBackgroundImageUrl'],
      ),
      gameRating: serializer.fromJson<double?>(json['gameRating']),
      gameMetacritic: serializer.fromJson<int?>(json['gameMetacritic']),
      gameReleased: serializer.fromJson<int?>(json['gameReleased']),
      gameGenres: serializer.fromJson<String?>(json['gameGenres']),
      gameGenreIds: serializer.fromJson<String?>(json['gameGenreIds']),
      gamePlatforms: serializer.fromJson<String?>(json['gamePlatforms']),
      gameTags: serializer.fromJson<String?>(json['gameTags']),
      gameDeveloperIds: serializer.fromJson<String?>(json['gameDeveloperIds']),
      gameDescription: serializer.fromJson<String?>(json['gameDescription']),
      cachedAt: serializer.fromJson<int>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'gameId': serializer.toJson<int>(gameId),
      'gameName': serializer.toJson<String>(gameName),
      'gameBackgroundImageUrl': serializer.toJson<String?>(
        gameBackgroundImageUrl,
      ),
      'gameRating': serializer.toJson<double?>(gameRating),
      'gameMetacritic': serializer.toJson<int?>(gameMetacritic),
      'gameReleased': serializer.toJson<int?>(gameReleased),
      'gameGenres': serializer.toJson<String?>(gameGenres),
      'gameGenreIds': serializer.toJson<String?>(gameGenreIds),
      'gamePlatforms': serializer.toJson<String?>(gamePlatforms),
      'gameTags': serializer.toJson<String?>(gameTags),
      'gameDeveloperIds': serializer.toJson<String?>(gameDeveloperIds),
      'gameDescription': serializer.toJson<String?>(gameDescription),
      'cachedAt': serializer.toJson<int>(cachedAt),
    };
  }

  GameCacheData copyWith({
    int? gameId,
    String? gameName,
    Value<String?> gameBackgroundImageUrl = const Value.absent(),
    Value<double?> gameRating = const Value.absent(),
    Value<int?> gameMetacritic = const Value.absent(),
    Value<int?> gameReleased = const Value.absent(),
    Value<String?> gameGenres = const Value.absent(),
    Value<String?> gameGenreIds = const Value.absent(),
    Value<String?> gamePlatforms = const Value.absent(),
    Value<String?> gameTags = const Value.absent(),
    Value<String?> gameDeveloperIds = const Value.absent(),
    Value<String?> gameDescription = const Value.absent(),
    int? cachedAt,
  }) => GameCacheData(
    gameId: gameId ?? this.gameId,
    gameName: gameName ?? this.gameName,
    gameBackgroundImageUrl: gameBackgroundImageUrl.present
        ? gameBackgroundImageUrl.value
        : this.gameBackgroundImageUrl,
    gameRating: gameRating.present ? gameRating.value : this.gameRating,
    gameMetacritic: gameMetacritic.present
        ? gameMetacritic.value
        : this.gameMetacritic,
    gameReleased: gameReleased.present ? gameReleased.value : this.gameReleased,
    gameGenres: gameGenres.present ? gameGenres.value : this.gameGenres,
    gameGenreIds: gameGenreIds.present ? gameGenreIds.value : this.gameGenreIds,
    gamePlatforms: gamePlatforms.present
        ? gamePlatforms.value
        : this.gamePlatforms,
    gameTags: gameTags.present ? gameTags.value : this.gameTags,
    gameDeveloperIds: gameDeveloperIds.present
        ? gameDeveloperIds.value
        : this.gameDeveloperIds,
    gameDescription: gameDescription.present
        ? gameDescription.value
        : this.gameDescription,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  GameCacheData copyWithCompanion(GameCacheCompanion data) {
    return GameCacheData(
      gameId: data.gameId.present ? data.gameId.value : this.gameId,
      gameName: data.gameName.present ? data.gameName.value : this.gameName,
      gameBackgroundImageUrl: data.gameBackgroundImageUrl.present
          ? data.gameBackgroundImageUrl.value
          : this.gameBackgroundImageUrl,
      gameRating: data.gameRating.present
          ? data.gameRating.value
          : this.gameRating,
      gameMetacritic: data.gameMetacritic.present
          ? data.gameMetacritic.value
          : this.gameMetacritic,
      gameReleased: data.gameReleased.present
          ? data.gameReleased.value
          : this.gameReleased,
      gameGenres: data.gameGenres.present
          ? data.gameGenres.value
          : this.gameGenres,
      gameGenreIds: data.gameGenreIds.present
          ? data.gameGenreIds.value
          : this.gameGenreIds,
      gamePlatforms: data.gamePlatforms.present
          ? data.gamePlatforms.value
          : this.gamePlatforms,
      gameTags: data.gameTags.present ? data.gameTags.value : this.gameTags,
      gameDeveloperIds: data.gameDeveloperIds.present
          ? data.gameDeveloperIds.value
          : this.gameDeveloperIds,
      gameDescription: data.gameDescription.present
          ? data.gameDescription.value
          : this.gameDescription,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameCacheData(')
          ..write('gameId: $gameId, ')
          ..write('gameName: $gameName, ')
          ..write('gameBackgroundImageUrl: $gameBackgroundImageUrl, ')
          ..write('gameRating: $gameRating, ')
          ..write('gameMetacritic: $gameMetacritic, ')
          ..write('gameReleased: $gameReleased, ')
          ..write('gameGenres: $gameGenres, ')
          ..write('gameGenreIds: $gameGenreIds, ')
          ..write('gamePlatforms: $gamePlatforms, ')
          ..write('gameTags: $gameTags, ')
          ..write('gameDeveloperIds: $gameDeveloperIds, ')
          ..write('gameDescription: $gameDescription, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    gameId,
    gameName,
    gameBackgroundImageUrl,
    gameRating,
    gameMetacritic,
    gameReleased,
    gameGenres,
    gameGenreIds,
    gamePlatforms,
    gameTags,
    gameDeveloperIds,
    gameDescription,
    cachedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameCacheData &&
          other.gameId == this.gameId &&
          other.gameName == this.gameName &&
          other.gameBackgroundImageUrl == this.gameBackgroundImageUrl &&
          other.gameRating == this.gameRating &&
          other.gameMetacritic == this.gameMetacritic &&
          other.gameReleased == this.gameReleased &&
          other.gameGenres == this.gameGenres &&
          other.gameGenreIds == this.gameGenreIds &&
          other.gamePlatforms == this.gamePlatforms &&
          other.gameTags == this.gameTags &&
          other.gameDeveloperIds == this.gameDeveloperIds &&
          other.gameDescription == this.gameDescription &&
          other.cachedAt == this.cachedAt);
}

class GameCacheCompanion extends UpdateCompanion<GameCacheData> {
  final Value<int> gameId;
  final Value<String> gameName;
  final Value<String?> gameBackgroundImageUrl;
  final Value<double?> gameRating;
  final Value<int?> gameMetacritic;
  final Value<int?> gameReleased;
  final Value<String?> gameGenres;
  final Value<String?> gameGenreIds;
  final Value<String?> gamePlatforms;
  final Value<String?> gameTags;
  final Value<String?> gameDeveloperIds;
  final Value<String?> gameDescription;
  final Value<int> cachedAt;
  const GameCacheCompanion({
    this.gameId = const Value.absent(),
    this.gameName = const Value.absent(),
    this.gameBackgroundImageUrl = const Value.absent(),
    this.gameRating = const Value.absent(),
    this.gameMetacritic = const Value.absent(),
    this.gameReleased = const Value.absent(),
    this.gameGenres = const Value.absent(),
    this.gameGenreIds = const Value.absent(),
    this.gamePlatforms = const Value.absent(),
    this.gameTags = const Value.absent(),
    this.gameDeveloperIds = const Value.absent(),
    this.gameDescription = const Value.absent(),
    this.cachedAt = const Value.absent(),
  });
  GameCacheCompanion.insert({
    this.gameId = const Value.absent(),
    required String gameName,
    this.gameBackgroundImageUrl = const Value.absent(),
    this.gameRating = const Value.absent(),
    this.gameMetacritic = const Value.absent(),
    this.gameReleased = const Value.absent(),
    this.gameGenres = const Value.absent(),
    this.gameGenreIds = const Value.absent(),
    this.gamePlatforms = const Value.absent(),
    this.gameTags = const Value.absent(),
    this.gameDeveloperIds = const Value.absent(),
    this.gameDescription = const Value.absent(),
    required int cachedAt,
  }) : gameName = Value(gameName),
       cachedAt = Value(cachedAt);
  static Insertable<GameCacheData> custom({
    Expression<int>? gameId,
    Expression<String>? gameName,
    Expression<String>? gameBackgroundImageUrl,
    Expression<double>? gameRating,
    Expression<int>? gameMetacritic,
    Expression<int>? gameReleased,
    Expression<String>? gameGenres,
    Expression<String>? gameGenreIds,
    Expression<String>? gamePlatforms,
    Expression<String>? gameTags,
    Expression<String>? gameDeveloperIds,
    Expression<String>? gameDescription,
    Expression<int>? cachedAt,
  }) {
    return RawValuesInsertable({
      if (gameId != null) 'game_id': gameId,
      if (gameName != null) 'game_name': gameName,
      if (gameBackgroundImageUrl != null)
        'game_background_image_url': gameBackgroundImageUrl,
      if (gameRating != null) 'game_rating': gameRating,
      if (gameMetacritic != null) 'game_metacritic': gameMetacritic,
      if (gameReleased != null) 'game_released': gameReleased,
      if (gameGenres != null) 'game_genres': gameGenres,
      if (gameGenreIds != null) 'game_genre_ids': gameGenreIds,
      if (gamePlatforms != null) 'game_platforms': gamePlatforms,
      if (gameTags != null) 'game_tags': gameTags,
      if (gameDeveloperIds != null) 'game_developer_ids': gameDeveloperIds,
      if (gameDescription != null) 'game_description': gameDescription,
      if (cachedAt != null) 'cached_at': cachedAt,
    });
  }

  GameCacheCompanion copyWith({
    Value<int>? gameId,
    Value<String>? gameName,
    Value<String?>? gameBackgroundImageUrl,
    Value<double?>? gameRating,
    Value<int?>? gameMetacritic,
    Value<int?>? gameReleased,
    Value<String?>? gameGenres,
    Value<String?>? gameGenreIds,
    Value<String?>? gamePlatforms,
    Value<String?>? gameTags,
    Value<String?>? gameDeveloperIds,
    Value<String?>? gameDescription,
    Value<int>? cachedAt,
  }) {
    return GameCacheCompanion(
      gameId: gameId ?? this.gameId,
      gameName: gameName ?? this.gameName,
      gameBackgroundImageUrl:
          gameBackgroundImageUrl ?? this.gameBackgroundImageUrl,
      gameRating: gameRating ?? this.gameRating,
      gameMetacritic: gameMetacritic ?? this.gameMetacritic,
      gameReleased: gameReleased ?? this.gameReleased,
      gameGenres: gameGenres ?? this.gameGenres,
      gameGenreIds: gameGenreIds ?? this.gameGenreIds,
      gamePlatforms: gamePlatforms ?? this.gamePlatforms,
      gameTags: gameTags ?? this.gameTags,
      gameDeveloperIds: gameDeveloperIds ?? this.gameDeveloperIds,
      gameDescription: gameDescription ?? this.gameDescription,
      cachedAt: cachedAt ?? this.cachedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (gameId.present) {
      map['game_id'] = Variable<int>(gameId.value);
    }
    if (gameName.present) {
      map['game_name'] = Variable<String>(gameName.value);
    }
    if (gameBackgroundImageUrl.present) {
      map['game_background_image_url'] = Variable<String>(
        gameBackgroundImageUrl.value,
      );
    }
    if (gameRating.present) {
      map['game_rating'] = Variable<double>(gameRating.value);
    }
    if (gameMetacritic.present) {
      map['game_metacritic'] = Variable<int>(gameMetacritic.value);
    }
    if (gameReleased.present) {
      map['game_released'] = Variable<int>(gameReleased.value);
    }
    if (gameGenres.present) {
      map['game_genres'] = Variable<String>(gameGenres.value);
    }
    if (gameGenreIds.present) {
      map['game_genre_ids'] = Variable<String>(gameGenreIds.value);
    }
    if (gamePlatforms.present) {
      map['game_platforms'] = Variable<String>(gamePlatforms.value);
    }
    if (gameTags.present) {
      map['game_tags'] = Variable<String>(gameTags.value);
    }
    if (gameDeveloperIds.present) {
      map['game_developer_ids'] = Variable<String>(gameDeveloperIds.value);
    }
    if (gameDescription.present) {
      map['game_description'] = Variable<String>(gameDescription.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<int>(cachedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameCacheCompanion(')
          ..write('gameId: $gameId, ')
          ..write('gameName: $gameName, ')
          ..write('gameBackgroundImageUrl: $gameBackgroundImageUrl, ')
          ..write('gameRating: $gameRating, ')
          ..write('gameMetacritic: $gameMetacritic, ')
          ..write('gameReleased: $gameReleased, ')
          ..write('gameGenres: $gameGenres, ')
          ..write('gameGenreIds: $gameGenreIds, ')
          ..write('gamePlatforms: $gamePlatforms, ')
          ..write('gameTags: $gameTags, ')
          ..write('gameDeveloperIds: $gameDeveloperIds, ')
          ..write('gameDescription: $gameDescription, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CollectionItemsTable collectionItems = $CollectionItemsTable(
    this,
  );
  late final $GameCacheTable gameCache = $GameCacheTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    collectionItems,
    gameCache,
  ];
}

typedef $$CollectionItemsTableCreateCompanionBuilder =
    CollectionItemsCompanion Function({
      Value<int> gameId,
      Value<bool> isFavorite,
      Value<int> playStatusIndex,
      required int updatedAt,
      Value<String?> gameName,
      Value<String?> gameBackgroundImageUrl,
      Value<double?> gameRating,
      Value<int?> gameMetacritic,
      Value<int?> gameReleased,
      Value<String?> gameGenres,
      Value<String?> gameGenreIds,
      Value<String?> gamePlatforms,
      Value<String?> gameTags,
      Value<String?> gameDeveloperIds,
      Value<String?> gameDescription,
    });
typedef $$CollectionItemsTableUpdateCompanionBuilder =
    CollectionItemsCompanion Function({
      Value<int> gameId,
      Value<bool> isFavorite,
      Value<int> playStatusIndex,
      Value<int> updatedAt,
      Value<String?> gameName,
      Value<String?> gameBackgroundImageUrl,
      Value<double?> gameRating,
      Value<int?> gameMetacritic,
      Value<int?> gameReleased,
      Value<String?> gameGenres,
      Value<String?> gameGenreIds,
      Value<String?> gamePlatforms,
      Value<String?> gameTags,
      Value<String?> gameDeveloperIds,
      Value<String?> gameDescription,
    });

class $$CollectionItemsTableFilterComposer
    extends Composer<_$AppDatabase, $CollectionItemsTable> {
  $$CollectionItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get gameId => $composableBuilder(
    column: $table.gameId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get playStatusIndex => $composableBuilder(
    column: $table.playStatusIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gameName => $composableBuilder(
    column: $table.gameName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gameBackgroundImageUrl => $composableBuilder(
    column: $table.gameBackgroundImageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get gameRating => $composableBuilder(
    column: $table.gameRating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get gameMetacritic => $composableBuilder(
    column: $table.gameMetacritic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get gameReleased => $composableBuilder(
    column: $table.gameReleased,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gameGenres => $composableBuilder(
    column: $table.gameGenres,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gameGenreIds => $composableBuilder(
    column: $table.gameGenreIds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gamePlatforms => $composableBuilder(
    column: $table.gamePlatforms,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gameTags => $composableBuilder(
    column: $table.gameTags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gameDeveloperIds => $composableBuilder(
    column: $table.gameDeveloperIds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gameDescription => $composableBuilder(
    column: $table.gameDescription,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CollectionItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $CollectionItemsTable> {
  $$CollectionItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get gameId => $composableBuilder(
    column: $table.gameId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get playStatusIndex => $composableBuilder(
    column: $table.playStatusIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gameName => $composableBuilder(
    column: $table.gameName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gameBackgroundImageUrl => $composableBuilder(
    column: $table.gameBackgroundImageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get gameRating => $composableBuilder(
    column: $table.gameRating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get gameMetacritic => $composableBuilder(
    column: $table.gameMetacritic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get gameReleased => $composableBuilder(
    column: $table.gameReleased,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gameGenres => $composableBuilder(
    column: $table.gameGenres,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gameGenreIds => $composableBuilder(
    column: $table.gameGenreIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gamePlatforms => $composableBuilder(
    column: $table.gamePlatforms,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gameTags => $composableBuilder(
    column: $table.gameTags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gameDeveloperIds => $composableBuilder(
    column: $table.gameDeveloperIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gameDescription => $composableBuilder(
    column: $table.gameDescription,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CollectionItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CollectionItemsTable> {
  $$CollectionItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get gameId =>
      $composableBuilder(column: $table.gameId, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<int> get playStatusIndex => $composableBuilder(
    column: $table.playStatusIndex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get gameName =>
      $composableBuilder(column: $table.gameName, builder: (column) => column);

  GeneratedColumn<String> get gameBackgroundImageUrl => $composableBuilder(
    column: $table.gameBackgroundImageUrl,
    builder: (column) => column,
  );

  GeneratedColumn<double> get gameRating => $composableBuilder(
    column: $table.gameRating,
    builder: (column) => column,
  );

  GeneratedColumn<int> get gameMetacritic => $composableBuilder(
    column: $table.gameMetacritic,
    builder: (column) => column,
  );

  GeneratedColumn<int> get gameReleased => $composableBuilder(
    column: $table.gameReleased,
    builder: (column) => column,
  );

  GeneratedColumn<String> get gameGenres => $composableBuilder(
    column: $table.gameGenres,
    builder: (column) => column,
  );

  GeneratedColumn<String> get gameGenreIds => $composableBuilder(
    column: $table.gameGenreIds,
    builder: (column) => column,
  );

  GeneratedColumn<String> get gamePlatforms => $composableBuilder(
    column: $table.gamePlatforms,
    builder: (column) => column,
  );

  GeneratedColumn<String> get gameTags =>
      $composableBuilder(column: $table.gameTags, builder: (column) => column);

  GeneratedColumn<String> get gameDeveloperIds => $composableBuilder(
    column: $table.gameDeveloperIds,
    builder: (column) => column,
  );

  GeneratedColumn<String> get gameDescription => $composableBuilder(
    column: $table.gameDescription,
    builder: (column) => column,
  );
}

class $$CollectionItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CollectionItemsTable,
          CollectionItem,
          $$CollectionItemsTableFilterComposer,
          $$CollectionItemsTableOrderingComposer,
          $$CollectionItemsTableAnnotationComposer,
          $$CollectionItemsTableCreateCompanionBuilder,
          $$CollectionItemsTableUpdateCompanionBuilder,
          (
            CollectionItem,
            BaseReferences<
              _$AppDatabase,
              $CollectionItemsTable,
              CollectionItem
            >,
          ),
          CollectionItem,
          PrefetchHooks Function()
        > {
  $$CollectionItemsTableTableManager(
    _$AppDatabase db,
    $CollectionItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CollectionItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CollectionItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CollectionItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> gameId = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<int> playStatusIndex = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<String?> gameName = const Value.absent(),
                Value<String?> gameBackgroundImageUrl = const Value.absent(),
                Value<double?> gameRating = const Value.absent(),
                Value<int?> gameMetacritic = const Value.absent(),
                Value<int?> gameReleased = const Value.absent(),
                Value<String?> gameGenres = const Value.absent(),
                Value<String?> gameGenreIds = const Value.absent(),
                Value<String?> gamePlatforms = const Value.absent(),
                Value<String?> gameTags = const Value.absent(),
                Value<String?> gameDeveloperIds = const Value.absent(),
                Value<String?> gameDescription = const Value.absent(),
              }) => CollectionItemsCompanion(
                gameId: gameId,
                isFavorite: isFavorite,
                playStatusIndex: playStatusIndex,
                updatedAt: updatedAt,
                gameName: gameName,
                gameBackgroundImageUrl: gameBackgroundImageUrl,
                gameRating: gameRating,
                gameMetacritic: gameMetacritic,
                gameReleased: gameReleased,
                gameGenres: gameGenres,
                gameGenreIds: gameGenreIds,
                gamePlatforms: gamePlatforms,
                gameTags: gameTags,
                gameDeveloperIds: gameDeveloperIds,
                gameDescription: gameDescription,
              ),
          createCompanionCallback:
              ({
                Value<int> gameId = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<int> playStatusIndex = const Value.absent(),
                required int updatedAt,
                Value<String?> gameName = const Value.absent(),
                Value<String?> gameBackgroundImageUrl = const Value.absent(),
                Value<double?> gameRating = const Value.absent(),
                Value<int?> gameMetacritic = const Value.absent(),
                Value<int?> gameReleased = const Value.absent(),
                Value<String?> gameGenres = const Value.absent(),
                Value<String?> gameGenreIds = const Value.absent(),
                Value<String?> gamePlatforms = const Value.absent(),
                Value<String?> gameTags = const Value.absent(),
                Value<String?> gameDeveloperIds = const Value.absent(),
                Value<String?> gameDescription = const Value.absent(),
              }) => CollectionItemsCompanion.insert(
                gameId: gameId,
                isFavorite: isFavorite,
                playStatusIndex: playStatusIndex,
                updatedAt: updatedAt,
                gameName: gameName,
                gameBackgroundImageUrl: gameBackgroundImageUrl,
                gameRating: gameRating,
                gameMetacritic: gameMetacritic,
                gameReleased: gameReleased,
                gameGenres: gameGenres,
                gameGenreIds: gameGenreIds,
                gamePlatforms: gamePlatforms,
                gameTags: gameTags,
                gameDeveloperIds: gameDeveloperIds,
                gameDescription: gameDescription,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CollectionItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CollectionItemsTable,
      CollectionItem,
      $$CollectionItemsTableFilterComposer,
      $$CollectionItemsTableOrderingComposer,
      $$CollectionItemsTableAnnotationComposer,
      $$CollectionItemsTableCreateCompanionBuilder,
      $$CollectionItemsTableUpdateCompanionBuilder,
      (
        CollectionItem,
        BaseReferences<_$AppDatabase, $CollectionItemsTable, CollectionItem>,
      ),
      CollectionItem,
      PrefetchHooks Function()
    >;
typedef $$GameCacheTableCreateCompanionBuilder =
    GameCacheCompanion Function({
      Value<int> gameId,
      required String gameName,
      Value<String?> gameBackgroundImageUrl,
      Value<double?> gameRating,
      Value<int?> gameMetacritic,
      Value<int?> gameReleased,
      Value<String?> gameGenres,
      Value<String?> gameGenreIds,
      Value<String?> gamePlatforms,
      Value<String?> gameTags,
      Value<String?> gameDeveloperIds,
      Value<String?> gameDescription,
      required int cachedAt,
    });
typedef $$GameCacheTableUpdateCompanionBuilder =
    GameCacheCompanion Function({
      Value<int> gameId,
      Value<String> gameName,
      Value<String?> gameBackgroundImageUrl,
      Value<double?> gameRating,
      Value<int?> gameMetacritic,
      Value<int?> gameReleased,
      Value<String?> gameGenres,
      Value<String?> gameGenreIds,
      Value<String?> gamePlatforms,
      Value<String?> gameTags,
      Value<String?> gameDeveloperIds,
      Value<String?> gameDescription,
      Value<int> cachedAt,
    });

class $$GameCacheTableFilterComposer
    extends Composer<_$AppDatabase, $GameCacheTable> {
  $$GameCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get gameId => $composableBuilder(
    column: $table.gameId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gameName => $composableBuilder(
    column: $table.gameName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gameBackgroundImageUrl => $composableBuilder(
    column: $table.gameBackgroundImageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get gameRating => $composableBuilder(
    column: $table.gameRating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get gameMetacritic => $composableBuilder(
    column: $table.gameMetacritic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get gameReleased => $composableBuilder(
    column: $table.gameReleased,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gameGenres => $composableBuilder(
    column: $table.gameGenres,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gameGenreIds => $composableBuilder(
    column: $table.gameGenreIds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gamePlatforms => $composableBuilder(
    column: $table.gamePlatforms,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gameTags => $composableBuilder(
    column: $table.gameTags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gameDeveloperIds => $composableBuilder(
    column: $table.gameDeveloperIds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gameDescription => $composableBuilder(
    column: $table.gameDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GameCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $GameCacheTable> {
  $$GameCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get gameId => $composableBuilder(
    column: $table.gameId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gameName => $composableBuilder(
    column: $table.gameName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gameBackgroundImageUrl => $composableBuilder(
    column: $table.gameBackgroundImageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get gameRating => $composableBuilder(
    column: $table.gameRating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get gameMetacritic => $composableBuilder(
    column: $table.gameMetacritic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get gameReleased => $composableBuilder(
    column: $table.gameReleased,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gameGenres => $composableBuilder(
    column: $table.gameGenres,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gameGenreIds => $composableBuilder(
    column: $table.gameGenreIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gamePlatforms => $composableBuilder(
    column: $table.gamePlatforms,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gameTags => $composableBuilder(
    column: $table.gameTags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gameDeveloperIds => $composableBuilder(
    column: $table.gameDeveloperIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gameDescription => $composableBuilder(
    column: $table.gameDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GameCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $GameCacheTable> {
  $$GameCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get gameId =>
      $composableBuilder(column: $table.gameId, builder: (column) => column);

  GeneratedColumn<String> get gameName =>
      $composableBuilder(column: $table.gameName, builder: (column) => column);

  GeneratedColumn<String> get gameBackgroundImageUrl => $composableBuilder(
    column: $table.gameBackgroundImageUrl,
    builder: (column) => column,
  );

  GeneratedColumn<double> get gameRating => $composableBuilder(
    column: $table.gameRating,
    builder: (column) => column,
  );

  GeneratedColumn<int> get gameMetacritic => $composableBuilder(
    column: $table.gameMetacritic,
    builder: (column) => column,
  );

  GeneratedColumn<int> get gameReleased => $composableBuilder(
    column: $table.gameReleased,
    builder: (column) => column,
  );

  GeneratedColumn<String> get gameGenres => $composableBuilder(
    column: $table.gameGenres,
    builder: (column) => column,
  );

  GeneratedColumn<String> get gameGenreIds => $composableBuilder(
    column: $table.gameGenreIds,
    builder: (column) => column,
  );

  GeneratedColumn<String> get gamePlatforms => $composableBuilder(
    column: $table.gamePlatforms,
    builder: (column) => column,
  );

  GeneratedColumn<String> get gameTags =>
      $composableBuilder(column: $table.gameTags, builder: (column) => column);

  GeneratedColumn<String> get gameDeveloperIds => $composableBuilder(
    column: $table.gameDeveloperIds,
    builder: (column) => column,
  );

  GeneratedColumn<String> get gameDescription => $composableBuilder(
    column: $table.gameDescription,
    builder: (column) => column,
  );

  GeneratedColumn<int> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$GameCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GameCacheTable,
          GameCacheData,
          $$GameCacheTableFilterComposer,
          $$GameCacheTableOrderingComposer,
          $$GameCacheTableAnnotationComposer,
          $$GameCacheTableCreateCompanionBuilder,
          $$GameCacheTableUpdateCompanionBuilder,
          (
            GameCacheData,
            BaseReferences<_$AppDatabase, $GameCacheTable, GameCacheData>,
          ),
          GameCacheData,
          PrefetchHooks Function()
        > {
  $$GameCacheTableTableManager(_$AppDatabase db, $GameCacheTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GameCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> gameId = const Value.absent(),
                Value<String> gameName = const Value.absent(),
                Value<String?> gameBackgroundImageUrl = const Value.absent(),
                Value<double?> gameRating = const Value.absent(),
                Value<int?> gameMetacritic = const Value.absent(),
                Value<int?> gameReleased = const Value.absent(),
                Value<String?> gameGenres = const Value.absent(),
                Value<String?> gameGenreIds = const Value.absent(),
                Value<String?> gamePlatforms = const Value.absent(),
                Value<String?> gameTags = const Value.absent(),
                Value<String?> gameDeveloperIds = const Value.absent(),
                Value<String?> gameDescription = const Value.absent(),
                Value<int> cachedAt = const Value.absent(),
              }) => GameCacheCompanion(
                gameId: gameId,
                gameName: gameName,
                gameBackgroundImageUrl: gameBackgroundImageUrl,
                gameRating: gameRating,
                gameMetacritic: gameMetacritic,
                gameReleased: gameReleased,
                gameGenres: gameGenres,
                gameGenreIds: gameGenreIds,
                gamePlatforms: gamePlatforms,
                gameTags: gameTags,
                gameDeveloperIds: gameDeveloperIds,
                gameDescription: gameDescription,
                cachedAt: cachedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> gameId = const Value.absent(),
                required String gameName,
                Value<String?> gameBackgroundImageUrl = const Value.absent(),
                Value<double?> gameRating = const Value.absent(),
                Value<int?> gameMetacritic = const Value.absent(),
                Value<int?> gameReleased = const Value.absent(),
                Value<String?> gameGenres = const Value.absent(),
                Value<String?> gameGenreIds = const Value.absent(),
                Value<String?> gamePlatforms = const Value.absent(),
                Value<String?> gameTags = const Value.absent(),
                Value<String?> gameDeveloperIds = const Value.absent(),
                Value<String?> gameDescription = const Value.absent(),
                required int cachedAt,
              }) => GameCacheCompanion.insert(
                gameId: gameId,
                gameName: gameName,
                gameBackgroundImageUrl: gameBackgroundImageUrl,
                gameRating: gameRating,
                gameMetacritic: gameMetacritic,
                gameReleased: gameReleased,
                gameGenres: gameGenres,
                gameGenreIds: gameGenreIds,
                gamePlatforms: gamePlatforms,
                gameTags: gameTags,
                gameDeveloperIds: gameDeveloperIds,
                gameDescription: gameDescription,
                cachedAt: cachedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GameCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GameCacheTable,
      GameCacheData,
      $$GameCacheTableFilterComposer,
      $$GameCacheTableOrderingComposer,
      $$GameCacheTableAnnotationComposer,
      $$GameCacheTableCreateCompanionBuilder,
      $$GameCacheTableUpdateCompanionBuilder,
      (
        GameCacheData,
        BaseReferences<_$AppDatabase, $GameCacheTable, GameCacheData>,
      ),
      GameCacheData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CollectionItemsTableTableManager get collectionItems =>
      $$CollectionItemsTableTableManager(_db, _db.collectionItems);
  $$GameCacheTableTableManager get gameCache =>
      $$GameCacheTableTableManager(_db, _db.gameCache);
}
