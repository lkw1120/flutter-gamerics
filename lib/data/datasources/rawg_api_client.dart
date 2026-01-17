/// RAWG API 클라이언트
library rawg_api_client;

import 'package:dio/dio.dart';
import 'package:gamerics/core/config/app_config.dart';
import 'package:gamerics/core/error/exceptions.dart';

/// RAWG API 클라이언트
/// 
/// Dio를 사용하여 RAWG API와 통신합니다.
/// 모든 API 호출은 이 클래스를 통해 이루어집니다.
class RawgApiClient {
  RawgApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.rawgBaseUrl,
        queryParameters: {'key': AppConfig.rawgApiKey},
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  late final Dio _dio;

  /// GET 요청
  /// 
  /// [path] API 경로
  /// [queryParameters] 쿼리 파라미터
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        path,
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200 && response.data != null) {
        return response.data!;
      } else {
        throw ServerException(
          'Invalid response: ${response.statusCode}',
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw NetworkException('Network error: ${e.message}');
      }

      throw ServerException(
        'Server error: ${e.message}',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw UnknownException('Unexpected error: $e');
    }
  }
}

/// 알 수 없는 예외
class UnknownException extends AppException {
  const UnknownException(super.message);
}

