/// 즐겨찾기 조회 UseCase
library get_favorites;

import 'package:gamerics/core/error/either.dart';
import 'package:gamerics/core/error/failures.dart';
import 'package:gamerics/domain/entities/collection_item.dart';
import 'package:gamerics/domain/repositories/collection_repository.dart';

/// 즐겨찾기 조회 UseCase
/// 
/// 즐겨찾기 목록을 조회하는 비즈니스 로직을 캡슐화합니다.
class GetFavorites {
  GetFavorites(this._repository);

  final CollectionRepository _repository;

  Future<Either<Failure, List<CollectionItem>>> call() {
    return _repository.getFavorites();
  }
}

