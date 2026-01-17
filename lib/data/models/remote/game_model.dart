/// 게임 모델 (DTO)
library game_model;

import 'package:gamerics/domain/entities/game.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_model.g.dart';

/// 게임 모델
/// 
/// RAWG API 응답을 파싱하여 Game 엔티티로 변환합니다.
/// 
/// 참고: 게임 목록 응답과 게임 상세 응답 모두에서 사용됩니다.
/// 게임 목록에서는 description_raw가 null일 수 있습니다.
@JsonSerializable()
class GameModel {
  final int id;
  final String name;
  @JsonKey(name: 'background_image')
  final String? backgroundImage;
  final double? rating;
  final int? metacritic;
  final String? released;
  final List<GenreModel>? genres;
  final List<PlatformModel>? platforms;
  final List<TagModel>? tags;
  final List<DeveloperModel>? developers;
  @JsonKey(name: 'description_raw')
  final String? descriptionRaw;

  const GameModel({
    required this.id,
    required this.name,
    this.backgroundImage,
    this.rating,
    this.metacritic,
    this.released,
    this.genres,
    this.platforms,
    this.tags,
    this.developers,
    this.descriptionRaw,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameModelToJson(this);

  Game toEntity() {
    return Game(
      id: id,
      name: name,
      backgroundImageUrl: backgroundImage,
      rating: rating,
      metacritic: metacritic,
      released: released != null ? DateTime.tryParse(released!) : null,
      genres: genres?.map((g) => g.name).toList() ?? [],
      genreIds: genres?.map((g) => g.id).toList() ?? [],
      platforms: platforms
              ?.map((p) => p.platform?.name)
              .whereType<String>()
              .toList() ??
          [],
      tags: tags?.map((t) => t.name).toList() ?? [],
      developerIds: developers?.map((d) => d.id).toList() ?? [],
      description: descriptionRaw,
    );
  }
}

/// 장르 모델
/// 
/// RAWG API 응답: {id, name, slug}
@JsonSerializable()
class GenreModel {
  final int id;
  final String name;

  const GenreModel({
    required this.id,
    required this.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenreModelToJson(this);
}

/// 플랫폼 모델
/// 
/// RAWG API 응답: {platform: {id, name, slug}, ...}
/// 중첩된 platform 객체에서 name을 추출합니다.
@JsonSerializable()
class PlatformModel {
  final PlatformDetailModel? platform;

  const PlatformModel({this.platform});

  factory PlatformModel.fromJson(Map<String, dynamic> json) =>
      _$PlatformModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlatformModelToJson(this);
}

/// 플랫폼 상세 모델
@JsonSerializable()
class PlatformDetailModel {
  final String name;

  const PlatformDetailModel({required this.name});

  factory PlatformDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PlatformDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlatformDetailModelToJson(this);
}

/// 태그 모델
/// 
/// RAWG API 응답: {id, name, slug}
/// 우리는 name만 사용합니다.
@JsonSerializable()
class TagModel {
  final String name;

  const TagModel({required this.name});

  factory TagModel.fromJson(Map<String, dynamic> json) =>
      _$TagModelFromJson(json);

  Map<String, dynamic> toJson() => _$TagModelToJson(this);
}

/// 개발사 모델
/// 
/// RAWG API 응답: {id, name, slug}
@JsonSerializable()
class DeveloperModel {
  final int id;
  final String name;

  const DeveloperModel({
    required this.id,
    required this.name,
  });

  factory DeveloperModel.fromJson(Map<String, dynamic> json) =>
      _$DeveloperModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeveloperModelToJson(this);
}
