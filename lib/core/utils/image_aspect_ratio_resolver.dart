import 'dart:async';

import 'package:flutter/material.dart';

class ImageAspectRatioResolver {
  ImageAspectRatioResolver._();

  static const double fallbackRatio = 16 / 9;
  static final Map<String, double> _cache = {};
  static final Map<String, Future<double>> _pending = {};

  static Future<double> resolve(String url, {BuildContext? context}) {
    final key = url;
    if (_cache.containsKey(key)) {
      return Future.value(_cache[key]!);
    }
    if (_pending.containsKey(key)) {
      return _pending[key]!;
    }

    final completer = Completer<double>();
    _pending[key] = completer.future;

    ImageProvider provider = NetworkImage(url);

    final configuration = context != null
        ? createLocalImageConfiguration(context)
        : ImageConfiguration.empty;
    final stream = provider.resolve(configuration);
    late final ImageStreamListener listener;
    listener = ImageStreamListener(
      (imageInfo, _) {
        final width = imageInfo.image.width.toDouble();
        final height = imageInfo.image.height.toDouble();
        final ratio = width > 0 && height > 0 ? width / height : fallbackRatio;
        _cache[key] = ratio.isFinite ? ratio : fallbackRatio;
        stream.removeListener(listener);
        _pending.remove(key);
        completer.complete(_cache[key]!);
      },
      onError: (error, stackTrace) {
        stream.removeListener(listener);
        _pending.remove(key);
        completer.complete(fallbackRatio);
      },
    );
    stream.addListener(listener);
    return completer.future;
  }

  static void clearCache() {
    _cache.clear();
    _pending.clear();
  }
}
