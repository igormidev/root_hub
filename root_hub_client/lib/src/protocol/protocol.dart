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
import 'api/match/models/played_matches_pagination.dart' as _i5;
import 'api/match/models/player_match_result_input.dart' as _i6;
import 'api/match/models/registered_player_search_result.dart' as _i7;
import 'api/match_chat/models/match_chat_activity_chat_item.dart' as _i8;
import 'api/match_chat/models/match_chat_activity_overview.dart' as _i9;
import 'api/match_chat/models/match_chat_messages_pagination.dart' as _i10;
import 'api/match_chat/models/match_chat_played_match_player.dart' as _i11;
import 'api/match_chat/models/match_chat_played_match_summary.dart' as _i12;
import 'api/match_chat/models/match_chat_sender_profile.dart' as _i13;
import 'api/match_making/models/location_pagination.dart' as _i14;
import 'api/match_making/models/match_schedule_info.dart' as _i15;
import 'api/match_making/models/match_schedule_player_snapshot.dart' as _i16;
import 'api/match_making/models/subscribed_matches_pagination.dart' as _i17;
import 'api/stats/models/platform_stats.dart' as _i18;
import 'api/stats/models/player_stats.dart' as _i19;
import 'entities/community/post.dart' as _i20;
import 'entities/community/post_comment.dart' as _i21;
import 'entities/core/anonymous_player.dart' as _i22;
import 'entities/core/country.dart' as _i23;
import 'entities/core/faction.dart' as _i24;
import 'entities/core/geo_location.dart' as _i25;
import 'entities/core/language.dart' as _i26;
import 'entities/core/match_podium.dart' as _i27;
import 'entities/core/player_data.dart' as _i28;
import 'entities/core/player_push_notification_token.dart' as _i29;
import 'entities/core/push_notification_platform.dart' as _i30;
import 'entities/core/server_supported_translation.dart' as _i31;
import 'entities/match/match_in_person_proof.dart' as _i32;
import 'entities/match/played_match.dart' as _i33;
import 'entities/match/player_in_match.dart' as _i34;
import 'entities/match/player_perfomance_in_match.dart' as _i35;
import 'entities/match_making/chat/match_chat_history.dart' as _i36;
import 'entities/match_making/chat/match_chat_message.dart' as _i37;
import 'entities/match_making/chat/match_chat_message_type.dart' as _i38;
import 'entities/match_making/chat/match_chat_participant_state.dart' as _i39;
import 'entities/match_making/google_place_location.dart' as _i40;
import 'entities/match_making/location.dart' as _i41;
import 'entities/match_making/manual_input_location.dart' as _i42;
import 'entities/match_making/match_schedule.dart' as _i43;
import 'entities/match_making/match_subscription.dart' as _i44;
import 'entities/others/pagination_metadata.dart' as _i45;
import 'entities/others/root_hub_exception.dart' as _i46;
import 'package:root_hub_client/src/protocol/entities/core/anonymous_player.dart'
    as _i47;
import 'package:root_hub_client/src/protocol/entities/match/played_match.dart'
    as _i48;
import 'package:root_hub_client/src/protocol/entities/match_making/match_schedule.dart'
    as _i49;
import 'package:root_hub_client/src/protocol/api/match/models/player_match_result_input.dart'
    as _i50;
import 'package:root_hub_client/src/protocol/api/match/models/registered_player_search_result.dart'
    as _i51;
import 'package:root_hub_client/src/protocol/entities/match_making/location.dart'
    as _i52;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i53;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i54;
export 'api/account/models/reverse_geocode_city_result.dart';
export 'api/community/models/comments_pagination.dart';
export 'api/community/models/post_pagination.dart';
export 'api/match/models/played_matches_pagination.dart';
export 'api/match/models/player_match_result_input.dart';
export 'api/match/models/registered_player_search_result.dart';
export 'api/match_chat/models/match_chat_activity_chat_item.dart';
export 'api/match_chat/models/match_chat_activity_overview.dart';
export 'api/match_chat/models/match_chat_messages_pagination.dart';
export 'api/match_chat/models/match_chat_played_match_player.dart';
export 'api/match_chat/models/match_chat_played_match_summary.dart';
export 'api/match_chat/models/match_chat_sender_profile.dart';
export 'api/match_making/models/location_pagination.dart';
export 'api/match_making/models/match_schedule_info.dart';
export 'api/match_making/models/match_schedule_player_snapshot.dart';
export 'api/match_making/models/subscribed_matches_pagination.dart';
export 'api/stats/models/platform_stats.dart';
export 'api/stats/models/player_stats.dart';
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
export 'entities/match_making/chat/match_chat_participant_state.dart';
export 'entities/match_making/google_place_location.dart';
export 'entities/match_making/location.dart';
export 'entities/match_making/manual_input_location.dart';
export 'entities/match_making/match_schedule.dart';
export 'entities/match_making/match_subscription.dart';
export 'entities/others/pagination_metadata.dart';
export 'entities/others/root_hub_exception.dart';
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
    if (t == _i5.PlayedMatchesPagination) {
      return _i5.PlayedMatchesPagination.fromJson(data) as T;
    }
    if (t == _i6.PlayerMatchResultInput) {
      return _i6.PlayerMatchResultInput.fromJson(data) as T;
    }
    if (t == _i7.RegisteredPlayerSearchResult) {
      return _i7.RegisteredPlayerSearchResult.fromJson(data) as T;
    }
    if (t == _i8.MatchChatActivityChatItem) {
      return _i8.MatchChatActivityChatItem.fromJson(data) as T;
    }
    if (t == _i9.MatchChatActivityOverview) {
      return _i9.MatchChatActivityOverview.fromJson(data) as T;
    }
    if (t == _i10.MatchChatMessagesPagination) {
      return _i10.MatchChatMessagesPagination.fromJson(data) as T;
    }
    if (t == _i11.MatchChatPlayedMatchPlayer) {
      return _i11.MatchChatPlayedMatchPlayer.fromJson(data) as T;
    }
    if (t == _i12.MatchChatPlayedMatchSummary) {
      return _i12.MatchChatPlayedMatchSummary.fromJson(data) as T;
    }
    if (t == _i13.MatchChatSenderProfile) {
      return _i13.MatchChatSenderProfile.fromJson(data) as T;
    }
    if (t == _i14.LocationPagination) {
      return _i14.LocationPagination.fromJson(data) as T;
    }
    if (t == _i15.MatchScheduleInfo) {
      return _i15.MatchScheduleInfo.fromJson(data) as T;
    }
    if (t == _i16.MatchSchedulePlayerSnapshot) {
      return _i16.MatchSchedulePlayerSnapshot.fromJson(data) as T;
    }
    if (t == _i17.SubscribedMatchesPagination) {
      return _i17.SubscribedMatchesPagination.fromJson(data) as T;
    }
    if (t == _i18.PlatformStats) {
      return _i18.PlatformStats.fromJson(data) as T;
    }
    if (t == _i19.PlayerStats) {
      return _i19.PlayerStats.fromJson(data) as T;
    }
    if (t == _i20.Post) {
      return _i20.Post.fromJson(data) as T;
    }
    if (t == _i21.PostComment) {
      return _i21.PostComment.fromJson(data) as T;
    }
    if (t == _i22.AnonymousPlayer) {
      return _i22.AnonymousPlayer.fromJson(data) as T;
    }
    if (t == _i23.Country) {
      return _i23.Country.fromJson(data) as T;
    }
    if (t == _i24.Faction) {
      return _i24.Faction.fromJson(data) as T;
    }
    if (t == _i25.GeoLocation) {
      return _i25.GeoLocation.fromJson(data) as T;
    }
    if (t == _i26.Language) {
      return _i26.Language.fromJson(data) as T;
    }
    if (t == _i27.MatchPodium) {
      return _i27.MatchPodium.fromJson(data) as T;
    }
    if (t == _i28.PlayerData) {
      return _i28.PlayerData.fromJson(data) as T;
    }
    if (t == _i29.PlayerPushNotificationToken) {
      return _i29.PlayerPushNotificationToken.fromJson(data) as T;
    }
    if (t == _i30.PushNotificationPlatform) {
      return _i30.PushNotificationPlatform.fromJson(data) as T;
    }
    if (t == _i31.ServerSupportedTranslation) {
      return _i31.ServerSupportedTranslation.fromJson(data) as T;
    }
    if (t == _i32.MatchInPersonProof) {
      return _i32.MatchInPersonProof.fromJson(data) as T;
    }
    if (t == _i33.PlayedMatch) {
      return _i33.PlayedMatch.fromJson(data) as T;
    }
    if (t == _i34.PlayerInMatch) {
      return _i34.PlayerInMatch.fromJson(data) as T;
    }
    if (t == _i35.PlayerPerfomanceInMatch) {
      return _i35.PlayerPerfomanceInMatch.fromJson(data) as T;
    }
    if (t == _i36.MatchChatHistory) {
      return _i36.MatchChatHistory.fromJson(data) as T;
    }
    if (t == _i37.MatchChatMessage) {
      return _i37.MatchChatMessage.fromJson(data) as T;
    }
    if (t == _i38.MatchChatMessageType) {
      return _i38.MatchChatMessageType.fromJson(data) as T;
    }
    if (t == _i39.MatchChatParticipantState) {
      return _i39.MatchChatParticipantState.fromJson(data) as T;
    }
    if (t == _i40.GooglePlaceLocation) {
      return _i40.GooglePlaceLocation.fromJson(data) as T;
    }
    if (t == _i41.Location) {
      return _i41.Location.fromJson(data) as T;
    }
    if (t == _i42.ManualInputLocation) {
      return _i42.ManualInputLocation.fromJson(data) as T;
    }
    if (t == _i43.MatchSchedulePairingAttempt) {
      return _i43.MatchSchedulePairingAttempt.fromJson(data) as T;
    }
    if (t == _i44.MatchSubscription) {
      return _i44.MatchSubscription.fromJson(data) as T;
    }
    if (t == _i45.PaginationMetadata) {
      return _i45.PaginationMetadata.fromJson(data) as T;
    }
    if (t == _i46.RootHubException) {
      return _i46.RootHubException.fromJson(data) as T;
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
    if (t == _i1.getType<_i5.PlayedMatchesPagination?>()) {
      return (data != null ? _i5.PlayedMatchesPagination.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i6.PlayerMatchResultInput?>()) {
      return (data != null ? _i6.PlayerMatchResultInput.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i7.RegisteredPlayerSearchResult?>()) {
      return (data != null
              ? _i7.RegisteredPlayerSearchResult.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i8.MatchChatActivityChatItem?>()) {
      return (data != null
              ? _i8.MatchChatActivityChatItem.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i9.MatchChatActivityOverview?>()) {
      return (data != null
              ? _i9.MatchChatActivityOverview.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i10.MatchChatMessagesPagination?>()) {
      return (data != null
              ? _i10.MatchChatMessagesPagination.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i11.MatchChatPlayedMatchPlayer?>()) {
      return (data != null
              ? _i11.MatchChatPlayedMatchPlayer.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i12.MatchChatPlayedMatchSummary?>()) {
      return (data != null
              ? _i12.MatchChatPlayedMatchSummary.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i13.MatchChatSenderProfile?>()) {
      return (data != null ? _i13.MatchChatSenderProfile.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i14.LocationPagination?>()) {
      return (data != null ? _i14.LocationPagination.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i15.MatchScheduleInfo?>()) {
      return (data != null ? _i15.MatchScheduleInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.MatchSchedulePlayerSnapshot?>()) {
      return (data != null
              ? _i16.MatchSchedulePlayerSnapshot.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i17.SubscribedMatchesPagination?>()) {
      return (data != null
              ? _i17.SubscribedMatchesPagination.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i18.PlatformStats?>()) {
      return (data != null ? _i18.PlatformStats.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.PlayerStats?>()) {
      return (data != null ? _i19.PlayerStats.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.Post?>()) {
      return (data != null ? _i20.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.PostComment?>()) {
      return (data != null ? _i21.PostComment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.AnonymousPlayer?>()) {
      return (data != null ? _i22.AnonymousPlayer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.Country?>()) {
      return (data != null ? _i23.Country.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.Faction?>()) {
      return (data != null ? _i24.Faction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.GeoLocation?>()) {
      return (data != null ? _i25.GeoLocation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.Language?>()) {
      return (data != null ? _i26.Language.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.MatchPodium?>()) {
      return (data != null ? _i27.MatchPodium.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.PlayerData?>()) {
      return (data != null ? _i28.PlayerData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.PlayerPushNotificationToken?>()) {
      return (data != null
              ? _i29.PlayerPushNotificationToken.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i30.PushNotificationPlatform?>()) {
      return (data != null
              ? _i30.PushNotificationPlatform.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i31.ServerSupportedTranslation?>()) {
      return (data != null
              ? _i31.ServerSupportedTranslation.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i32.MatchInPersonProof?>()) {
      return (data != null ? _i32.MatchInPersonProof.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i33.PlayedMatch?>()) {
      return (data != null ? _i33.PlayedMatch.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.PlayerInMatch?>()) {
      return (data != null ? _i34.PlayerInMatch.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.PlayerPerfomanceInMatch?>()) {
      return (data != null ? _i35.PlayerPerfomanceInMatch.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i36.MatchChatHistory?>()) {
      return (data != null ? _i36.MatchChatHistory.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.MatchChatMessage?>()) {
      return (data != null ? _i37.MatchChatMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.MatchChatMessageType?>()) {
      return (data != null ? _i38.MatchChatMessageType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i39.MatchChatParticipantState?>()) {
      return (data != null
              ? _i39.MatchChatParticipantState.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i40.GooglePlaceLocation?>()) {
      return (data != null ? _i40.GooglePlaceLocation.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i41.Location?>()) {
      return (data != null ? _i41.Location.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i42.ManualInputLocation?>()) {
      return (data != null ? _i42.ManualInputLocation.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i43.MatchSchedulePairingAttempt?>()) {
      return (data != null
              ? _i43.MatchSchedulePairingAttempt.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i44.MatchSubscription?>()) {
      return (data != null ? _i44.MatchSubscription.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i45.PaginationMetadata?>()) {
      return (data != null ? _i45.PaginationMetadata.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i46.RootHubException?>()) {
      return (data != null ? _i46.RootHubException.fromJson(data) : null) as T;
    }
    if (t == List<_i21.PostComment>) {
      return (data as List)
              .map((e) => deserialize<_i21.PostComment>(e))
              .toList()
          as T;
    }
    if (t == List<_i20.Post>) {
      return (data as List).map((e) => deserialize<_i20.Post>(e)).toList() as T;
    }
    if (t == List<_i44.MatchSubscription>) {
      return (data as List)
              .map((e) => deserialize<_i44.MatchSubscription>(e))
              .toList()
          as T;
    }
    if (t == List<_i43.MatchSchedulePairingAttempt>) {
      return (data as List)
              .map((e) => deserialize<_i43.MatchSchedulePairingAttempt>(e))
              .toList()
          as T;
    }
    if (t == List<_i8.MatchChatActivityChatItem>) {
      return (data as List)
              .map((e) => deserialize<_i8.MatchChatActivityChatItem>(e))
              .toList()
          as T;
    }
    if (t == List<_i37.MatchChatMessage>) {
      return (data as List)
              .map((e) => deserialize<_i37.MatchChatMessage>(e))
              .toList()
          as T;
    }
    if (t == List<_i13.MatchChatSenderProfile>) {
      return (data as List)
              .map((e) => deserialize<_i13.MatchChatSenderProfile>(e))
              .toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i11.MatchChatPlayedMatchPlayer>) {
      return (data as List)
              .map((e) => deserialize<_i11.MatchChatPlayedMatchPlayer>(e))
              .toList()
          as T;
    }
    if (t == List<_i41.Location>) {
      return (data as List).map((e) => deserialize<_i41.Location>(e)).toList()
          as T;
    }
    if (t == List<_i16.MatchSchedulePlayerSnapshot>) {
      return (data as List)
              .map((e) => deserialize<_i16.MatchSchedulePlayerSnapshot>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i21.PostComment>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i21.PostComment>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i35.PlayerPerfomanceInMatch>) {
      return (data as List)
              .map((e) => deserialize<_i35.PlayerPerfomanceInMatch>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i35.PlayerPerfomanceInMatch>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i35.PlayerPerfomanceInMatch>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i34.PlayerInMatch>) {
      return (data as List)
              .map((e) => deserialize<_i34.PlayerInMatch>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i34.PlayerInMatch>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i34.PlayerInMatch>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == _i1.getType<List<_i20.Post>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i20.Post>(e)).toList()
              : null)
          as T;
    }
    if (t == _i1.getType<List<_i43.MatchSchedulePairingAttempt>?>()) {
      return (data != null
              ? (data as List)
                    .map(
                      (e) => deserialize<_i43.MatchSchedulePairingAttempt>(e),
                    )
                    .toList()
              : null)
          as T;
    }
    if (t == _i1.getType<List<_i44.MatchSubscription>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i44.MatchSubscription>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == _i1.getType<List<_i37.MatchChatMessage>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i37.MatchChatMessage>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i39.MatchChatParticipantState>) {
      return (data as List)
              .map((e) => deserialize<_i39.MatchChatParticipantState>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i39.MatchChatParticipantState>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i39.MatchChatParticipantState>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i29.PlayerPushNotificationToken>) {
      return (data as List)
              .map((e) => deserialize<_i29.PlayerPushNotificationToken>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i29.PlayerPushNotificationToken>?>()) {
      return (data != null
              ? (data as List)
                    .map(
                      (e) => deserialize<_i29.PlayerPushNotificationToken>(e),
                    )
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i42.ManualInputLocation>) {
      return (data as List)
              .map((e) => deserialize<_i42.ManualInputLocation>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i42.ManualInputLocation>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i42.ManualInputLocation>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i22.AnonymousPlayer>) {
      return (data as List)
              .map((e) => deserialize<_i22.AnonymousPlayer>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i22.AnonymousPlayer>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i22.AnonymousPlayer>(e))
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
    if (t == List<_i33.PlayedMatch>) {
      return (data as List)
              .map((e) => deserialize<_i33.PlayedMatch>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i33.PlayedMatch>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i33.PlayedMatch>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i47.AnonymousPlayer>) {
      return (data as List)
              .map((e) => deserialize<_i47.AnonymousPlayer>(e))
              .toList()
          as T;
    }
    if (t == List<_i48.PlayedMatch>) {
      return (data as List)
              .map((e) => deserialize<_i48.PlayedMatch>(e))
              .toList()
          as T;
    }
    if (t == List<_i49.MatchSchedulePairingAttempt>) {
      return (data as List)
              .map((e) => deserialize<_i49.MatchSchedulePairingAttempt>(e))
              .toList()
          as T;
    }
    if (t == List<_i50.PlayerMatchResultInput>) {
      return (data as List)
              .map((e) => deserialize<_i50.PlayerMatchResultInput>(e))
              .toList()
          as T;
    }
    if (t == List<_i51.RegisteredPlayerSearchResult>) {
      return (data as List)
              .map((e) => deserialize<_i51.RegisteredPlayerSearchResult>(e))
              .toList()
          as T;
    }
    if (t == List<_i52.Location>) {
      return (data as List).map((e) => deserialize<_i52.Location>(e)).toList()
          as T;
    }
    try {
      return _i53.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i54.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.ReverseGeocodeCityResult => 'ReverseGeocodeCityResult',
      _i3.CommentsPagination => 'CommentsPagination',
      _i4.PostPagination => 'PostPagination',
      _i5.PlayedMatchesPagination => 'PlayedMatchesPagination',
      _i6.PlayerMatchResultInput => 'PlayerMatchResultInput',
      _i7.RegisteredPlayerSearchResult => 'RegisteredPlayerSearchResult',
      _i8.MatchChatActivityChatItem => 'MatchChatActivityChatItem',
      _i9.MatchChatActivityOverview => 'MatchChatActivityOverview',
      _i10.MatchChatMessagesPagination => 'MatchChatMessagesPagination',
      _i11.MatchChatPlayedMatchPlayer => 'MatchChatPlayedMatchPlayer',
      _i12.MatchChatPlayedMatchSummary => 'MatchChatPlayedMatchSummary',
      _i13.MatchChatSenderProfile => 'MatchChatSenderProfile',
      _i14.LocationPagination => 'LocationPagination',
      _i15.MatchScheduleInfo => 'MatchScheduleInfo',
      _i16.MatchSchedulePlayerSnapshot => 'MatchSchedulePlayerSnapshot',
      _i17.SubscribedMatchesPagination => 'SubscribedMatchesPagination',
      _i18.PlatformStats => 'PlatformStats',
      _i19.PlayerStats => 'PlayerStats',
      _i20.Post => 'Post',
      _i21.PostComment => 'PostComment',
      _i22.AnonymousPlayer => 'AnonymousPlayer',
      _i23.Country => 'Country',
      _i24.Faction => 'Faction',
      _i25.GeoLocation => 'GeoLocation',
      _i26.Language => 'Language',
      _i27.MatchPodium => 'MatchPodium',
      _i28.PlayerData => 'PlayerData',
      _i29.PlayerPushNotificationToken => 'PlayerPushNotificationToken',
      _i30.PushNotificationPlatform => 'PushNotificationPlatform',
      _i31.ServerSupportedTranslation => 'ServerSupportedTranslation',
      _i32.MatchInPersonProof => 'MatchInPersonProof',
      _i33.PlayedMatch => 'PlayedMatch',
      _i34.PlayerInMatch => 'PlayerInMatch',
      _i35.PlayerPerfomanceInMatch => 'PlayerPerfomanceInMatch',
      _i36.MatchChatHistory => 'MatchChatHistory',
      _i37.MatchChatMessage => 'MatchChatMessage',
      _i38.MatchChatMessageType => 'MatchChatMessageType',
      _i39.MatchChatParticipantState => 'MatchChatParticipantState',
      _i40.GooglePlaceLocation => 'GooglePlaceLocation',
      _i41.Location => 'Location',
      _i42.ManualInputLocation => 'ManualInputLocation',
      _i43.MatchSchedulePairingAttempt => 'MatchSchedulePairingAttempt',
      _i44.MatchSubscription => 'MatchSubscription',
      _i45.PaginationMetadata => 'PaginationMetadata',
      _i46.RootHubException => 'RootHubException',
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
      case _i5.PlayedMatchesPagination():
        return 'PlayedMatchesPagination';
      case _i6.PlayerMatchResultInput():
        return 'PlayerMatchResultInput';
      case _i7.RegisteredPlayerSearchResult():
        return 'RegisteredPlayerSearchResult';
      case _i8.MatchChatActivityChatItem():
        return 'MatchChatActivityChatItem';
      case _i9.MatchChatActivityOverview():
        return 'MatchChatActivityOverview';
      case _i10.MatchChatMessagesPagination():
        return 'MatchChatMessagesPagination';
      case _i11.MatchChatPlayedMatchPlayer():
        return 'MatchChatPlayedMatchPlayer';
      case _i12.MatchChatPlayedMatchSummary():
        return 'MatchChatPlayedMatchSummary';
      case _i13.MatchChatSenderProfile():
        return 'MatchChatSenderProfile';
      case _i14.LocationPagination():
        return 'LocationPagination';
      case _i15.MatchScheduleInfo():
        return 'MatchScheduleInfo';
      case _i16.MatchSchedulePlayerSnapshot():
        return 'MatchSchedulePlayerSnapshot';
      case _i17.SubscribedMatchesPagination():
        return 'SubscribedMatchesPagination';
      case _i18.PlatformStats():
        return 'PlatformStats';
      case _i19.PlayerStats():
        return 'PlayerStats';
      case _i20.Post():
        return 'Post';
      case _i21.PostComment():
        return 'PostComment';
      case _i22.AnonymousPlayer():
        return 'AnonymousPlayer';
      case _i23.Country():
        return 'Country';
      case _i24.Faction():
        return 'Faction';
      case _i25.GeoLocation():
        return 'GeoLocation';
      case _i26.Language():
        return 'Language';
      case _i27.MatchPodium():
        return 'MatchPodium';
      case _i28.PlayerData():
        return 'PlayerData';
      case _i29.PlayerPushNotificationToken():
        return 'PlayerPushNotificationToken';
      case _i30.PushNotificationPlatform():
        return 'PushNotificationPlatform';
      case _i31.ServerSupportedTranslation():
        return 'ServerSupportedTranslation';
      case _i32.MatchInPersonProof():
        return 'MatchInPersonProof';
      case _i33.PlayedMatch():
        return 'PlayedMatch';
      case _i34.PlayerInMatch():
        return 'PlayerInMatch';
      case _i35.PlayerPerfomanceInMatch():
        return 'PlayerPerfomanceInMatch';
      case _i36.MatchChatHistory():
        return 'MatchChatHistory';
      case _i37.MatchChatMessage():
        return 'MatchChatMessage';
      case _i38.MatchChatMessageType():
        return 'MatchChatMessageType';
      case _i39.MatchChatParticipantState():
        return 'MatchChatParticipantState';
      case _i40.GooglePlaceLocation():
        return 'GooglePlaceLocation';
      case _i41.Location():
        return 'Location';
      case _i42.ManualInputLocation():
        return 'ManualInputLocation';
      case _i43.MatchSchedulePairingAttempt():
        return 'MatchSchedulePairingAttempt';
      case _i44.MatchSubscription():
        return 'MatchSubscription';
      case _i45.PaginationMetadata():
        return 'PaginationMetadata';
      case _i46.RootHubException():
        return 'RootHubException';
    }
    className = _i53.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i54.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'PlayedMatchesPagination') {
      return deserialize<_i5.PlayedMatchesPagination>(data['data']);
    }
    if (dataClassName == 'PlayerMatchResultInput') {
      return deserialize<_i6.PlayerMatchResultInput>(data['data']);
    }
    if (dataClassName == 'RegisteredPlayerSearchResult') {
      return deserialize<_i7.RegisteredPlayerSearchResult>(data['data']);
    }
    if (dataClassName == 'MatchChatActivityChatItem') {
      return deserialize<_i8.MatchChatActivityChatItem>(data['data']);
    }
    if (dataClassName == 'MatchChatActivityOverview') {
      return deserialize<_i9.MatchChatActivityOverview>(data['data']);
    }
    if (dataClassName == 'MatchChatMessagesPagination') {
      return deserialize<_i10.MatchChatMessagesPagination>(data['data']);
    }
    if (dataClassName == 'MatchChatPlayedMatchPlayer') {
      return deserialize<_i11.MatchChatPlayedMatchPlayer>(data['data']);
    }
    if (dataClassName == 'MatchChatPlayedMatchSummary') {
      return deserialize<_i12.MatchChatPlayedMatchSummary>(data['data']);
    }
    if (dataClassName == 'MatchChatSenderProfile') {
      return deserialize<_i13.MatchChatSenderProfile>(data['data']);
    }
    if (dataClassName == 'LocationPagination') {
      return deserialize<_i14.LocationPagination>(data['data']);
    }
    if (dataClassName == 'MatchScheduleInfo') {
      return deserialize<_i15.MatchScheduleInfo>(data['data']);
    }
    if (dataClassName == 'MatchSchedulePlayerSnapshot') {
      return deserialize<_i16.MatchSchedulePlayerSnapshot>(data['data']);
    }
    if (dataClassName == 'SubscribedMatchesPagination') {
      return deserialize<_i17.SubscribedMatchesPagination>(data['data']);
    }
    if (dataClassName == 'PlatformStats') {
      return deserialize<_i18.PlatformStats>(data['data']);
    }
    if (dataClassName == 'PlayerStats') {
      return deserialize<_i19.PlayerStats>(data['data']);
    }
    if (dataClassName == 'Post') {
      return deserialize<_i20.Post>(data['data']);
    }
    if (dataClassName == 'PostComment') {
      return deserialize<_i21.PostComment>(data['data']);
    }
    if (dataClassName == 'AnonymousPlayer') {
      return deserialize<_i22.AnonymousPlayer>(data['data']);
    }
    if (dataClassName == 'Country') {
      return deserialize<_i23.Country>(data['data']);
    }
    if (dataClassName == 'Faction') {
      return deserialize<_i24.Faction>(data['data']);
    }
    if (dataClassName == 'GeoLocation') {
      return deserialize<_i25.GeoLocation>(data['data']);
    }
    if (dataClassName == 'Language') {
      return deserialize<_i26.Language>(data['data']);
    }
    if (dataClassName == 'MatchPodium') {
      return deserialize<_i27.MatchPodium>(data['data']);
    }
    if (dataClassName == 'PlayerData') {
      return deserialize<_i28.PlayerData>(data['data']);
    }
    if (dataClassName == 'PlayerPushNotificationToken') {
      return deserialize<_i29.PlayerPushNotificationToken>(data['data']);
    }
    if (dataClassName == 'PushNotificationPlatform') {
      return deserialize<_i30.PushNotificationPlatform>(data['data']);
    }
    if (dataClassName == 'ServerSupportedTranslation') {
      return deserialize<_i31.ServerSupportedTranslation>(data['data']);
    }
    if (dataClassName == 'MatchInPersonProof') {
      return deserialize<_i32.MatchInPersonProof>(data['data']);
    }
    if (dataClassName == 'PlayedMatch') {
      return deserialize<_i33.PlayedMatch>(data['data']);
    }
    if (dataClassName == 'PlayerInMatch') {
      return deserialize<_i34.PlayerInMatch>(data['data']);
    }
    if (dataClassName == 'PlayerPerfomanceInMatch') {
      return deserialize<_i35.PlayerPerfomanceInMatch>(data['data']);
    }
    if (dataClassName == 'MatchChatHistory') {
      return deserialize<_i36.MatchChatHistory>(data['data']);
    }
    if (dataClassName == 'MatchChatMessage') {
      return deserialize<_i37.MatchChatMessage>(data['data']);
    }
    if (dataClassName == 'MatchChatMessageType') {
      return deserialize<_i38.MatchChatMessageType>(data['data']);
    }
    if (dataClassName == 'MatchChatParticipantState') {
      return deserialize<_i39.MatchChatParticipantState>(data['data']);
    }
    if (dataClassName == 'GooglePlaceLocation') {
      return deserialize<_i40.GooglePlaceLocation>(data['data']);
    }
    if (dataClassName == 'Location') {
      return deserialize<_i41.Location>(data['data']);
    }
    if (dataClassName == 'ManualInputLocation') {
      return deserialize<_i42.ManualInputLocation>(data['data']);
    }
    if (dataClassName == 'MatchSchedulePairingAttempt') {
      return deserialize<_i43.MatchSchedulePairingAttempt>(data['data']);
    }
    if (dataClassName == 'MatchSubscription') {
      return deserialize<_i44.MatchSubscription>(data['data']);
    }
    if (dataClassName == 'PaginationMetadata') {
      return deserialize<_i45.PaginationMetadata>(data['data']);
    }
    if (dataClassName == 'RootHubException') {
      return deserialize<_i46.RootHubException>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i53.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i54.Protocol().deserializeByClassName(data);
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
      return _i53.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i54.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
