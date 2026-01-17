/// 게임 카드 위젯
library game_card;

import 'package:flutter/material.dart';
import 'package:gamerics/domain/entities/game.dart';
import 'package:gamerics/presentation/widgets/app_cached_network_image.dart';

/// 게임 카드 위젯
class GameCard extends StatelessWidget {
  const GameCard({
    super.key,
    required this.game,
    this.onTap,
    this.width,
    this.height,
    this.imageHeight,
    this.aspectRatio,
  });

  static const double defaultAspectRatio = 16 / 9;

  final Game game;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final double? imageHeight;
  final double? aspectRatio;

  @override
  Widget build(BuildContext context) {
    final expandWidth = width?.isInfinite ?? false;
    final cardWidth = expandWidth ? double.infinity : (width ?? 140);
    final cardHeight = height;
    final cardImageHeight = imageHeight ?? 180;
    final imageWidth = expandWidth ? double.infinity : cardWidth;

    Widget imageChild;
    if (imageHeight != null) {
      imageChild = SizedBox(
        width: imageWidth,
        height: cardImageHeight,
        child: _buildImage(imageWidth, cardImageHeight),
      );
    } else {
      final ratio = aspectRatio ?? defaultAspectRatio;
      imageChild = AspectRatio(
        aspectRatio: ratio,
        child: _buildImage(imageWidth, null),
      );
    }

    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: cardWidth,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: imageChild,
          ),
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              game.name,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            if (game.rating != null) ...[
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, size: 16, color: Colors.amber),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      game.rating!.toStringAsFixed(1),
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ],
    );

    if (cardHeight != null) {
      content = SizedBox(height: cardHeight, child: content);
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
      onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(4),
      child: SizedBox(width: cardWidth, child: content),
        ),
      ),
    );
  }

  Widget _buildImage(double width, double? height) {
    final imageUrl = game.backgroundImageUrl;
    if (imageUrl == null) {
      return AppImagePlaceholder(width: width, height: height);
    }

    return AppCachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }
}

class GameCardSkeleton extends StatelessWidget {
  const GameCardSkeleton({super.key, this.aspectRatio = 4 / 3});

  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.2),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 14,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 12,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.grey.withValues(alpha: 0.25),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ],
    );
  }
}
