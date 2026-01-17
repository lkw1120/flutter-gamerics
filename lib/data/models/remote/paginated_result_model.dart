/// 페이지네이션 결과 모델 (DTO)
library paginated_result_model;

import 'package:gamerics/domain/entities/paginated_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paginated_result_model.g.dart';

/// 페이지네이션 결과 모델
@JsonSerializable(genericArgumentFactories: true)
class PaginatedResultModel<T> {
  final List<T> results;
  final int count;
  final String? next;
  final String? previous;

  const PaginatedResultModel({
    required this.results,
    required this.count,
    this.next,
    this.previous,
  });

  factory PaginatedResultModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginatedResultModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$PaginatedResultModelToJson(this, toJsonT);

  PaginatedResult<R> toEntity<R>(R Function(T model) toEntity) {
    return PaginatedResult<R>(
      results: results.map(toEntity).toList(),
      count: count,
      next: next,
      previous: previous,
    );
  }
}

