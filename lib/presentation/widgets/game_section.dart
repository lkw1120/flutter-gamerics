/// 게임 섹션 위젯
library game_section;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gamerics/core/widgets/loading_widget.dart';
import 'package:gamerics/domain/entities/game.dart';
import 'package:gamerics/presentation/widgets/game_card.dart';

/// 게임 섹션 위젯
class GameSection extends StatelessWidget {
  const GameSection({
    super.key,
    required this.title,
    required this.games,
    required this.isLoading,
    this.onSeeMore,
  });

  final String title;
  final List<Game> games;
  final bool isLoading;
  final VoidCallback? onSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              if (onSeeMore != null)
                TextButton(onPressed: onSeeMore, child: const Text('See more')),
            ],
          ),
        ),
        if (isLoading)
          const SizedBox(height: 200, child: LoadingWidget())
        else if (games.isEmpty)
          const SizedBox(
            height: 200,
            child: Center(child: Text('No games available')),
          )
        else
          SizedBox(
            height: 256,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: games.length,
              itemBuilder: (context, index) {
                final game = games[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: GameCard(
                    game: game,
                    height: 256,
                    imageHeight: 180,
                    onTap: () {
                      context.push('/game/${game.id}');
                    },
                  ),
                );
              },
            ),
          ),
        const SizedBox(height: 16),
      ],
    );
  }
}
