/// 예외 타입 정의
library exceptions;

/// 기본 예외 추상 클래스
abstract class AppException implements Exception {
  final String? message;

  const AppException(this.message);

  @override
  String toString() => message ?? runtimeType.toString();
}

/// 서버 예외
class ServerException extends AppException {
  final int? statusCode;

  const ServerException(super.message, {this.statusCode});
}

/// 네트워크 예외
class NetworkException extends AppException {
  const NetworkException(super.message);
}

/// 로컬 저장소 예외
class LocalStorageException extends AppException {
  const LocalStorageException(super.message);
}

/// 데이터 파싱 예외
class ParsingException extends AppException {
  const ParsingException(super.message);
}

