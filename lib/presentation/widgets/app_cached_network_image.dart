import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Shared placeholder used across the app to ensure consistent loading states.
class AppImagePlaceholder extends StatelessWidget {
  const AppImagePlaceholder({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.icon = Icons.image_outlined,
    this.showLoader = true,
    this.backgroundColor,
  });

  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final IconData icon;
  final bool showLoader;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final placeholderColor =
        backgroundColor ?? Theme.of(context).colorScheme.surfaceVariant.withValues(alpha: 0.3);
    Widget content = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: placeholderColor,
        borderRadius: borderRadius,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            icon,
            size: 48,
            color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
          ),
          if (showLoader)
            SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
        ],
      ),
    );

    if (borderRadius != null) {
      content = ClipRRect(
        borderRadius: borderRadius!,
        child: content,
      );
    }

    return content;
  }
}

/// Cached image widget with unified placeholder / error UI.
class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.alignment = Alignment.center,
    this.showLoader = true,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Alignment alignment;
  final bool showLoader;

  @override
  Widget build(BuildContext context) {
    Widget image = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      placeholder: (context, _) => AppImagePlaceholder(
        width: width,
        height: height,
        borderRadius: borderRadius,
        showLoader: showLoader,
      ),
      errorWidget: (context, _, __) => AppImagePlaceholder(
        width: width,
        height: height,
        borderRadius: borderRadius,
        showLoader: false,
        icon: Icons.image_not_supported,
      ),
    );

    if (borderRadius != null) {
      image = ClipRRect(
        borderRadius: borderRadius!,
        child: image,
      );
    }

    return image;
  }
}

