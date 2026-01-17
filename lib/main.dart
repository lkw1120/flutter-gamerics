/// Gamerics 앱 메인 진입점
library main;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gamerics/core/theme/app_theme.dart';
import 'package:gamerics/presentation/common/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await dotenv.load(fileName: '.env');
  } catch (e) {
    debugPrint('Warning: .env file not found. Please create .env file with RAWG_API_KEY');
  }
  
  runApp(
    const ProviderScope(
      child: GamericsApp(),
    ),
  );
}

class GamericsApp extends StatelessWidget {
  const GamericsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Gamerics',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
    );
  }
}
