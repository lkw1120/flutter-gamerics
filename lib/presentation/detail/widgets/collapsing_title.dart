/// 접히는 타이틀 위젯
library collapsing_title;

import 'package:flutter/material.dart';

/// SliverAppBar의 FlexibleSpaceBar에서 사용되는 접히는 타이틀
/// 
/// AppBar가 접힐 때만 표시되는 타이틀 위젯입니다.
class CollapsingTitle extends StatelessWidget {
  const CollapsingTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final settings = context
        .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    final collapsed = settings == null
        ? true
        : settings.currentExtent <= settings.minExtent + 24;

    return AnimatedOpacity(
      opacity: collapsed ? 1 : 0,
      duration: const Duration(milliseconds: 200),
      child: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
    );
  }
}

