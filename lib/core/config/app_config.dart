/// 앱 전역 설정 및 상수 정의
library app_config;

import 'package:flutter_dotenv/flutter_dotenv.dart';

/// RAWG API 기본 설정
class AppConfig {
  AppConfig._();

  static const String rawgBaseUrl = 'https://api.rawg.io/api';
  
  /// RAWG API 키 (.env 파일에서 읽어옴)
  static String get rawgApiKey => dotenv.env['RAWG_API_KEY'] ?? '';

  static const int defaultPageSize = 20;
  
  static const int searchDebounceMs = 400;
  
  static const int searchMinLength = 2;
  
  /// 게임 캐시 TTL (시간 단위)
  static const int gameCacheTTLHours = 24;
}

