/// 게임 스크린샷 모델 (DTO)
library game_screenshot_model;

import 'package:gamerics/domain/entities/game_screenshot.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_screenshot_model.g.dart';

/// 게임 스크린샷 모델
@JsonSerializable()
class GameScreenshotModel {
  final int id;
  final String image;
  final int? width;
  final int? height;

  const GameScreenshotModel({
    required this.id,
    required this.image,
    this.width,
    this.height,
  });

  factory GameScreenshotModel.fromJson(Map<String, dynamic> json) =>
      _$GameScreenshotModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameScreenshotModelToJson(this);

  GameScreenshot toEntity() {
    return GameScreenshot(
      id: id,
      imageUrl: image,
      width: width,
      height: height,
    );
  }
}

