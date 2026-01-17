/// 컬렉션 아이템 엔티티
library collection_item;

import 'package:equatable/equatable.dart';
import 'package:gamerics/domain/entities/game.dart';

enum PlayStatus {
  notPlayed,
  playing,
  finished,
}

class CollectionItem extends Equatable {
  final int gameId;
  final bool isFavorite;
  final PlayStatus playStatus;
  final DateTime updatedAt;
  final Game? game; // 게임 정보 (리스트 표시용)

  const CollectionItem({
    required this.gameId,
    this.isFavorite = false,
    this.playStatus = PlayStatus.notPlayed,
    required this.updatedAt,
    this.game,
  });

  CollectionItem copyWith({
    int? gameId,
    bool? isFavorite,
    PlayStatus? playStatus,
    DateTime? updatedAt,
    Game? game,
  }) {
    return CollectionItem(
      gameId: gameId ?? this.gameId,
      isFavorite: isFavorite ?? this.isFavorite,
      playStatus: playStatus ?? this.playStatus,
      updatedAt: updatedAt ?? this.updatedAt,
      game: game ?? this.game,
    );
  }

  @override
  List<Object?> get props => [gameId, isFavorite, playStatus, updatedAt, game];
}

