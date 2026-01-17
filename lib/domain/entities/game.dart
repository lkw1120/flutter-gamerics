/// 게임 엔티티
library game;

import 'package:equatable/equatable.dart';

class Game extends Equatable {
  final int id;
  final String name;
  final String? backgroundImageUrl;
  final double? rating;
  final int? metacritic;
  final DateTime? released;
  final List<String> genres;
  final List<int> genreIds;
  final List<String> platforms;
  final List<String> tags;
  final List<int> developerIds;
  final String? description;

  const Game({
    required this.id,
    required this.name,
    this.backgroundImageUrl,
    this.rating,
    this.metacritic,
    this.released,
    this.genres = const [],
    this.genreIds = const [],
    this.platforms = const [],
    this.tags = const [],
    this.developerIds = const [],
    this.description,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        backgroundImageUrl,
        rating,
        metacritic,
        released,
        genres,
        genreIds,
        platforms,
        tags,
        developerIds,
        description,
      ];
}

