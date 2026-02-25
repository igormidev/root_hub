// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_stats_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeStatsState {

 bool get isLoading; bool get hasLoadedOnce; HomeStatsSnapshot? get platformStats; HomeStatsSnapshot? get playerStats; RootHubException? get loadError;
/// Create a copy of HomeStatsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStatsStateCopyWith<HomeStatsState> get copyWith => _$HomeStatsStateCopyWithImpl<HomeStatsState>(this as HomeStatsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStatsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasLoadedOnce, hasLoadedOnce) || other.hasLoadedOnce == hasLoadedOnce)&&(identical(other.platformStats, platformStats) || other.platformStats == platformStats)&&(identical(other.playerStats, playerStats) || other.playerStats == playerStats)&&(identical(other.loadError, loadError) || other.loadError == loadError));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,hasLoadedOnce,platformStats,playerStats,loadError);

@override
String toString() {
  return 'HomeStatsState(isLoading: $isLoading, hasLoadedOnce: $hasLoadedOnce, platformStats: $platformStats, playerStats: $playerStats, loadError: $loadError)';
}


}

/// @nodoc
abstract mixin class $HomeStatsStateCopyWith<$Res>  {
  factory $HomeStatsStateCopyWith(HomeStatsState value, $Res Function(HomeStatsState) _then) = _$HomeStatsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool hasLoadedOnce, HomeStatsSnapshot? platformStats, HomeStatsSnapshot? playerStats, RootHubException? loadError
});




}
/// @nodoc
class _$HomeStatsStateCopyWithImpl<$Res>
    implements $HomeStatsStateCopyWith<$Res> {
  _$HomeStatsStateCopyWithImpl(this._self, this._then);

  final HomeStatsState _self;
  final $Res Function(HomeStatsState) _then;

/// Create a copy of HomeStatsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? hasLoadedOnce = null,Object? platformStats = freezed,Object? playerStats = freezed,Object? loadError = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasLoadedOnce: null == hasLoadedOnce ? _self.hasLoadedOnce : hasLoadedOnce // ignore: cast_nullable_to_non_nullable
as bool,platformStats: freezed == platformStats ? _self.platformStats : platformStats // ignore: cast_nullable_to_non_nullable
as HomeStatsSnapshot?,playerStats: freezed == playerStats ? _self.playerStats : playerStats // ignore: cast_nullable_to_non_nullable
as HomeStatsSnapshot?,loadError: freezed == loadError ? _self.loadError : loadError // ignore: cast_nullable_to_non_nullable
as RootHubException?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeStatsState].
extension HomeStatsStatePatterns on HomeStatsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeStatsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeStatsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeStatsState value)  $default,){
final _that = this;
switch (_that) {
case _HomeStatsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeStatsState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeStatsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool hasLoadedOnce,  HomeStatsSnapshot? platformStats,  HomeStatsSnapshot? playerStats,  RootHubException? loadError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeStatsState() when $default != null:
return $default(_that.isLoading,_that.hasLoadedOnce,_that.platformStats,_that.playerStats,_that.loadError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool hasLoadedOnce,  HomeStatsSnapshot? platformStats,  HomeStatsSnapshot? playerStats,  RootHubException? loadError)  $default,) {final _that = this;
switch (_that) {
case _HomeStatsState():
return $default(_that.isLoading,_that.hasLoadedOnce,_that.platformStats,_that.playerStats,_that.loadError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool hasLoadedOnce,  HomeStatsSnapshot? platformStats,  HomeStatsSnapshot? playerStats,  RootHubException? loadError)?  $default,) {final _that = this;
switch (_that) {
case _HomeStatsState() when $default != null:
return $default(_that.isLoading,_that.hasLoadedOnce,_that.platformStats,_that.playerStats,_that.loadError);case _:
  return null;

}
}

}

/// @nodoc


class _HomeStatsState implements HomeStatsState {
  const _HomeStatsState({this.isLoading = false, this.hasLoadedOnce = false, this.platformStats, this.playerStats, this.loadError});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool hasLoadedOnce;
@override final  HomeStatsSnapshot? platformStats;
@override final  HomeStatsSnapshot? playerStats;
@override final  RootHubException? loadError;

/// Create a copy of HomeStatsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStatsStateCopyWith<_HomeStatsState> get copyWith => __$HomeStatsStateCopyWithImpl<_HomeStatsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeStatsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasLoadedOnce, hasLoadedOnce) || other.hasLoadedOnce == hasLoadedOnce)&&(identical(other.platformStats, platformStats) || other.platformStats == platformStats)&&(identical(other.playerStats, playerStats) || other.playerStats == playerStats)&&(identical(other.loadError, loadError) || other.loadError == loadError));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,hasLoadedOnce,platformStats,playerStats,loadError);

@override
String toString() {
  return 'HomeStatsState(isLoading: $isLoading, hasLoadedOnce: $hasLoadedOnce, platformStats: $platformStats, playerStats: $playerStats, loadError: $loadError)';
}


}

/// @nodoc
abstract mixin class _$HomeStatsStateCopyWith<$Res> implements $HomeStatsStateCopyWith<$Res> {
  factory _$HomeStatsStateCopyWith(_HomeStatsState value, $Res Function(_HomeStatsState) _then) = __$HomeStatsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool hasLoadedOnce, HomeStatsSnapshot? platformStats, HomeStatsSnapshot? playerStats, RootHubException? loadError
});




}
/// @nodoc
class __$HomeStatsStateCopyWithImpl<$Res>
    implements _$HomeStatsStateCopyWith<$Res> {
  __$HomeStatsStateCopyWithImpl(this._self, this._then);

  final _HomeStatsState _self;
  final $Res Function(_HomeStatsState) _then;

/// Create a copy of HomeStatsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? hasLoadedOnce = null,Object? platformStats = freezed,Object? playerStats = freezed,Object? loadError = freezed,}) {
  return _then(_HomeStatsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasLoadedOnce: null == hasLoadedOnce ? _self.hasLoadedOnce : hasLoadedOnce // ignore: cast_nullable_to_non_nullable
as bool,platformStats: freezed == platformStats ? _self.platformStats : platformStats // ignore: cast_nullable_to_non_nullable
as HomeStatsSnapshot?,playerStats: freezed == playerStats ? _self.playerStats : playerStats // ignore: cast_nullable_to_non_nullable
as HomeStatsSnapshot?,loadError: freezed == loadError ? _self.loadError : loadError // ignore: cast_nullable_to_non_nullable
as RootHubException?,
  ));
}


}

// dart format on
