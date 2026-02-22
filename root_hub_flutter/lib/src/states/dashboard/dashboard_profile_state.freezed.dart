// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardProfileState {

 bool get isUpdatingDisplayName; bool get isUpdatingLocation; bool get isUpdatingFaction; RootHubException? get lastError;
/// Create a copy of DashboardProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardProfileStateCopyWith<DashboardProfileState> get copyWith => _$DashboardProfileStateCopyWithImpl<DashboardProfileState>(this as DashboardProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardProfileState&&(identical(other.isUpdatingDisplayName, isUpdatingDisplayName) || other.isUpdatingDisplayName == isUpdatingDisplayName)&&(identical(other.isUpdatingLocation, isUpdatingLocation) || other.isUpdatingLocation == isUpdatingLocation)&&(identical(other.isUpdatingFaction, isUpdatingFaction) || other.isUpdatingFaction == isUpdatingFaction)&&(identical(other.lastError, lastError) || other.lastError == lastError));
}


@override
int get hashCode => Object.hash(runtimeType,isUpdatingDisplayName,isUpdatingLocation,isUpdatingFaction,lastError);

@override
String toString() {
  return 'DashboardProfileState(isUpdatingDisplayName: $isUpdatingDisplayName, isUpdatingLocation: $isUpdatingLocation, isUpdatingFaction: $isUpdatingFaction, lastError: $lastError)';
}


}

/// @nodoc
abstract mixin class $DashboardProfileStateCopyWith<$Res>  {
  factory $DashboardProfileStateCopyWith(DashboardProfileState value, $Res Function(DashboardProfileState) _then) = _$DashboardProfileStateCopyWithImpl;
@useResult
$Res call({
 bool isUpdatingDisplayName, bool isUpdatingLocation, bool isUpdatingFaction, RootHubException? lastError
});




}
/// @nodoc
class _$DashboardProfileStateCopyWithImpl<$Res>
    implements $DashboardProfileStateCopyWith<$Res> {
  _$DashboardProfileStateCopyWithImpl(this._self, this._then);

  final DashboardProfileState _self;
  final $Res Function(DashboardProfileState) _then;

/// Create a copy of DashboardProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isUpdatingDisplayName = null,Object? isUpdatingLocation = null,Object? isUpdatingFaction = null,Object? lastError = freezed,}) {
  return _then(_self.copyWith(
isUpdatingDisplayName: null == isUpdatingDisplayName ? _self.isUpdatingDisplayName : isUpdatingDisplayName // ignore: cast_nullable_to_non_nullable
as bool,isUpdatingLocation: null == isUpdatingLocation ? _self.isUpdatingLocation : isUpdatingLocation // ignore: cast_nullable_to_non_nullable
as bool,isUpdatingFaction: null == isUpdatingFaction ? _self.isUpdatingFaction : isUpdatingFaction // ignore: cast_nullable_to_non_nullable
as bool,lastError: freezed == lastError ? _self.lastError : lastError // ignore: cast_nullable_to_non_nullable
as RootHubException?,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardProfileState].
extension DashboardProfileStatePatterns on DashboardProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardProfileState value)  $default,){
final _that = this;
switch (_that) {
case _DashboardProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isUpdatingDisplayName,  bool isUpdatingLocation,  bool isUpdatingFaction,  RootHubException? lastError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardProfileState() when $default != null:
return $default(_that.isUpdatingDisplayName,_that.isUpdatingLocation,_that.isUpdatingFaction,_that.lastError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isUpdatingDisplayName,  bool isUpdatingLocation,  bool isUpdatingFaction,  RootHubException? lastError)  $default,) {final _that = this;
switch (_that) {
case _DashboardProfileState():
return $default(_that.isUpdatingDisplayName,_that.isUpdatingLocation,_that.isUpdatingFaction,_that.lastError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isUpdatingDisplayName,  bool isUpdatingLocation,  bool isUpdatingFaction,  RootHubException? lastError)?  $default,) {final _that = this;
switch (_that) {
case _DashboardProfileState() when $default != null:
return $default(_that.isUpdatingDisplayName,_that.isUpdatingLocation,_that.isUpdatingFaction,_that.lastError);case _:
  return null;

}
}

}

/// @nodoc


class _DashboardProfileState implements DashboardProfileState {
  const _DashboardProfileState({this.isUpdatingDisplayName = false, this.isUpdatingLocation = false, this.isUpdatingFaction = false, this.lastError});
  

@override@JsonKey() final  bool isUpdatingDisplayName;
@override@JsonKey() final  bool isUpdatingLocation;
@override@JsonKey() final  bool isUpdatingFaction;
@override final  RootHubException? lastError;

/// Create a copy of DashboardProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardProfileStateCopyWith<_DashboardProfileState> get copyWith => __$DashboardProfileStateCopyWithImpl<_DashboardProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardProfileState&&(identical(other.isUpdatingDisplayName, isUpdatingDisplayName) || other.isUpdatingDisplayName == isUpdatingDisplayName)&&(identical(other.isUpdatingLocation, isUpdatingLocation) || other.isUpdatingLocation == isUpdatingLocation)&&(identical(other.isUpdatingFaction, isUpdatingFaction) || other.isUpdatingFaction == isUpdatingFaction)&&(identical(other.lastError, lastError) || other.lastError == lastError));
}


@override
int get hashCode => Object.hash(runtimeType,isUpdatingDisplayName,isUpdatingLocation,isUpdatingFaction,lastError);

@override
String toString() {
  return 'DashboardProfileState(isUpdatingDisplayName: $isUpdatingDisplayName, isUpdatingLocation: $isUpdatingLocation, isUpdatingFaction: $isUpdatingFaction, lastError: $lastError)';
}


}

/// @nodoc
abstract mixin class _$DashboardProfileStateCopyWith<$Res> implements $DashboardProfileStateCopyWith<$Res> {
  factory _$DashboardProfileStateCopyWith(_DashboardProfileState value, $Res Function(_DashboardProfileState) _then) = __$DashboardProfileStateCopyWithImpl;
@override @useResult
$Res call({
 bool isUpdatingDisplayName, bool isUpdatingLocation, bool isUpdatingFaction, RootHubException? lastError
});




}
/// @nodoc
class __$DashboardProfileStateCopyWithImpl<$Res>
    implements _$DashboardProfileStateCopyWith<$Res> {
  __$DashboardProfileStateCopyWithImpl(this._self, this._then);

  final _DashboardProfileState _self;
  final $Res Function(_DashboardProfileState) _then;

/// Create a copy of DashboardProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isUpdatingDisplayName = null,Object? isUpdatingLocation = null,Object? isUpdatingFaction = null,Object? lastError = freezed,}) {
  return _then(_DashboardProfileState(
isUpdatingDisplayName: null == isUpdatingDisplayName ? _self.isUpdatingDisplayName : isUpdatingDisplayName // ignore: cast_nullable_to_non_nullable
as bool,isUpdatingLocation: null == isUpdatingLocation ? _self.isUpdatingLocation : isUpdatingLocation // ignore: cast_nullable_to_non_nullable
as bool,isUpdatingFaction: null == isUpdatingFaction ? _self.isUpdatingFaction : isUpdatingFaction // ignore: cast_nullable_to_non_nullable
as bool,lastError: freezed == lastError ? _self.lastError : lastError // ignore: cast_nullable_to_non_nullable
as RootHubException?,
  ));
}


}

// dart format on
