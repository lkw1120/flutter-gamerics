import 'package:flutter/material.dart';
import 'package:gamerics/domain/entities/collection_item.dart';
import 'package:gamerics/domain/entities/game_screenshot.dart';
import 'package:gamerics/domain/entities/game_video.dart';
import 'package:gamerics/presentation/detail/widgets/video_player_dialog.dart';
import 'package:gamerics/presentation/widgets/app_cached_network_image.dart';

/// Detail 화면 헬퍼 메서드들
class DetailScreenHelpers {
  /// 액션 버튼 빌드
  static Widget buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color? color,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 4),
            Text(label, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }

  /// 플레이 상태 아이콘 반환
  static IconData getPlayStatusIcon(PlayStatus? status) {
    switch (status) {
      case PlayStatus.playing:
        return Icons.play_circle_outline;
      case PlayStatus.finished:
        return Icons.check_circle_outline;
      case PlayStatus.notPlayed:
      default:
        return Icons.close;
    }
  }

  /// 플레이 상태 라벨 반환
  static String getPlayStatusLabel(PlayStatus? status) {
    switch (status) {
      case PlayStatus.playing:
        return 'Playing';
      case PlayStatus.finished:
        return 'Finished';
      case PlayStatus.notPlayed:
      default:
        return 'Not started';
    }
  }

  /// 스크린샷 뷰어 표시
  static void showScreenshotViewer(
    BuildContext context,
    int initialIndex,
    List<GameScreenshot> screenshots,
  ) {
    final controller = PageController(initialPage: initialIndex);
    showGeneralDialog(
      context: context,
      barrierLabel: 'Screenshots',
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.9),
      pageBuilder: (context, animation, secondaryAnimation) {
        return SafeArea(
          child: Stack(
            children: [
              ClipRect(
                child: SizedBox(
                  height: double.infinity,
                  child: PageView.builder(
                    controller: controller,
                    itemCount: screenshots.length,
                    itemBuilder: (context, index) {
                      final screenshot = screenshots[index];
                      return Center(
                        child: InteractiveViewer(
                          minScale: 0.8,
                          maxScale: 3,
                          boundaryMargin: const EdgeInsets.only(bottom: 120),
                          child: AppCachedNetworkImage(
                            imageUrl: screenshot.imageUrl,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Positioned(
                bottom: 24,
                left: 0,
                right: 0,
                child: AbsorbPointer(
                  child: Center(
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (context, _) {
                        final currentIndex = controller.hasClients
                            ? controller.page?.round() ?? controller.initialPage
                            : initialIndex;
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal,
                              letterSpacing: 0,
                              height: 1.0,
                            ),
                            child: Text(
                              '${currentIndex + 1} / ${screenshots.length}',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// 영상 전체화면 뷰어를 연다.
  /// 스크린샷 뷰어와 유사하게 페이지 단위로 스와이프가 가능하다.
  static Future<void> showVideoViewer(
    BuildContext context,
    List<GameVideo> videos,
    int initialIndex,
  ) {
    return showGeneralDialog(
      context: context,
      barrierLabel: 'Promotional videos',
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.9),
      pageBuilder: (context, animation, secondaryAnimation) {
        return VideoPlayerDialog(videos: videos, initialIndex: initialIndex);
      },
    );
  }

  /// Metacritic 점수에 따른 색상 반환
  static Color getMetacriticColor(int score) {
    if (score >= 75) {
      return Colors.green;
    } else if (score >= 50) {
      return Colors.yellow.shade700;
    } else {
      return Colors.red;
    }
  }
}

