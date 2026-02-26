// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActivityState {

 List<MatchSchedulePairingAttempt> get subscribedActiveSchedules; List<MatchChatActivityChatItem> get activeChats; List<MatchChatActivityChatItem> get endedChats; int get unreadMessagesCount; bool get isLoading; bool get hasLoadedOnce; RootHubException? get loadError; bool get isLoadingUnreadCount; bool get hasLoadedUnreadCount; RootHubException? get unreadCountError;
/// Create a copy of ActivityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityStateCopyWith<ActivityState> get copyWith => _$ActivityStateCopyWithImpl<ActivityState>(this as ActivityState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityState&&const DeepCollectionEquality().equals(other.subscribedActiveSchedules, subscribedActiveSchedules)&&const DeepCollectionEquality().equals(other.activeChats, activeChats)&&const DeepCollectionEquality().equals(other.endedChats, endedChats)&&(identical(other.unreadMessagesCount, unreadMessagesCount) || other.unreadMessagesCount == unreadMessagesCount)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasLoadedOnce, hasLoadedOnce) || other.hasLoadedOnce == hasLoadedOnce)&&(identical(other.loadError, loadError) || other.loadError == loadError)&&(identical(other.isLoadingUnreadCount, isLoadingUnreadCount) || other.isLoadingUnreadCount == isLoadingUnreadCount)&&(identical(other.hasLoadedUnreadCount, hasLoadedUnreadCount) || other.hasLoadedUnreadCount == hasLoadedUnreadCount)&&(identical(other.unreadCountError, unreadCountError) || other.unreadCountError == unreadCountError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(subscribedActiveSchedules),const DeepCollectionEquality().hash(activeChats),const DeepCollectionEquality().hash(endedChats),unreadMessagesCount,isLoading,hasLoadedOnce,loadError,isLoadingUnreadCount,hasLoadedUnreadCount,unreadCountError);

@override
String toString() {
  return 'ActivityState(subscribedActiveSchedules: $subscribedActiveSchedules, activeChats: $activeChats, endedChats: $endedChats, unreadMessagesCount: $unreadMessagesCount, isLoading: $isLoading, hasLoadedOnce: $hasLoadedOnce, loadError: $loadError, isLoadingUnreadCount: $isLoadingUnreadCount, hasLoadedUnreadCount: $hasLoadedUnreadCount, unreadCountError: $unreadCountError)';
}


}

/// @nodoc
abstract mixin class $ActivityStateCopyWith<$Res>  {
  factory $ActivityStateCopyWith(ActivityState value, $Res Function(ActivityState) _then) = _$ActivityStateCopyWithImpl;
@useResult
$Res call({
 List<MatchSchedulePairingAttempt> subscribedActiveSchedules, List<MatchChatActivityChatItem> activeChats, List<MatchChatActivityChatItem> endedChats, int unreadMessagesCount, bool isLoading, bool hasLoadedOnce, RootHubException? loadError, bool isLoadingUnreadCount, bool hasLoadedUnreadCount, RootHubException? unreadCountError
});




}
/// @nodoc
class _$ActivityStateCopyWithImpl<$Res>
    implements $ActivityStateCopyWith<$Res> {
  _$ActivityStateCopyWithImpl(this._self, this._then);

  final ActivityState _self;
  final $Res Function(ActivityState) _then;

/// Create a copy of ActivityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subscribedActiveSchedules = null,Object? activeChats = null,Object? endedChats = null,Object? unreadMessagesCount = null,Object? isLoading = null,Object? hasLoadedOnce = null,Object? loadError = freezed,Object? isLoadingUnreadCount = null,Object? hasLoadedUnreadCount = null,Object? unreadCountError = freezed,}) {
  return _then(_self.copyWith(
subscribedActiveSchedules: null == subscribedActiveSchedules ? _self.subscribedActiveSchedules : subscribedActiveSchedules // ignore: cast_nullable_to_non_nullable
as List<MatchSchedulePairingAttempt>,activeChats: null == activeChats ? _self.activeChats : activeChats // ignore: cast_nullable_to_non_nullable
as List<MatchChatActivityChatItem>,endedChats: null == endedChats ? _self.endedChats : endedChats // ignore: cast_nullable_to_non_nullable
as List<MatchChatActivityChatItem>,unreadMessagesCount: null == unreadMessagesCount ? _self.unreadMessagesCount : unreadMessagesCount // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasLoadedOnce: null == hasLoadedOnce ? _self.hasLoadedOnce : hasLoadedOnce // ignore: cast_nullable_to_non_nullable
as bool,loadError: freezed == loadError ? _self.loadError : loadError // ignore: cast_nullable_to_non_nullable
as RootHubException?,isLoadingUnreadCount: null == isLoadingUnreadCount ? _self.isLoadingUnreadCount : isLoadingUnreadCount // ignore: cast_nullable_to_non_nullable
as bool,hasLoadedUnreadCount: null == hasLoadedUnreadCount ? _self.hasLoadedUnreadCount : hasLoadedUnreadCount // ignore: cast_nullable_to_non_nullable
as bool,unreadCountError: freezed == unreadCountError ? _self.unreadCountError : unreadCountError // ignore: cast_nullable_to_non_nullable
as RootHubException?,
  ));
}

}


/// Adds pattern-matching-related methods to [ActivityState].
extension ActivityStatePatterns on ActivityState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityState value)  $default,){
final _that = this;
switch (_that) {
case _ActivityState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityState value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MatchSchedulePairingAttempt> subscribedActiveSchedules,  List<MatchChatActivityChatItem> activeChats,  List<MatchChatActivityChatItem> endedChats,  int unreadMessagesCount,  bool isLoading,  bool hasLoadedOnce,  RootHubException? loadError,  bool isLoadingUnreadCount,  bool hasLoadedUnreadCount,  RootHubException? unreadCountError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityState() when $default != null:
return $default(_that.subscribedActiveSchedules,_that.activeChats,_that.endedChats,_that.unreadMessagesCount,_that.isLoading,_that.hasLoadedOnce,_that.loadError,_that.isLoadingUnreadCount,_that.hasLoadedUnreadCount,_that.unreadCountError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MatchSchedulePairingAttempt> subscribedActiveSchedules,  List<MatchChatActivityChatItem> activeChats,  List<MatchChatActivityChatItem> endedChats,  int unreadMessagesCount,  bool isLoading,  bool hasLoadedOnce,  RootHubException? loadError,  bool isLoadingUnreadCount,  bool hasLoadedUnreadCount,  RootHubException? unreadCountError)  $default,) {final _that = this;
switch (_that) {
case _ActivityState():
return $default(_that.subscribedActiveSchedules,_that.activeChats,_that.endedChats,_that.unreadMessagesCount,_that.isLoading,_that.hasLoadedOnce,_that.loadError,_that.isLoadingUnreadCount,_that.hasLoadedUnreadCount,_that.unreadCountError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MatchSchedulePairingAttempt> subscribedActiveSchedules,  List<MatchChatActivityChatItem> activeChats,  List<MatchChatActivityChatItem> endedChats,  int unreadMessagesCount,  bool isLoading,  bool hasLoadedOnce,  RootHubException? loadError,  bool isLoadingUnreadCount,  bool hasLoadedUnreadCount,  RootHubException? unreadCountError)?  $default,) {final _that = this;
switch (_that) {
case _ActivityState() when $default != null:
return $default(_that.subscribedActiveSchedules,_that.activeChats,_that.endedChats,_that.unreadMessagesCount,_that.isLoading,_that.hasLoadedOnce,_that.loadError,_that.isLoadingUnreadCount,_that.hasLoadedUnreadCount,_that.unreadCountError);case _:
  return null;

}
}

}

/// @nodoc


class _ActivityState implements ActivityState {
  const _ActivityState({final  List<MatchSchedulePairingAttempt> subscribedActiveSchedules = const <MatchSchedulePairingAttempt>[], final  List<MatchChatActivityChatItem> activeChats = const <MatchChatActivityChatItem>[], final  List<MatchChatActivityChatItem> endedChats = const <MatchChatActivityChatItem>[], this.unreadMessagesCount = 0, this.isLoading = false, this.hasLoadedOnce = false, this.loadError, this.isLoadingUnreadCount = false, this.hasLoadedUnreadCount = false, this.unreadCountError}): _subscribedActiveSchedules = subscribedActiveSchedules,_activeChats = activeChats,_endedChats = endedChats;
  

 final  List<MatchSchedulePairingAttempt> _subscribedActiveSchedules;
@override@JsonKey() List<MatchSchedulePairingAttempt> get subscribedActiveSchedules {
  if (_subscribedActiveSchedules is EqualUnmodifiableListView) return _subscribedActiveSchedules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subscribedActiveSchedules);
}

 final  List<MatchChatActivityChatItem> _activeChats;
@override@JsonKey() List<MatchChatActivityChatItem> get activeChats {
  if (_activeChats is EqualUnmodifiableListView) return _activeChats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activeChats);
}

 final  List<MatchChatActivityChatItem> _endedChats;
@override@JsonKey() List<MatchChatActivityChatItem> get endedChats {
  if (_endedChats is EqualUnmodifiableListView) return _endedChats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_endedChats);
}

@override@JsonKey() final  int unreadMessagesCount;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool hasLoadedOnce;
@override final  RootHubException? loadError;
@override@JsonKey() final  bool isLoadingUnreadCount;
@override@JsonKey() final  bool hasLoadedUnreadCount;
@override final  RootHubException? unreadCountError;

/// Create a copy of ActivityState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityStateCopyWith<_ActivityState> get copyWith => __$ActivityStateCopyWithImpl<_ActivityState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityState&&const DeepCollectionEquality().equals(other._subscribedActiveSchedules, _subscribedActiveSchedules)&&const DeepCollectionEquality().equals(other._activeChats, _activeChats)&&const DeepCollectionEquality().equals(other._endedChats, _endedChats)&&(identical(other.unreadMessagesCount, unreadMessagesCount) || other.unreadMessagesCount == unreadMessagesCount)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasLoadedOnce, hasLoadedOnce) || other.hasLoadedOnce == hasLoadedOnce)&&(identical(other.loadError, loadError) || other.loadError == loadError)&&(identical(other.isLoadingUnreadCount, isLoadingUnreadCount) || other.isLoadingUnreadCount == isLoadingUnreadCount)&&(identical(other.hasLoadedUnreadCount, hasLoadedUnreadCount) || other.hasLoadedUnreadCount == hasLoadedUnreadCount)&&(identical(other.unreadCountError, unreadCountError) || other.unreadCountError == unreadCountError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_subscribedActiveSchedules),const DeepCollectionEquality().hash(_activeChats),const DeepCollectionEquality().hash(_endedChats),unreadMessagesCount,isLoading,hasLoadedOnce,loadError,isLoadingUnreadCount,hasLoadedUnreadCount,unreadCountError);

@override
String toString() {
  return 'ActivityState(subscribedActiveSchedules: $subscribedActiveSchedules, activeChats: $activeChats, endedChats: $endedChats, unreadMessagesCount: $unreadMessagesCount, isLoading: $isLoading, hasLoadedOnce: $hasLoadedOnce, loadError: $loadError, isLoadingUnreadCount: $isLoadingUnreadCount, hasLoadedUnreadCount: $hasLoadedUnreadCount, unreadCountError: $unreadCountError)';
}


}

/// @nodoc
abstract mixin class _$ActivityStateCopyWith<$Res> implements $ActivityStateCopyWith<$Res> {
  factory _$ActivityStateCopyWith(_ActivityState value, $Res Function(_ActivityState) _then) = __$ActivityStateCopyWithImpl;
@override @useResult
$Res call({
 List<MatchSchedulePairingAttempt> subscribedActiveSchedules, List<MatchChatActivityChatItem> activeChats, List<MatchChatActivityChatItem> endedChats, int unreadMessagesCount, bool isLoading, bool hasLoadedOnce, RootHubException? loadError, bool isLoadingUnreadCount, bool hasLoadedUnreadCount, RootHubException? unreadCountError
});




}
/// @nodoc
class __$ActivityStateCopyWithImpl<$Res>
    implements _$ActivityStateCopyWith<$Res> {
  __$ActivityStateCopyWithImpl(this._self, this._then);

  final _ActivityState _self;
  final $Res Function(_ActivityState) _then;

/// Create a copy of ActivityState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subscribedActiveSchedules = null,Object? activeChats = null,Object? endedChats = null,Object? unreadMessagesCount = null,Object? isLoading = null,Object? hasLoadedOnce = null,Object? loadError = freezed,Object? isLoadingUnreadCount = null,Object? hasLoadedUnreadCount = null,Object? unreadCountError = freezed,}) {
  return _then(_ActivityState(
subscribedActiveSchedules: null == subscribedActiveSchedules ? _self._subscribedActiveSchedules : subscribedActiveSchedules // ignore: cast_nullable_to_non_nullable
as List<MatchSchedulePairingAttempt>,activeChats: null == activeChats ? _self._activeChats : activeChats // ignore: cast_nullable_to_non_nullable
as List<MatchChatActivityChatItem>,endedChats: null == endedChats ? _self._endedChats : endedChats // ignore: cast_nullable_to_non_nullable
as List<MatchChatActivityChatItem>,unreadMessagesCount: null == unreadMessagesCount ? _self.unreadMessagesCount : unreadMessagesCount // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasLoadedOnce: null == hasLoadedOnce ? _self.hasLoadedOnce : hasLoadedOnce // ignore: cast_nullable_to_non_nullable
as bool,loadError: freezed == loadError ? _self.loadError : loadError // ignore: cast_nullable_to_non_nullable
as RootHubException?,isLoadingUnreadCount: null == isLoadingUnreadCount ? _self.isLoadingUnreadCount : isLoadingUnreadCount // ignore: cast_nullable_to_non_nullable
as bool,hasLoadedUnreadCount: null == hasLoadedUnreadCount ? _self.hasLoadedUnreadCount : hasLoadedUnreadCount // ignore: cast_nullable_to_non_nullable
as bool,unreadCountError: freezed == unreadCountError ? _self.unreadCountError : unreadCountError // ignore: cast_nullable_to_non_nullable
as RootHubException?,
  ));
}


}

// dart format on
