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
import 'dart:async' as _i2;
import 'package:root_hub_client/src/protocol/entities/core/player_data.dart'
    as _i3;
import 'package:root_hub_client/src/protocol/entities/core/server_supported_translation.dart'
    as _i4;
import 'package:root_hub_client/src/protocol/entities/core/faction.dart' as _i5;
import 'package:root_hub_client/src/protocol/entities/core/geo_location.dart'
    as _i6;
import 'package:root_hub_client/src/protocol/api/account/models/reverse_geocode_city_result.dart'
    as _i7;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i8;
import 'dart:typed_data' as _i9;
import 'package:root_hub_client/src/protocol/entities/community/post_comment.dart'
    as _i10;
import 'package:root_hub_client/src/protocol/entities/core/language.dart'
    as _i11;
import 'package:root_hub_client/src/protocol/entities/community/post.dart'
    as _i12;
import 'package:root_hub_client/src/protocol/api/community/models/comments_pagination.dart'
    as _i13;
import 'package:root_hub_client/src/protocol/api/community/models/post_pagination.dart'
    as _i14;
import 'package:root_hub_client/src/protocol/entities/match_making/match_schedule.dart'
    as _i15;
import 'package:root_hub_client/src/protocol/entities/match_making/match_schedule_not_played_reason.dart'
    as _i16;
import 'package:root_hub_client/src/protocol/entities/core/anonymous_player.dart'
    as _i17;
import 'package:root_hub_client/src/protocol/entities/match/played_match.dart'
    as _i18;
import 'package:root_hub_client/src/protocol/api/match/models/player_match_result_input.dart'
    as _i19;
import 'package:root_hub_client/src/protocol/api/match/models/registered_player_search_result.dart'
    as _i20;
import 'package:root_hub_client/src/protocol/api/match_chat/models/match_chat_activity_overview.dart'
    as _i21;
import 'package:root_hub_client/src/protocol/api/match_chat/models/match_chat_messages_pagination.dart'
    as _i22;
import 'package:root_hub_client/src/protocol/api/match_chat/models/match_chat_played_match_summary.dart'
    as _i23;
import 'package:root_hub_client/src/protocol/entities/match_making/chat/match_chat_message.dart'
    as _i24;
import 'package:root_hub_client/src/protocol/entities/core/match_podium.dart'
    as _i25;
import 'package:root_hub_client/src/protocol/entities/match_making/location.dart'
    as _i26;
import 'package:root_hub_client/src/protocol/api/match_making/models/match_schedule_info.dart'
    as _i27;
import 'package:root_hub_client/src/protocol/api/match_making/models/subscribed_matches_pagination.dart'
    as _i28;
import 'package:root_hub_client/src/protocol/entities/match_making/match_subscription.dart'
    as _i29;
import 'package:root_hub_client/src/protocol/entities/core/push_notification_platform.dart'
    as _i30;
import 'package:root_hub_client/src/protocol/api/stats/models/platform_stats.dart'
    as _i31;
import 'package:root_hub_client/src/protocol/api/stats/models/player_stats.dart'
    as _i32;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i33;
import 'protocol.dart' as _i34;

/// {@category Endpoint}
class EndpointCreatePlayerData extends _i1.EndpointRef {
  EndpointCreatePlayerData(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'createPlayerData';

  _i2.Future<_i3.PlayerData> v1({
    required _i4.ServerSupportedTranslation language,
    required String displayName,
    required _i5.Faction favoriteFaction,
    required _i6.GeoLocation currentLocation,
  }) => caller.callServerEndpoint<_i3.PlayerData>(
    'createPlayerData',
    'v1',
    {
      'language': language,
      'displayName': displayName,
      'favoriteFaction': favoriteFaction,
      'currentLocation': currentLocation,
    },
  );
}

/// {@category Endpoint}
class EndpointGetPlayerData extends _i1.EndpointRef {
  EndpointGetPlayerData(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'getPlayerData';

  _i2.Future<_i3.PlayerData?> v1({
    required _i4.ServerSupportedTranslation language,
  }) => caller.callServerEndpoint<_i3.PlayerData?>(
    'getPlayerData',
    'v1',
    {'language': language},
  );
}

/// {@category Endpoint}
class EndpointReverseGeocodeCity extends _i1.EndpointRef {
  EndpointReverseGeocodeCity(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'reverseGeocodeCity';

  _i2.Future<_i7.ReverseGeocodeCityResult?> v1({
    required _i4.ServerSupportedTranslation language,
    required double x,
    required double y,
  }) => caller.callServerEndpoint<_i7.ReverseGeocodeCityResult?>(
    'reverseGeocodeCity',
    'v1',
    {
      'language': language,
      'x': x,
      'y': y,
    },
  );
}

/// {@category Endpoint}
class EndpointUpdatePlayerData extends _i1.EndpointRef {
  EndpointUpdatePlayerData(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'updatePlayerData';

  _i2.Future<_i3.PlayerData> v1({
    required _i4.ServerSupportedTranslation language,
    String? displayName,
    _i5.Faction? favoriteFaction,
    _i6.GeoLocation? currentLocation,
  }) => caller.callServerEndpoint<_i3.PlayerData>(
    'updatePlayerData',
    'v1',
    {
      'language': language,
      'displayName': displayName,
      'favoriteFaction': favoriteFaction,
      'currentLocation': currentLocation,
    },
  );
}

/// {@category Endpoint}
class EndpointUserProfileEdit extends _i8.EndpointUserProfileEditBase {
  EndpointUserProfileEdit(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'userProfileEdit';

  /// Removes the user's uploaded image, setting it to null.
  ///
  /// The client should handle displaying a placeholder for users without images.
  @override
  _i2.Future<_i8.UserProfileModel> removeUserImage() =>
      caller.callServerEndpoint<_i8.UserProfileModel>(
        'userProfileEdit',
        'removeUserImage',
        {},
      );

  /// Sets a new user image for the signed in user.
  @override
  _i2.Future<_i8.UserProfileModel> setUserImage(_i9.ByteData image) =>
      caller.callServerEndpoint<_i8.UserProfileModel>(
        'userProfileEdit',
        'setUserImage',
        {'image': image},
      );

  /// Changes the name of a user.
  @override
  _i2.Future<_i8.UserProfileModel> changeUserName(String? userName) =>
      caller.callServerEndpoint<_i8.UserProfileModel>(
        'userProfileEdit',
        'changeUserName',
        {'userName': userName},
      );

  /// Changes the full name of a user.
  @override
  _i2.Future<_i8.UserProfileModel> changeFullName(String? fullName) =>
      caller.callServerEndpoint<_i8.UserProfileModel>(
        'userProfileEdit',
        'changeFullName',
        {'fullName': fullName},
      );

  /// Returns the user profile of the current user.
  @override
  _i2.Future<_i8.UserProfileModel> get() =>
      caller.callServerEndpoint<_i8.UserProfileModel>(
        'userProfileEdit',
        'get',
        {},
      );
}

/// {@category Endpoint}
class EndpointCreateComment extends _i1.EndpointRef {
  EndpointCreateComment(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'createComment';

  _i2.Future<_i10.PostComment> v1({
    required _i4.ServerSupportedTranslation language,
    required int postId,
    required String content,
    required _i11.Language commentLanguage,
  }) => caller.callServerEndpoint<_i10.PostComment>(
    'createComment',
    'v1',
    {
      'language': language,
      'postId': postId,
      'content': content,
      'commentLanguage': commentLanguage,
    },
  );
}

/// {@category Endpoint}
class EndpointCreatePost extends _i1.EndpointRef {
  EndpointCreatePost(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'createPost';

  _i2.Future<_i12.Post> v1({
    required _i4.ServerSupportedTranslation language,
    required String title,
    required String content,
    required _i11.Language postLanguage,
    int? attachedMatchId,
  }) => caller.callServerEndpoint<_i12.Post>(
    'createPost',
    'v1',
    {
      'language': language,
      'title': title,
      'content': content,
      'postLanguage': postLanguage,
      'attachedMatchId': attachedMatchId,
    },
  );
}

/// {@category Endpoint}
class EndpointGetComments extends _i1.EndpointRef {
  EndpointGetComments(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'getComments';

  _i2.Future<_i13.CommentsPagination> v1({
    required _i4.ServerSupportedTranslation language,
    required int postId,
    required int page,
  }) => caller.callServerEndpoint<_i13.CommentsPagination>(
    'getComments',
    'v1',
    {
      'language': language,
      'postId': postId,
      'page': page,
    },
  );
}

/// {@category Endpoint}
class EndpointGetPosts extends _i1.EndpointRef {
  EndpointGetPosts(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'getPosts';

  _i2.Future<_i14.PostPagination> v1({
    required _i4.ServerSupportedTranslation language,
    required int page,
    _i11.Language? postLanguage,
  }) => caller.callServerEndpoint<_i14.PostPagination>(
    'getPosts',
    'v1',
    {
      'language': language,
      'page': page,
      'postLanguage': postLanguage,
    },
  );
}

/// {@category Endpoint}
class EndpointCancelMatchSchedule extends _i1.EndpointRef {
  EndpointCancelMatchSchedule(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'cancelMatchSchedule';

  _i2.Future<_i15.MatchSchedulePairingAttempt> v1({
    required _i4.ServerSupportedTranslation language,
    required int scheduledMatchId,
    required _i16.MatchScheduleNotPlayedReason notPlayedReason,
    String? notPlayedReasonDetails,
  }) => caller.callServerEndpoint<_i15.MatchSchedulePairingAttempt>(
    'cancelMatchSchedule',
    'v1',
    {
      'language': language,
      'scheduledMatchId': scheduledMatchId,
      'notPlayedReason': notPlayedReason,
      'notPlayedReasonDetails': notPlayedReasonDetails,
    },
  );
}

/// {@category Endpoint}
class EndpointCreateAnonymousPlayer extends _i1.EndpointRef {
  EndpointCreateAnonymousPlayer(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'createAnonymousPlayer';

  _i2.Future<_i17.AnonymousPlayer> v1({
    required _i4.ServerSupportedTranslation language,
    required String firstName,
    required String lastName,
  }) => caller.callServerEndpoint<_i17.AnonymousPlayer>(
    'createAnonymousPlayer',
    'v1',
    {
      'language': language,
      'firstName': firstName,
      'lastName': lastName,
    },
  );
}

/// {@category Endpoint}
class EndpointGetMyAnonymousPlayers extends _i1.EndpointRef {
  EndpointGetMyAnonymousPlayers(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'getMyAnonymousPlayers';

  _i2.Future<List<_i17.AnonymousPlayer>> v1({
    required _i4.ServerSupportedTranslation language,
  }) => caller.callServerEndpoint<List<_i17.AnonymousPlayer>>(
    'getMyAnonymousPlayers',
    'v1',
    {'language': language},
  );
}

/// {@category Endpoint}
class EndpointGetMyMatches extends _i1.EndpointRef {
  EndpointGetMyMatches(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'getMyMatches';

  _i2.Future<List<_i18.PlayedMatch>> v1({
    required _i4.ServerSupportedTranslation language,
  }) => caller.callServerEndpoint<List<_i18.PlayedMatch>>(
    'getMyMatches',
    'v1',
    {'language': language},
  );
}

/// {@category Endpoint}
class EndpointGetPendingMatchResults extends _i1.EndpointRef {
  EndpointGetPendingMatchResults(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'getPendingMatchResults';

  _i2.Future<List<_i15.MatchSchedulePairingAttempt>> v1({
    required _i4.ServerSupportedTranslation language,
  }) => caller.callServerEndpoint<List<_i15.MatchSchedulePairingAttempt>>(
    'getPendingMatchResults',
    'v1',
    {'language': language},
  );
}

/// {@category Endpoint}
class EndpointGetPendingMatchResultsCount extends _i1.EndpointRef {
  EndpointGetPendingMatchResultsCount(_i1.EndpointCaller caller)
    : super(caller);

  @override
  String get name => 'getPendingMatchResultsCount';

  _i2.Future<int> v1({required _i4.ServerSupportedTranslation language}) =>
      caller.callServerEndpoint<int>(
        'getPendingMatchResultsCount',
        'v1',
        {'language': language},
      );
}

/// {@category Endpoint}
class EndpointRegisterMatchData extends _i1.EndpointRef {
  EndpointRegisterMatchData(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'registerMatchData';

  _i2.Future<_i18.PlayedMatch> v1({
    required _i4.ServerSupportedTranslation language,
    required DateTime matchStartedAt,
    required Duration matchEstimatedDuration,
    required int locationId,
    required int scheduledPairingAttemptId,
    required List<_i19.PlayerMatchResultInput> players,
    required _i9.ByteData groupPhotoBytes,
    String? groupPhotoFileName,
    String? groupPhotoContentType,
    required _i9.ByteData boardPhotoBytes,
    String? boardPhotoFileName,
    String? boardPhotoContentType,
  }) => caller.callServerEndpoint<_i18.PlayedMatch>(
    'registerMatchData',
    'v1',
    {
      'language': language,
      'matchStartedAt': matchStartedAt,
      'matchEstimatedDuration': matchEstimatedDuration,
      'locationId': locationId,
      'scheduledPairingAttemptId': scheduledPairingAttemptId,
      'players': players,
      'groupPhotoBytes': groupPhotoBytes,
      'groupPhotoFileName': groupPhotoFileName,
      'groupPhotoContentType': groupPhotoContentType,
      'boardPhotoBytes': boardPhotoBytes,
      'boardPhotoFileName': boardPhotoFileName,
      'boardPhotoContentType': boardPhotoContentType,
    },
  );
}

/// {@category Endpoint}
class EndpointSearchRegisteredPlayers extends _i1.EndpointRef {
  EndpointSearchRegisteredPlayers(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'searchRegisteredPlayers';

  _i2.Future<List<_i20.RegisteredPlayerSearchResult>> v1({
    required _i4.ServerSupportedTranslation language,
    required String query,
  }) => caller.callServerEndpoint<List<_i20.RegisteredPlayerSearchResult>>(
    'searchRegisteredPlayers',
    'v1',
    {
      'language': language,
      'query': query,
    },
  );
}

/// {@category Endpoint}
class EndpointGetMatchChatActivityOverview extends _i1.EndpointRef {
  EndpointGetMatchChatActivityOverview(_i1.EndpointCaller caller)
    : super(caller);

  @override
  String get name => 'getMatchChatActivityOverview';

  _i2.Future<_i21.MatchChatActivityOverview> v1({
    required _i4.ServerSupportedTranslation language,
  }) => caller.callServerEndpoint<_i21.MatchChatActivityOverview>(
    'getMatchChatActivityOverview',
    'v1',
    {'language': language},
  );
}

/// {@category Endpoint}
class EndpointGetMatchChatMessage extends _i1.EndpointRef {
  EndpointGetMatchChatMessage(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'getMatchChatMessage';

  _i2.Future<_i22.MatchChatMessagesPagination> v1({
    required _i4.ServerSupportedTranslation language,
    required int scheduledMatchId,
    required int page,
  }) => caller.callServerEndpoint<_i22.MatchChatMessagesPagination>(
    'getMatchChatMessage',
    'v1',
    {
      'language': language,
      'scheduledMatchId': scheduledMatchId,
      'page': page,
    },
  );
}

/// {@category Endpoint}
class EndpointGetMatchChatPlayedMatchSummary extends _i1.EndpointRef {
  EndpointGetMatchChatPlayedMatchSummary(_i1.EndpointCaller caller)
    : super(caller);

  @override
  String get name => 'getMatchChatPlayedMatchSummary';

  _i2.Future<_i23.MatchChatPlayedMatchSummary?> v1({
    required _i4.ServerSupportedTranslation language,
    required int scheduledMatchId,
  }) => caller.callServerEndpoint<_i23.MatchChatPlayedMatchSummary?>(
    'getMatchChatPlayedMatchSummary',
    'v1',
    {
      'language': language,
      'scheduledMatchId': scheduledMatchId,
    },
  );
}

/// {@category Endpoint}
class EndpointGetMatchChatUnreadCount extends _i1.EndpointRef {
  EndpointGetMatchChatUnreadCount(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'getMatchChatUnreadCount';

  _i2.Future<int> v1({required _i4.ServerSupportedTranslation language}) =>
      caller.callServerEndpoint<int>(
        'getMatchChatUnreadCount',
        'v1',
        {'language': language},
      );
}

/// {@category Endpoint}
class EndpointSendMatchChatMessage extends _i1.EndpointRef {
  EndpointSendMatchChatMessage(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'sendMatchChatMessage';

  _i2.Future<_i24.MatchChatMessage> v1({
    required _i4.ServerSupportedTranslation language,
    required int scheduledMatchId,
    required String content,
    _i9.ByteData? imageBytes,
    String? imageFileName,
    String? imageContentType,
  }) => caller.callServerEndpoint<_i24.MatchChatMessage>(
    'sendMatchChatMessage',
    'v1',
    {
      'language': language,
      'scheduledMatchId': scheduledMatchId,
      'content': content,
      'imageBytes': imageBytes,
      'imageFileName': imageFileName,
      'imageContentType': imageContentType,
    },
  );
}

/// {@category Endpoint}
class EndpointCreateMatchSchedule extends _i1.EndpointRef {
  EndpointCreateMatchSchedule(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'createMatchSchedule';

  _i2.Future<_i15.MatchSchedulePairingAttempt> v1({
    required _i4.ServerSupportedTranslation language,
    required String title,
    String? description,
    required _i25.MatchPodium minAmountOfPlayers,
    required _i25.MatchPodium maxAmountOfPlayers,
    required DateTime attemptedAt,
    required int locationId,
    required bool hostWillPlay,
  }) => caller.callServerEndpoint<_i15.MatchSchedulePairingAttempt>(
    'createMatchSchedule',
    'v1',
    {
      'language': language,
      'title': title,
      'description': description,
      'minAmountOfPlayers': minAmountOfPlayers,
      'maxAmountOfPlayers': maxAmountOfPlayers,
      'attemptedAt': attemptedAt,
      'locationId': locationId,
      'hostWillPlay': hostWillPlay,
    },
  );
}

/// {@category Endpoint}
class EndpointEditMatchSchedule extends _i1.EndpointRef {
  EndpointEditMatchSchedule(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'editMatchSchedule';

  _i2.Future<void> v1({
    required _i4.ServerSupportedTranslation language,
    required int scheduledMatchId,
    required String title,
    String? description,
    required _i25.MatchPodium minAmountOfPlayers,
    required _i25.MatchPodium maxAmountOfPlayers,
    required DateTime attemptedAt,
    bool? closedForSubscriptions,
  }) => caller.callServerEndpoint<void>(
    'editMatchSchedule',
    'v1',
    {
      'language': language,
      'scheduledMatchId': scheduledMatchId,
      'title': title,
      'description': description,
      'minAmountOfPlayers': minAmountOfPlayers,
      'maxAmountOfPlayers': maxAmountOfPlayers,
      'attemptedAt': attemptedAt,
      'closedForSubscriptions': closedForSubscriptions,
    },
  );
}

/// {@category Endpoint}
class EndpointGetMatchLocation extends _i1.EndpointRef {
  EndpointGetMatchLocation(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'getMatchLocation';

  _i2.Future<List<_i26.Location>> v1({
    required _i4.ServerSupportedTranslation language,
    required String query,
    required int page,
  }) => caller.callServerEndpoint<List<_i26.Location>>(
    'getMatchLocation',
    'v1',
    {
      'language': language,
      'query': query,
      'page': page,
    },
  );
}

/// {@category Endpoint}
class EndpointGetMatchScheduleInfo extends _i1.EndpointRef {
  EndpointGetMatchScheduleInfo(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'getMatchScheduleInfo';

  _i2.Future<_i27.MatchScheduleInfo> v1({
    required _i4.ServerSupportedTranslation language,
    required int scheduledMatchId,
  }) => caller.callServerEndpoint<_i27.MatchScheduleInfo>(
    'getMatchScheduleInfo',
    'v1',
    {
      'language': language,
      'scheduledMatchId': scheduledMatchId,
    },
  );
}

/// {@category Endpoint}
class EndpointGetPlayerSubscribedMatches extends _i1.EndpointRef {
  EndpointGetPlayerSubscribedMatches(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'getPlayerSubscribedMatches';

  _i2.Future<_i28.SubscribedMatchesPagination> v1({
    required _i4.ServerSupportedTranslation language,
    required int page,
  }) => caller.callServerEndpoint<_i28.SubscribedMatchesPagination>(
    'getPlayerSubscribedMatches',
    'v1',
    {
      'language': language,
      'page': page,
    },
  );
}

/// {@category Endpoint}
class EndpointGetTablesInArea extends _i1.EndpointRef {
  EndpointGetTablesInArea(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'getTablesInArea';

  _i2.Future<List<_i15.MatchSchedulePairingAttempt>> v1({
    required _i4.ServerSupportedTranslation language,
  }) => caller.callServerEndpoint<List<_i15.MatchSchedulePairingAttempt>>(
    'getTablesInArea',
    'v1',
    {'language': language},
  );
}

/// {@category Endpoint}
class EndpointRemovePlayerFromMatch extends _i1.EndpointRef {
  EndpointRemovePlayerFromMatch(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'removePlayerFromMatch';

  _i2.Future<void> v1({
    required _i4.ServerSupportedTranslation language,
    required int scheduledMatchId,
    required int playerDataId,
  }) => caller.callServerEndpoint<void>(
    'removePlayerFromMatch',
    'v1',
    {
      'language': language,
      'scheduledMatchId': scheduledMatchId,
      'playerDataId': playerDataId,
    },
  );
}

/// {@category Endpoint}
class EndpointSubscribeToMatch extends _i1.EndpointRef {
  EndpointSubscribeToMatch(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'subscribeToMatch';

  _i2.Future<_i29.MatchSubscription> v1({
    required _i4.ServerSupportedTranslation language,
    required int scheduledMatchId,
  }) => caller.callServerEndpoint<_i29.MatchSubscription>(
    'subscribeToMatch',
    'v1',
    {
      'language': language,
      'scheduledMatchId': scheduledMatchId,
    },
  );
}

/// {@category Endpoint}
class EndpointUnsubscribeFromMatch extends _i1.EndpointRef {
  EndpointUnsubscribeFromMatch(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'unsubscribeFromMatch';

  _i2.Future<void> v1({
    required _i4.ServerSupportedTranslation language,
    required int scheduledMatchId,
  }) => caller.callServerEndpoint<void>(
    'unsubscribeFromMatch',
    'v1',
    {
      'language': language,
      'scheduledMatchId': scheduledMatchId,
    },
  );
}

/// {@category Endpoint}
class EndpointDeactivatePushNotificationToken extends _i1.EndpointRef {
  EndpointDeactivatePushNotificationToken(_i1.EndpointCaller caller)
    : super(caller);

  @override
  String get name => 'deactivatePushNotificationToken';

  _i2.Future<void> v1({
    required _i4.ServerSupportedTranslation language,
    required String token,
  }) => caller.callServerEndpoint<void>(
    'deactivatePushNotificationToken',
    'v1',
    {
      'language': language,
      'token': token,
    },
  );
}

/// {@category Endpoint}
class EndpointSyncPushNotificationToken extends _i1.EndpointRef {
  EndpointSyncPushNotificationToken(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'syncPushNotificationToken';

  _i2.Future<void> v1({
    required _i4.ServerSupportedTranslation language,
    required String token,
    required _i30.PushNotificationPlatform platform,
  }) => caller.callServerEndpoint<void>(
    'syncPushNotificationToken',
    'v1',
    {
      'language': language,
      'token': token,
      'platform': platform,
    },
  );
}

/// {@category Endpoint}
class EndpointGetPlatformStats extends _i1.EndpointRef {
  EndpointGetPlatformStats(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'getPlatformStats';

  _i2.Future<_i31.PlatformStats?> v1({
    required _i4.ServerSupportedTranslation language,
  }) => caller.callServerEndpoint<_i31.PlatformStats?>(
    'getPlatformStats',
    'v1',
    {'language': language},
  );
}

/// {@category Endpoint}
class EndpointGetPlayerStats extends _i1.EndpointRef {
  EndpointGetPlayerStats(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'getPlayerStats';

  _i2.Future<_i32.PlayerStats?> v1({
    required _i4.ServerSupportedTranslation language,
  }) => caller.callServerEndpoint<_i32.PlayerStats?>(
    'getPlayerStats',
    'v1',
    {'language': language},
  );
}

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
/// {@category Endpoint}
class EndpointEmailIdp extends _i33.EndpointEmailIdpBase {
  EndpointEmailIdp(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  /// Logs in the user and returns a new session.
  ///
  /// Throws an [EmailAccountLoginException] in case of errors, with reason:
  /// - [EmailAccountLoginExceptionReason.invalidCredentials] if the email or
  ///   password is incorrect.
  /// - [EmailAccountLoginExceptionReason.tooManyAttempts] if there have been
  ///   too many failed login attempts.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i2.Future<_i8.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_i8.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  /// Starts the registration for a new user account with an email-based login
  /// associated to it.
  ///
  /// Upon successful completion of this method, an email will have been
  /// sent to [email] with a verification link, which the user must open to
  /// complete the registration.
  ///
  /// Always returns a account request ID, which can be used to complete the
  /// registration. If the email is already registered, the returned ID will not
  /// be valid.
  @override
  _i2.Future<_i1.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_i1.UuidValue>(
        'emailIdp',
        'startRegistration',
        {'email': email},
      );

  /// Verifies an account request code and returns a token
  /// that can be used to complete the account creation.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if no request exists
  ///   for the given [accountRequestId] or [verificationCode] is invalid.
  @override
  _i2.Future<String> verifyRegistrationCode({
    required _i1.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a new account registration, creating a new auth user with a
  /// profile and attaching the given email account to it.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [registrationToken]
  ///   is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  ///
  /// Returns a session for the newly created user.
  @override
  _i2.Future<_i8.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_i8.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
  );

  /// Requests a password reset for [email].
  ///
  /// If the email address is registered, an email with reset instructions will
  /// be send out. If the email is unknown, this method will have no effect.
  ///
  /// Always returns a password reset request ID, which can be used to complete
  /// the reset. If the email is not registered, the returned ID will not be
  /// valid.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to request a password reset.
  ///
  @override
  _i2.Future<_i1.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_i1.UuidValue>(
        'emailIdp',
        'startPasswordReset',
        {'email': email},
      );

  /// Verifies a password reset code and returns a finishPasswordResetToken
  /// that can be used to finish the password reset.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to verify the password reset.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// If multiple steps are required to complete the password reset, this endpoint
  /// should be overridden to return credentials for the next step instead
  /// of the credentials for setting the password.
  @override
  _i2.Future<String> verifyPasswordResetCode({
    required _i1.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a password reset request by setting a new password.
  ///
  /// The [verificationCode] returned from [verifyPasswordResetCode] is used to
  /// validate the password reset request.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.policyViolation] if the new
  ///   password does not comply with the password policy.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i2.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );

  @override
  _i2.Future<bool> hasAccount() => caller.callServerEndpoint<bool>(
    'emailIdp',
    'hasAccount',
    {},
  );
}

/// By extending [GoogleIdpBaseEndpoint], the Google identity provider endpoints
/// are made available on the server and enable Google sign-in on the client.
/// {@category Endpoint}
class EndpointGoogleIdp extends _i33.EndpointGoogleIdpBase {
  EndpointGoogleIdp(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'googleIdp';

  /// Validates a Google ID token and either logs in the associated user or
  /// creates a new user account if the Google account ID is not yet known.
  ///
  /// If a new user is created an associated [UserProfile] is also created.
  @override
  _i2.Future<_i8.AuthSuccess> login({
    required String idToken,
    required String? accessToken,
  }) => caller.callServerEndpoint<_i8.AuthSuccess>(
    'googleIdp',
    'login',
    {
      'idToken': idToken,
      'accessToken': accessToken,
    },
  );

  @override
  _i2.Future<bool> hasAccount() => caller.callServerEndpoint<bool>(
    'googleIdp',
    'hasAccount',
    {},
  );
}

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
/// {@category Endpoint}
class EndpointJwtRefresh extends _i8.EndpointRefreshJwtTokens {
  EndpointJwtRefresh(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'jwtRefresh';

  /// Creates a new token pair for the given [refreshToken].
  ///
  /// Can throw the following exceptions:
  /// -[RefreshTokenMalformedException]: refresh token is malformed and could
  ///   not be parsed. Not expected to happen for tokens issued by the server.
  /// -[RefreshTokenNotFoundException]: refresh token is unknown to the server.
  ///   Either the token was deleted or generated by a different server.
  /// -[RefreshTokenExpiredException]: refresh token has expired. Will happen
  ///   only if it has not been used within configured `refreshTokenLifetime`.
  /// -[RefreshTokenInvalidSecretException]: refresh token is incorrect, meaning
  ///   it does not refer to the current secret refresh token. This indicates
  ///   either a malfunctioning client or a malicious attempt by someone who has
  ///   obtained the refresh token. In this case the underlying refresh token
  ///   will be deleted, and access to it will expire fully when the last access
  ///   token is elapsed.
  ///
  /// This endpoint is unauthenticated, meaning the client won't include any
  /// authentication information with the call.
  @override
  _i2.Future<_i8.AuthSuccess> refreshAccessToken({
    required String refreshToken,
  }) => caller.callServerEndpoint<_i8.AuthSuccess>(
    'jwtRefresh',
    'refreshAccessToken',
    {'refreshToken': refreshToken},
    authenticated: false,
  );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _i33.Caller(client);
    serverpod_auth_core = _i8.Caller(client);
  }

  late final _i33.Caller serverpod_auth_idp;

  late final _i8.Caller serverpod_auth_core;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    @Deprecated(
      'Use authKeyProvider instead. This will be removed in future releases.',
    )
    super.authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
         host,
         _i34.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    createPlayerData = EndpointCreatePlayerData(this);
    getPlayerData = EndpointGetPlayerData(this);
    reverseGeocodeCity = EndpointReverseGeocodeCity(this);
    updatePlayerData = EndpointUpdatePlayerData(this);
    userProfileEdit = EndpointUserProfileEdit(this);
    createComment = EndpointCreateComment(this);
    createPost = EndpointCreatePost(this);
    getComments = EndpointGetComments(this);
    getPosts = EndpointGetPosts(this);
    cancelMatchSchedule = EndpointCancelMatchSchedule(this);
    createAnonymousPlayer = EndpointCreateAnonymousPlayer(this);
    getMyAnonymousPlayers = EndpointGetMyAnonymousPlayers(this);
    getMyMatches = EndpointGetMyMatches(this);
    getPendingMatchResults = EndpointGetPendingMatchResults(this);
    getPendingMatchResultsCount = EndpointGetPendingMatchResultsCount(this);
    registerMatchData = EndpointRegisterMatchData(this);
    searchRegisteredPlayers = EndpointSearchRegisteredPlayers(this);
    getMatchChatActivityOverview = EndpointGetMatchChatActivityOverview(this);
    getMatchChatMessage = EndpointGetMatchChatMessage(this);
    getMatchChatPlayedMatchSummary = EndpointGetMatchChatPlayedMatchSummary(
      this,
    );
    getMatchChatUnreadCount = EndpointGetMatchChatUnreadCount(this);
    sendMatchChatMessage = EndpointSendMatchChatMessage(this);
    createMatchSchedule = EndpointCreateMatchSchedule(this);
    editMatchSchedule = EndpointEditMatchSchedule(this);
    getMatchLocation = EndpointGetMatchLocation(this);
    getMatchScheduleInfo = EndpointGetMatchScheduleInfo(this);
    getPlayerSubscribedMatches = EndpointGetPlayerSubscribedMatches(this);
    getTablesInArea = EndpointGetTablesInArea(this);
    removePlayerFromMatch = EndpointRemovePlayerFromMatch(this);
    subscribeToMatch = EndpointSubscribeToMatch(this);
    unsubscribeFromMatch = EndpointUnsubscribeFromMatch(this);
    deactivatePushNotificationToken = EndpointDeactivatePushNotificationToken(
      this,
    );
    syncPushNotificationToken = EndpointSyncPushNotificationToken(this);
    getPlatformStats = EndpointGetPlatformStats(this);
    getPlayerStats = EndpointGetPlayerStats(this);
    emailIdp = EndpointEmailIdp(this);
    googleIdp = EndpointGoogleIdp(this);
    jwtRefresh = EndpointJwtRefresh(this);
    modules = Modules(this);
  }

  late final EndpointCreatePlayerData createPlayerData;

  late final EndpointGetPlayerData getPlayerData;

  late final EndpointReverseGeocodeCity reverseGeocodeCity;

  late final EndpointUpdatePlayerData updatePlayerData;

  late final EndpointUserProfileEdit userProfileEdit;

  late final EndpointCreateComment createComment;

  late final EndpointCreatePost createPost;

  late final EndpointGetComments getComments;

  late final EndpointGetPosts getPosts;

  late final EndpointCancelMatchSchedule cancelMatchSchedule;

  late final EndpointCreateAnonymousPlayer createAnonymousPlayer;

  late final EndpointGetMyAnonymousPlayers getMyAnonymousPlayers;

  late final EndpointGetMyMatches getMyMatches;

  late final EndpointGetPendingMatchResults getPendingMatchResults;

  late final EndpointGetPendingMatchResultsCount getPendingMatchResultsCount;

  late final EndpointRegisterMatchData registerMatchData;

  late final EndpointSearchRegisteredPlayers searchRegisteredPlayers;

  late final EndpointGetMatchChatActivityOverview getMatchChatActivityOverview;

  late final EndpointGetMatchChatMessage getMatchChatMessage;

  late final EndpointGetMatchChatPlayedMatchSummary
  getMatchChatPlayedMatchSummary;

  late final EndpointGetMatchChatUnreadCount getMatchChatUnreadCount;

  late final EndpointSendMatchChatMessage sendMatchChatMessage;

  late final EndpointCreateMatchSchedule createMatchSchedule;

  late final EndpointEditMatchSchedule editMatchSchedule;

  late final EndpointGetMatchLocation getMatchLocation;

  late final EndpointGetMatchScheduleInfo getMatchScheduleInfo;

  late final EndpointGetPlayerSubscribedMatches getPlayerSubscribedMatches;

  late final EndpointGetTablesInArea getTablesInArea;

  late final EndpointRemovePlayerFromMatch removePlayerFromMatch;

  late final EndpointSubscribeToMatch subscribeToMatch;

  late final EndpointUnsubscribeFromMatch unsubscribeFromMatch;

  late final EndpointDeactivatePushNotificationToken
  deactivatePushNotificationToken;

  late final EndpointSyncPushNotificationToken syncPushNotificationToken;

  late final EndpointGetPlatformStats getPlatformStats;

  late final EndpointGetPlayerStats getPlayerStats;

  late final EndpointEmailIdp emailIdp;

  late final EndpointGoogleIdp googleIdp;

  late final EndpointJwtRefresh jwtRefresh;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
    'createPlayerData': createPlayerData,
    'getPlayerData': getPlayerData,
    'reverseGeocodeCity': reverseGeocodeCity,
    'updatePlayerData': updatePlayerData,
    'userProfileEdit': userProfileEdit,
    'createComment': createComment,
    'createPost': createPost,
    'getComments': getComments,
    'getPosts': getPosts,
    'cancelMatchSchedule': cancelMatchSchedule,
    'createAnonymousPlayer': createAnonymousPlayer,
    'getMyAnonymousPlayers': getMyAnonymousPlayers,
    'getMyMatches': getMyMatches,
    'getPendingMatchResults': getPendingMatchResults,
    'getPendingMatchResultsCount': getPendingMatchResultsCount,
    'registerMatchData': registerMatchData,
    'searchRegisteredPlayers': searchRegisteredPlayers,
    'getMatchChatActivityOverview': getMatchChatActivityOverview,
    'getMatchChatMessage': getMatchChatMessage,
    'getMatchChatPlayedMatchSummary': getMatchChatPlayedMatchSummary,
    'getMatchChatUnreadCount': getMatchChatUnreadCount,
    'sendMatchChatMessage': sendMatchChatMessage,
    'createMatchSchedule': createMatchSchedule,
    'editMatchSchedule': editMatchSchedule,
    'getMatchLocation': getMatchLocation,
    'getMatchScheduleInfo': getMatchScheduleInfo,
    'getPlayerSubscribedMatches': getPlayerSubscribedMatches,
    'getTablesInArea': getTablesInArea,
    'removePlayerFromMatch': removePlayerFromMatch,
    'subscribeToMatch': subscribeToMatch,
    'unsubscribeFromMatch': unsubscribeFromMatch,
    'deactivatePushNotificationToken': deactivatePushNotificationToken,
    'syncPushNotificationToken': syncPushNotificationToken,
    'getPlatformStats': getPlatformStats,
    'getPlayerStats': getPlayerStats,
    'emailIdp': emailIdp,
    'googleIdp': googleIdp,
    'jwtRefresh': jwtRefresh,
  };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}
