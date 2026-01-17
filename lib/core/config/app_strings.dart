/// 앱 UI 문자열 상수 정의
library app_strings;

/// 앱 UI 문자열
class AppStrings {
  AppStrings._();

  // Collection 화면
  static const String collectionEmpty = 'Your collection is empty';

  // Search 화면
  static const String searchStart = 'Start searching for games';
  static const String searchNoResults = 'No results found';
  static String searchMinLength(int minLength) => 'Enter at least $minLength characters';

  // Detail 화면
  static const String detailUnableToLoad = 'Unable to load game info';
}

