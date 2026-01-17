// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CollectionState {

 int get selectedTabIndex; List<CollectionItem> get favoritesItems; List<CollectionItem> get playingItems; List<CollectionItem> get finishedItems; bool get isLoadingFavorites; bool get isLoadingPlaying; bool get isLoadingFinished; String? get errorMessage;
/// Create a copy of CollectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollectionStateCopyWith<CollectionState> get copyWith => _$CollectionStateCopyWithImpl<CollectionState>(this as CollectionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollectionState&&(identical(other.selectedTabIndex, selectedTabIndex) || other.selectedTabIndex == selectedTabIndex)&&const DeepCollectionEquality().equals(other.favoritesItems, favoritesItems)&&const DeepCollectionEquality().equals(other.playingItems, playingItems)&&const DeepCollectionEquality().equals(other.finishedItems, finishedItems)&&(identical(other.isLoadingFavorites, isLoadingFavorites) || other.isLoadingFavorites == isLoadingFavorites)&&(identical(other.isLoadingPlaying, isLoadingPlaying) || other.isLoadingPlaying == isLoadingPlaying)&&(identical(other.isLoadingFinished, isLoadingFinished) || other.isLoadingFinished == isLoadingFinished)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTabIndex,const DeepCollectionEquality().hash(favoritesItems),const DeepCollectionEquality().hash(playingItems),const DeepCollectionEquality().hash(finishedItems),isLoadingFavorites,isLoadingPlaying,isLoadingFinished,errorMessage);

@override
String toString() {
  return 'CollectionState(selectedTabIndex: $selectedTabIndex, favoritesItems: $favoritesItems, playingItems: $playingItems, finishedItems: $finishedItems, isLoadingFavorites: $isLoadingFavorites, isLoadingPlaying: $isLoadingPlaying, isLoadingFinished: $isLoadingFinished, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CollectionStateCopyWith<$Res>  {
  factory $CollectionStateCopyWith(CollectionState value, $Res Function(CollectionState) _then) = _$CollectionStateCopyWithImpl;
@useResult
$Res call({
 int selectedTabIndex, List<CollectionItem> favoritesItems, List<CollectionItem> playingItems, List<CollectionItem> finishedItems, bool isLoadingFavorites, bool isLoadingPlaying, bool isLoadingFinished, String? errorMessage
});




}
/// @nodoc
class _$CollectionStateCopyWithImpl<$Res>
    implements $CollectionStateCopyWith<$Res> {
  _$CollectionStateCopyWithImpl(this._self, this._then);

  final CollectionState _self;
  final $Res Function(CollectionState) _then;

/// Create a copy of CollectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTabIndex = null,Object? favoritesItems = null,Object? playingItems = null,Object? finishedItems = null,Object? isLoadingFavorites = null,Object? isLoadingPlaying = null,Object? isLoadingFinished = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
selectedTabIndex: null == selectedTabIndex ? _self.selectedTabIndex : selectedTabIndex // ignore: cast_nullable_to_non_nullable
as int,favoritesItems: null == favoritesItems ? _self.favoritesItems : favoritesItems // ignore: cast_nullable_to_non_nullable
as List<CollectionItem>,playingItems: null == playingItems ? _self.playingItems : playingItems // ignore: cast_nullable_to_non_nullable
as List<CollectionItem>,finishedItems: null == finishedItems ? _self.finishedItems : finishedItems // ignore: cast_nullable_to_non_nullable
as List<CollectionItem>,isLoadingFavorites: null == isLoadingFavorites ? _self.isLoadingFavorites : isLoadingFavorites // ignore: cast_nullable_to_non_nullable
as bool,isLoadingPlaying: null == isLoadingPlaying ? _self.isLoadingPlaying : isLoadingPlaying // ignore: cast_nullable_to_non_nullable
as bool,isLoadingFinished: null == isLoadingFinished ? _self.isLoadingFinished : isLoadingFinished // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CollectionState].
extension CollectionStatePatterns on CollectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CollectionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CollectionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CollectionState value)  $default,){
final _that = this;
switch (_that) {
case _CollectionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CollectionState value)?  $default,){
final _that = this;
switch (_that) {
case _CollectionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int selectedTabIndex,  List<CollectionItem> favoritesItems,  List<CollectionItem> playingItems,  List<CollectionItem> finishedItems,  bool isLoadingFavorites,  bool isLoadingPlaying,  bool isLoadingFinished,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CollectionState() when $default != null:
return $default(_that.selectedTabIndex,_that.favoritesItems,_that.playingItems,_that.finishedItems,_that.isLoadingFavorites,_that.isLoadingPlaying,_that.isLoadingFinished,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int selectedTabIndex,  List<CollectionItem> favoritesItems,  List<CollectionItem> playingItems,  List<CollectionItem> finishedItems,  bool isLoadingFavorites,  bool isLoadingPlaying,  bool isLoadingFinished,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CollectionState():
return $default(_that.selectedTabIndex,_that.favoritesItems,_that.playingItems,_that.finishedItems,_that.isLoadingFavorites,_that.isLoadingPlaying,_that.isLoadingFinished,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int selectedTabIndex,  List<CollectionItem> favoritesItems,  List<CollectionItem> playingItems,  List<CollectionItem> finishedItems,  bool isLoadingFavorites,  bool isLoadingPlaying,  bool isLoadingFinished,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CollectionState() when $default != null:
return $default(_that.selectedTabIndex,_that.favoritesItems,_that.playingItems,_that.finishedItems,_that.isLoadingFavorites,_that.isLoadingPlaying,_that.isLoadingFinished,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _CollectionState implements CollectionState {
  const _CollectionState({this.selectedTabIndex = 0, final  List<CollectionItem> favoritesItems = const [], final  List<CollectionItem> playingItems = const [], final  List<CollectionItem> finishedItems = const [], this.isLoadingFavorites = false, this.isLoadingPlaying = false, this.isLoadingFinished = false, this.errorMessage = null}): _favoritesItems = favoritesItems,_playingItems = playingItems,_finishedItems = finishedItems;
  

@override@JsonKey() final  int selectedTabIndex;
 final  List<CollectionItem> _favoritesItems;
@override@JsonKey() List<CollectionItem> get favoritesItems {
  if (_favoritesItems is EqualUnmodifiableListView) return _favoritesItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favoritesItems);
}

 final  List<CollectionItem> _playingItems;
@override@JsonKey() List<CollectionItem> get playingItems {
  if (_playingItems is EqualUnmodifiableListView) return _playingItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_playingItems);
}

 final  List<CollectionItem> _finishedItems;
@override@JsonKey() List<CollectionItem> get finishedItems {
  if (_finishedItems is EqualUnmodifiableListView) return _finishedItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_finishedItems);
}

@override@JsonKey() final  bool isLoadingFavorites;
@override@JsonKey() final  bool isLoadingPlaying;
@override@JsonKey() final  bool isLoadingFinished;
@override@JsonKey() final  String? errorMessage;

/// Create a copy of CollectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CollectionStateCopyWith<_CollectionState> get copyWith => __$CollectionStateCopyWithImpl<_CollectionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CollectionState&&(identical(other.selectedTabIndex, selectedTabIndex) || other.selectedTabIndex == selectedTabIndex)&&const DeepCollectionEquality().equals(other._favoritesItems, _favoritesItems)&&const DeepCollectionEquality().equals(other._playingItems, _playingItems)&&const DeepCollectionEquality().equals(other._finishedItems, _finishedItems)&&(identical(other.isLoadingFavorites, isLoadingFavorites) || other.isLoadingFavorites == isLoadingFavorites)&&(identical(other.isLoadingPlaying, isLoadingPlaying) || other.isLoadingPlaying == isLoadingPlaying)&&(identical(other.isLoadingFinished, isLoadingFinished) || other.isLoadingFinished == isLoadingFinished)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTabIndex,const DeepCollectionEquality().hash(_favoritesItems),const DeepCollectionEquality().hash(_playingItems),const DeepCollectionEquality().hash(_finishedItems),isLoadingFavorites,isLoadingPlaying,isLoadingFinished,errorMessage);

@override
String toString() {
  return 'CollectionState(selectedTabIndex: $selectedTabIndex, favoritesItems: $favoritesItems, playingItems: $playingItems, finishedItems: $finishedItems, isLoadingFavorites: $isLoadingFavorites, isLoadingPlaying: $isLoadingPlaying, isLoadingFinished: $isLoadingFinished, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CollectionStateCopyWith<$Res> implements $CollectionStateCopyWith<$Res> {
  factory _$CollectionStateCopyWith(_CollectionState value, $Res Function(_CollectionState) _then) = __$CollectionStateCopyWithImpl;
@override @useResult
$Res call({
 int selectedTabIndex, List<CollectionItem> favoritesItems, List<CollectionItem> playingItems, List<CollectionItem> finishedItems, bool isLoadingFavorites, bool isLoadingPlaying, bool isLoadingFinished, String? errorMessage
});




}
/// @nodoc
class __$CollectionStateCopyWithImpl<$Res>
    implements _$CollectionStateCopyWith<$Res> {
  __$CollectionStateCopyWithImpl(this._self, this._then);

  final _CollectionState _self;
  final $Res Function(_CollectionState) _then;

/// Create a copy of CollectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTabIndex = null,Object? favoritesItems = null,Object? playingItems = null,Object? finishedItems = null,Object? isLoadingFavorites = null,Object? isLoadingPlaying = null,Object? isLoadingFinished = null,Object? errorMessage = freezed,}) {
  return _then(_CollectionState(
selectedTabIndex: null == selectedTabIndex ? _self.selectedTabIndex : selectedTabIndex // ignore: cast_nullable_to_non_nullable
as int,favoritesItems: null == favoritesItems ? _self._favoritesItems : favoritesItems // ignore: cast_nullable_to_non_nullable
as List<CollectionItem>,playingItems: null == playingItems ? _self._playingItems : playingItems // ignore: cast_nullable_to_non_nullable
as List<CollectionItem>,finishedItems: null == finishedItems ? _self._finishedItems : finishedItems // ignore: cast_nullable_to_non_nullable
as List<CollectionItem>,isLoadingFavorites: null == isLoadingFavorites ? _self.isLoadingFavorites : isLoadingFavorites // ignore: cast_nullable_to_non_nullable
as bool,isLoadingPlaying: null == isLoadingPlaying ? _self.isLoadingPlaying : isLoadingPlaying // ignore: cast_nullable_to_non_nullable
as bool,isLoadingFinished: null == isLoadingFinished ? _self.isLoadingFinished : isLoadingFinished // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
