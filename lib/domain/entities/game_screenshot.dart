/// 게임 스크린샷 엔티티
library game_screenshot;

import 'package:equatable/equatable.dart';

class GameScreenshot extends Equatable {
  final int id;
  final String imageUrl;
  final int? width;
  final int? height;

  const GameScreenshot({
    required this.id,
    required this.imageUrl,
    this.width,
    this.height,
  });

  @override
  List<Object?> get props => [id, imageUrl, width, height];
}

