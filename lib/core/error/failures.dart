/// 실패 및 에러 타입 정의
library failures;

import 'package:equatable/equatable.dart';

/// 기본 실패 추상 클래스
abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object?> get props => [];
}

/// 서버 통신 실패
class ServerFailure extends Failure {
  final String? message;
  final int? statusCode;

  const ServerFailure({this.message, this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

/// 네트워크 연결 실패
class NetworkFailure extends Failure {
  final String? message;

  const NetworkFailure({this.message});

  @override
  List<Object?> get props => [message];
}

/// 로컬 저장소 실패
class LocalStorageFailure extends Failure {
  final String? message;

  const LocalStorageFailure({this.message});

  @override
  List<Object?> get props => [message];
}

/// 데이터 파싱 실패
class ParsingFailure extends Failure {
  final String? message;

  const ParsingFailure({this.message});

  @override
  List<Object?> get props => [message];
}

/// 알 수 없는 실패
class UnknownFailure extends Failure {
  final String? message;

  const UnknownFailure({this.message});

  @override
  List<Object?> get props => [message];
}

