/// 게임 비디오 모델
library game_video_model;

import 'package:gamerics/domain/entities/game_video.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_video_model.g.dart';

/// RAWG API `/games/{id}/movies` 응답 모델
@JsonSerializable()
class GameVideoModel {
  const GameVideoModel({
    required this.id,
    required this.name,
    required this.preview,
    required this.data,
  });

  final int id;
  final String name;
  final String preview;
  final GameVideoDataModel data;

  factory GameVideoModel.fromJson(Map<String, dynamic> json) =>
      _$GameVideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameVideoModelToJson(this);

  GameVideo toEntity() {
    return GameVideo(
      id: id,
      name: name,
      previewImageUrl: _normalizeUrl(preview) ?? '',
      videoUrl: _normalizeUrl(data.max) ?? _normalizeUrl(data.low480) ?? '',
      lowQualityUrl: _normalizeUrl(data.low480),
    );
  }
}

/// 비디오 품질별 URL 정보
@JsonSerializable()
class GameVideoDataModel {
  const GameVideoDataModel({
    this.low480,
    this.max,
  });

  @JsonKey(name: '480')
  final String? low480;
  final String? max;

  factory GameVideoDataModel.fromJson(Map<String, dynamic> json) =>
      _$GameVideoDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameVideoDataModelToJson(this);
}

String? _normalizeUrl(String? url) {
  if (url == null || url.isEmpty) {
    return null;
  }
  if (url.startsWith('//')) {
    return 'https:$url';
  }
  return url;
}


