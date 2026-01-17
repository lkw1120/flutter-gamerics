/// 컬렉션 아이템 조회 UseCase
library get_collection_item;

import 'package:gamerics/core/error/either.dart';
import 'package:gamerics/core/error/failures.dart';
import 'package:gamerics/domain/entities/collection_item.dart';
import 'package:gamerics/domain/repositories/collection_repository.dart';

/// 컬렉션 아이템 조회 UseCase
/// 
/// 특정 게임의 컬렉션 아이템을 조회하는 비즈니스 로직을 캡슐화합니다.
class GetCollectionItem {
  GetCollectionItem(this._repository);

  final CollectionRepository _repository;

  Future<Either<Failure, CollectionItem?>> call(int gameId) {
    return _repository.getCollectionItem(gameId);
  }
}

