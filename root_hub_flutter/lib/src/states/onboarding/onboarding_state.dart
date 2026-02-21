import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:root_hub_client/root_hub_client.dart';

part 'onboarding_state.freezed.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    Faction? selectedFaction,
  }) = _OnboardingState;
}
