/// 게임 비디오 엔티티
library game_video;

/// 게임 상세 화면에서 사용할 프로모션/플레이 영상 정보를 표현한다.
/// RAWG API 의 /games/{id}/movies 응답을 기반으로 하며,
/// 썸네일과 스트리밍 URL 을 함께 제공한다.
class GameVideo {
  /// [GameVideo] 생성자
  /// [id] 는 RAWG 에서 제공하는 고유 식별자이며,
  /// [name] 은 영상 타이틀, [previewImageUrl] 은 썸네일,
  /// [videoUrl] 은 가장 고화질 스트리밍 URL, [lowQualityUrl] 은 보조 URL 이다.
  const GameVideo({
    required this.id,
    required this.name,
    required this.previewImageUrl,
    required this.videoUrl,
    this.lowQualityUrl,
  });

  /// RAWG 비디오 식별자
  final int id;

  /// 영상 이름 (예: Official Trailer)
  final String name;

  /// 영상 썸네일 이미지 URL
  final String previewImageUrl;

  /// 기본 재생에 사용할 고화질 영상 URL
  final String videoUrl;

  /// 네트워크 환경이 열악할 때 사용할 저화질 영상 URL (없을 수 있음)
  final String? lowQualityUrl;
}


