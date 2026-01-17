/// Either 타입 정의 (함수형 프로그래밍 스타일 에러 처리)
library either;

/// Left 또는 Right 값을 가지는 타입
/// 
/// Left는 일반적으로 실패(Failure)를 나타내고,
/// Right는 성공한 결과 값을 나타냅니다.
sealed class Either<L, R> {
  const Either();

  T fold<T>(T Function(L left) onLeft, T Function(R right) onRight);

  bool get isLeft => this is Left<L, R>;
  bool get isRight => this is Right<L, R>;

  L? get leftOrNull => isLeft ? (this as Left<L, R>).value : null;
  R? get rightOrNull => isRight ? (this as Right<L, R>).value : null;
}

class Left<L, R> extends Either<L, R> {
  final L value;

  const Left(this.value);

  @override
  T fold<T>(T Function(L left) onLeft, T Function(R right) onRight) {
    return onLeft(value);
  }
}

class Right<L, R> extends Either<L, R> {
  final R value;

  const Right(this.value);

  @override
  T fold<T>(T Function(L left) onLeft, T Function(R right) onRight) {
    return onRight(value);
  }
}

