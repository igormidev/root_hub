// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MatchChatState {

 int? get scheduledMatchId; bool get isLoading; bool get hasLoadedOnce; bool get isLoadingMore; bool get hasNextPage; int get currentPage; bool get isSendingMessage; bool get isUploadingImage; RootHubException? get loadError; RootHubException? get actionError; Set<int> get subscribedPlayerIds;
/// Create a copy of MatchChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchChatStateCopyWith<MatchChatState> get copyWith => _$MatchChatStateCopyWithImpl<MatchChatState>(this as MatchChatState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchChatState&&(identical(other.scheduledMatchId, scheduledMatchId) || other.scheduledMatchId == scheduledMatchId)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasLoadedOnce, hasLoadedOnce) || other.hasLoadedOnce == hasLoadedOnce)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.isSendingMessage, isSendingMessage) || other.isSendingMessage == isSendingMessage)&&(identical(other.isUploadingImage, isUploadingImage) || other.isUploadingImage == isUploadingImage)&&(identical(other.loadError, loadError) || other.loadError == loadError)&&(identical(other.actionError, actionError) || other.actionError == actionError)&&const DeepCollectionEquality().equals(other.subscribedPlayerIds, subscribedPlayerIds));
}


@override
int get hashCode => Object.hash(runtimeType,scheduledMatchId,isLoading,hasLoadedOnce,isLoadingMore,hasNextPage,currentPage,isSendingMessage,isUploadingImage,loadError,actionError,const DeepCollectionEquality().hash(subscribedPlayerIds));

@override
String toString() {
  return 'MatchChatState(scheduledMatchId: $scheduledMatchId, isLoading: $isLoading, hasLoadedOnce: $hasLoadedOnce, isLoadingMore: $isLoadingMore, hasNextPage: $hasNextPage, currentPage: $currentPage, isSendingMessage: $isSendingMessage, isUploadingImage: $isUploadingImage, loadError: $loadError, actionError: $actionError, subscribedPlayerIds: $subscribedPlayerIds)';
}


}

/// @nodoc
abstract mixin class $MatchChatStateCopyWith<$Res>  {
  factory $MatchChatStateCopyWith(MatchChatState value, $Res Function(MatchChatState) _then) = _$MatchChatStateCopyWithImpl;
@useResult
$Res call({
 int? scheduledMatchId, bool isLoading, bool hasLoadedOnce, bool isLoadingMore, bool hasNextPage, int currentPage, bool isSendingMessage, bool isUploadingImage, RootHubException? loadError, RootHubException? actionError, Set<int> subscribedPlayerIds
});




}
/// @nodoc
class _$MatchChatStateCopyWithImpl<$Res>
    implements $MatchChatStateCopyWith<$Res> {
  _$MatchChatStateCopyWithImpl(this._self, this._then);

  final MatchChatState _self;
  final $Res Function(MatchChatState) _then;

/// Create a copy of MatchChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scheduledMatchId = freezed,Object? isLoading = null,Object? hasLoadedOnce = null,Object? isLoadingMore = null,Object? hasNextPage = null,Object? currentPage = null,Object? isSendingMessage = null,Object? isUploadingImage = null,Object? loadError = freezed,Object? actionError = freezed,Object? subscribedPlayerIds = null,}) {
  return _then(_self.copyWith(
scheduledMatchId: freezed == scheduledMatchId ? _self.scheduledMatchId : scheduledMatchId // ignore: cast_nullable_to_non_nullable
as int?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasLoadedOnce: null == hasLoadedOnce ? _self.hasLoadedOnce : hasLoadedOnce // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,isSendingMessage: null == isSendingMessage ? _self.isSendingMessage : isSendingMessage // ignore: cast_nullable_to_non_nullable
as bool,isUploadingImage: null == isUploadingImage ? _self.isUploadingImage : isUploadingImage // ignore: cast_nullable_to_non_nullable
as bool,loadError: freezed == loadError ? _self.loadError : loadError // ignore: cast_nullable_to_non_nullable
as RootHubException?,actionError: freezed == actionError ? _self.actionError : actionError // ignore: cast_nullable_to_non_nullable
as RootHubException?,subscribedPlayerIds: null == subscribedPlayerIds ? _self.subscribedPlayerIds : subscribedPlayerIds // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchChatState].
extension MatchChatStatePatterns on MatchChatState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchChatState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchChatState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchChatState value)  $default,){
final _that = this;
switch (_that) {
case _MatchChatState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchChatState value)?  $default,){
final _that = this;
switch (_that) {
case _MatchChatState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? scheduledMatchId,  bool isLoading,  bool hasLoadedOnce,  bool isLoadingMore,  bool hasNextPage,  int currentPage,  bool isSendingMessage,  bool isUploadingImage,  RootHubException? loadError,  RootHubException? actionError,  Set<int> subscribedPlayerIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchChatState() when $default != null:
return $default(_that.scheduledMatchId,_that.isLoading,_that.hasLoadedOnce,_that.isLoadingMore,_that.hasNextPage,_that.currentPage,_that.isSendingMessage,_that.isUploadingImage,_that.loadError,_that.actionError,_that.subscribedPlayerIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? scheduledMatchId,  bool isLoading,  bool hasLoadedOnce,  bool isLoadingMore,  bool hasNextPage,  int currentPage,  bool isSendingMessage,  bool isUploadingImage,  RootHubException? loadError,  RootHubException? actionError,  Set<int> subscribedPlayerIds)  $default,) {final _that = this;
switch (_that) {
case _MatchChatState():
return $default(_that.scheduledMatchId,_that.isLoading,_that.hasLoadedOnce,_that.isLoadingMore,_that.hasNextPage,_that.currentPage,_that.isSendingMessage,_that.isUploadingImage,_that.loadError,_that.actionError,_that.subscribedPlayerIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? scheduledMatchId,  bool isLoading,  bool hasLoadedOnce,  bool isLoadingMore,  bool hasNextPage,  int currentPage,  bool isSendingMessage,  bool isUploadingImage,  RootHubException? loadError,  RootHubException? actionError,  Set<int> subscribedPlayerIds)?  $default,) {final _that = this;
switch (_that) {
case _MatchChatState() when $default != null:
return $default(_that.scheduledMatchId,_that.isLoading,_that.hasLoadedOnce,_that.isLoadingMore,_that.hasNextPage,_that.currentPage,_that.isSendingMessage,_that.isUploadingImage,_that.loadError,_that.actionError,_that.subscribedPlayerIds);case _:
  return null;

}
}

}

/// @nodoc


class _MatchChatState implements MatchChatState {
  const _MatchChatState({this.scheduledMatchId, this.isLoading = false, this.hasLoadedOnce = false, this.isLoadingMore = false, this.hasNextPage = false, this.currentPage = 0, this.isSendingMessage = false, this.isUploadingImage = false, this.loadError, this.actionError, final  Set<int> subscribedPlayerIds = const <int>{}}): _subscribedPlayerIds = subscribedPlayerIds;
  

@override final  int? scheduledMatchId;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool hasLoadedOnce;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool hasNextPage;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool isSendingMessage;
@override@JsonKey() final  bool isUploadingImage;
@override final  RootHubException? loadError;
@override final  RootHubException? actionError;
 final  Set<int> _subscribedPlayerIds;
@override@JsonKey() Set<int> get subscribedPlayerIds {
  if (_subscribedPlayerIds is EqualUnmodifiableSetView) return _subscribedPlayerIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_subscribedPlayerIds);
}


/// Create a copy of MatchChatState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchChatStateCopyWith<_MatchChatState> get copyWith => __$MatchChatStateCopyWithImpl<_MatchChatState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchChatState&&(identical(other.scheduledMatchId, scheduledMatchId) || other.scheduledMatchId == scheduledMatchId)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasLoadedOnce, hasLoadedOnce) || other.hasLoadedOnce == hasLoadedOnce)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.isSendingMessage, isSendingMessage) || other.isSendingMessage == isSendingMessage)&&(identical(other.isUploadingImage, isUploadingImage) || other.isUploadingImage == isUploadingImage)&&(identical(other.loadError, loadError) || other.loadError == loadError)&&(identical(other.actionError, actionError) || other.actionError == actionError)&&const DeepCollectionEquality().equals(other._subscribedPlayerIds, _subscribedPlayerIds));
}


@override
int get hashCode => Object.hash(runtimeType,scheduledMatchId,isLoading,hasLoadedOnce,isLoadingMore,hasNextPage,currentPage,isSendingMessage,isUploadingImage,loadError,actionError,const DeepCollectionEquality().hash(_subscribedPlayerIds));

@override
String toString() {
  return 'MatchChatState(scheduledMatchId: $scheduledMatchId, isLoading: $isLoading, hasLoadedOnce: $hasLoadedOnce, isLoadingMore: $isLoadingMore, hasNextPage: $hasNextPage, currentPage: $currentPage, isSendingMessage: $isSendingMessage, isUploadingImage: $isUploadingImage, loadError: $loadError, actionError: $actionError, subscribedPlayerIds: $subscribedPlayerIds)';
}


}

/// @nodoc
abstract mixin class _$MatchChatStateCopyWith<$Res> implements $MatchChatStateCopyWith<$Res> {
  factory _$MatchChatStateCopyWith(_MatchChatState value, $Res Function(_MatchChatState) _then) = __$MatchChatStateCopyWithImpl;
@override @useResult
$Res call({
 int? scheduledMatchId, bool isLoading, bool hasLoadedOnce, bool isLoadingMore, bool hasNextPage, int currentPage, bool isSendingMessage, bool isUploadingImage, RootHubException? loadError, RootHubException? actionError, Set<int> subscribedPlayerIds
});




}
/// @nodoc
class __$MatchChatStateCopyWithImpl<$Res>
    implements _$MatchChatStateCopyWith<$Res> {
  __$MatchChatStateCopyWithImpl(this._self, this._then);

  final _MatchChatState _self;
  final $Res Function(_MatchChatState) _then;

/// Create a copy of MatchChatState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scheduledMatchId = freezed,Object? isLoading = null,Object? hasLoadedOnce = null,Object? isLoadingMore = null,Object? hasNextPage = null,Object? currentPage = null,Object? isSendingMessage = null,Object? isUploadingImage = null,Object? loadError = freezed,Object? actionError = freezed,Object? subscribedPlayerIds = null,}) {
  return _then(_MatchChatState(
scheduledMatchId: freezed == scheduledMatchId ? _self.scheduledMatchId : scheduledMatchId // ignore: cast_nullable_to_non_nullable
as int?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasLoadedOnce: null == hasLoadedOnce ? _self.hasLoadedOnce : hasLoadedOnce // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,isSendingMessage: null == isSendingMessage ? _self.isSendingMessage : isSendingMessage // ignore: cast_nullable_to_non_nullable
as bool,isUploadingImage: null == isUploadingImage ? _self.isUploadingImage : isUploadingImage // ignore: cast_nullable_to_non_nullable
as bool,loadError: freezed == loadError ? _self.loadError : loadError // ignore: cast_nullable_to_non_nullable
as RootHubException?,actionError: freezed == actionError ? _self.actionError : actionError // ignore: cast_nullable_to_non_nullable
as RootHubException?,subscribedPlayerIds: null == subscribedPlayerIds ? _self._subscribedPlayerIds : subscribedPlayerIds // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}


}

// dart format on
