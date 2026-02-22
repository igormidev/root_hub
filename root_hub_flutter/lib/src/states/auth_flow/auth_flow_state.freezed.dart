// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthFlowState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFlowState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFlowState()';
}


}

/// @nodoc
class $AuthFlowStateCopyWith<$Res>  {
$AuthFlowStateCopyWith(AuthFlowState _, $Res Function(AuthFlowState) __);
}


/// Adds pattern-matching-related methods to [AuthFlowState].
extension AuthFlowStatePatterns on AuthFlowState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthFlowLoading value)?  loading,TResult Function( _AuthFlowRequiresOnboarding value)?  requiresOnboarding,TResult Function( _AuthFlowRequiresOnboardingProfile value)?  requiresOnboardingProfile,TResult Function( _AuthFlowRequiresLogin value)?  requiresLogin,TResult Function( _AuthFlowAuthenticated value)?  authenticated,TResult Function( _AuthFlowError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthFlowLoading() when loading != null:
return loading(_that);case _AuthFlowRequiresOnboarding() when requiresOnboarding != null:
return requiresOnboarding(_that);case _AuthFlowRequiresOnboardingProfile() when requiresOnboardingProfile != null:
return requiresOnboardingProfile(_that);case _AuthFlowRequiresLogin() when requiresLogin != null:
return requiresLogin(_that);case _AuthFlowAuthenticated() when authenticated != null:
return authenticated(_that);case _AuthFlowError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthFlowLoading value)  loading,required TResult Function( _AuthFlowRequiresOnboarding value)  requiresOnboarding,required TResult Function( _AuthFlowRequiresOnboardingProfile value)  requiresOnboardingProfile,required TResult Function( _AuthFlowRequiresLogin value)  requiresLogin,required TResult Function( _AuthFlowAuthenticated value)  authenticated,required TResult Function( _AuthFlowError value)  error,}){
final _that = this;
switch (_that) {
case _AuthFlowLoading():
return loading(_that);case _AuthFlowRequiresOnboarding():
return requiresOnboarding(_that);case _AuthFlowRequiresOnboardingProfile():
return requiresOnboardingProfile(_that);case _AuthFlowRequiresLogin():
return requiresLogin(_that);case _AuthFlowAuthenticated():
return authenticated(_that);case _AuthFlowError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthFlowLoading value)?  loading,TResult? Function( _AuthFlowRequiresOnboarding value)?  requiresOnboarding,TResult? Function( _AuthFlowRequiresOnboardingProfile value)?  requiresOnboardingProfile,TResult? Function( _AuthFlowRequiresLogin value)?  requiresLogin,TResult? Function( _AuthFlowAuthenticated value)?  authenticated,TResult? Function( _AuthFlowError value)?  error,}){
final _that = this;
switch (_that) {
case _AuthFlowLoading() when loading != null:
return loading(_that);case _AuthFlowRequiresOnboarding() when requiresOnboarding != null:
return requiresOnboarding(_that);case _AuthFlowRequiresOnboardingProfile() when requiresOnboardingProfile != null:
return requiresOnboardingProfile(_that);case _AuthFlowRequiresLogin() when requiresLogin != null:
return requiresLogin(_that);case _AuthFlowAuthenticated() when authenticated != null:
return authenticated(_that);case _AuthFlowError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function()?  requiresOnboarding,TResult Function()?  requiresOnboardingProfile,TResult Function()?  requiresLogin,TResult Function( PlayerData playerData)?  authenticated,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthFlowLoading() when loading != null:
return loading();case _AuthFlowRequiresOnboarding() when requiresOnboarding != null:
return requiresOnboarding();case _AuthFlowRequiresOnboardingProfile() when requiresOnboardingProfile != null:
return requiresOnboardingProfile();case _AuthFlowRequiresLogin() when requiresLogin != null:
return requiresLogin();case _AuthFlowAuthenticated() when authenticated != null:
return authenticated(_that.playerData);case _AuthFlowError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function()  requiresOnboarding,required TResult Function()  requiresOnboardingProfile,required TResult Function()  requiresLogin,required TResult Function( PlayerData playerData)  authenticated,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _AuthFlowLoading():
return loading();case _AuthFlowRequiresOnboarding():
return requiresOnboarding();case _AuthFlowRequiresOnboardingProfile():
return requiresOnboardingProfile();case _AuthFlowRequiresLogin():
return requiresLogin();case _AuthFlowAuthenticated():
return authenticated(_that.playerData);case _AuthFlowError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function()?  requiresOnboarding,TResult? Function()?  requiresOnboardingProfile,TResult? Function()?  requiresLogin,TResult? Function( PlayerData playerData)?  authenticated,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _AuthFlowLoading() when loading != null:
return loading();case _AuthFlowRequiresOnboarding() when requiresOnboarding != null:
return requiresOnboarding();case _AuthFlowRequiresOnboardingProfile() when requiresOnboardingProfile != null:
return requiresOnboardingProfile();case _AuthFlowRequiresLogin() when requiresLogin != null:
return requiresLogin();case _AuthFlowAuthenticated() when authenticated != null:
return authenticated(_that.playerData);case _AuthFlowError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _AuthFlowLoading implements AuthFlowState {
  const _AuthFlowLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthFlowLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFlowState.loading()';
}


}




/// @nodoc


class _AuthFlowRequiresOnboarding implements AuthFlowState {
  const _AuthFlowRequiresOnboarding();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthFlowRequiresOnboarding);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFlowState.requiresOnboarding()';
}


}




/// @nodoc


class _AuthFlowRequiresOnboardingProfile implements AuthFlowState {
  const _AuthFlowRequiresOnboardingProfile();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthFlowRequiresOnboardingProfile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFlowState.requiresOnboardingProfile()';
}


}




/// @nodoc


class _AuthFlowRequiresLogin implements AuthFlowState {
  const _AuthFlowRequiresLogin();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthFlowRequiresLogin);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFlowState.requiresLogin()';
}


}




/// @nodoc


class _AuthFlowAuthenticated implements AuthFlowState {
  const _AuthFlowAuthenticated({required this.playerData});
  

 final  PlayerData playerData;

/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthFlowAuthenticatedCopyWith<_AuthFlowAuthenticated> get copyWith => __$AuthFlowAuthenticatedCopyWithImpl<_AuthFlowAuthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthFlowAuthenticated&&(identical(other.playerData, playerData) || other.playerData == playerData));
}


@override
int get hashCode => Object.hash(runtimeType,playerData);

@override
String toString() {
  return 'AuthFlowState.authenticated(playerData: $playerData)';
}


}

/// @nodoc
abstract mixin class _$AuthFlowAuthenticatedCopyWith<$Res> implements $AuthFlowStateCopyWith<$Res> {
  factory _$AuthFlowAuthenticatedCopyWith(_AuthFlowAuthenticated value, $Res Function(_AuthFlowAuthenticated) _then) = __$AuthFlowAuthenticatedCopyWithImpl;
@useResult
$Res call({
 PlayerData playerData
});




}
/// @nodoc
class __$AuthFlowAuthenticatedCopyWithImpl<$Res>
    implements _$AuthFlowAuthenticatedCopyWith<$Res> {
  __$AuthFlowAuthenticatedCopyWithImpl(this._self, this._then);

  final _AuthFlowAuthenticated _self;
  final $Res Function(_AuthFlowAuthenticated) _then;

/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? playerData = null,}) {
  return _then(_AuthFlowAuthenticated(
playerData: null == playerData ? _self.playerData : playerData // ignore: cast_nullable_to_non_nullable
as PlayerData,
  ));
}


}

/// @nodoc


class _AuthFlowError implements AuthFlowState {
  const _AuthFlowError({required this.message});
  

 final  String message;

/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthFlowErrorCopyWith<_AuthFlowError> get copyWith => __$AuthFlowErrorCopyWithImpl<_AuthFlowError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthFlowError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthFlowState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$AuthFlowErrorCopyWith<$Res> implements $AuthFlowStateCopyWith<$Res> {
  factory _$AuthFlowErrorCopyWith(_AuthFlowError value, $Res Function(_AuthFlowError) _then) = __$AuthFlowErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$AuthFlowErrorCopyWithImpl<$Res>
    implements _$AuthFlowErrorCopyWith<$Res> {
  __$AuthFlowErrorCopyWithImpl(this._self, this._then);

  final _AuthFlowError _self;
  final $Res Function(_AuthFlowError) _then;

/// Create a copy of AuthFlowState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_AuthFlowError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
