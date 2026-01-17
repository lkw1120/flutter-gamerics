// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) => GameModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  backgroundImage: json['background_image'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  metacritic: (json['metacritic'] as num?)?.toInt(),
  released: json['released'] as String?,
  genres: (json['genres'] as List<dynamic>?)
      ?.map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  platforms: (json['platforms'] as List<dynamic>?)
      ?.map((e) => PlatformModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  tags: (json['tags'] as List<dynamic>?)
      ?.map((e) => TagModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  developers: (json['developers'] as List<dynamic>?)
      ?.map((e) => DeveloperModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  descriptionRaw: json['description_raw'] as String?,
);

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'background_image': instance.backgroundImage,
  'rating': instance.rating,
  'metacritic': instance.metacritic,
  'released': instance.released,
  'genres': instance.genres,
  'platforms': instance.platforms,
  'tags': instance.tags,
  'developers': instance.developers,
  'description_raw': instance.descriptionRaw,
};

GenreModel _$GenreModelFromJson(Map<String, dynamic> json) =>
    GenreModel(id: (json['id'] as num).toInt(), name: json['name'] as String);

Map<String, dynamic> _$GenreModelToJson(GenreModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

PlatformModel _$PlatformModelFromJson(Map<String, dynamic> json) =>
    PlatformModel(
      platform: json['platform'] == null
          ? null
          : PlatformDetailModel.fromJson(
              json['platform'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$PlatformModelToJson(PlatformModel instance) =>
    <String, dynamic>{'platform': instance.platform};

PlatformDetailModel _$PlatformDetailModelFromJson(Map<String, dynamic> json) =>
    PlatformDetailModel(name: json['name'] as String);

Map<String, dynamic> _$PlatformDetailModelToJson(
  PlatformDetailModel instance,
) => <String, dynamic>{'name': instance.name};

TagModel _$TagModelFromJson(Map<String, dynamic> json) =>
    TagModel(name: json['name'] as String);

Map<String, dynamic> _$TagModelToJson(TagModel instance) => <String, dynamic>{
  'name': instance.name,
};

DeveloperModel _$DeveloperModelFromJson(Map<String, dynamic> json) =>
    DeveloperModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$DeveloperModelToJson(DeveloperModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
