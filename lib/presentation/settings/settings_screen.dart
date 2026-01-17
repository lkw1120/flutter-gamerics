/// Settings 화면
library settings_screen;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamerics/providers/providers.dart';
import 'package:url_launcher/url_launcher.dart';

/// Settings 화면
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  static const String appName = 'Gamerics';
  static const String appVersion = '1.0.0';
  static const String rawgUrl = 'https://rawg.io';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('App name'),
            leading: const Icon(Icons.app_registration),
            trailing: Text(
              appName,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ),
          ListTile(
            title: const Text('Version'),
            leading: const Icon(Icons.info),
            trailing: Text(
              appVersion,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ),
          ListTile(
            title: const Text('RAWG.io'),
            subtitle: const Text('Powered by RAWG'),
            leading: const Icon(Icons.link),
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              final uri = Uri.parse(rawgUrl);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            },
          ),
          ListTile(
            title: const Text('Open source licenses'),
            leading: const Icon(Icons.description),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              showLicensePage(
                context: context,
                applicationName: appName,
                applicationVersion: appVersion,
              );
            },
          ),
          ListTile(
            title: const Text('Clear cache'),
            leading: const Icon(Icons.cached),
            onTap: () async {
              final repository = ref.read(gameRepositoryProvider);
              final result = await repository.clearGameCache();

              result.fold(
                (_) {
                  // 실패 시 조용히 무시 (별도 에러 UI 없음)
                },
                (_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Game detail cache cleared.'),
                    ),
                  );
                },
              );
            },
          ),
          ListTile(
            title: const Text('Reset'),
            leading: const Icon(Icons.delete_forever),
            onTap: () {
              final messenger = ScaffoldMessenger.of(context);

              messenger.clearSnackBars();
              messenger.showSnackBar(
                SnackBar(
                  content: const Text(
                    'All local data (collections & cache) will be removed.',
                  ),
                  action: SnackBarAction(
                    label: 'RESET',
                    onPressed: () async {
                      final collectionRepo =
                          ref.read(collectionRepositoryProvider);
                      final collResult = await collectionRepo.clearAll();

                      final gameRepo = ref.read(gameRepositoryProvider);
                      final cacheResult = await gameRepo.clearGameCache();

                      if (collResult.isRight && cacheResult.isRight) {
                        messenger.showSnackBar(
                          const SnackBar(
                            content: Text('Local database has been reset.'),
                          ),
                        );
                      }
                    },
                  ),
                  duration: const Duration(seconds: 5),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
