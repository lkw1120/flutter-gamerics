/// 컬렉션 아이템 조회 UseCase
library get_collection_items;

import 'package:gamerics/core/error/either.dart';
import 'package:gamerics/core/error/failures.dart';
import 'package:gamerics/domain/entities/collection_item.dart';
import 'package:gamerics/domain/repositories/collection_repository.dart';

/// 컬렉션 아이템 조회 UseCase
/// 
/// 컬렉션 아이템 목록을 조회하는 비즈니스 로직을 캡슐화합니다.
class GetCollectionItems {
  GetCollectionItems(this._repository);

  final CollectionRepository _repository;

  Future<Either<Failure, List<CollectionItem>>> call({
    PlayStatus? playStatus,
  }) {
    return _repository.getAllCollectionItems(playStatus: playStatus);
  }
}

