/// 컬렉션 리포지토리 인터페이스
library collection_repository;

import 'package:gamerics/core/error/either.dart';
import 'package:gamerics/domain/entities/collection_item.dart';
import 'package:gamerics/domain/entities/game.dart';
import 'package:gamerics/core/error/failures.dart';

/// 컬렉션 리포지토리 인터페이스
/// 
/// 로컬 저장소(Drift)를 통한 컬렉션 데이터 관리 기능을 정의합니다.
/// 즐겨찾기, 플레이 상태 등의 정보를 관리합니다.
abstract class CollectionRepository {
  /// 컬렉션 아이템 조회
  /// 
  /// [gameId] 게임 ID
  Future<Either<Failure, CollectionItem?>> getCollectionItem(int gameId);

  /// 모든 컬렉션 아이템 조회
  /// 
  /// [playStatus] 필터링할 플레이 상태 (null이면 전체)
  Future<Either<Failure, List<CollectionItem>>> getAllCollectionItems({
    PlayStatus? playStatus,
  });

  /// 즐겨찾기만 조회
  Future<Either<Failure, List<CollectionItem>>> getFavorites();

  /// 모든 컬렉션 데이터 삭제
  Future<Either<Failure, void>> clearAll();

  /// 모든 컬렉션 아이템 스트림 구독
  /// 
  /// [playStatus] 필터링할 플레이 상태 (null이면 전체)
  Stream<List<CollectionItem>> watchAllCollectionItems({
    PlayStatus? playStatus,
  });

  /// 즐겨찾기 스트림 구독
  Stream<List<CollectionItem>> watchFavorites();

  /// 컬렉션 아이템 저장 또는 업데이트
  /// 
  /// [item] 저장할 컬렉션 아이템
  Future<Either<Failure, void>> saveCollectionItem(CollectionItem item);

  /// 컬렉션 아이템 삭제
  /// 
  /// [gameId] 삭제할 게임 ID
  Future<Either<Failure, void>> deleteCollectionItem(int gameId);

  /// 즐겨찾기 토글
  /// 
  /// [gameId] 게임 ID
  /// [game] 게임 정보 (있으면 DB에 저장)
  Future<Either<Failure, void>> toggleFavorite(int gameId, {Game? game});

  /// 플레이 상태 업데이트
  /// 
  /// [gameId] 게임 ID
  /// [playStatus] 새로운 플레이 상태
  /// [game] 게임 정보 (있으면 DB에 저장)
  Future<Either<Failure, void>> updatePlayStatus(
    int gameId,
    PlayStatus playStatus, {
    Game? game,
  });
}

