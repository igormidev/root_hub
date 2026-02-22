import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:root_hub_client/root_hub_client.dart';

part 'dashboard_profile_state.freezed.dart';

@freezed
abstract class DashboardProfileState with _$DashboardProfileState {
  const factory DashboardProfileState({
    String? profileImageUrl,
    @Default(false) bool hasLoadedProfileImage,
    @Default(false) bool isLoadingProfileImage,
    @Default(false) bool isUpdatingProfileImage,
    @Default(false) bool isUpdatingDisplayName,
    @Default(false) bool isUpdatingLocation,
    @Default(false) bool isUpdatingFaction,
    RootHubException? lastError,
  }) = _DashboardProfileState;
}
