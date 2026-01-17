// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVideoModel _$GameVideoModelFromJson(Map<String, dynamic> json) =>
    GameVideoModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      preview: json['preview'] as String,
      data: GameVideoDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GameVideoModelToJson(GameVideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'preview': instance.preview,
      'data': instance.data,
    };

GameVideoDataModel _$GameVideoDataModelFromJson(Map<String, dynamic> json) =>
    GameVideoDataModel(
      low480: json['480'] as String?,
      max: json['max'] as String?,
    );

Map<String, dynamic> _$GameVideoDataModelToJson(GameVideoDataModel instance) =>
    <String, dynamic>{'480': instance.low480, 'max': instance.max};
