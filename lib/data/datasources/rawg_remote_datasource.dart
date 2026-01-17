/// RAWG 원격 데이터소스
library rawg_remote_datasource;

import 'package:gamerics/core/error/exceptions.dart';
import 'package:gamerics/data/datasources/rawg_api_client.dart';

/// RAWG 원격 데이터소스 인터페이스
abstract class RawgRemoteDataSource {
  Future<Map<String, dynamic>> getGames({
    int page = 1,
    int pageSize = 20,
    String? ordering,
    String? dates,
    List<int>? platforms,
    List<int>? genres,
    List<int>? developers,
  });

  Future<Map<String, dynamic>> searchGames({
    required String query,
    int page = 1,
    int pageSize = 20,
  });

  Future<Map<String, dynamic>> getGameById(int id);

  Future<Map<String, dynamic>> getGameScreenshots(int gameId);

  Future<Map<String, dynamic>> getGameVideos(int gameId);
}

/// RAWG 원격 데이터소스 구현
class RawgRemoteDataSourceImpl implements RawgRemoteDataSource {
  RawgRemoteDataSourceImpl(this._apiClient);

  final RawgApiClient _apiClient;

  @override
  Future<Map<String, dynamic>> getGames({
    int page = 1,
    int pageSize = 20,
    String? ordering,
    String? dates,
    List<int>? platforms,
    List<int>? genres,
    List<int>? developers,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'page_size': pageSize,
      };

      if (ordering != null) {
        queryParams['ordering'] = ordering;
      }

      if (dates != null) {
        queryParams['dates'] = dates;
      }

      if (platforms != null && platforms.isNotEmpty) {
        queryParams['platforms'] = platforms.join(',');
      }

      if (genres != null && genres.isNotEmpty) {
        queryParams['genres'] = genres.join(',');
      }

      if (developers != null && developers.isNotEmpty) {
        queryParams['developers'] = developers.join(',');
      }

      return await _apiClient.get('/games', queryParameters: queryParams);
    } catch (e) {
      if (e is AppException) {
        rethrow;
      }
      throw UnknownException('Failed to get games: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> searchGames({
    required String query,
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      return await _apiClient.get(
        '/games',
        queryParameters: {
          'search': query,
          'page': page,
          'page_size': pageSize,
        },
      );
    } catch (e) {
      if (e is AppException) {
        rethrow;
      }
      throw UnknownException('Failed to search games: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> getGameById(int id) async {
    try {
      return await _apiClient.get('/games/$id');
    } catch (e) {
      if (e is AppException) {
        rethrow;
      }
      throw UnknownException('Failed to get game: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> getGameScreenshots(int gameId) async {
    try {
      return await _apiClient.get('/games/$gameId/screenshots');
    } catch (e) {
      if (e is AppException) {
        rethrow;
      }
      throw UnknownException('Failed to get screenshots: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> getGameVideos(int gameId) async {
    try {
      return await _apiClient.get('/games/$gameId/movies');
    } catch (e) {
      if (e is AppException) {
        rethrow;
      }
      throw UnknownException('Failed to get videos: $e');
    }
  }
}

