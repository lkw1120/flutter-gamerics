/// 페이지네이션 결과 엔티티
library paginated_result;

import 'package:equatable/equatable.dart';

class PaginatedResult<T> extends Equatable {
  final List<T> results;
  final int count;
  final String? next;
  final String? previous;

  const PaginatedResult({
    required this.results,
    required this.count,
    this.next,
    this.previous,
  });

  bool get hasNext => next != null;

  bool get hasPrevious => previous != null;

  @override
  List<Object?> get props => [results, count, next, previous];
}

