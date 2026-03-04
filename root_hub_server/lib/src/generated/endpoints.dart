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
import 'package:serverpod/serverpod.dart' as _i1;
import '../api/account/create_player_data.dart' as _i2;
import '../api/account/get_player_data.dart' as _i3;
import '../api/account/reverse_geocode_city.dart' as _i4;
import '../api/account/update_player_data.dart' as _i5;
import '../api/account/user_profile_edit.dart' as _i6;
import '../api/community/create_comment_endpoint.dart' as _i7;
import '../api/community/create_post_endpoint.dart' as _i8;
import '../api/community/get_comments_endpoint.dart' as _i9;
import '../api/community/get_posts_endpoint.dart' as _i10;
import '../api/match/cancel_match_schedule.dart' as _i11;
import '../api/match/create_anonymous_player.dart' as _i12;
import '../api/match/get_my_anonymous_players.dart' as _i13;
import '../api/match/get_my_played_matches.dart' as _i14;
import '../api/match/get_pending_match_results.dart' as _i15;
import '../api/match/get_pending_match_results_count.dart' as _i16;
import '../api/match/prepare_match_proof_upload.dart' as _i17;
import '../api/match/register_match_data.dart' as _i18;
import '../api/match/search_registered_players.dart' as _i19;
import '../api/match_chat/get_match_chat_activity_overview.dart' as _i20;
import '../api/match_chat/get_match_chat_message.dart' as _i21;
import '../api/match_chat/get_match_chat_played_match_summary.dart' as _i22;
import '../api/match_chat/get_match_chat_unread_count.dart' as _i23;
import '../api/match_chat/send_match_chat_message.dart' as _i24;
import '../api/match_making/create_match_schedule.dart' as _i25;
import '../api/match_making/edit_match_schedule.dart' as _i26;
import '../api/match_making/get_match_location.dart' as _i27;
import '../api/match_making/get_match_location_photo.dart' as _i28;
import '../api/match_making/get_match_schedule_info.dart' as _i29;
import '../api/match_making/get_player_subscribed_matches.dart' as _i30;
import '../api/match_making/get_tables_in_area.dart' as _i31;
import '../api/match_making/remove_player_from_match.dart' as _i32;
import '../api/match_making/subscribe_to_match.dart' as _i33;
import '../api/match_making/unsubscribe_from_match.dart' as _i34;
import '../api/push_notifications/deactivate_push_notification_token.dart'
    as _i35;
import '../api/push_notifications/sync_push_notification_token.dart' as _i36;
import '../api/stats/get_platform_stats.dart' as _i37;
import '../api/stats/get_player_stats.dart' as _i38;
import '../api/stats/get_web_analytics_dashboard.dart' as _i39;
import '../auth/email_idp_endpoint.dart' as _i40;
import '../auth/google_idp_endpoint.dart' as _i41;
import '../auth/jwt_refresh_endpoint.dart' as _i42;
import 'package:root_hub_server/src/generated/entities/core/server_supported_translation.dart'
    as _i43;
import 'package:root_hub_server/src/generated/entities/core/faction.dart'
    as _i44;
import 'package:root_hub_server/src/generated/entities/core/geo_location.dart'
    as _i45;
import 'package:root_hub_server/src/generated/entities/core/language.dart'
    as _i46;
import 'dart:typed_data' as _i47;
import 'package:root_hub_server/src/generated/entities/match_making/match_schedule_not_played_reason.dart'
    as _i48;
import 'package:root_hub_server/src/generated/api/match/models/player_match_result_input.dart'
    as _i49;
import 'package:root_hub_server/src/generated/entities/core/match_podium.dart'
    as _i50;
import 'package:root_hub_server/src/generated/entities/core/push_notification_platform.dart'
    as _i51;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i52;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i53;
import 'package:root_hub_server/src/generated/future_calls.dart' as _i54;
export 'future_calls.dart' show ServerpodFutureCallsGetter;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'createPlayerData': _i2.CreatePlayerData()
        ..initialize(
          server,
          'createPlayerData',
          null,
        ),
      'getPlayerData': _i3.GetPlayerData()
        ..initialize(
          server,
          'getPlayerData',
          null,
        ),
      'reverseGeocodeCity': _i4.ReverseGeocodeCity()
        ..initialize(
          server,
          'reverseGeocodeCity',
          null,
        ),
      'updatePlayerData': _i5.UpdatePlayerData()
        ..initialize(
          server,
          'updatePlayerData',
          null,
        ),
      'userProfileEdit': _i6.UserProfileEdit()
        ..initialize(
          server,
          'userProfileEdit',
          null,
        ),
      'createComment': _i7.CreateCommentEndpoint()
        ..initialize(
          server,
          'createComment',
          null,
        ),
      'createPost': _i8.CreatePostEndpoint()
        ..initialize(
          server,
          'createPost',
          null,
        ),
      'getComments': _i9.GetCommentsEndpoint()
        ..initialize(
          server,
          'getComments',
          null,
        ),
      'getPosts': _i10.GetPostsEndpoint()
        ..initialize(
          server,
          'getPosts',
          null,
        ),
      'cancelMatchSchedule': _i11.CancelMatchSchedule()
        ..initialize(
          server,
          'cancelMatchSchedule',
          null,
        ),
      'createAnonymousPlayer': _i12.CreateAnonymousPlayer()
        ..initialize(
          server,
          'createAnonymousPlayer',
          null,
        ),
      'getMyAnonymousPlayers': _i13.GetMyAnonymousPlayers()
        ..initialize(
          server,
          'getMyAnonymousPlayers',
          null,
        ),
      'getMyMatches': _i14.GetMyMatches()
        ..initialize(
          server,
          'getMyMatches',
          null,
        ),
      'getPendingMatchResults': _i15.GetPendingMatchResults()
        ..initialize(
          server,
          'getPendingMatchResults',
          null,
        ),
      'getPendingMatchResultsCount': _i16.GetPendingMatchResultsCount()
        ..initialize(
          server,
          'getPendingMatchResultsCount',
          null,
        ),
      'prepareMatchProofUpload': _i17.PrepareMatchProofUpload()
        ..initialize(
          server,
          'prepareMatchProofUpload',
          null,
        ),
      'registerMatchData': _i18.RegisterMatchData()
        ..initialize(
          server,
          'registerMatchData',
          null,
        ),
      'searchRegisteredPlayers': _i19.SearchRegisteredPlayers()
        ..initialize(
          server,
          'searchRegisteredPlayers',
          null,
        ),
      'getMatchChatActivityOverview': _i20.GetMatchChatActivityOverview()
        ..initialize(
          server,
          'getMatchChatActivityOverview',
          null,
        ),
      'getMatchChatMessage': _i21.GetMatchChatMessage()
        ..initialize(
          server,
          'getMatchChatMessage',
          null,
        ),
      'getMatchChatPlayedMatchSummary': _i22.GetMatchChatPlayedMatchSummary()
        ..initialize(
          server,
          'getMatchChatPlayedMatchSummary',
          null,
        ),
      'getMatchChatUnreadCount': _i23.GetMatchChatUnreadCount()
        ..initialize(
          server,
          'getMatchChatUnreadCount',
          null,
        ),
      'sendMatchChatMessage': _i24.SendMatchChatMessage()
        ..initialize(
          server,
          'sendMatchChatMessage',
          null,
        ),
      'createMatchSchedule': _i25.CreateMatchSchedule()
        ..initialize(
          server,
          'createMatchSchedule',
          null,
        ),
      'editMatchSchedule': _i26.EditMatchSchedule()
        ..initialize(
          server,
          'editMatchSchedule',
          null,
        ),
      'getMatchLocation': _i27.GetMatchLocation()
        ..initialize(
          server,
          'getMatchLocation',
          null,
        ),
      'getMatchLocationPhoto': _i28.GetMatchLocationPhoto()
        ..initialize(
          server,
          'getMatchLocationPhoto',
          null,
        ),
      'getMatchScheduleInfo': _i29.GetMatchScheduleInfo()
        ..initialize(
          server,
          'getMatchScheduleInfo',
          null,
        ),
      'getPlayerSubscribedMatches': _i30.GetPlayerSubscribedMatches()
        ..initialize(
          server,
          'getPlayerSubscribedMatches',
          null,
        ),
      'getTablesInArea': _i31.GetTablesInArea()
        ..initialize(
          server,
          'getTablesInArea',
          null,
        ),
      'removePlayerFromMatch': _i32.RemovePlayerFromMatch()
        ..initialize(
          server,
          'removePlayerFromMatch',
          null,
        ),
      'subscribeToMatch': _i33.SubscribeToMatch()
        ..initialize(
          server,
          'subscribeToMatch',
          null,
        ),
      'unsubscribeFromMatch': _i34.UnsubscribeFromMatch()
        ..initialize(
          server,
          'unsubscribeFromMatch',
          null,
        ),
      'deactivatePushNotificationToken': _i35.DeactivatePushNotificationToken()
        ..initialize(
          server,
          'deactivatePushNotificationToken',
          null,
        ),
      'syncPushNotificationToken': _i36.SyncPushNotificationToken()
        ..initialize(
          server,
          'syncPushNotificationToken',
          null,
        ),
      'getPlatformStats': _i37.GetPlatformStats()
        ..initialize(
          server,
          'getPlatformStats',
          null,
        ),
      'getPlayerStats': _i38.GetPlayerStats()
        ..initialize(
          server,
          'getPlayerStats',
          null,
        ),
      'getWebAnalyticsDashboard': _i39.GetWebAnalyticsDashboard()
        ..initialize(
          server,
          'getWebAnalyticsDashboard',
          null,
        ),
      'emailIdp': _i40.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'googleIdp': _i41.GoogleIdpEndpoint()
        ..initialize(
          server,
          'googleIdp',
          null,
        ),
      'jwtRefresh': _i42.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
    };
    connectors['createPlayerData'] = _i1.EndpointConnector(
      name: 'createPlayerData',
      endpoint: endpoints['createPlayerData']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'displayName': _i1.ParameterDescription(
              name: 'displayName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'favoriteFaction': _i1.ParameterDescription(
              name: 'favoriteFaction',
              type: _i1.getType<_i44.Faction>(),
              nullable: false,
            ),
            'currentLocation': _i1.ParameterDescription(
              name: 'currentLocation',
              type: _i1.getType<_i45.GeoLocation>(),
              nullable: false,
            ),
            'preferredLanguage': _i1.ParameterDescription(
              name: 'preferredLanguage',
              type: _i1.getType<_i46.Language>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['createPlayerData'] as _i2.CreatePlayerData).v1(
                    session,
                    language: params['language'],
                    displayName: params['displayName'],
                    favoriteFaction: params['favoriteFaction'],
                    currentLocation: params['currentLocation'],
                    preferredLanguage: params['preferredLanguage'],
                  ),
        ),
      },
    );
    connectors['getPlayerData'] = _i1.EndpointConnector(
      name: 'getPlayerData',
      endpoint: endpoints['getPlayerData']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['getPlayerData'] as _i3.GetPlayerData).v1(
                session,
                language: params['language'],
              ),
        ),
      },
    );
    connectors['reverseGeocodeCity'] = _i1.EndpointConnector(
      name: 'reverseGeocodeCity',
      endpoint: endpoints['reverseGeocodeCity']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'x': _i1.ParameterDescription(
              name: 'x',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'y': _i1.ParameterDescription(
              name: 'y',
              type: _i1.getType<double>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['reverseGeocodeCity'] as _i4.ReverseGeocodeCity)
                      .v1(
                        session,
                        language: params['language'],
                        x: params['x'],
                        y: params['y'],
                      ),
        ),
      },
    );
    connectors['updatePlayerData'] = _i1.EndpointConnector(
      name: 'updatePlayerData',
      endpoint: endpoints['updatePlayerData']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'displayName': _i1.ParameterDescription(
              name: 'displayName',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'favoriteFaction': _i1.ParameterDescription(
              name: 'favoriteFaction',
              type: _i1.getType<_i44.Faction?>(),
              nullable: true,
            ),
            'currentLocation': _i1.ParameterDescription(
              name: 'currentLocation',
              type: _i1.getType<_i45.GeoLocation?>(),
              nullable: true,
            ),
            'preferredLanguage': _i1.ParameterDescription(
              name: 'preferredLanguage',
              type: _i1.getType<_i46.Language?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['updatePlayerData'] as _i5.UpdatePlayerData).v1(
                    session,
                    language: params['language'],
                    displayName: params['displayName'],
                    favoriteFaction: params['favoriteFaction'],
                    currentLocation: params['currentLocation'],
                    preferredLanguage: params['preferredLanguage'],
                  ),
        ),
      },
    );
    connectors['userProfileEdit'] = _i1.EndpointConnector(
      name: 'userProfileEdit',
      endpoint: endpoints['userProfileEdit']!,
      methodConnectors: {
        'removeUserImage': _i1.MethodConnector(
          name: 'removeUserImage',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['userProfileEdit'] as _i6.UserProfileEdit)
                  .removeUserImage(session),
        ),
        'setUserImage': _i1.MethodConnector(
          name: 'setUserImage',
          params: {
            'image': _i1.ParameterDescription(
              name: 'image',
              type: _i1.getType<_i47.ByteData>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['userProfileEdit'] as _i6.UserProfileEdit)
                  .setUserImage(
                    session,
                    params['image'],
                  ),
        ),
        'changeUserName': _i1.MethodConnector(
          name: 'changeUserName',
          params: {
            'userName': _i1.ParameterDescription(
              name: 'userName',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['userProfileEdit'] as _i6.UserProfileEdit)
                  .changeUserName(
                    session,
                    params['userName'],
                  ),
        ),
        'changeFullName': _i1.MethodConnector(
          name: 'changeFullName',
          params: {
            'fullName': _i1.ParameterDescription(
              name: 'fullName',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['userProfileEdit'] as _i6.UserProfileEdit)
                  .changeFullName(
                    session,
                    params['fullName'],
                  ),
        ),
        'get': _i1.MethodConnector(
          name: 'get',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['userProfileEdit'] as _i6.UserProfileEdit)
                  .get(session),
        ),
      },
    );
    connectors['createComment'] = _i1.EndpointConnector(
      name: 'createComment',
      endpoint: endpoints['createComment']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'postId': _i1.ParameterDescription(
              name: 'postId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'content': _i1.ParameterDescription(
              name: 'content',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'commentLanguage': _i1.ParameterDescription(
              name: 'commentLanguage',
              type: _i1.getType<_i46.Language>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['createComment'] as _i7.CreateCommentEndpoint).v1(
                    session,
                    language: params['language'],
                    postId: params['postId'],
                    content: params['content'],
                    commentLanguage: params['commentLanguage'],
                  ),
        ),
      },
    );
    connectors['createPost'] = _i1.EndpointConnector(
      name: 'createPost',
      endpoint: endpoints['createPost']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'title': _i1.ParameterDescription(
              name: 'title',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'content': _i1.ParameterDescription(
              name: 'content',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'postLanguage': _i1.ParameterDescription(
              name: 'postLanguage',
              type: _i1.getType<_i46.Language>(),
              nullable: false,
            ),
            'attachedMatchId': _i1.ParameterDescription(
              name: 'attachedMatchId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['createPost'] as _i8.CreatePostEndpoint).v1(
                session,
                language: params['language'],
                title: params['title'],
                content: params['content'],
                postLanguage: params['postLanguage'],
                attachedMatchId: params['attachedMatchId'],
              ),
        ),
      },
    );
    connectors['getComments'] = _i1.EndpointConnector(
      name: 'getComments',
      endpoint: endpoints['getComments']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'postId': _i1.ParameterDescription(
              name: 'postId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['getComments'] as _i9.GetCommentsEndpoint).v1(
                    session,
                    language: params['language'],
                    postId: params['postId'],
                    page: params['page'],
                  ),
        ),
      },
    );
    connectors['getPosts'] = _i1.EndpointConnector(
      name: 'getPosts',
      endpoint: endpoints['getPosts']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'postLanguage': _i1.ParameterDescription(
              name: 'postLanguage',
              type: _i1.getType<_i46.Language?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['getPosts'] as _i10.GetPostsEndpoint).v1(
                session,
                language: params['language'],
                page: params['page'],
                postLanguage: params['postLanguage'],
              ),
        ),
      },
    );
    connectors['cancelMatchSchedule'] = _i1.EndpointConnector(
      name: 'cancelMatchSchedule',
      endpoint: endpoints['cancelMatchSchedule']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'scheduledMatchId': _i1.ParameterDescription(
              name: 'scheduledMatchId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'notPlayedReason': _i1.ParameterDescription(
              name: 'notPlayedReason',
              type: _i1.getType<_i48.MatchScheduleNotPlayedReason>(),
              nullable: false,
            ),
            'notPlayedReasonDetails': _i1.ParameterDescription(
              name: 'notPlayedReasonDetails',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['cancelMatchSchedule'] as _i11.CancelMatchSchedule)
                      .v1(
                        session,
                        language: params['language'],
                        scheduledMatchId: params['scheduledMatchId'],
                        notPlayedReason: params['notPlayedReason'],
                        notPlayedReasonDetails:
                            params['notPlayedReasonDetails'],
                      ),
        ),
      },
    );
    connectors['createAnonymousPlayer'] = _i1.EndpointConnector(
      name: 'createAnonymousPlayer',
      endpoint: endpoints['createAnonymousPlayer']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'firstName': _i1.ParameterDescription(
              name: 'firstName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'lastName': _i1.ParameterDescription(
              name: 'lastName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['createAnonymousPlayer']
                          as _i12.CreateAnonymousPlayer)
                      .v1(
                        session,
                        language: params['language'],
                        firstName: params['firstName'],
                        lastName: params['lastName'],
                      ),
        ),
      },
    );
    connectors['getMyAnonymousPlayers'] = _i1.EndpointConnector(
      name: 'getMyAnonymousPlayers',
      endpoint: endpoints['getMyAnonymousPlayers']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['getMyAnonymousPlayers']
                          as _i13.GetMyAnonymousPlayers)
                      .v1(
                        session,
                        language: params['language'],
                      ),
        ),
      },
    );
    connectors['getMyMatches'] = _i1.EndpointConnector(
      name: 'getMyMatches',
      endpoint: endpoints['getMyMatches']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['getMyMatches'] as _i14.GetMyMatches).v1(
                session,
                language: params['language'],
              ),
        ),
      },
    );
    connectors['getPendingMatchResults'] = _i1.EndpointConnector(
      name: 'getPendingMatchResults',
      endpoint: endpoints['getPendingMatchResults']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['getPendingMatchResults']
                          as _i15.GetPendingMatchResults)
                      .v1(
                        session,
                        language: params['language'],
                      ),
        ),
      },
    );
    connectors['getPendingMatchResultsCount'] = _i1.EndpointConnector(
      name: 'getPendingMatchResultsCount',
      endpoint: endpoints['getPendingMatchResultsCount']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['getPendingMatchResultsCount']
                          as _i16.GetPendingMatchResultsCount)
                      .v1(
                        session,
                        language: params['language'],
                      ),
        ),
      },
    );
    connectors['prepareMatchProofUpload'] = _i1.EndpointConnector(
      name: 'prepareMatchProofUpload',
      endpoint: endpoints['prepareMatchProofUpload']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'fileName': _i1.ParameterDescription(
              name: 'fileName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'contentType': _i1.ParameterDescription(
              name: 'contentType',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'fileSizeBytes': _i1.ParameterDescription(
              name: 'fileSizeBytes',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['prepareMatchProofUpload']
                          as _i17.PrepareMatchProofUpload)
                      .v1(
                        session,
                        language: params['language'],
                        fileName: params['fileName'],
                        contentType: params['contentType'],
                        fileSizeBytes: params['fileSizeBytes'],
                      ),
        ),
      },
    );
    connectors['registerMatchData'] = _i1.EndpointConnector(
      name: 'registerMatchData',
      endpoint: endpoints['registerMatchData']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'matchStartedAt': _i1.ParameterDescription(
              name: 'matchStartedAt',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'matchEstimatedDuration': _i1.ParameterDescription(
              name: 'matchEstimatedDuration',
              type: _i1.getType<Duration>(),
              nullable: false,
            ),
            'locationId': _i1.ParameterDescription(
              name: 'locationId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'scheduledPairingAttemptId': _i1.ParameterDescription(
              name: 'scheduledPairingAttemptId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'players': _i1.ParameterDescription(
              name: 'players',
              type: _i1.getType<List<_i49.PlayerMatchResultInput>>(),
              nullable: false,
            ),
            'groupPhotoUploadKey': _i1.ParameterDescription(
              name: 'groupPhotoUploadKey',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'boardPhotoUploadKey': _i1.ParameterDescription(
              name: 'boardPhotoUploadKey',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['registerMatchData'] as _i18.RegisterMatchData).v1(
                    session,
                    language: params['language'],
                    matchStartedAt: params['matchStartedAt'],
                    matchEstimatedDuration: params['matchEstimatedDuration'],
                    locationId: params['locationId'],
                    scheduledPairingAttemptId:
                        params['scheduledPairingAttemptId'],
                    players: params['players'],
                    groupPhotoUploadKey: params['groupPhotoUploadKey'],
                    boardPhotoUploadKey: params['boardPhotoUploadKey'],
                  ),
        ),
      },
    );
    connectors['searchRegisteredPlayers'] = _i1.EndpointConnector(
      name: 'searchRegisteredPlayers',
      endpoint: endpoints['searchRegisteredPlayers']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'query': _i1.ParameterDescription(
              name: 'query',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['searchRegisteredPlayers']
                          as _i19.SearchRegisteredPlayers)
                      .v1(
                        session,
                        language: params['language'],
                        query: params['query'],
                      ),
        ),
      },
    );
    connectors['getMatchChatActivityOverview'] = _i1.EndpointConnector(
      name: 'getMatchChatActivityOverview',
      endpoint: endpoints['getMatchChatActivityOverview']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['getMatchChatActivityOverview']
                          as _i20.GetMatchChatActivityOverview)
                      .v1(
                        session,
                        language: params['language'],
                      ),
        ),
      },
    );
    connectors['getMatchChatMessage'] = _i1.EndpointConnector(
      name: 'getMatchChatMessage',
      endpoint: endpoints['getMatchChatMessage']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'scheduledMatchId': _i1.ParameterDescription(
              name: 'scheduledMatchId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['getMatchChatMessage'] as _i21.GetMatchChatMessage)
                      .v1(
                        session,
                        language: params['language'],
                        scheduledMatchId: params['scheduledMatchId'],
                        page: params['page'],
                      ),
        ),
      },
    );
    connectors['getMatchChatPlayedMatchSummary'] = _i1.EndpointConnector(
      name: 'getMatchChatPlayedMatchSummary',
      endpoint: endpoints['getMatchChatPlayedMatchSummary']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'scheduledMatchId': _i1.ParameterDescription(
              name: 'scheduledMatchId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['getMatchChatPlayedMatchSummary']
                          as _i22.GetMatchChatPlayedMatchSummary)
                      .v1(
                        session,
                        language: params['language'],
                        scheduledMatchId: params['scheduledMatchId'],
                      ),
        ),
      },
    );
    connectors['getMatchChatUnreadCount'] = _i1.EndpointConnector(
      name: 'getMatchChatUnreadCount',
      endpoint: endpoints['getMatchChatUnreadCount']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['getMatchChatUnreadCount']
                          as _i23.GetMatchChatUnreadCount)
                      .v1(
                        session,
                        language: params['language'],
                      ),
        ),
      },
    );
    connectors['sendMatchChatMessage'] = _i1.EndpointConnector(
      name: 'sendMatchChatMessage',
      endpoint: endpoints['sendMatchChatMessage']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'scheduledMatchId': _i1.ParameterDescription(
              name: 'scheduledMatchId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'content': _i1.ParameterDescription(
              name: 'content',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'imageBytes': _i1.ParameterDescription(
              name: 'imageBytes',
              type: _i1.getType<_i47.ByteData?>(),
              nullable: true,
            ),
            'imageFileName': _i1.ParameterDescription(
              name: 'imageFileName',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'imageContentType': _i1.ParameterDescription(
              name: 'imageContentType',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['sendMatchChatMessage']
                          as _i24.SendMatchChatMessage)
                      .v1(
                        session,
                        language: params['language'],
                        scheduledMatchId: params['scheduledMatchId'],
                        content: params['content'],
                        imageBytes: params['imageBytes'],
                        imageFileName: params['imageFileName'],
                        imageContentType: params['imageContentType'],
                      ),
        ),
      },
    );
    connectors['createMatchSchedule'] = _i1.EndpointConnector(
      name: 'createMatchSchedule',
      endpoint: endpoints['createMatchSchedule']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'title': _i1.ParameterDescription(
              name: 'title',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'minAmountOfPlayers': _i1.ParameterDescription(
              name: 'minAmountOfPlayers',
              type: _i1.getType<_i50.MatchPodium>(),
              nullable: false,
            ),
            'maxAmountOfPlayers': _i1.ParameterDescription(
              name: 'maxAmountOfPlayers',
              type: _i1.getType<_i50.MatchPodium>(),
              nullable: false,
            ),
            'attemptedAt': _i1.ParameterDescription(
              name: 'attemptedAt',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'locationId': _i1.ParameterDescription(
              name: 'locationId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'hostWillPlay': _i1.ParameterDescription(
              name: 'hostWillPlay',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['createMatchSchedule'] as _i25.CreateMatchSchedule)
                      .v1(
                        session,
                        language: params['language'],
                        title: params['title'],
                        description: params['description'],
                        minAmountOfPlayers: params['minAmountOfPlayers'],
                        maxAmountOfPlayers: params['maxAmountOfPlayers'],
                        attemptedAt: params['attemptedAt'],
                        locationId: params['locationId'],
                        hostWillPlay: params['hostWillPlay'],
                      ),
        ),
      },
    );
    connectors['editMatchSchedule'] = _i1.EndpointConnector(
      name: 'editMatchSchedule',
      endpoint: endpoints['editMatchSchedule']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'scheduledMatchId': _i1.ParameterDescription(
              name: 'scheduledMatchId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'title': _i1.ParameterDescription(
              name: 'title',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'minAmountOfPlayers': _i1.ParameterDescription(
              name: 'minAmountOfPlayers',
              type: _i1.getType<_i50.MatchPodium>(),
              nullable: false,
            ),
            'maxAmountOfPlayers': _i1.ParameterDescription(
              name: 'maxAmountOfPlayers',
              type: _i1.getType<_i50.MatchPodium>(),
              nullable: false,
            ),
            'attemptedAt': _i1.ParameterDescription(
              name: 'attemptedAt',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'closedForSubscriptions': _i1.ParameterDescription(
              name: 'closedForSubscriptions',
              type: _i1.getType<bool?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['editMatchSchedule'] as _i26.EditMatchSchedule).v1(
                    session,
                    language: params['language'],
                    scheduledMatchId: params['scheduledMatchId'],
                    title: params['title'],
                    description: params['description'],
                    minAmountOfPlayers: params['minAmountOfPlayers'],
                    maxAmountOfPlayers: params['maxAmountOfPlayers'],
                    attemptedAt: params['attemptedAt'],
                    closedForSubscriptions: params['closedForSubscriptions'],
                  ),
        ),
      },
    );
    connectors['getMatchLocation'] = _i1.EndpointConnector(
      name: 'getMatchLocation',
      endpoint: endpoints['getMatchLocation']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'query': _i1.ParameterDescription(
              name: 'query',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['getMatchLocation'] as _i27.GetMatchLocation).v1(
                    session,
                    language: params['language'],
                    query: params['query'],
                    page: params['page'],
                  ),
        ),
      },
    );
    connectors['getMatchLocationPhoto'] = _i1.EndpointConnector(
      name: 'getMatchLocationPhoto',
      endpoint: endpoints['getMatchLocationPhoto']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'providerPlaceId': _i1.ParameterDescription(
              name: 'providerPlaceId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'maxWidthPx': _i1.ParameterDescription(
              name: 'maxWidthPx',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'maxHeightPx': _i1.ParameterDescription(
              name: 'maxHeightPx',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['getMatchLocationPhoto']
                          as _i28.GetMatchLocationPhoto)
                      .v1(
                        session,
                        language: params['language'],
                        providerPlaceId: params['providerPlaceId'],
                        maxWidthPx: params['maxWidthPx'],
                        maxHeightPx: params['maxHeightPx'],
                      ),
        ),
      },
    );
    connectors['getMatchScheduleInfo'] = _i1.EndpointConnector(
      name: 'getMatchScheduleInfo',
      endpoint: endpoints['getMatchScheduleInfo']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'scheduledMatchId': _i1.ParameterDescription(
              name: 'scheduledMatchId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['getMatchScheduleInfo']
                          as _i29.GetMatchScheduleInfo)
                      .v1(
                        session,
                        language: params['language'],
                        scheduledMatchId: params['scheduledMatchId'],
                      ),
        ),
      },
    );
    connectors['getPlayerSubscribedMatches'] = _i1.EndpointConnector(
      name: 'getPlayerSubscribedMatches',
      endpoint: endpoints['getPlayerSubscribedMatches']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['getPlayerSubscribedMatches']
                          as _i30.GetPlayerSubscribedMatches)
                      .v1(
                        session,
                        language: params['language'],
                        page: params['page'],
                      ),
        ),
      },
    );
    connectors['getTablesInArea'] = _i1.EndpointConnector(
      name: 'getTablesInArea',
      endpoint: endpoints['getTablesInArea']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['getTablesInArea'] as _i31.GetTablesInArea).v1(
                    session,
                    language: params['language'],
                  ),
        ),
      },
    );
    connectors['removePlayerFromMatch'] = _i1.EndpointConnector(
      name: 'removePlayerFromMatch',
      endpoint: endpoints['removePlayerFromMatch']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'scheduledMatchId': _i1.ParameterDescription(
              name: 'scheduledMatchId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'playerDataId': _i1.ParameterDescription(
              name: 'playerDataId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['removePlayerFromMatch']
                          as _i32.RemovePlayerFromMatch)
                      .v1(
                        session,
                        language: params['language'],
                        scheduledMatchId: params['scheduledMatchId'],
                        playerDataId: params['playerDataId'],
                      ),
        ),
      },
    );
    connectors['subscribeToMatch'] = _i1.EndpointConnector(
      name: 'subscribeToMatch',
      endpoint: endpoints['subscribeToMatch']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'scheduledMatchId': _i1.ParameterDescription(
              name: 'scheduledMatchId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['subscribeToMatch'] as _i33.SubscribeToMatch).v1(
                    session,
                    language: params['language'],
                    scheduledMatchId: params['scheduledMatchId'],
                  ),
        ),
      },
    );
    connectors['unsubscribeFromMatch'] = _i1.EndpointConnector(
      name: 'unsubscribeFromMatch',
      endpoint: endpoints['unsubscribeFromMatch']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'scheduledMatchId': _i1.ParameterDescription(
              name: 'scheduledMatchId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['unsubscribeFromMatch']
                          as _i34.UnsubscribeFromMatch)
                      .v1(
                        session,
                        language: params['language'],
                        scheduledMatchId: params['scheduledMatchId'],
                      ),
        ),
      },
    );
    connectors['deactivatePushNotificationToken'] = _i1.EndpointConnector(
      name: 'deactivatePushNotificationToken',
      endpoint: endpoints['deactivatePushNotificationToken']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'token': _i1.ParameterDescription(
              name: 'token',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['deactivatePushNotificationToken']
                          as _i35.DeactivatePushNotificationToken)
                      .v1(
                        session,
                        language: params['language'],
                        token: params['token'],
                      ),
        ),
      },
    );
    connectors['syncPushNotificationToken'] = _i1.EndpointConnector(
      name: 'syncPushNotificationToken',
      endpoint: endpoints['syncPushNotificationToken']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'token': _i1.ParameterDescription(
              name: 'token',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'platform': _i1.ParameterDescription(
              name: 'platform',
              type: _i1.getType<_i51.PushNotificationPlatform>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['syncPushNotificationToken']
                          as _i36.SyncPushNotificationToken)
                      .v1(
                        session,
                        language: params['language'],
                        token: params['token'],
                        platform: params['platform'],
                      ),
        ),
      },
    );
    connectors['getPlatformStats'] = _i1.EndpointConnector(
      name: 'getPlatformStats',
      endpoint: endpoints['getPlatformStats']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['getPlatformStats'] as _i37.GetPlatformStats).v1(
                    session,
                    language: params['language'],
                  ),
        ),
      },
    );
    connectors['getPlayerStats'] = _i1.EndpointConnector(
      name: 'getPlayerStats',
      endpoint: endpoints['getPlayerStats']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['getPlayerStats'] as _i38.GetPlayerStats).v1(
                    session,
                    language: params['language'],
                  ),
        ),
      },
    );
    connectors['getWebAnalyticsDashboard'] = _i1.EndpointConnector(
      name: 'getWebAnalyticsDashboard',
      endpoint: endpoints['getWebAnalyticsDashboard']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i43.ServerSupportedTranslation>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['getWebAnalyticsDashboard']
                          as _i39.GetWebAnalyticsDashboard)
                      .v1(
                        session,
                        language: params['language'],
                        password: params['password'],
                        page: params['page'],
                      ),
        ),
      },
    );
    connectors['emailIdp'] = _i1.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i40.EmailIdpEndpoint).login(
                session,
                email: params['email'],
                password: params['password'],
              ),
        ),
        'startRegistration': _i1.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i40.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _i1.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _i1.ParameterDescription(
              name: 'accountRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i40.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _i1.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _i1.ParameterDescription(
              name: 'registrationToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i40.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _i1.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i40.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _i1.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _i1.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i40.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _i1.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _i1.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newPassword': _i1.ParameterDescription(
              name: 'newPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i40.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
        'hasAccount': _i1.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i40.EmailIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['googleIdp'] = _i1.EndpointConnector(
      name: 'googleIdp',
      endpoint: endpoints['googleIdp']!,
      methodConnectors: {
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'idToken': _i1.ParameterDescription(
              name: 'idToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'accessToken': _i1.ParameterDescription(
              name: 'accessToken',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['googleIdp'] as _i41.GoogleIdpEndpoint).login(
                    session,
                    idToken: params['idToken'],
                    accessToken: params['accessToken'],
                  ),
        ),
        'hasAccount': _i1.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['googleIdp'] as _i41.GoogleIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['jwtRefresh'] = _i1.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _i1.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _i1.ParameterDescription(
              name: 'refreshToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['jwtRefresh'] as _i42.JwtRefreshEndpoint)
                  .refreshAccessToken(
                    session,
                    refreshToken: params['refreshToken'],
                  ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _i52.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _i53.Endpoints()
      ..initializeEndpoints(server);
  }

  @override
  _i1.FutureCallDispatch? get futureCalls {
    return _i54.FutureCalls();
  }
}
