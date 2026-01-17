// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_screenshot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameScreenshotModel _$GameScreenshotModelFromJson(Map<String, dynamic> json) =>
    GameScreenshotModel(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GameScreenshotModelToJson(
  GameScreenshotModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'image': instance.image,
  'width': instance.width,
  'height': instance.height,
};
