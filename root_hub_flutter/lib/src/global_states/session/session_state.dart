import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:root_hub_flutter/src/global_states/session/user_model.dart';

part 'session_state.freezed.dart';

@freezed
abstract class SessionState with _$SessionState {
  factory SessionState.loading() = _SessionStateLoading;
  factory SessionState.notSignedIn() = _SessionStateNotSignedIn;
  factory SessionState.logged({
    required UserModel user,
  }) = _SessionStateLogged;
}
