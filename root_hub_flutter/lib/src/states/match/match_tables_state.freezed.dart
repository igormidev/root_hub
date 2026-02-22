// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_tables_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MatchTablesState {

 List<MatchSchedulePairingAttempt> get tables; bool get isLoading; bool get hasLoadedOnce; RootHubException? get loadError; Set<int> get subscribingTableIds; RootHubException? get actionError;
/// Create a copy of MatchTablesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchTablesStateCopyWith<MatchTablesState> get copyWith => _$MatchTablesStateCopyWithImpl<MatchTablesState>(this as MatchTablesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchTablesState&&const DeepCollectionEquality().equals(other.tables, tables)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasLoadedOnce, hasLoadedOnce) || other.hasLoadedOnce == hasLoadedOnce)&&(identical(other.loadError, loadError) || other.loadError == loadError)&&const DeepCollectionEquality().equals(other.subscribingTableIds, subscribingTableIds)&&(identical(other.actionError, actionError) || other.actionError == actionError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tables),isLoading,hasLoadedOnce,loadError,const DeepCollectionEquality().hash(subscribingTableIds),actionError);

@override
String toString() {
  return 'MatchTablesState(tables: $tables, isLoading: $isLoading, hasLoadedOnce: $hasLoadedOnce, loadError: $loadError, subscribingTableIds: $subscribingTableIds, actionError: $actionError)';
}


}

/// @nodoc
abstract mixin class $MatchTablesStateCopyWith<$Res>  {
  factory $MatchTablesStateCopyWith(MatchTablesState value, $Res Function(MatchTablesState) _then) = _$MatchTablesStateCopyWithImpl;
@useResult
$Res call({
 List<MatchSchedulePairingAttempt> tables, bool isLoading, bool hasLoadedOnce, RootHubException? loadError, Set<int> subscribingTableIds, RootHubException? actionError
});




}
/// @nodoc
class _$MatchTablesStateCopyWithImpl<$Res>
    implements $MatchTablesStateCopyWith<$Res> {
  _$MatchTablesStateCopyWithImpl(this._self, this._then);

  final MatchTablesState _self;
  final $Res Function(MatchTablesState) _then;

/// Create a copy of MatchTablesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tables = null,Object? isLoading = null,Object? hasLoadedOnce = null,Object? loadError = freezed,Object? subscribingTableIds = null,Object? actionError = freezed,}) {
  return _then(_self.copyWith(
tables: null == tables ? _self.tables : tables // ignore: cast_nullable_to_non_nullable
as List<MatchSchedulePairingAttempt>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasLoadedOnce: null == hasLoadedOnce ? _self.hasLoadedOnce : hasLoadedOnce // ignore: cast_nullable_to_non_nullable
as bool,loadError: freezed == loadError ? _self.loadError : loadError // ignore: cast_nullable_to_non_nullable
as RootHubException?,subscribingTableIds: null == subscribingTableIds ? _self.subscribingTableIds : subscribingTableIds // ignore: cast_nullable_to_non_nullable
as Set<int>,actionError: freezed == actionError ? _self.actionError : actionError // ignore: cast_nullable_to_non_nullable
as RootHubException?,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchTablesState].
extension MatchTablesStatePatterns on MatchTablesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchTablesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchTablesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchTablesState value)  $default,){
final _that = this;
switch (_that) {
case _MatchTablesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchTablesState value)?  $default,){
final _that = this;
switch (_that) {
case _MatchTablesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MatchSchedulePairingAttempt> tables,  bool isLoading,  bool hasLoadedOnce,  RootHubException? loadError,  Set<int> subscribingTableIds,  RootHubException? actionError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchTablesState() when $default != null:
return $default(_that.tables,_that.isLoading,_that.hasLoadedOnce,_that.loadError,_that.subscribingTableIds,_that.actionError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MatchSchedulePairingAttempt> tables,  bool isLoading,  bool hasLoadedOnce,  RootHubException? loadError,  Set<int> subscribingTableIds,  RootHubException? actionError)  $default,) {final _that = this;
switch (_that) {
case _MatchTablesState():
return $default(_that.tables,_that.isLoading,_that.hasLoadedOnce,_that.loadError,_that.subscribingTableIds,_that.actionError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MatchSchedulePairingAttempt> tables,  bool isLoading,  bool hasLoadedOnce,  RootHubException? loadError,  Set<int> subscribingTableIds,  RootHubException? actionError)?  $default,) {final _that = this;
switch (_that) {
case _MatchTablesState() when $default != null:
return $default(_that.tables,_that.isLoading,_that.hasLoadedOnce,_that.loadError,_that.subscribingTableIds,_that.actionError);case _:
  return null;

}
}

}

/// @nodoc


class _MatchTablesState implements MatchTablesState {
  const _MatchTablesState({final  List<MatchSchedulePairingAttempt> tables = const <MatchSchedulePairingAttempt>[], this.isLoading = false, this.hasLoadedOnce = false, this.loadError, final  Set<int> subscribingTableIds = const <int>{}, this.actionError}): _tables = tables,_subscribingTableIds = subscribingTableIds;
  

 final  List<MatchSchedulePairingAttempt> _tables;
@override@JsonKey() List<MatchSchedulePairingAttempt> get tables {
  if (_tables is EqualUnmodifiableListView) return _tables;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tables);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool hasLoadedOnce;
@override final  RootHubException? loadError;
 final  Set<int> _subscribingTableIds;
@override@JsonKey() Set<int> get subscribingTableIds {
  if (_subscribingTableIds is EqualUnmodifiableSetView) return _subscribingTableIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_subscribingTableIds);
}

@override final  RootHubException? actionError;

/// Create a copy of MatchTablesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchTablesStateCopyWith<_MatchTablesState> get copyWith => __$MatchTablesStateCopyWithImpl<_MatchTablesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchTablesState&&const DeepCollectionEquality().equals(other._tables, _tables)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasLoadedOnce, hasLoadedOnce) || other.hasLoadedOnce == hasLoadedOnce)&&(identical(other.loadError, loadError) || other.loadError == loadError)&&const DeepCollectionEquality().equals(other._subscribingTableIds, _subscribingTableIds)&&(identical(other.actionError, actionError) || other.actionError == actionError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tables),isLoading,hasLoadedOnce,loadError,const DeepCollectionEquality().hash(_subscribingTableIds),actionError);

@override
String toString() {
  return 'MatchTablesState(tables: $tables, isLoading: $isLoading, hasLoadedOnce: $hasLoadedOnce, loadError: $loadError, subscribingTableIds: $subscribingTableIds, actionError: $actionError)';
}


}

/// @nodoc
abstract mixin class _$MatchTablesStateCopyWith<$Res> implements $MatchTablesStateCopyWith<$Res> {
  factory _$MatchTablesStateCopyWith(_MatchTablesState value, $Res Function(_MatchTablesState) _then) = __$MatchTablesStateCopyWithImpl;
@override @useResult
$Res call({
 List<MatchSchedulePairingAttempt> tables, bool isLoading, bool hasLoadedOnce, RootHubException? loadError, Set<int> subscribingTableIds, RootHubException? actionError
});




}
/// @nodoc
class __$MatchTablesStateCopyWithImpl<$Res>
    implements _$MatchTablesStateCopyWith<$Res> {
  __$MatchTablesStateCopyWithImpl(this._self, this._then);

  final _MatchTablesState _self;
  final $Res Function(_MatchTablesState) _then;

/// Create a copy of MatchTablesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tables = null,Object? isLoading = null,Object? hasLoadedOnce = null,Object? loadError = freezed,Object? subscribingTableIds = null,Object? actionError = freezed,}) {
  return _then(_MatchTablesState(
tables: null == tables ? _self._tables : tables // ignore: cast_nullable_to_non_nullable
as List<MatchSchedulePairingAttempt>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasLoadedOnce: null == hasLoadedOnce ? _self.hasLoadedOnce : hasLoadedOnce // ignore: cast_nullable_to_non_nullable
as bool,loadError: freezed == loadError ? _self.loadError : loadError // ignore: cast_nullable_to_non_nullable
as RootHubException?,subscribingTableIds: null == subscribingTableIds ? _self._subscribingTableIds : subscribingTableIds // ignore: cast_nullable_to_non_nullable
as Set<int>,actionError: freezed == actionError ? _self.actionError : actionError // ignore: cast_nullable_to_non_nullable
as RootHubException?,
  ));
}


}

// dart format on
