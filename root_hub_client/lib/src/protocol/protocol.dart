/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'api/account/models/reverse_geocode_city_result.dart' as _i2;
import 'api/community/models/comments_pagination.dart' as _i3;
import 'api/community/models/post_pagination.dart' as _i4;
import 'api/match/models/match_proof_upload_preparation.dart' as _i5;
import 'api/match/models/played_matches_pagination.dart' as _i6;
import 'api/match/models/player_match_result_input.dart' as _i7;
import 'api/match/models/registered_player_search_result.dart' as _i8;
import 'api/match_chat/models/match_chat_activity_chat_item.dart' as _i9;
import 'api/match_chat/models/match_chat_activity_overview.dart' as _i10;
import 'api/match_chat/models/match_chat_messages_pagination.dart' as _i11;
import 'api/match_chat/models/match_chat_participant_presence.dart' as _i12;
import 'api/match_chat/models/match_chat_played_match_player.dart' as _i13;
import 'api/match_chat/models/match_chat_played_match_summary.dart' as _i14;
import 'api/match_chat/models/match_chat_sender_profile.dart' as _i15;
import 'api/match_chat/models/player_schedules_pagination.dart' as _i16;
import 'api/match_making/models/location_pagination.dart' as _i17;
import 'api/match_making/models/match_schedule_info.dart' as _i18;
import 'api/match_making/models/match_schedule_player_snapshot.dart' as _i19;
import 'api/match_making/models/subscribed_matches_pagination.dart' as _i20;
import 'api/stats/models/platform_stats.dart' as _i21;
import 'api/stats/models/player_stats.dart' as _i22;
import 'api/stats/models/web_analytics_click_item.dart' as _i23;
import 'api/stats/models/web_analytics_clicks_pagination.dart' as _i24;
import 'api/stats/models/web_analytics_dashboard.dart' as _i25;
import 'api/stats/models/web_analytics_metric_item.dart' as _i26;
import 'api/stats/models/web_analytics_timeline_point.dart' as _i27;
import 'entities/community/post.dart' as _i28;
import 'entities/community/post_comment.dart' as _i29;
import 'entities/core/anonymous_player.dart' as _i30;
import 'entities/core/country.dart' as _i31;
import 'entities/core/faction.dart' as _i32;
import 'entities/core/geo_location.dart' as _i33;
import 'entities/core/language.dart' as _i34;
import 'entities/core/match_podium.dart' as _i35;
import 'entities/core/player_data.dart' as _i36;
import 'entities/core/player_push_notification_token.dart' as _i37;
import 'entities/core/push_notification_platform.dart' as _i38;
import 'entities/core/server_supported_translation.dart' as _i39;
import 'entities/match/match_in_person_proof.dart' as _i40;
import 'entities/match/played_match.dart' as _i41;
import 'entities/match/player_in_match.dart' as _i42;
import 'entities/match/player_perfomance_in_match.dart' as _i43;
import 'entities/match_making/chat/match_chat_history.dart' as _i44;
import 'entities/match_making/chat/match_chat_message.dart' as _i45;
import 'entities/match_making/chat/match_chat_message_type.dart' as _i46;
import 'entities/match_making/chat/match_chat_message_ui_type.dart' as _i47;
import 'entities/match_making/chat/match_chat_participant_state.dart' as _i48;
import 'entities/match_making/google_place_location.dart' as _i49;
import 'entities/match_making/location.dart' as _i50;
import 'entities/match_making/manual_input_location.dart' as _i51;
import 'entities/match_making/match_schedule.dart' as _i52;
import 'entities/match_making/match_schedule_not_played_reason.dart' as _i53;
import 'entities/match_making/match_schedule_status.dart' as _i54;
import 'entities/match_making/match_subscription.dart' as _i55;
import 'entities/others/account_deletion_request.dart' as _i56;
import 'entities/others/auth_feedback_exception.dart' as _i57;
import 'entities/others/auth_feedback_exception_reason.dart' as _i58;
import 'entities/others/pagination_metadata.dart' as _i59;
import 'entities/others/root_hub_exception.dart' as _i60;
import 'entities/others/web_analytics_click.dart' as _i61;
import 'entities/others/web_analytics_device_type.dart' as _i62;
import 'entities/others/web_ip_location_cache.dart' as _i63;
import 'package:root_hub_client/src/protocol/entities/core/anonymous_player.dart'
    as _i64;
import 'package:root_hub_client/src/protocol/entities/match/played_match.dart'
    as _i65;
import 'package:root_hub_client/src/protocol/entities/match_making/match_schedule.dart'
    as _i66;
import 'package:root_hub_client/src/protocol/api/match/models/player_match_result_input.dart'
    as _i67;
import 'package:root_hub_client/src/protocol/api/match/models/registered_player_search_result.dart'
    as _i68;
import 'package:root_hub_client/src/protocol/entities/match_making/location.dart'
    as _i69;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i70;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i71;
export 'api/account/models/reverse_geocode_city_result.dart';
export 'api/community/models/comments_pagination.dart';
export 'api/community/models/post_pagination.dart';
export 'api/match/models/match_proof_upload_preparation.dart';
export 'api/match/models/played_matches_pagination.dart';
export 'api/match/models/player_match_result_input.dart';
export 'api/match/models/registered_player_search_result.dart';
export 'api/match_chat/models/match_chat_activity_chat_item.dart';
export 'api/match_chat/models/match_chat_activity_overview.dart';
export 'api/match_chat/models/match_chat_messages_pagination.dart';
export 'api/match_chat/models/match_chat_participant_presence.dart';
export 'api/match_chat/models/match_chat_played_match_player.dart';
export 'api/match_chat/models/match_chat_played_match_summary.dart';
export 'api/match_chat/models/match_chat_sender_profile.dart';
export 'api/match_chat/models/player_schedules_pagination.dart';
export 'api/match_making/models/location_pagination.dart';
export 'api/match_making/models/match_schedule_info.dart';
export 'api/match_making/models/match_schedule_player_snapshot.dart';
export 'api/match_making/models/subscribed_matches_pagination.dart';
export 'api/stats/models/platform_stats.dart';
export 'api/stats/models/player_stats.dart';
export 'api/stats/models/web_analytics_click_item.dart';
export 'api/stats/models/web_analytics_clicks_pagination.dart';
export 'api/stats/models/web_analytics_dashboard.dart';
export 'api/stats/models/web_analytics_metric_item.dart';
export 'api/stats/models/web_analytics_timeline_point.dart';
export 'entities/community/post.dart';
export 'entities/community/post_comment.dart';
export 'entities/core/anonymous_player.dart';
export 'entities/core/country.dart';
export 'entities/core/faction.dart';
export 'entities/core/geo_location.dart';
export 'entities/core/language.dart';
export 'entities/core/match_podium.dart';
export 'entities/core/player_data.dart';
export 'entities/core/player_push_notification_token.dart';
export 'entities/core/push_notification_platform.dart';
export 'entities/core/server_supported_translation.dart';
export 'entities/match/match_in_person_proof.dart';
export 'entities/match/played_match.dart';
export 'entities/match/player_in_match.dart';
export 'entities/match/player_perfomance_in_match.dart';
export 'entities/match_making/chat/match_chat_history.dart';
export 'entities/match_making/chat/match_chat_message.dart';
export 'entities/match_making/chat/match_chat_message_type.dart';
export 'entities/match_making/chat/match_chat_message_ui_type.dart';
export 'entities/match_making/chat/match_chat_participant_state.dart';
export 'entities/match_making/google_place_location.dart';
export 'entities/match_making/location.dart';
export 'entities/match_making/manual_input_location.dart';
export 'entities/match_making/match_schedule.dart';
export 'entities/match_making/match_schedule_not_played_reason.dart';
export 'entities/match_making/match_schedule_status.dart';
export 'entities/match_making/match_subscription.dart';
export 'entities/others/account_deletion_request.dart';
export 'entities/others/auth_feedback_exception.dart';
export 'entities/others/auth_feedback_exception_reason.dart';
export 'entities/others/pagination_metadata.dart';
export 'entities/others/root_hub_exception.dart';
export 'entities/others/web_analytics_click.dart';
export 'entities/others/web_analytics_device_type.dart';
export 'entities/others/web_ip_location_cache.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.ReverseGeocodeCityResult) {
      return _i2.ReverseGeocodeCityResult.fromJson(data) as T;
    }
    if (t == _i3.CommentsPagination) {
      return _i3.CommentsPagination.fromJson(data) as T;
    }
    if (t == _i4.PostPagination) {
      return _i4.PostPagination.fromJson(data) as T;
    }
    if (t == _i5.MatchProofUploadPreparation) {
      return _i5.MatchProofUploadPreparation.fromJson(data) as T;
    }
    if (t == _i6.PlayedMatchesPagination) {
      return _i6.PlayedMatchesPagination.fromJson(data) as T;
    }
    if (t == _i7.PlayerMatchResultInput) {
      return _i7.PlayerMatchResultInput.fromJson(data) as T;
    }
    if (t == _i8.RegisteredPlayerSearchResult) {
      return _i8.RegisteredPlayerSearchResult.fromJson(data) as T;
    }
    if (t == _i9.MatchChatActivityChatItem) {
      return _i9.MatchChatActivityChatItem.fromJson(data) as T;
    }
    if (t == _i10.MatchChatActivityOverview) {
      return _i10.MatchChatActivityOverview.fromJson(data) as T;
    }
    if (t == _i11.MatchChatMessagesPagination) {
      return _i11.MatchChatMessagesPagination.fromJson(data) as T;
    }
    if (t == _i12.MatchChatParticipantPresence) {
      return _i12.MatchChatParticipantPresence.fromJson(data) as T;
    }
    if (t == _i13.MatchChatPlayedMatchPlayer) {
      return _i13.MatchChatPlayedMatchPlayer.fromJson(data) as T;
    }
    if (t == _i14.MatchChatPlayedMatchSummary) {
      return _i14.MatchChatPlayedMatchSummary.fromJson(data) as T;
    }
    if (t == _i15.MatchChatSenderProfile) {
      return _i15.MatchChatSenderProfile.fromJson(data) as T;
    }
    if (t == _i16.PlayerSchedulesPagination) {
      return _i16.PlayerSchedulesPagination.fromJson(data) as T;
    }
    if (t == _i17.LocationPagination) {
      return _i17.LocationPagination.fromJson(data) as T;
    }
    if (t == _i18.MatchScheduleInfo) {
      return _i18.MatchScheduleInfo.fromJson(data) as T;
    }
    if (t == _i19.MatchSchedulePlayerSnapshot) {
      return _i19.MatchSchedulePlayerSnapshot.fromJson(data) as T;
    }
    if (t == _i20.SubscribedMatchesPagination) {
      return _i20.SubscribedMatchesPagination.fromJson(data) as T;
    }
    if (t == _i21.PlatformStats) {
      return _i21.PlatformStats.fromJson(data) as T;
    }
    if (t == _i22.PlayerStats) {
      return _i22.PlayerStats.fromJson(data) as T;
    }
    if (t == _i23.WebAnalyticsClickItem) {
      return _i23.WebAnalyticsClickItem.fromJson(data) as T;
    }
    if (t == _i24.WebAnalyticsClicksPagination) {
      return _i24.WebAnalyticsClicksPagination.fromJson(data) as T;
    }
    if (t == _i25.WebAnalyticsDashboard) {
      return _i25.WebAnalyticsDashboard.fromJson(data) as T;
    }
    if (t == _i26.WebAnalyticsMetricItem) {
      return _i26.WebAnalyticsMetricItem.fromJson(data) as T;
    }
    if (t == _i27.WebAnalyticsTimelinePoint) {
      return _i27.WebAnalyticsTimelinePoint.fromJson(data) as T;
    }
    if (t == _i28.Post) {
      return _i28.Post.fromJson(data) as T;
    }
    if (t == _i29.PostComment) {
      return _i29.PostComment.fromJson(data) as T;
    }
    if (t == _i30.AnonymousPlayer) {
      return _i30.AnonymousPlayer.fromJson(data) as T;
    }
    if (t == _i31.Country) {
      return _i31.Country.fromJson(data) as T;
    }
    if (t == _i32.Faction) {
      return _i32.Faction.fromJson(data) as T;
    }
    if (t == _i33.GeoLocation) {
      return _i33.GeoLocation.fromJson(data) as T;
    }
    if (t == _i34.Language) {
      return _i34.Language.fromJson(data) as T;
    }
    if (t == _i35.MatchPodium) {
      return _i35.MatchPodium.fromJson(data) as T;
    }
    if (t == _i36.PlayerData) {
      return _i36.PlayerData.fromJson(data) as T;
    }
    if (t == _i37.PlayerPushNotificationToken) {
      return _i37.PlayerPushNotificationToken.fromJson(data) as T;
    }
    if (t == _i38.PushNotificationPlatform) {
      return _i38.PushNotificationPlatform.fromJson(data) as T;
    }
    if (t == _i39.ServerSupportedTranslation) {
      return _i39.ServerSupportedTranslation.fromJson(data) as T;
    }
    if (t == _i40.MatchInPersonProof) {
      return _i40.MatchInPersonProof.fromJson(data) as T;
    }
    if (t == _i41.PlayedMatch) {
      return _i41.PlayedMatch.fromJson(data) as T;
    }
    if (t == _i42.PlayerInMatch) {
      return _i42.PlayerInMatch.fromJson(data) as T;
    }
    if (t == _i43.PlayerPerfomanceInMatch) {
      return _i43.PlayerPerfomanceInMatch.fromJson(data) as T;
    }
    if (t == _i44.MatchChatHistory) {
      return _i44.MatchChatHistory.fromJson(data) as T;
    }
    if (t == _i45.MatchChatMessage) {
      return _i45.MatchChatMessage.fromJson(data) as T;
    }
    if (t == _i46.MatchChatMessageType) {
      return _i46.MatchChatMessageType.fromJson(data) as T;
    }
    if (t == _i47.MatchChatMessageUiType) {
      return _i47.MatchChatMessageUiType.fromJson(data) as T;
    }
    if (t == _i48.MatchChatParticipantState) {
      return _i48.MatchChatParticipantState.fromJson(data) as T;
    }
    if (t == _i49.GooglePlaceLocation) {
      return _i49.GooglePlaceLocation.fromJson(data) as T;
    }
    if (t == _i50.Location) {
      return _i50.Location.fromJson(data) as T;
    }
    if (t == _i51.ManualInputLocation) {
      return _i51.ManualInputLocation.fromJson(data) as T;
    }
    if (t == _i52.MatchSchedulePairingAttempt) {
      return _i52.MatchSchedulePairingAttempt.fromJson(data) as T;
    }
    if (t == _i53.MatchScheduleNotPlayedReason) {
      return _i53.MatchScheduleNotPlayedReason.fromJson(data) as T;
    }
    if (t == _i54.MatchScheduleStatus) {
      return _i54.MatchScheduleStatus.fromJson(data) as T;
    }
    if (t == _i55.MatchSubscription) {
      return _i55.MatchSubscription.fromJson(data) as T;
    }
    if (t == _i56.AccountDeletionRequest) {
      return _i56.AccountDeletionRequest.fromJson(data) as T;
    }
    if (t == _i57.AuthFeedbackException) {
      return _i57.AuthFeedbackException.fromJson(data) as T;
    }
    if (t == _i58.AuthFeedbackExceptionReason) {
      return _i58.AuthFeedbackExceptionReason.fromJson(data) as T;
    }
    if (t == _i59.PaginationMetadata) {
      return _i59.PaginationMetadata.fromJson(data) as T;
    }
    if (t == _i60.RootHubException) {
      return _i60.RootHubException.fromJson(data) as T;
    }
    if (t == _i61.WebAnalyticsClick) {
      return _i61.WebAnalyticsClick.fromJson(data) as T;
    }
    if (t == _i62.WebAnalyticsDeviceType) {
      return _i62.WebAnalyticsDeviceType.fromJson(data) as T;
    }
    if (t == _i63.WebIpLocationCache) {
      return _i63.WebIpLocationCache.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.ReverseGeocodeCityResult?>()) {
      return (data != null ? _i2.ReverseGeocodeCityResult.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i3.CommentsPagination?>()) {
      return (data != null ? _i3.CommentsPagination.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.PostPagination?>()) {
      return (data != null ? _i4.PostPagination.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.MatchProofUploadPreparation?>()) {
      return (data != null
              ? _i5.MatchProofUploadPreparation.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i6.PlayedMatchesPagination?>()) {
      return (data != null ? _i6.PlayedMatchesPagination.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i7.PlayerMatchResultInput?>()) {
      return (data != null ? _i7.PlayerMatchResultInput.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i8.RegisteredPlayerSearchResult?>()) {
      return (data != null
              ? _i8.RegisteredPlayerSearchResult.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i9.MatchChatActivityChatItem?>()) {
      return (data != null
              ? _i9.MatchChatActivityChatItem.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i10.MatchChatActivityOverview?>()) {
      return (data != null
              ? _i10.MatchChatActivityOverview.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i11.MatchChatMessagesPagination?>()) {
      return (data != null
              ? _i11.MatchChatMessagesPagination.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i12.MatchChatParticipantPresence?>()) {
      return (data != null
              ? _i12.MatchChatParticipantPresence.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i13.MatchChatPlayedMatchPlayer?>()) {
      return (data != null
              ? _i13.MatchChatPlayedMatchPlayer.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i14.MatchChatPlayedMatchSummary?>()) {
      return (data != null
              ? _i14.MatchChatPlayedMatchSummary.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i15.MatchChatSenderProfile?>()) {
      return (data != null ? _i15.MatchChatSenderProfile.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i16.PlayerSchedulesPagination?>()) {
      return (data != null
              ? _i16.PlayerSchedulesPagination.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i17.LocationPagination?>()) {
      return (data != null ? _i17.LocationPagination.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i18.MatchScheduleInfo?>()) {
      return (data != null ? _i18.MatchScheduleInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.MatchSchedulePlayerSnapshot?>()) {
      return (data != null
              ? _i19.MatchSchedulePlayerSnapshot.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i20.SubscribedMatchesPagination?>()) {
      return (data != null
              ? _i20.SubscribedMatchesPagination.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i21.PlatformStats?>()) {
      return (data != null ? _i21.PlatformStats.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.PlayerStats?>()) {
      return (data != null ? _i22.PlayerStats.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.WebAnalyticsClickItem?>()) {
      return (data != null ? _i23.WebAnalyticsClickItem.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i24.WebAnalyticsClicksPagination?>()) {
      return (data != null
              ? _i24.WebAnalyticsClicksPagination.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i25.WebAnalyticsDashboard?>()) {
      return (data != null ? _i25.WebAnalyticsDashboard.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i26.WebAnalyticsMetricItem?>()) {
      return (data != null ? _i26.WebAnalyticsMetricItem.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i27.WebAnalyticsTimelinePoint?>()) {
      return (data != null
              ? _i27.WebAnalyticsTimelinePoint.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i28.Post?>()) {
      return (data != null ? _i28.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.PostComment?>()) {
      return (data != null ? _i29.PostComment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.AnonymousPlayer?>()) {
      return (data != null ? _i30.AnonymousPlayer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.Country?>()) {
      return (data != null ? _i31.Country.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.Faction?>()) {
      return (data != null ? _i32.Faction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.GeoLocation?>()) {
      return (data != null ? _i33.GeoLocation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.Language?>()) {
      return (data != null ? _i34.Language.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.MatchPodium?>()) {
      return (data != null ? _i35.MatchPodium.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.PlayerData?>()) {
      return (data != null ? _i36.PlayerData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.PlayerPushNotificationToken?>()) {
      return (data != null
              ? _i37.PlayerPushNotificationToken.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i38.PushNotificationPlatform?>()) {
      return (data != null
              ? _i38.PushNotificationPlatform.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i39.ServerSupportedTranslation?>()) {
      return (data != null
              ? _i39.ServerSupportedTranslation.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i40.MatchInPersonProof?>()) {
      return (data != null ? _i40.MatchInPersonProof.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i41.PlayedMatch?>()) {
      return (data != null ? _i41.PlayedMatch.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i42.PlayerInMatch?>()) {
      return (data != null ? _i42.PlayerInMatch.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i43.PlayerPerfomanceInMatch?>()) {
      return (data != null ? _i43.PlayerPerfomanceInMatch.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i44.MatchChatHistory?>()) {
      return (data != null ? _i44.MatchChatHistory.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i45.MatchChatMessage?>()) {
      return (data != null ? _i45.MatchChatMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i46.MatchChatMessageType?>()) {
      return (data != null ? _i46.MatchChatMessageType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i47.MatchChatMessageUiType?>()) {
      return (data != null ? _i47.MatchChatMessageUiType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i48.MatchChatParticipantState?>()) {
      return (data != null
              ? _i48.MatchChatParticipantState.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i49.GooglePlaceLocation?>()) {
      return (data != null ? _i49.GooglePlaceLocation.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i50.Location?>()) {
      return (data != null ? _i50.Location.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i51.ManualInputLocation?>()) {
      return (data != null ? _i51.ManualInputLocation.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i52.MatchSchedulePairingAttempt?>()) {
      return (data != null
              ? _i52.MatchSchedulePairingAttempt.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i53.MatchScheduleNotPlayedReason?>()) {
      return (data != null
              ? _i53.MatchScheduleNotPlayedReason.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i54.MatchScheduleStatus?>()) {
      return (data != null ? _i54.MatchScheduleStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i55.MatchSubscription?>()) {
      return (data != null ? _i55.MatchSubscription.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i56.AccountDeletionRequest?>()) {
      return (data != null ? _i56.AccountDeletionRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i57.AuthFeedbackException?>()) {
      return (data != null ? _i57.AuthFeedbackException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i58.AuthFeedbackExceptionReason?>()) {
      return (data != null
              ? _i58.AuthFeedbackExceptionReason.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i59.PaginationMetadata?>()) {
      return (data != null ? _i59.PaginationMetadata.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i60.RootHubException?>()) {
      return (data != null ? _i60.RootHubException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i61.WebAnalyticsClick?>()) {
      return (data != null ? _i61.WebAnalyticsClick.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i62.WebAnalyticsDeviceType?>()) {
      return (data != null ? _i62.WebAnalyticsDeviceType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i63.WebIpLocationCache?>()) {
      return (data != null ? _i63.WebIpLocationCache.fromJson(data) : null)
          as T;
    }
    if (t == List<_i29.PostComment>) {
      return (data as List)
              .map((e) => deserialize<_i29.PostComment>(e))
              .toList()
          as T;
    }
    if (t == List<_i28.Post>) {
      return (data as List).map((e) => deserialize<_i28.Post>(e)).toList() as T;
    }
    if (t == List<_i55.MatchSubscription>) {
      return (data as List)
              .map((e) => deserialize<_i55.MatchSubscription>(e))
              .toList()
          as T;
    }
    if (t == List<_i52.MatchSchedulePairingAttempt>) {
      return (data as List)
              .map((e) => deserialize<_i52.MatchSchedulePairingAttempt>(e))
              .toList()
          as T;
    }
    if (t == List<_i9.MatchChatActivityChatItem>) {
      return (data as List)
              .map((e) => deserialize<_i9.MatchChatActivityChatItem>(e))
              .toList()
          as T;
    }
    if (t == List<_i45.MatchChatMessage>) {
      return (data as List)
              .map((e) => deserialize<_i45.MatchChatMessage>(e))
              .toList()
          as T;
    }
    if (t == List<_i15.MatchChatSenderProfile>) {
      return (data as List)
              .map((e) => deserialize<_i15.MatchChatSenderProfile>(e))
              .toList()
          as T;
    }
    if (t == List<_i12.MatchChatParticipantPresence>) {
      return (data as List)
              .map((e) => deserialize<_i12.MatchChatParticipantPresence>(e))
              .toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i13.MatchChatPlayedMatchPlayer>) {
      return (data as List)
              .map((e) => deserialize<_i13.MatchChatPlayedMatchPlayer>(e))
              .toList()
          as T;
    }
    if (t == List<_i50.Location>) {
      return (data as List).map((e) => deserialize<_i50.Location>(e)).toList()
          as T;
    }
    if (t == List<_i19.MatchSchedulePlayerSnapshot>) {
      return (data as List)
              .map((e) => deserialize<_i19.MatchSchedulePlayerSnapshot>(e))
              .toList()
          as T;
    }
    if (t == List<_i23.WebAnalyticsClickItem>) {
      return (data as List)
              .map((e) => deserialize<_i23.WebAnalyticsClickItem>(e))
              .toList()
          as T;
    }
    if (t == List<_i26.WebAnalyticsMetricItem>) {
      return (data as List)
              .map((e) => deserialize<_i26.WebAnalyticsMetricItem>(e))
              .toList()
          as T;
    }
    if (t == List<_i27.WebAnalyticsTimelinePoint>) {
      return (data as List)
              .map((e) => deserialize<_i27.WebAnalyticsTimelinePoint>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i29.PostComment>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i29.PostComment>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i43.PlayerPerfomanceInMatch>) {
      return (data as List)
              .map((e) => deserialize<_i43.PlayerPerfomanceInMatch>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i43.PlayerPerfomanceInMatch>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i43.PlayerPerfomanceInMatch>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i42.PlayerInMatch>) {
      return (data as List)
              .map((e) => deserialize<_i42.PlayerInMatch>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i42.PlayerInMatch>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i42.PlayerInMatch>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == _i1.getType<List<_i28.Post>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i28.Post>(e)).toList()
              : null)
          as T;
    }
    if (t == _i1.getType<List<_i52.MatchSchedulePairingAttempt>?>()) {
      return (data != null
              ? (data as List)
                    .map(
                      (e) => deserialize<_i52.MatchSchedulePairingAttempt>(e),
                    )
                    .toList()
              : null)
          as T;
    }
    if (t == _i1.getType<List<_i55.MatchSubscription>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i55.MatchSubscription>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == _i1.getType<List<_i45.MatchChatMessage>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i45.MatchChatMessage>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i48.MatchChatParticipantState>) {
      return (data as List)
              .map((e) => deserialize<_i48.MatchChatParticipantState>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i48.MatchChatParticipantState>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i48.MatchChatParticipantState>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i37.PlayerPushNotificationToken>) {
      return (data as List)
              .map((e) => deserialize<_i37.PlayerPushNotificationToken>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i37.PlayerPushNotificationToken>?>()) {
      return (data != null
              ? (data as List)
                    .map(
                      (e) => deserialize<_i37.PlayerPushNotificationToken>(e),
                    )
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i51.ManualInputLocation>) {
      return (data as List)
              .map((e) => deserialize<_i51.ManualInputLocation>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i51.ManualInputLocation>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i51.ManualInputLocation>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i30.AnonymousPlayer>) {
      return (data as List)
              .map((e) => deserialize<_i30.AnonymousPlayer>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i30.AnonymousPlayer>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i30.AnonymousPlayer>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<String>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i41.PlayedMatch>) {
      return (data as List)
              .map((e) => deserialize<_i41.PlayedMatch>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i41.PlayedMatch>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i41.PlayedMatch>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i64.AnonymousPlayer>) {
      return (data as List)
              .map((e) => deserialize<_i64.AnonymousPlayer>(e))
              .toList()
          as T;
    }
    if (t == List<_i65.PlayedMatch>) {
      return (data as List)
              .map((e) => deserialize<_i65.PlayedMatch>(e))
              .toList()
          as T;
    }
    if (t == List<_i66.MatchSchedulePairingAttempt>) {
      return (data as List)
              .map((e) => deserialize<_i66.MatchSchedulePairingAttempt>(e))
              .toList()
          as T;
    }
    if (t == List<_i67.PlayerMatchResultInput>) {
      return (data as List)
              .map((e) => deserialize<_i67.PlayerMatchResultInput>(e))
              .toList()
          as T;
    }
    if (t == List<_i68.RegisteredPlayerSearchResult>) {
      return (data as List)
              .map((e) => deserialize<_i68.RegisteredPlayerSearchResult>(e))
              .toList()
          as T;
    }
    if (t == List<_i69.Location>) {
      return (data as List).map((e) => deserialize<_i69.Location>(e)).toList()
          as T;
    }
    try {
      return _i70.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i71.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.ReverseGeocodeCityResult => 'ReverseGeocodeCityResult',
      _i3.CommentsPagination => 'CommentsPagination',
      _i4.PostPagination => 'PostPagination',
      _i5.MatchProofUploadPreparation => 'MatchProofUploadPreparation',
      _i6.PlayedMatchesPagination => 'PlayedMatchesPagination',
      _i7.PlayerMatchResultInput => 'PlayerMatchResultInput',
      _i8.RegisteredPlayerSearchResult => 'RegisteredPlayerSearchResult',
      _i9.MatchChatActivityChatItem => 'MatchChatActivityChatItem',
      _i10.MatchChatActivityOverview => 'MatchChatActivityOverview',
      _i11.MatchChatMessagesPagination => 'MatchChatMessagesPagination',
      _i12.MatchChatParticipantPresence => 'MatchChatParticipantPresence',
      _i13.MatchChatPlayedMatchPlayer => 'MatchChatPlayedMatchPlayer',
      _i14.MatchChatPlayedMatchSummary => 'MatchChatPlayedMatchSummary',
      _i15.MatchChatSenderProfile => 'MatchChatSenderProfile',
      _i16.PlayerSchedulesPagination => 'PlayerSchedulesPagination',
      _i17.LocationPagination => 'LocationPagination',
      _i18.MatchScheduleInfo => 'MatchScheduleInfo',
      _i19.MatchSchedulePlayerSnapshot => 'MatchSchedulePlayerSnapshot',
      _i20.SubscribedMatchesPagination => 'SubscribedMatchesPagination',
      _i21.PlatformStats => 'PlatformStats',
      _i22.PlayerStats => 'PlayerStats',
      _i23.WebAnalyticsClickItem => 'WebAnalyticsClickItem',
      _i24.WebAnalyticsClicksPagination => 'WebAnalyticsClicksPagination',
      _i25.WebAnalyticsDashboard => 'WebAnalyticsDashboard',
      _i26.WebAnalyticsMetricItem => 'WebAnalyticsMetricItem',
      _i27.WebAnalyticsTimelinePoint => 'WebAnalyticsTimelinePoint',
      _i28.Post => 'Post',
      _i29.PostComment => 'PostComment',
      _i30.AnonymousPlayer => 'AnonymousPlayer',
      _i31.Country => 'Country',
      _i32.Faction => 'Faction',
      _i33.GeoLocation => 'GeoLocation',
      _i34.Language => 'Language',
      _i35.MatchPodium => 'MatchPodium',
      _i36.PlayerData => 'PlayerData',
      _i37.PlayerPushNotificationToken => 'PlayerPushNotificationToken',
      _i38.PushNotificationPlatform => 'PushNotificationPlatform',
      _i39.ServerSupportedTranslation => 'ServerSupportedTranslation',
      _i40.MatchInPersonProof => 'MatchInPersonProof',
      _i41.PlayedMatch => 'PlayedMatch',
      _i42.PlayerInMatch => 'PlayerInMatch',
      _i43.PlayerPerfomanceInMatch => 'PlayerPerfomanceInMatch',
      _i44.MatchChatHistory => 'MatchChatHistory',
      _i45.MatchChatMessage => 'MatchChatMessage',
      _i46.MatchChatMessageType => 'MatchChatMessageType',
      _i47.MatchChatMessageUiType => 'MatchChatMessageUiType',
      _i48.MatchChatParticipantState => 'MatchChatParticipantState',
      _i49.GooglePlaceLocation => 'GooglePlaceLocation',
      _i50.Location => 'Location',
      _i51.ManualInputLocation => 'ManualInputLocation',
      _i52.MatchSchedulePairingAttempt => 'MatchSchedulePairingAttempt',
      _i53.MatchScheduleNotPlayedReason => 'MatchScheduleNotPlayedReason',
      _i54.MatchScheduleStatus => 'MatchScheduleStatus',
      _i55.MatchSubscription => 'MatchSubscription',
      _i56.AccountDeletionRequest => 'AccountDeletionRequest',
      _i57.AuthFeedbackException => 'AuthFeedbackException',
      _i58.AuthFeedbackExceptionReason => 'AuthFeedbackExceptionReason',
      _i59.PaginationMetadata => 'PaginationMetadata',
      _i60.RootHubException => 'RootHubException',
      _i61.WebAnalyticsClick => 'WebAnalyticsClick',
      _i62.WebAnalyticsDeviceType => 'WebAnalyticsDeviceType',
      _i63.WebIpLocationCache => 'WebIpLocationCache',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('root_hub.', '');
    }

    switch (data) {
      case _i2.ReverseGeocodeCityResult():
        return 'ReverseGeocodeCityResult';
      case _i3.CommentsPagination():
        return 'CommentsPagination';
      case _i4.PostPagination():
        return 'PostPagination';
      case _i5.MatchProofUploadPreparation():
        return 'MatchProofUploadPreparation';
      case _i6.PlayedMatchesPagination():
        return 'PlayedMatchesPagination';
      case _i7.PlayerMatchResultInput():
        return 'PlayerMatchResultInput';
      case _i8.RegisteredPlayerSearchResult():
        return 'RegisteredPlayerSearchResult';
      case _i9.MatchChatActivityChatItem():
        return 'MatchChatActivityChatItem';
      case _i10.MatchChatActivityOverview():
        return 'MatchChatActivityOverview';
      case _i11.MatchChatMessagesPagination():
        return 'MatchChatMessagesPagination';
      case _i12.MatchChatParticipantPresence():
        return 'MatchChatParticipantPresence';
      case _i13.MatchChatPlayedMatchPlayer():
        return 'MatchChatPlayedMatchPlayer';
      case _i14.MatchChatPlayedMatchSummary():
        return 'MatchChatPlayedMatchSummary';
      case _i15.MatchChatSenderProfile():
        return 'MatchChatSenderProfile';
      case _i16.PlayerSchedulesPagination():
        return 'PlayerSchedulesPagination';
      case _i17.LocationPagination():
        return 'LocationPagination';
      case _i18.MatchScheduleInfo():
        return 'MatchScheduleInfo';
      case _i19.MatchSchedulePlayerSnapshot():
        return 'MatchSchedulePlayerSnapshot';
      case _i20.SubscribedMatchesPagination():
        return 'SubscribedMatchesPagination';
      case _i21.PlatformStats():
        return 'PlatformStats';
      case _i22.PlayerStats():
        return 'PlayerStats';
      case _i23.WebAnalyticsClickItem():
        return 'WebAnalyticsClickItem';
      case _i24.WebAnalyticsClicksPagination():
        return 'WebAnalyticsClicksPagination';
      case _i25.WebAnalyticsDashboard():
        return 'WebAnalyticsDashboard';
      case _i26.WebAnalyticsMetricItem():
        return 'WebAnalyticsMetricItem';
      case _i27.WebAnalyticsTimelinePoint():
        return 'WebAnalyticsTimelinePoint';
      case _i28.Post():
        return 'Post';
      case _i29.PostComment():
        return 'PostComment';
      case _i30.AnonymousPlayer():
        return 'AnonymousPlayer';
      case _i31.Country():
        return 'Country';
      case _i32.Faction():
        return 'Faction';
      case _i33.GeoLocation():
        return 'GeoLocation';
      case _i34.Language():
        return 'Language';
      case _i35.MatchPodium():
        return 'MatchPodium';
      case _i36.PlayerData():
        return 'PlayerData';
      case _i37.PlayerPushNotificationToken():
        return 'PlayerPushNotificationToken';
      case _i38.PushNotificationPlatform():
        return 'PushNotificationPlatform';
      case _i39.ServerSupportedTranslation():
        return 'ServerSupportedTranslation';
      case _i40.MatchInPersonProof():
        return 'MatchInPersonProof';
      case _i41.PlayedMatch():
        return 'PlayedMatch';
      case _i42.PlayerInMatch():
        return 'PlayerInMatch';
      case _i43.PlayerPerfomanceInMatch():
        return 'PlayerPerfomanceInMatch';
      case _i44.MatchChatHistory():
        return 'MatchChatHistory';
      case _i45.MatchChatMessage():
        return 'MatchChatMessage';
      case _i46.MatchChatMessageType():
        return 'MatchChatMessageType';
      case _i47.MatchChatMessageUiType():
        return 'MatchChatMessageUiType';
      case _i48.MatchChatParticipantState():
        return 'MatchChatParticipantState';
      case _i49.GooglePlaceLocation():
        return 'GooglePlaceLocation';
      case _i50.Location():
        return 'Location';
      case _i51.ManualInputLocation():
        return 'ManualInputLocation';
      case _i52.MatchSchedulePairingAttempt():
        return 'MatchSchedulePairingAttempt';
      case _i53.MatchScheduleNotPlayedReason():
        return 'MatchScheduleNotPlayedReason';
      case _i54.MatchScheduleStatus():
        return 'MatchScheduleStatus';
      case _i55.MatchSubscription():
        return 'MatchSubscription';
      case _i56.AccountDeletionRequest():
        return 'AccountDeletionRequest';
      case _i57.AuthFeedbackException():
        return 'AuthFeedbackException';
      case _i58.AuthFeedbackExceptionReason():
        return 'AuthFeedbackExceptionReason';
      case _i59.PaginationMetadata():
        return 'PaginationMetadata';
      case _i60.RootHubException():
        return 'RootHubException';
      case _i61.WebAnalyticsClick():
        return 'WebAnalyticsClick';
      case _i62.WebAnalyticsDeviceType():
        return 'WebAnalyticsDeviceType';
      case _i63.WebIpLocationCache():
        return 'WebIpLocationCache';
    }
    className = _i70.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i71.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'ReverseGeocodeCityResult') {
      return deserialize<_i2.ReverseGeocodeCityResult>(data['data']);
    }
    if (dataClassName == 'CommentsPagination') {
      return deserialize<_i3.CommentsPagination>(data['data']);
    }
    if (dataClassName == 'PostPagination') {
      return deserialize<_i4.PostPagination>(data['data']);
    }
    if (dataClassName == 'MatchProofUploadPreparation') {
      return deserialize<_i5.MatchProofUploadPreparation>(data['data']);
    }
    if (dataClassName == 'PlayedMatchesPagination') {
      return deserialize<_i6.PlayedMatchesPagination>(data['data']);
    }
    if (dataClassName == 'PlayerMatchResultInput') {
      return deserialize<_i7.PlayerMatchResultInput>(data['data']);
    }
    if (dataClassName == 'RegisteredPlayerSearchResult') {
      return deserialize<_i8.RegisteredPlayerSearchResult>(data['data']);
    }
    if (dataClassName == 'MatchChatActivityChatItem') {
      return deserialize<_i9.MatchChatActivityChatItem>(data['data']);
    }
    if (dataClassName == 'MatchChatActivityOverview') {
      return deserialize<_i10.MatchChatActivityOverview>(data['data']);
    }
    if (dataClassName == 'MatchChatMessagesPagination') {
      return deserialize<_i11.MatchChatMessagesPagination>(data['data']);
    }
    if (dataClassName == 'MatchChatParticipantPresence') {
      return deserialize<_i12.MatchChatParticipantPresence>(data['data']);
    }
    if (dataClassName == 'MatchChatPlayedMatchPlayer') {
      return deserialize<_i13.MatchChatPlayedMatchPlayer>(data['data']);
    }
    if (dataClassName == 'MatchChatPlayedMatchSummary') {
      return deserialize<_i14.MatchChatPlayedMatchSummary>(data['data']);
    }
    if (dataClassName == 'MatchChatSenderProfile') {
      return deserialize<_i15.MatchChatSenderProfile>(data['data']);
    }
    if (dataClassName == 'PlayerSchedulesPagination') {
      return deserialize<_i16.PlayerSchedulesPagination>(data['data']);
    }
    if (dataClassName == 'LocationPagination') {
      return deserialize<_i17.LocationPagination>(data['data']);
    }
    if (dataClassName == 'MatchScheduleInfo') {
      return deserialize<_i18.MatchScheduleInfo>(data['data']);
    }
    if (dataClassName == 'MatchSchedulePlayerSnapshot') {
      return deserialize<_i19.MatchSchedulePlayerSnapshot>(data['data']);
    }
    if (dataClassName == 'SubscribedMatchesPagination') {
      return deserialize<_i20.SubscribedMatchesPagination>(data['data']);
    }
    if (dataClassName == 'PlatformStats') {
      return deserialize<_i21.PlatformStats>(data['data']);
    }
    if (dataClassName == 'PlayerStats') {
      return deserialize<_i22.PlayerStats>(data['data']);
    }
    if (dataClassName == 'WebAnalyticsClickItem') {
      return deserialize<_i23.WebAnalyticsClickItem>(data['data']);
    }
    if (dataClassName == 'WebAnalyticsClicksPagination') {
      return deserialize<_i24.WebAnalyticsClicksPagination>(data['data']);
    }
    if (dataClassName == 'WebAnalyticsDashboard') {
      return deserialize<_i25.WebAnalyticsDashboard>(data['data']);
    }
    if (dataClassName == 'WebAnalyticsMetricItem') {
      return deserialize<_i26.WebAnalyticsMetricItem>(data['data']);
    }
    if (dataClassName == 'WebAnalyticsTimelinePoint') {
      return deserialize<_i27.WebAnalyticsTimelinePoint>(data['data']);
    }
    if (dataClassName == 'Post') {
      return deserialize<_i28.Post>(data['data']);
    }
    if (dataClassName == 'PostComment') {
      return deserialize<_i29.PostComment>(data['data']);
    }
    if (dataClassName == 'AnonymousPlayer') {
      return deserialize<_i30.AnonymousPlayer>(data['data']);
    }
    if (dataClassName == 'Country') {
      return deserialize<_i31.Country>(data['data']);
    }
    if (dataClassName == 'Faction') {
      return deserialize<_i32.Faction>(data['data']);
    }
    if (dataClassName == 'GeoLocation') {
      return deserialize<_i33.GeoLocation>(data['data']);
    }
    if (dataClassName == 'Language') {
      return deserialize<_i34.Language>(data['data']);
    }
    if (dataClassName == 'MatchPodium') {
      return deserialize<_i35.MatchPodium>(data['data']);
    }
    if (dataClassName == 'PlayerData') {
      return deserialize<_i36.PlayerData>(data['data']);
    }
    if (dataClassName == 'PlayerPushNotificationToken') {
      return deserialize<_i37.PlayerPushNotificationToken>(data['data']);
    }
    if (dataClassName == 'PushNotificationPlatform') {
      return deserialize<_i38.PushNotificationPlatform>(data['data']);
    }
    if (dataClassName == 'ServerSupportedTranslation') {
      return deserialize<_i39.ServerSupportedTranslation>(data['data']);
    }
    if (dataClassName == 'MatchInPersonProof') {
      return deserialize<_i40.MatchInPersonProof>(data['data']);
    }
    if (dataClassName == 'PlayedMatch') {
      return deserialize<_i41.PlayedMatch>(data['data']);
    }
    if (dataClassName == 'PlayerInMatch') {
      return deserialize<_i42.PlayerInMatch>(data['data']);
    }
    if (dataClassName == 'PlayerPerfomanceInMatch') {
      return deserialize<_i43.PlayerPerfomanceInMatch>(data['data']);
    }
    if (dataClassName == 'MatchChatHistory') {
      return deserialize<_i44.MatchChatHistory>(data['data']);
    }
    if (dataClassName == 'MatchChatMessage') {
      return deserialize<_i45.MatchChatMessage>(data['data']);
    }
    if (dataClassName == 'MatchChatMessageType') {
      return deserialize<_i46.MatchChatMessageType>(data['data']);
    }
    if (dataClassName == 'MatchChatMessageUiType') {
      return deserialize<_i47.MatchChatMessageUiType>(data['data']);
    }
    if (dataClassName == 'MatchChatParticipantState') {
      return deserialize<_i48.MatchChatParticipantState>(data['data']);
    }
    if (dataClassName == 'GooglePlaceLocation') {
      return deserialize<_i49.GooglePlaceLocation>(data['data']);
    }
    if (dataClassName == 'Location') {
      return deserialize<_i50.Location>(data['data']);
    }
    if (dataClassName == 'ManualInputLocation') {
      return deserialize<_i51.ManualInputLocation>(data['data']);
    }
    if (dataClassName == 'MatchSchedulePairingAttempt') {
      return deserialize<_i52.MatchSchedulePairingAttempt>(data['data']);
    }
    if (dataClassName == 'MatchScheduleNotPlayedReason') {
      return deserialize<_i53.MatchScheduleNotPlayedReason>(data['data']);
    }
    if (dataClassName == 'MatchScheduleStatus') {
      return deserialize<_i54.MatchScheduleStatus>(data['data']);
    }
    if (dataClassName == 'MatchSubscription') {
      return deserialize<_i55.MatchSubscription>(data['data']);
    }
    if (dataClassName == 'AccountDeletionRequest') {
      return deserialize<_i56.AccountDeletionRequest>(data['data']);
    }
    if (dataClassName == 'AuthFeedbackException') {
      return deserialize<_i57.AuthFeedbackException>(data['data']);
    }
    if (dataClassName == 'AuthFeedbackExceptionReason') {
      return deserialize<_i58.AuthFeedbackExceptionReason>(data['data']);
    }
    if (dataClassName == 'PaginationMetadata') {
      return deserialize<_i59.PaginationMetadata>(data['data']);
    }
    if (dataClassName == 'RootHubException') {
      return deserialize<_i60.RootHubException>(data['data']);
    }
    if (dataClassName == 'WebAnalyticsClick') {
      return deserialize<_i61.WebAnalyticsClick>(data['data']);
    }
    if (dataClassName == 'WebAnalyticsDeviceType') {
      return deserialize<_i62.WebAnalyticsDeviceType>(data['data']);
    }
    if (dataClassName == 'WebIpLocationCache') {
      return deserialize<_i63.WebIpLocationCache>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i70.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i71.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i70.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i71.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
