// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DetailState {

 Game? get game; List<GameScreenshot> get screenshots; List<GameVideo> get videos; List<Game> get similarGames; List<Game> get sameDeveloperGames; CollectionItem? get collectionItem; bool get isLoadingGame; bool get isLoadingScreenshots; bool get isLoadingVideos; bool get isLoadingCollection; bool get isLoadingSimilarGames; bool get isLoadingSameDeveloperGames; bool get isDescriptionExpanded; bool get isInitialLoading; double get loadingProgress; String? get errorMessage;
/// Create a copy of DetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailStateCopyWith<DetailState> get copyWith => _$DetailStateCopyWithImpl<DetailState>(this as DetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailState&&(identical(other.game, game) || other.game == game)&&const DeepCollectionEquality().equals(other.screenshots, screenshots)&&const DeepCollectionEquality().equals(other.videos, videos)&&const DeepCollectionEquality().equals(other.similarGames, similarGames)&&const DeepCollectionEquality().equals(other.sameDeveloperGames, sameDeveloperGames)&&(identical(other.collectionItem, collectionItem) || other.collectionItem == collectionItem)&&(identical(other.isLoadingGame, isLoadingGame) || other.isLoadingGame == isLoadingGame)&&(identical(other.isLoadingScreenshots, isLoadingScreenshots) || other.isLoadingScreenshots == isLoadingScreenshots)&&(identical(other.isLoadingVideos, isLoadingVideos) || other.isLoadingVideos == isLoadingVideos)&&(identical(other.isLoadingCollection, isLoadingCollection) || other.isLoadingCollection == isLoadingCollection)&&(identical(other.isLoadingSimilarGames, isLoadingSimilarGames) || other.isLoadingSimilarGames == isLoadingSimilarGames)&&(identical(other.isLoadingSameDeveloperGames, isLoadingSameDeveloperGames) || other.isLoadingSameDeveloperGames == isLoadingSameDeveloperGames)&&(identical(other.isDescriptionExpanded, isDescriptionExpanded) || other.isDescriptionExpanded == isDescriptionExpanded)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.loadingProgress, loadingProgress) || other.loadingProgress == loadingProgress)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,game,const DeepCollectionEquality().hash(screenshots),const DeepCollectionEquality().hash(videos),const DeepCollectionEquality().hash(similarGames),const DeepCollectionEquality().hash(sameDeveloperGames),collectionItem,isLoadingGame,isLoadingScreenshots,isLoadingVideos,isLoadingCollection,isLoadingSimilarGames,isLoadingSameDeveloperGames,isDescriptionExpanded,isInitialLoading,loadingProgress,errorMessage);

@override
String toString() {
  return 'DetailState(game: $game, screenshots: $screenshots, videos: $videos, similarGames: $similarGames, sameDeveloperGames: $sameDeveloperGames, collectionItem: $collectionItem, isLoadingGame: $isLoadingGame, isLoadingScreenshots: $isLoadingScreenshots, isLoadingVideos: $isLoadingVideos, isLoadingCollection: $isLoadingCollection, isLoadingSimilarGames: $isLoadingSimilarGames, isLoadingSameDeveloperGames: $isLoadingSameDeveloperGames, isDescriptionExpanded: $isDescriptionExpanded, isInitialLoading: $isInitialLoading, loadingProgress: $loadingProgress, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $DetailStateCopyWith<$Res>  {
  factory $DetailStateCopyWith(DetailState value, $Res Function(DetailState) _then) = _$DetailStateCopyWithImpl;
@useResult
$Res call({
 Game? game, List<GameScreenshot> screenshots, List<GameVideo> videos, List<Game> similarGames, List<Game> sameDeveloperGames, CollectionItem? collectionItem, bool isLoadingGame, bool isLoadingScreenshots, bool isLoadingVideos, bool isLoadingCollection, bool isLoadingSimilarGames, bool isLoadingSameDeveloperGames, bool isDescriptionExpanded, bool isInitialLoading, double loadingProgress, String? errorMessage
});




}
/// @nodoc
class _$DetailStateCopyWithImpl<$Res>
    implements $DetailStateCopyWith<$Res> {
  _$DetailStateCopyWithImpl(this._self, this._then);

  final DetailState _self;
  final $Res Function(DetailState) _then;

/// Create a copy of DetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? game = freezed,Object? screenshots = null,Object? videos = null,Object? similarGames = null,Object? sameDeveloperGames = null,Object? collectionItem = freezed,Object? isLoadingGame = null,Object? isLoadingScreenshots = null,Object? isLoadingVideos = null,Object? isLoadingCollection = null,Object? isLoadingSimilarGames = null,Object? isLoadingSameDeveloperGames = null,Object? isDescriptionExpanded = null,Object? isInitialLoading = null,Object? loadingProgress = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
game: freezed == game ? _self.game : game // ignore: cast_nullable_to_non_nullable
as Game?,screenshots: null == screenshots ? _self.screenshots : screenshots // ignore: cast_nullable_to_non_nullable
as List<GameScreenshot>,videos: null == videos ? _self.videos : videos // ignore: cast_nullable_to_non_nullable
as List<GameVideo>,similarGames: null == similarGames ? _self.similarGames : similarGames // ignore: cast_nullable_to_non_nullable
as List<Game>,sameDeveloperGames: null == sameDeveloperGames ? _self.sameDeveloperGames : sameDeveloperGames // ignore: cast_nullable_to_non_nullable
as List<Game>,collectionItem: freezed == collectionItem ? _self.collectionItem : collectionItem // ignore: cast_nullable_to_non_nullable
as CollectionItem?,isLoadingGame: null == isLoadingGame ? _self.isLoadingGame : isLoadingGame // ignore: cast_nullable_to_non_nullable
as bool,isLoadingScreenshots: null == isLoadingScreenshots ? _self.isLoadingScreenshots : isLoadingScreenshots // ignore: cast_nullable_to_non_nullable
as bool,isLoadingVideos: null == isLoadingVideos ? _self.isLoadingVideos : isLoadingVideos // ignore: cast_nullable_to_non_nullable
as bool,isLoadingCollection: null == isLoadingCollection ? _self.isLoadingCollection : isLoadingCollection // ignore: cast_nullable_to_non_nullable
as bool,isLoadingSimilarGames: null == isLoadingSimilarGames ? _self.isLoadingSimilarGames : isLoadingSimilarGames // ignore: cast_nullable_to_non_nullable
as bool,isLoadingSameDeveloperGames: null == isLoadingSameDeveloperGames ? _self.isLoadingSameDeveloperGames : isLoadingSameDeveloperGames // ignore: cast_nullable_to_non_nullable
as bool,isDescriptionExpanded: null == isDescriptionExpanded ? _self.isDescriptionExpanded : isDescriptionExpanded // ignore: cast_nullable_to_non_nullable
as bool,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,loadingProgress: null == loadingProgress ? _self.loadingProgress : loadingProgress // ignore: cast_nullable_to_non_nullable
as double,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DetailState].
extension DetailStatePatterns on DetailState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailState value)  $default,){
final _that = this;
switch (_that) {
case _DetailState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailState value)?  $default,){
final _that = this;
switch (_that) {
case _DetailState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Game? game,  List<GameScreenshot> screenshots,  List<GameVideo> videos,  List<Game> similarGames,  List<Game> sameDeveloperGames,  CollectionItem? collectionItem,  bool isLoadingGame,  bool isLoadingScreenshots,  bool isLoadingVideos,  bool isLoadingCollection,  bool isLoadingSimilarGames,  bool isLoadingSameDeveloperGames,  bool isDescriptionExpanded,  bool isInitialLoading,  double loadingProgress,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailState() when $default != null:
return $default(_that.game,_that.screenshots,_that.videos,_that.similarGames,_that.sameDeveloperGames,_that.collectionItem,_that.isLoadingGame,_that.isLoadingScreenshots,_that.isLoadingVideos,_that.isLoadingCollection,_that.isLoadingSimilarGames,_that.isLoadingSameDeveloperGames,_that.isDescriptionExpanded,_that.isInitialLoading,_that.loadingProgress,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Game? game,  List<GameScreenshot> screenshots,  List<GameVideo> videos,  List<Game> similarGames,  List<Game> sameDeveloperGames,  CollectionItem? collectionItem,  bool isLoadingGame,  bool isLoadingScreenshots,  bool isLoadingVideos,  bool isLoadingCollection,  bool isLoadingSimilarGames,  bool isLoadingSameDeveloperGames,  bool isDescriptionExpanded,  bool isInitialLoading,  double loadingProgress,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _DetailState():
return $default(_that.game,_that.screenshots,_that.videos,_that.similarGames,_that.sameDeveloperGames,_that.collectionItem,_that.isLoadingGame,_that.isLoadingScreenshots,_that.isLoadingVideos,_that.isLoadingCollection,_that.isLoadingSimilarGames,_that.isLoadingSameDeveloperGames,_that.isDescriptionExpanded,_that.isInitialLoading,_that.loadingProgress,_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Game? game,  List<GameScreenshot> screenshots,  List<GameVideo> videos,  List<Game> similarGames,  List<Game> sameDeveloperGames,  CollectionItem? collectionItem,  bool isLoadingGame,  bool isLoadingScreenshots,  bool isLoadingVideos,  bool isLoadingCollection,  bool isLoadingSimilarGames,  bool isLoadingSameDeveloperGames,  bool isDescriptionExpanded,  bool isInitialLoading,  double loadingProgress,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _DetailState() when $default != null:
return $default(_that.game,_that.screenshots,_that.videos,_that.similarGames,_that.sameDeveloperGames,_that.collectionItem,_that.isLoadingGame,_that.isLoadingScreenshots,_that.isLoadingVideos,_that.isLoadingCollection,_that.isLoadingSimilarGames,_that.isLoadingSameDeveloperGames,_that.isDescriptionExpanded,_that.isInitialLoading,_that.loadingProgress,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _DetailState implements DetailState {
  const _DetailState({this.game, final  List<GameScreenshot> screenshots = const [], final  List<GameVideo> videos = const [], final  List<Game> similarGames = const [], final  List<Game> sameDeveloperGames = const [], this.collectionItem, this.isLoadingGame = false, this.isLoadingScreenshots = false, this.isLoadingVideos = false, this.isLoadingCollection = false, this.isLoadingSimilarGames = false, this.isLoadingSameDeveloperGames = false, this.isDescriptionExpanded = false, this.isInitialLoading = false, this.loadingProgress = 0.0, this.errorMessage}): _screenshots = screenshots,_videos = videos,_similarGames = similarGames,_sameDeveloperGames = sameDeveloperGames;
  

@override final  Game? game;
 final  List<GameScreenshot> _screenshots;
@override@JsonKey() List<GameScreenshot> get screenshots {
  if (_screenshots is EqualUnmodifiableListView) return _screenshots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_screenshots);
}

 final  List<GameVideo> _videos;
@override@JsonKey() List<GameVideo> get videos {
  if (_videos is EqualUnmodifiableListView) return _videos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_videos);
}

 final  List<Game> _similarGames;
@override@JsonKey() List<Game> get similarGames {
  if (_similarGames is EqualUnmodifiableListView) return _similarGames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_similarGames);
}

 final  List<Game> _sameDeveloperGames;
@override@JsonKey() List<Game> get sameDeveloperGames {
  if (_sameDeveloperGames is EqualUnmodifiableListView) return _sameDeveloperGames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sameDeveloperGames);
}

@override final  CollectionItem? collectionItem;
@override@JsonKey() final  bool isLoadingGame;
@override@JsonKey() final  bool isLoadingScreenshots;
@override@JsonKey() final  bool isLoadingVideos;
@override@JsonKey() final  bool isLoadingCollection;
@override@JsonKey() final  bool isLoadingSimilarGames;
@override@JsonKey() final  bool isLoadingSameDeveloperGames;
@override@JsonKey() final  bool isDescriptionExpanded;
@override@JsonKey() final  bool isInitialLoading;
@override@JsonKey() final  double loadingProgress;
@override final  String? errorMessage;

/// Create a copy of DetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailStateCopyWith<_DetailState> get copyWith => __$DetailStateCopyWithImpl<_DetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailState&&(identical(other.game, game) || other.game == game)&&const DeepCollectionEquality().equals(other._screenshots, _screenshots)&&const DeepCollectionEquality().equals(other._videos, _videos)&&const DeepCollectionEquality().equals(other._similarGames, _similarGames)&&const DeepCollectionEquality().equals(other._sameDeveloperGames, _sameDeveloperGames)&&(identical(other.collectionItem, collectionItem) || other.collectionItem == collectionItem)&&(identical(other.isLoadingGame, isLoadingGame) || other.isLoadingGame == isLoadingGame)&&(identical(other.isLoadingScreenshots, isLoadingScreenshots) || other.isLoadingScreenshots == isLoadingScreenshots)&&(identical(other.isLoadingVideos, isLoadingVideos) || other.isLoadingVideos == isLoadingVideos)&&(identical(other.isLoadingCollection, isLoadingCollection) || other.isLoadingCollection == isLoadingCollection)&&(identical(other.isLoadingSimilarGames, isLoadingSimilarGames) || other.isLoadingSimilarGames == isLoadingSimilarGames)&&(identical(other.isLoadingSameDeveloperGames, isLoadingSameDeveloperGames) || other.isLoadingSameDeveloperGames == isLoadingSameDeveloperGames)&&(identical(other.isDescriptionExpanded, isDescriptionExpanded) || other.isDescriptionExpanded == isDescriptionExpanded)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.loadingProgress, loadingProgress) || other.loadingProgress == loadingProgress)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,game,const DeepCollectionEquality().hash(_screenshots),const DeepCollectionEquality().hash(_videos),const DeepCollectionEquality().hash(_similarGames),const DeepCollectionEquality().hash(_sameDeveloperGames),collectionItem,isLoadingGame,isLoadingScreenshots,isLoadingVideos,isLoadingCollection,isLoadingSimilarGames,isLoadingSameDeveloperGames,isDescriptionExpanded,isInitialLoading,loadingProgress,errorMessage);

@override
String toString() {
  return 'DetailState(game: $game, screenshots: $screenshots, videos: $videos, similarGames: $similarGames, sameDeveloperGames: $sameDeveloperGames, collectionItem: $collectionItem, isLoadingGame: $isLoadingGame, isLoadingScreenshots: $isLoadingScreenshots, isLoadingVideos: $isLoadingVideos, isLoadingCollection: $isLoadingCollection, isLoadingSimilarGames: $isLoadingSimilarGames, isLoadingSameDeveloperGames: $isLoadingSameDeveloperGames, isDescriptionExpanded: $isDescriptionExpanded, isInitialLoading: $isInitialLoading, loadingProgress: $loadingProgress, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$DetailStateCopyWith<$Res> implements $DetailStateCopyWith<$Res> {
  factory _$DetailStateCopyWith(_DetailState value, $Res Function(_DetailState) _then) = __$DetailStateCopyWithImpl;
@override @useResult
$Res call({
 Game? game, List<GameScreenshot> screenshots, List<GameVideo> videos, List<Game> similarGames, List<Game> sameDeveloperGames, CollectionItem? collectionItem, bool isLoadingGame, bool isLoadingScreenshots, bool isLoadingVideos, bool isLoadingCollection, bool isLoadingSimilarGames, bool isLoadingSameDeveloperGames, bool isDescriptionExpanded, bool isInitialLoading, double loadingProgress, String? errorMessage
});




}
/// @nodoc
class __$DetailStateCopyWithImpl<$Res>
    implements _$DetailStateCopyWith<$Res> {
  __$DetailStateCopyWithImpl(this._self, this._then);

  final _DetailState _self;
  final $Res Function(_DetailState) _then;

/// Create a copy of DetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? game = freezed,Object? screenshots = null,Object? videos = null,Object? similarGames = null,Object? sameDeveloperGames = null,Object? collectionItem = freezed,Object? isLoadingGame = null,Object? isLoadingScreenshots = null,Object? isLoadingVideos = null,Object? isLoadingCollection = null,Object? isLoadingSimilarGames = null,Object? isLoadingSameDeveloperGames = null,Object? isDescriptionExpanded = null,Object? isInitialLoading = null,Object? loadingProgress = null,Object? errorMessage = freezed,}) {
  return _then(_DetailState(
game: freezed == game ? _self.game : game // ignore: cast_nullable_to_non_nullable
as Game?,screenshots: null == screenshots ? _self._screenshots : screenshots // ignore: cast_nullable_to_non_nullable
as List<GameScreenshot>,videos: null == videos ? _self._videos : videos // ignore: cast_nullable_to_non_nullable
as List<GameVideo>,similarGames: null == similarGames ? _self._similarGames : similarGames // ignore: cast_nullable_to_non_nullable
as List<Game>,sameDeveloperGames: null == sameDeveloperGames ? _self._sameDeveloperGames : sameDeveloperGames // ignore: cast_nullable_to_non_nullable
as List<Game>,collectionItem: freezed == collectionItem ? _self.collectionItem : collectionItem // ignore: cast_nullable_to_non_nullable
as CollectionItem?,isLoadingGame: null == isLoadingGame ? _self.isLoadingGame : isLoadingGame // ignore: cast_nullable_to_non_nullable
as bool,isLoadingScreenshots: null == isLoadingScreenshots ? _self.isLoadingScreenshots : isLoadingScreenshots // ignore: cast_nullable_to_non_nullable
as bool,isLoadingVideos: null == isLoadingVideos ? _self.isLoadingVideos : isLoadingVideos // ignore: cast_nullable_to_non_nullable
as bool,isLoadingCollection: null == isLoadingCollection ? _self.isLoadingCollection : isLoadingCollection // ignore: cast_nullable_to_non_nullable
as bool,isLoadingSimilarGames: null == isLoadingSimilarGames ? _self.isLoadingSimilarGames : isLoadingSimilarGames // ignore: cast_nullable_to_non_nullable
as bool,isLoadingSameDeveloperGames: null == isLoadingSameDeveloperGames ? _self.isLoadingSameDeveloperGames : isLoadingSameDeveloperGames // ignore: cast_nullable_to_non_nullable
as bool,isDescriptionExpanded: null == isDescriptionExpanded ? _self.isDescriptionExpanded : isDescriptionExpanded // ignore: cast_nullable_to_non_nullable
as bool,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,loadingProgress: null == loadingProgress ? _self.loadingProgress : loadingProgress // ignore: cast_nullable_to_non_nullable
as double,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
