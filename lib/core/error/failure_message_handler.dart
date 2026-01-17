/// Failure 메시지 핸들러
/// 
/// Failure를 사용자 친화적인 메시지로 변환합니다.
library failure_message_handler;

import 'package:gamerics/core/error/failures.dart';

/// Failure 메시지 핸들러
class FailureMessageHandler {
  FailureMessageHandler._();

  /// Failure를 사용자 친화적인 메시지로 변환
  static String getUserMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message ?? 'Server error occurred';
    } else if (failure is NetworkFailure) {
      return failure.message ?? 'Please check your network connection';
    } else if (failure is LocalStorageFailure) {
      return failure.message ?? 'Storage error occurred';
    } else if (failure is ParsingFailure) {
      return failure.message ?? 'Failed to parse data';
    } else if (failure is UnknownFailure) {
      return failure.message ?? 'An unexpected error occurred';
    } else {
      return failure.toString();
    }
  }
}

