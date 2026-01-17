/// 최근 검색어 로컬 데이터소스
library recent_search_local_datasource;

import 'dart:convert';
import 'package:gamerics/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 최근 검색어 로컬 데이터소스 인터페이스
abstract class RecentSearchLocalDataSource {
  /// 최근 검색어 목록 조회
  /// 
  /// 저장된 최근 검색어 목록을 반환합니다.
  Future<List<String>> getRecentSearches();

  /// 최근 검색어 저장
  /// 
  /// [query] 저장할 검색어
  Future<void> saveRecentSearch(String query);

  /// 모든 최근 검색어 삭제
  Future<void> clearRecentSearches();

  /// 개별 최근 검색어 삭제
  /// 
  /// [query] 삭제할 검색어
  Future<void> deleteRecentSearch(String query);
}

/// 최근 검색어 로컬 데이터소스 구현 (SharedPreferences)
class RecentSearchLocalDataSourceImpl implements RecentSearchLocalDataSource {
  RecentSearchLocalDataSourceImpl(this._prefs);

  final SharedPreferences _prefs;
  
  static const String _key = 'recent_searches';
  static const int _maxCount = 10;

  @override
  Future<List<String>> getRecentSearches() async {
    try {
      final jsonString = _prefs.getString(_key);
      if (jsonString == null || jsonString.isEmpty) {
        return [];
      }
      
      final decoded = jsonDecode(jsonString) as List;
      return decoded.map((e) => e.toString()).toList();
    } catch (e) {
      throw LocalStorageException('Failed to get recent searches: $e');
    }
  }

  @override
  Future<void> saveRecentSearch(String query) async {
    try {
      final trimmedQuery = query.trim();
      if (trimmedQuery.isEmpty) {
        return;
      }

      final current = await getRecentSearches();
      
      // 중복 제거 (기존 항목이 있으면 제거)
      final updated = current
          .where((item) => item.toLowerCase() != trimmedQuery.toLowerCase())
          .toList();
      
      // 맨 앞에 새 검색어 추가
      updated.insert(0, trimmedQuery);
      
      // 최대 개수 제한
      final limited = updated.take(_maxCount).toList();
      
      // 저장
      final jsonString = jsonEncode(limited);
      await _prefs.setString(_key, jsonString);
    } catch (e) {
      throw LocalStorageException('Failed to save recent search: $e');
    }
  }

  @override
  Future<void> clearRecentSearches() async {
    try {
      await _prefs.remove(_key);
    } catch (e) {
      throw LocalStorageException('Failed to clear recent searches: $e');
    }
  }

  @override
  Future<void> deleteRecentSearch(String query) async {
    try {
      final trimmedQuery = query.trim();
      if (trimmedQuery.isEmpty) {
        return;
      }

      final current = await getRecentSearches();
      
      // 삭제할 검색어 제거
      final updated = current
          .where((item) => item.toLowerCase() != trimmedQuery.toLowerCase())
          .toList();
      
      // 저장
      final jsonString = jsonEncode(updated);
      await _prefs.setString(_key, jsonString);
    } catch (e) {
      throw LocalStorageException('Failed to delete recent search: $e');
    }
  }
}

