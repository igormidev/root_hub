// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deep_link_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeepLinkState {

 bool get isInitialized; int? get pendingMatchId; Uri? get lastReceivedUri;
/// Create a copy of DeepLinkState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeepLinkStateCopyWith<DeepLinkState> get copyWith => _$DeepLinkStateCopyWithImpl<DeepLinkState>(this as DeepLinkState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeepLinkState&&(identical(other.isInitialized, isInitialized) || other.isInitialized == isInitialized)&&(identical(other.pendingMatchId, pendingMatchId) || other.pendingMatchId == pendingMatchId)&&(identical(other.lastReceivedUri, lastReceivedUri) || other.lastReceivedUri == lastReceivedUri));
}


@override
int get hashCode => Object.hash(runtimeType,isInitialized,pendingMatchId,lastReceivedUri);

@override
String toString() {
  return 'DeepLinkState(isInitialized: $isInitialized, pendingMatchId: $pendingMatchId, lastReceivedUri: $lastReceivedUri)';
}


}

/// @nodoc
abstract mixin class $DeepLinkStateCopyWith<$Res>  {
  factory $DeepLinkStateCopyWith(DeepLinkState value, $Res Function(DeepLinkState) _then) = _$DeepLinkStateCopyWithImpl;
@useResult
$Res call({
 bool isInitialized, int? pendingMatchId, Uri? lastReceivedUri
});




}
/// @nodoc
class _$DeepLinkStateCopyWithImpl<$Res>
    implements $DeepLinkStateCopyWith<$Res> {
  _$DeepLinkStateCopyWithImpl(this._self, this._then);

  final DeepLinkState _self;
  final $Res Function(DeepLinkState) _then;

/// Create a copy of DeepLinkState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isInitialized = null,Object? pendingMatchId = freezed,Object? lastReceivedUri = freezed,}) {
  return _then(_self.copyWith(
isInitialized: null == isInitialized ? _self.isInitialized : isInitialized // ignore: cast_nullable_to_non_nullable
as bool,pendingMatchId: freezed == pendingMatchId ? _self.pendingMatchId : pendingMatchId // ignore: cast_nullable_to_non_nullable
as int?,lastReceivedUri: freezed == lastReceivedUri ? _self.lastReceivedUri : lastReceivedUri // ignore: cast_nullable_to_non_nullable
as Uri?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeepLinkState].
extension DeepLinkStatePatterns on DeepLinkState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeepLinkState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeepLinkState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeepLinkState value)  $default,){
final _that = this;
switch (_that) {
case _DeepLinkState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeepLinkState value)?  $default,){
final _that = this;
switch (_that) {
case _DeepLinkState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isInitialized,  int? pendingMatchId,  Uri? lastReceivedUri)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeepLinkState() when $default != null:
return $default(_that.isInitialized,_that.pendingMatchId,_that.lastReceivedUri);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isInitialized,  int? pendingMatchId,  Uri? lastReceivedUri)  $default,) {final _that = this;
switch (_that) {
case _DeepLinkState():
return $default(_that.isInitialized,_that.pendingMatchId,_that.lastReceivedUri);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isInitialized,  int? pendingMatchId,  Uri? lastReceivedUri)?  $default,) {final _that = this;
switch (_that) {
case _DeepLinkState() when $default != null:
return $default(_that.isInitialized,_that.pendingMatchId,_that.lastReceivedUri);case _:
  return null;

}
}

}

/// @nodoc


class _DeepLinkState implements DeepLinkState {
  const _DeepLinkState({this.isInitialized = false, this.pendingMatchId, this.lastReceivedUri});
  

@override@JsonKey() final  bool isInitialized;
@override final  int? pendingMatchId;
@override final  Uri? lastReceivedUri;

/// Create a copy of DeepLinkState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeepLinkStateCopyWith<_DeepLinkState> get copyWith => __$DeepLinkStateCopyWithImpl<_DeepLinkState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeepLinkState&&(identical(other.isInitialized, isInitialized) || other.isInitialized == isInitialized)&&(identical(other.pendingMatchId, pendingMatchId) || other.pendingMatchId == pendingMatchId)&&(identical(other.lastReceivedUri, lastReceivedUri) || other.lastReceivedUri == lastReceivedUri));
}


@override
int get hashCode => Object.hash(runtimeType,isInitialized,pendingMatchId,lastReceivedUri);

@override
String toString() {
  return 'DeepLinkState(isInitialized: $isInitialized, pendingMatchId: $pendingMatchId, lastReceivedUri: $lastReceivedUri)';
}


}

/// @nodoc
abstract mixin class _$DeepLinkStateCopyWith<$Res> implements $DeepLinkStateCopyWith<$Res> {
  factory _$DeepLinkStateCopyWith(_DeepLinkState value, $Res Function(_DeepLinkState) _then) = __$DeepLinkStateCopyWithImpl;
@override @useResult
$Res call({
 bool isInitialized, int? pendingMatchId, Uri? lastReceivedUri
});




}
/// @nodoc
class __$DeepLinkStateCopyWithImpl<$Res>
    implements _$DeepLinkStateCopyWith<$Res> {
  __$DeepLinkStateCopyWithImpl(this._self, this._then);

  final _DeepLinkState _self;
  final $Res Function(_DeepLinkState) _then;

/// Create a copy of DeepLinkState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isInitialized = null,Object? pendingMatchId = freezed,Object? lastReceivedUri = freezed,}) {
  return _then(_DeepLinkState(
isInitialized: null == isInitialized ? _self.isInitialized : isInitialized // ignore: cast_nullable_to_non_nullable
as bool,pendingMatchId: freezed == pendingMatchId ? _self.pendingMatchId : pendingMatchId // ignore: cast_nullable_to_non_nullable
as int?,lastReceivedUri: freezed == lastReceivedUri ? _self.lastReceivedUri : lastReceivedUri // ignore: cast_nullable_to_non_nullable
as Uri?,
  ));
}


}

// dart format on
