import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:root_hub_client/root_hub_client.dart';

part 'auth_flow_state.freezed.dart';

@freezed
abstract class AuthFlowState with _$AuthFlowState {
  const factory AuthFlowState.loading() = _AuthFlowLoading;
  const factory AuthFlowState.requiresOnboarding() =
      _AuthFlowRequiresOnboarding;
  const factory AuthFlowState.requiresLogin() = _AuthFlowRequiresLogin;
  const factory AuthFlowState.authenticated({
    required PlayerData playerData,
  }) = _AuthFlowAuthenticated;
  const factory AuthFlowState.error({
    required String message,
  }) = _AuthFlowError;
}
