/// 애니메이션 진행률 바 위젯
library animated_progress_bar;

import 'package:flutter/material.dart';

/// 애니메이션 진행률 바
/// 
/// 이전 값에서 새 값으로 부드럽게 전환되는 진행률 바를 표시합니다.
class AnimatedProgressBar extends StatefulWidget {
  const AnimatedProgressBar({super.key, required this.progress});

  final double progress;

  @override
  State<AnimatedProgressBar> createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar> {
  double _previousProgress = 0.0;

  @override
  void didUpdateWidget(AnimatedProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progress != widget.progress) {
      _previousProgress = oldWidget.progress;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      key: ValueKey<double>(widget.progress),
      tween: Tween<double>(
        begin: _previousProgress,
        end: widget.progress,
      ),
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return LinearProgressIndicator(
          value: value,
          minHeight: 4,
          backgroundColor: Colors.transparent,
        );
      },
    );
  }
}

