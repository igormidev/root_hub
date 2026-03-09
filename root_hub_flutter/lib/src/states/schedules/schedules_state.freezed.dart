// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedules_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SchedulesState {

 List<MatchSchedulePairingAttempt> get activeSchedules; bool get isLoadingActiveSchedules; bool get hasLoadedActiveSchedules; bool get isLoadingMoreActiveSchedules; bool get hasNextActiveSchedulesPage; int get activeSchedulesCurrentPage; RootHubException? get activeSchedulesError; List<MatchSchedulePairingAttempt> get pastSchedules; bool get isLoadingPastSchedules; bool get hasLoadedPastSchedules; bool get isLoadingMorePastSchedules; bool get hasNextPastSchedulesPage; int get pastSchedulesCurrentPage; RootHubException? get pastSchedulesError;
/// Create a copy of SchedulesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SchedulesStateCopyWith<SchedulesState> get copyWith => _$SchedulesStateCopyWithImpl<SchedulesState>(this as SchedulesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SchedulesState&&const DeepCollectionEquality().equals(other.activeSchedules, activeSchedules)&&(identical(other.isLoadingActiveSchedules, isLoadingActiveSchedules) || other.isLoadingActiveSchedules == isLoadingActiveSchedules)&&(identical(other.hasLoadedActiveSchedules, hasLoadedActiveSchedules) || other.hasLoadedActiveSchedules == hasLoadedActiveSchedules)&&(identical(other.isLoadingMoreActiveSchedules, isLoadingMoreActiveSchedules) || other.isLoadingMoreActiveSchedules == isLoadingMoreActiveSchedules)&&(identical(other.hasNextActiveSchedulesPage, hasNextActiveSchedulesPage) || other.hasNextActiveSchedulesPage == hasNextActiveSchedulesPage)&&(identical(other.activeSchedulesCurrentPage, activeSchedulesCurrentPage) || other.activeSchedulesCurrentPage == activeSchedulesCurrentPage)&&(identical(other.activeSchedulesError, activeSchedulesError) || other.activeSchedulesError == activeSchedulesError)&&const DeepCollectionEquality().equals(other.pastSchedules, pastSchedules)&&(identical(other.isLoadingPastSchedules, isLoadingPastSchedules) || other.isLoadingPastSchedules == isLoadingPastSchedules)&&(identical(other.hasLoadedPastSchedules, hasLoadedPastSchedules) || other.hasLoadedPastSchedules == hasLoadedPastSchedules)&&(identical(other.isLoadingMorePastSchedules, isLoadingMorePastSchedules) || other.isLoadingMorePastSchedules == isLoadingMorePastSchedules)&&(identical(other.hasNextPastSchedulesPage, hasNextPastSchedulesPage) || other.hasNextPastSchedulesPage == hasNextPastSchedulesPage)&&(identical(other.pastSchedulesCurrentPage, pastSchedulesCurrentPage) || other.pastSchedulesCurrentPage == pastSchedulesCurrentPage)&&(identical(other.pastSchedulesError, pastSchedulesError) || other.pastSchedulesError == pastSchedulesError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(activeSchedules),isLoadingActiveSchedules,hasLoadedActiveSchedules,isLoadingMoreActiveSchedules,hasNextActiveSchedulesPage,activeSchedulesCurrentPage,activeSchedulesError,const DeepCollectionEquality().hash(pastSchedules),isLoadingPastSchedules,hasLoadedPastSchedules,isLoadingMorePastSchedules,hasNextPastSchedulesPage,pastSchedulesCurrentPage,pastSchedulesError);

@override
String toString() {
  return 'SchedulesState(activeSchedules: $activeSchedules, isLoadingActiveSchedules: $isLoadingActiveSchedules, hasLoadedActiveSchedules: $hasLoadedActiveSchedules, isLoadingMoreActiveSchedules: $isLoadingMoreActiveSchedules, hasNextActiveSchedulesPage: $hasNextActiveSchedulesPage, activeSchedulesCurrentPage: $activeSchedulesCurrentPage, activeSchedulesError: $activeSchedulesError, pastSchedules: $pastSchedules, isLoadingPastSchedules: $isLoadingPastSchedules, hasLoadedPastSchedules: $hasLoadedPastSchedules, isLoadingMorePastSchedules: $isLoadingMorePastSchedules, hasNextPastSchedulesPage: $hasNextPastSchedulesPage, pastSchedulesCurrentPage: $pastSchedulesCurrentPage, pastSchedulesError: $pastSchedulesError)';
}


}

/// @nodoc
abstract mixin class $SchedulesStateCopyWith<$Res>  {
  factory $SchedulesStateCopyWith(SchedulesState value, $Res Function(SchedulesState) _then) = _$SchedulesStateCopyWithImpl;
@useResult
$Res call({
 List<MatchSchedulePairingAttempt> activeSchedules, bool isLoadingActiveSchedules, bool hasLoadedActiveSchedules, bool isLoadingMoreActiveSchedules, bool hasNextActiveSchedulesPage, int activeSchedulesCurrentPage, RootHubException? activeSchedulesError, List<MatchSchedulePairingAttempt> pastSchedules, bool isLoadingPastSchedules, bool hasLoadedPastSchedules, bool isLoadingMorePastSchedules, bool hasNextPastSchedulesPage, int pastSchedulesCurrentPage, RootHubException? pastSchedulesError
});




}
/// @nodoc
class _$SchedulesStateCopyWithImpl<$Res>
    implements $SchedulesStateCopyWith<$Res> {
  _$SchedulesStateCopyWithImpl(this._self, this._then);

  final SchedulesState _self;
  final $Res Function(SchedulesState) _then;

/// Create a copy of SchedulesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeSchedules = null,Object? isLoadingActiveSchedules = null,Object? hasLoadedActiveSchedules = null,Object? isLoadingMoreActiveSchedules = null,Object? hasNextActiveSchedulesPage = null,Object? activeSchedulesCurrentPage = null,Object? activeSchedulesError = freezed,Object? pastSchedules = null,Object? isLoadingPastSchedules = null,Object? hasLoadedPastSchedules = null,Object? isLoadingMorePastSchedules = null,Object? hasNextPastSchedulesPage = null,Object? pastSchedulesCurrentPage = null,Object? pastSchedulesError = freezed,}) {
  return _then(_self.copyWith(
activeSchedules: null == activeSchedules ? _self.activeSchedules : activeSchedules // ignore: cast_nullable_to_non_nullable
as List<MatchSchedulePairingAttempt>,isLoadingActiveSchedules: null == isLoadingActiveSchedules ? _self.isLoadingActiveSchedules : isLoadingActiveSchedules // ignore: cast_nullable_to_non_nullable
as bool,hasLoadedActiveSchedules: null == hasLoadedActiveSchedules ? _self.hasLoadedActiveSchedules : hasLoadedActiveSchedules // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMoreActiveSchedules: null == isLoadingMoreActiveSchedules ? _self.isLoadingMoreActiveSchedules : isLoadingMoreActiveSchedules // ignore: cast_nullable_to_non_nullable
as bool,hasNextActiveSchedulesPage: null == hasNextActiveSchedulesPage ? _self.hasNextActiveSchedulesPage : hasNextActiveSchedulesPage // ignore: cast_nullable_to_non_nullable
as bool,activeSchedulesCurrentPage: null == activeSchedulesCurrentPage ? _self.activeSchedulesCurrentPage : activeSchedulesCurrentPage // ignore: cast_nullable_to_non_nullable
as int,activeSchedulesError: freezed == activeSchedulesError ? _self.activeSchedulesError : activeSchedulesError // ignore: cast_nullable_to_non_nullable
as RootHubException?,pastSchedules: null == pastSchedules ? _self.pastSchedules : pastSchedules // ignore: cast_nullable_to_non_nullable
as List<MatchSchedulePairingAttempt>,isLoadingPastSchedules: null == isLoadingPastSchedules ? _self.isLoadingPastSchedules : isLoadingPastSchedules // ignore: cast_nullable_to_non_nullable
as bool,hasLoadedPastSchedules: null == hasLoadedPastSchedules ? _self.hasLoadedPastSchedules : hasLoadedPastSchedules // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMorePastSchedules: null == isLoadingMorePastSchedules ? _self.isLoadingMorePastSchedules : isLoadingMorePastSchedules // ignore: cast_nullable_to_non_nullable
as bool,hasNextPastSchedulesPage: null == hasNextPastSchedulesPage ? _self.hasNextPastSchedulesPage : hasNextPastSchedulesPage // ignore: cast_nullable_to_non_nullable
as bool,pastSchedulesCurrentPage: null == pastSchedulesCurrentPage ? _self.pastSchedulesCurrentPage : pastSchedulesCurrentPage // ignore: cast_nullable_to_non_nullable
as int,pastSchedulesError: freezed == pastSchedulesError ? _self.pastSchedulesError : pastSchedulesError // ignore: cast_nullable_to_non_nullable
as RootHubException?,
  ));
}

}


/// Adds pattern-matching-related methods to [SchedulesState].
extension SchedulesStatePatterns on SchedulesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SchedulesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SchedulesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SchedulesState value)  $default,){
final _that = this;
switch (_that) {
case _SchedulesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SchedulesState value)?  $default,){
final _that = this;
switch (_that) {
case _SchedulesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MatchSchedulePairingAttempt> activeSchedules,  bool isLoadingActiveSchedules,  bool hasLoadedActiveSchedules,  bool isLoadingMoreActiveSchedules,  bool hasNextActiveSchedulesPage,  int activeSchedulesCurrentPage,  RootHubException? activeSchedulesError,  List<MatchSchedulePairingAttempt> pastSchedules,  bool isLoadingPastSchedules,  bool hasLoadedPastSchedules,  bool isLoadingMorePastSchedules,  bool hasNextPastSchedulesPage,  int pastSchedulesCurrentPage,  RootHubException? pastSchedulesError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SchedulesState() when $default != null:
return $default(_that.activeSchedules,_that.isLoadingActiveSchedules,_that.hasLoadedActiveSchedules,_that.isLoadingMoreActiveSchedules,_that.hasNextActiveSchedulesPage,_that.activeSchedulesCurrentPage,_that.activeSchedulesError,_that.pastSchedules,_that.isLoadingPastSchedules,_that.hasLoadedPastSchedules,_that.isLoadingMorePastSchedules,_that.hasNextPastSchedulesPage,_that.pastSchedulesCurrentPage,_that.pastSchedulesError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MatchSchedulePairingAttempt> activeSchedules,  bool isLoadingActiveSchedules,  bool hasLoadedActiveSchedules,  bool isLoadingMoreActiveSchedules,  bool hasNextActiveSchedulesPage,  int activeSchedulesCurrentPage,  RootHubException? activeSchedulesError,  List<MatchSchedulePairingAttempt> pastSchedules,  bool isLoadingPastSchedules,  bool hasLoadedPastSchedules,  bool isLoadingMorePastSchedules,  bool hasNextPastSchedulesPage,  int pastSchedulesCurrentPage,  RootHubException? pastSchedulesError)  $default,) {final _that = this;
switch (_that) {
case _SchedulesState():
return $default(_that.activeSchedules,_that.isLoadingActiveSchedules,_that.hasLoadedActiveSchedules,_that.isLoadingMoreActiveSchedules,_that.hasNextActiveSchedulesPage,_that.activeSchedulesCurrentPage,_that.activeSchedulesError,_that.pastSchedules,_that.isLoadingPastSchedules,_that.hasLoadedPastSchedules,_that.isLoadingMorePastSchedules,_that.hasNextPastSchedulesPage,_that.pastSchedulesCurrentPage,_that.pastSchedulesError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MatchSchedulePairingAttempt> activeSchedules,  bool isLoadingActiveSchedules,  bool hasLoadedActiveSchedules,  bool isLoadingMoreActiveSchedules,  bool hasNextActiveSchedulesPage,  int activeSchedulesCurrentPage,  RootHubException? activeSchedulesError,  List<MatchSchedulePairingAttempt> pastSchedules,  bool isLoadingPastSchedules,  bool hasLoadedPastSchedules,  bool isLoadingMorePastSchedules,  bool hasNextPastSchedulesPage,  int pastSchedulesCurrentPage,  RootHubException? pastSchedulesError)?  $default,) {final _that = this;
switch (_that) {
case _SchedulesState() when $default != null:
return $default(_that.activeSchedules,_that.isLoadingActiveSchedules,_that.hasLoadedActiveSchedules,_that.isLoadingMoreActiveSchedules,_that.hasNextActiveSchedulesPage,_that.activeSchedulesCurrentPage,_that.activeSchedulesError,_that.pastSchedules,_that.isLoadingPastSchedules,_that.hasLoadedPastSchedules,_that.isLoadingMorePastSchedules,_that.hasNextPastSchedulesPage,_that.pastSchedulesCurrentPage,_that.pastSchedulesError);case _:
  return null;

}
}

}

/// @nodoc


class _SchedulesState implements SchedulesState {
  const _SchedulesState({final  List<MatchSchedulePairingAttempt> activeSchedules = const <MatchSchedulePairingAttempt>[], this.isLoadingActiveSchedules = false, this.hasLoadedActiveSchedules = false, this.isLoadingMoreActiveSchedules = false, this.hasNextActiveSchedulesPage = false, this.activeSchedulesCurrentPage = 0, this.activeSchedulesError, final  List<MatchSchedulePairingAttempt> pastSchedules = const <MatchSchedulePairingAttempt>[], this.isLoadingPastSchedules = false, this.hasLoadedPastSchedules = false, this.isLoadingMorePastSchedules = false, this.hasNextPastSchedulesPage = false, this.pastSchedulesCurrentPage = 0, this.pastSchedulesError}): _activeSchedules = activeSchedules,_pastSchedules = pastSchedules;
  

 final  List<MatchSchedulePairingAttempt> _activeSchedules;
@override@JsonKey() List<MatchSchedulePairingAttempt> get activeSchedules {
  if (_activeSchedules is EqualUnmodifiableListView) return _activeSchedules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activeSchedules);
}

@override@JsonKey() final  bool isLoadingActiveSchedules;
@override@JsonKey() final  bool hasLoadedActiveSchedules;
@override@JsonKey() final  bool isLoadingMoreActiveSchedules;
@override@JsonKey() final  bool hasNextActiveSchedulesPage;
@override@JsonKey() final  int activeSchedulesCurrentPage;
@override final  RootHubException? activeSchedulesError;
 final  List<MatchSchedulePairingAttempt> _pastSchedules;
@override@JsonKey() List<MatchSchedulePairingAttempt> get pastSchedules {
  if (_pastSchedules is EqualUnmodifiableListView) return _pastSchedules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pastSchedules);
}

@override@JsonKey() final  bool isLoadingPastSchedules;
@override@JsonKey() final  bool hasLoadedPastSchedules;
@override@JsonKey() final  bool isLoadingMorePastSchedules;
@override@JsonKey() final  bool hasNextPastSchedulesPage;
@override@JsonKey() final  int pastSchedulesCurrentPage;
@override final  RootHubException? pastSchedulesError;

/// Create a copy of SchedulesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SchedulesStateCopyWith<_SchedulesState> get copyWith => __$SchedulesStateCopyWithImpl<_SchedulesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SchedulesState&&const DeepCollectionEquality().equals(other._activeSchedules, _activeSchedules)&&(identical(other.isLoadingActiveSchedules, isLoadingActiveSchedules) || other.isLoadingActiveSchedules == isLoadingActiveSchedules)&&(identical(other.hasLoadedActiveSchedules, hasLoadedActiveSchedules) || other.hasLoadedActiveSchedules == hasLoadedActiveSchedules)&&(identical(other.isLoadingMoreActiveSchedules, isLoadingMoreActiveSchedules) || other.isLoadingMoreActiveSchedules == isLoadingMoreActiveSchedules)&&(identical(other.hasNextActiveSchedulesPage, hasNextActiveSchedulesPage) || other.hasNextActiveSchedulesPage == hasNextActiveSchedulesPage)&&(identical(other.activeSchedulesCurrentPage, activeSchedulesCurrentPage) || other.activeSchedulesCurrentPage == activeSchedulesCurrentPage)&&(identical(other.activeSchedulesError, activeSchedulesError) || other.activeSchedulesError == activeSchedulesError)&&const DeepCollectionEquality().equals(other._pastSchedules, _pastSchedules)&&(identical(other.isLoadingPastSchedules, isLoadingPastSchedules) || other.isLoadingPastSchedules == isLoadingPastSchedules)&&(identical(other.hasLoadedPastSchedules, hasLoadedPastSchedules) || other.hasLoadedPastSchedules == hasLoadedPastSchedules)&&(identical(other.isLoadingMorePastSchedules, isLoadingMorePastSchedules) || other.isLoadingMorePastSchedules == isLoadingMorePastSchedules)&&(identical(other.hasNextPastSchedulesPage, hasNextPastSchedulesPage) || other.hasNextPastSchedulesPage == hasNextPastSchedulesPage)&&(identical(other.pastSchedulesCurrentPage, pastSchedulesCurrentPage) || other.pastSchedulesCurrentPage == pastSchedulesCurrentPage)&&(identical(other.pastSchedulesError, pastSchedulesError) || other.pastSchedulesError == pastSchedulesError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_activeSchedules),isLoadingActiveSchedules,hasLoadedActiveSchedules,isLoadingMoreActiveSchedules,hasNextActiveSchedulesPage,activeSchedulesCurrentPage,activeSchedulesError,const DeepCollectionEquality().hash(_pastSchedules),isLoadingPastSchedules,hasLoadedPastSchedules,isLoadingMorePastSchedules,hasNextPastSchedulesPage,pastSchedulesCurrentPage,pastSchedulesError);

@override
String toString() {
  return 'SchedulesState(activeSchedules: $activeSchedules, isLoadingActiveSchedules: $isLoadingActiveSchedules, hasLoadedActiveSchedules: $hasLoadedActiveSchedules, isLoadingMoreActiveSchedules: $isLoadingMoreActiveSchedules, hasNextActiveSchedulesPage: $hasNextActiveSchedulesPage, activeSchedulesCurrentPage: $activeSchedulesCurrentPage, activeSchedulesError: $activeSchedulesError, pastSchedules: $pastSchedules, isLoadingPastSchedules: $isLoadingPastSchedules, hasLoadedPastSchedules: $hasLoadedPastSchedules, isLoadingMorePastSchedules: $isLoadingMorePastSchedules, hasNextPastSchedulesPage: $hasNextPastSchedulesPage, pastSchedulesCurrentPage: $pastSchedulesCurrentPage, pastSchedulesError: $pastSchedulesError)';
}


}

/// @nodoc
abstract mixin class _$SchedulesStateCopyWith<$Res> implements $SchedulesStateCopyWith<$Res> {
  factory _$SchedulesStateCopyWith(_SchedulesState value, $Res Function(_SchedulesState) _then) = __$SchedulesStateCopyWithImpl;
@override @useResult
$Res call({
 List<MatchSchedulePairingAttempt> activeSchedules, bool isLoadingActiveSchedules, bool hasLoadedActiveSchedules, bool isLoadingMoreActiveSchedules, bool hasNextActiveSchedulesPage, int activeSchedulesCurrentPage, RootHubException? activeSchedulesError, List<MatchSchedulePairingAttempt> pastSchedules, bool isLoadingPastSchedules, bool hasLoadedPastSchedules, bool isLoadingMorePastSchedules, bool hasNextPastSchedulesPage, int pastSchedulesCurrentPage, RootHubException? pastSchedulesError
});




}
/// @nodoc
class __$SchedulesStateCopyWithImpl<$Res>
    implements _$SchedulesStateCopyWith<$Res> {
  __$SchedulesStateCopyWithImpl(this._self, this._then);

  final _SchedulesState _self;
  final $Res Function(_SchedulesState) _then;

/// Create a copy of SchedulesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeSchedules = null,Object? isLoadingActiveSchedules = null,Object? hasLoadedActiveSchedules = null,Object? isLoadingMoreActiveSchedules = null,Object? hasNextActiveSchedulesPage = null,Object? activeSchedulesCurrentPage = null,Object? activeSchedulesError = freezed,Object? pastSchedules = null,Object? isLoadingPastSchedules = null,Object? hasLoadedPastSchedules = null,Object? isLoadingMorePastSchedules = null,Object? hasNextPastSchedulesPage = null,Object? pastSchedulesCurrentPage = null,Object? pastSchedulesError = freezed,}) {
  return _then(_SchedulesState(
activeSchedules: null == activeSchedules ? _self._activeSchedules : activeSchedules // ignore: cast_nullable_to_non_nullable
as List<MatchSchedulePairingAttempt>,isLoadingActiveSchedules: null == isLoadingActiveSchedules ? _self.isLoadingActiveSchedules : isLoadingActiveSchedules // ignore: cast_nullable_to_non_nullable
as bool,hasLoadedActiveSchedules: null == hasLoadedActiveSchedules ? _self.hasLoadedActiveSchedules : hasLoadedActiveSchedules // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMoreActiveSchedules: null == isLoadingMoreActiveSchedules ? _self.isLoadingMoreActiveSchedules : isLoadingMoreActiveSchedules // ignore: cast_nullable_to_non_nullable
as bool,hasNextActiveSchedulesPage: null == hasNextActiveSchedulesPage ? _self.hasNextActiveSchedulesPage : hasNextActiveSchedulesPage // ignore: cast_nullable_to_non_nullable
as bool,activeSchedulesCurrentPage: null == activeSchedulesCurrentPage ? _self.activeSchedulesCurrentPage : activeSchedulesCurrentPage // ignore: cast_nullable_to_non_nullable
as int,activeSchedulesError: freezed == activeSchedulesError ? _self.activeSchedulesError : activeSchedulesError // ignore: cast_nullable_to_non_nullable
as RootHubException?,pastSchedules: null == pastSchedules ? _self._pastSchedules : pastSchedules // ignore: cast_nullable_to_non_nullable
as List<MatchSchedulePairingAttempt>,isLoadingPastSchedules: null == isLoadingPastSchedules ? _self.isLoadingPastSchedules : isLoadingPastSchedules // ignore: cast_nullable_to_non_nullable
as bool,hasLoadedPastSchedules: null == hasLoadedPastSchedules ? _self.hasLoadedPastSchedules : hasLoadedPastSchedules // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMorePastSchedules: null == isLoadingMorePastSchedules ? _self.isLoadingMorePastSchedules : isLoadingMorePastSchedules // ignore: cast_nullable_to_non_nullable
as bool,hasNextPastSchedulesPage: null == hasNextPastSchedulesPage ? _self.hasNextPastSchedulesPage : hasNextPastSchedulesPage // ignore: cast_nullable_to_non_nullable
as bool,pastSchedulesCurrentPage: null == pastSchedulesCurrentPage ? _self.pastSchedulesCurrentPage : pastSchedulesCurrentPage // ignore: cast_nullable_to_non_nullable
as int,pastSchedulesError: freezed == pastSchedulesError ? _self.pastSchedulesError : pastSchedulesError // ignore: cast_nullable_to_non_nullable
as RootHubException?,
  ));
}


}

// dart format on
