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
import '../api/account/update_player_data.dart' as _i4;
import '../api/account/user_profile_edit.dart' as _i5;
import '../api/community/create_comment_endpoint.dart' as _i6;
import '../api/community/create_post_endpoint.dart' as _i7;
import '../api/community/get_comments_endpoint.dart' as _i8;
import '../api/community/get_posts_endpoint.dart' as _i9;
import '../api/match/get_my_played_matches.dart' as _i10;
import '../api/match/register_match_data.dart' as _i11;
import '../api/match_chat/match_chat_get_messages.dart' as _i12;
import '../api/match_chat/match_chat_send_message.dart' as _i13;
import '../api/match_making/create_match_schedule.dart' as _i14;
import '../api/match_making/get_match_location.dart' as _i15;
import '../api/match_making/get_player_subscribed_matches.dart' as _i16;
import '../api/match_making/subscribe_to_match.dart' as _i17;
import '../auth/email_idp_endpoint.dart' as _i18;
import '../auth/google_idp_endpoint.dart' as _i19;
import '../auth/jwt_refresh_endpoint.dart' as _i20;
import 'package:root_hub_server/src/generated/entities/core/faction.dart'
    as _i21;
import 'package:root_hub_server/src/generated/entities/core/geo_location.dart'
    as _i22;
import 'dart:typed_data' as _i23;
import 'package:root_hub_server/src/generated/entities/core/language.dart'
    as _i24;
import 'package:root_hub_server/src/generated/api/match/models/player_match_result_input.dart'
    as _i25;
import 'package:root_hub_server/src/generated/entities/core/match_podium.dart'
    as _i26;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i27;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i28;

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
      'updatePlayerData': _i4.UpdatePlayerData()
        ..initialize(
          server,
          'updatePlayerData',
          null,
        ),
      'userProfileEdit': _i5.UserProfileEdit()
        ..initialize(
          server,
          'userProfileEdit',
          null,
        ),
      'createComment': _i6.CreateCommentEndpoint()
        ..initialize(
          server,
          'createComment',
          null,
        ),
      'createPost': _i7.CreatePostEndpoint()
        ..initialize(
          server,
          'createPost',
          null,
        ),
      'getComments': _i8.GetCommentsEndpoint()
        ..initialize(
          server,
          'getComments',
          null,
        ),
      'getPosts': _i9.GetPostsEndpoint()
        ..initialize(
          server,
          'getPosts',
          null,
        ),
      'getMyMatches': _i10.GetMyMatches()
        ..initialize(
          server,
          'getMyMatches',
          null,
        ),
      'registerMatchData': _i11.RegisterMatchData()
        ..initialize(
          server,
          'registerMatchData',
          null,
        ),
      'matchChatGetMessages': _i12.MatchChatGetMessages()
        ..initialize(
          server,
          'matchChatGetMessages',
          null,
        ),
      'matchChatSendMessage': _i13.MatchChatSendMessage()
        ..initialize(
          server,
          'matchChatSendMessage',
          null,
        ),
      'createMatchSchedule': _i14.CreateMatchSchedule()
        ..initialize(
          server,
          'createMatchSchedule',
          null,
        ),
      'getMatchLocation': _i15.GetMatchLocation()
        ..initialize(
          server,
          'getMatchLocation',
          null,
        ),
      'getPlayerSubscribedMatches': _i16.GetPlayerSubscribedMatches()
        ..initialize(
          server,
          'getPlayerSubscribedMatches',
          null,
        ),
      'subscribeToMatch': _i17.SubscribeToMatch()
        ..initialize(
          server,
          'subscribeToMatch',
          null,
        ),
      'emailIdp': _i18.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'googleIdp': _i19.GoogleIdpEndpoint()
        ..initialize(
          server,
          'googleIdp',
          null,
        ),
      'jwtRefresh': _i20.JwtRefreshEndpoint()
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
            'displayName': _i1.ParameterDescription(
              name: 'displayName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'favoriteFaction': _i1.ParameterDescription(
              name: 'favoriteFaction',
              type: _i1.getType<_i21.Faction>(),
              nullable: false,
            ),
            'currentLocation': _i1.ParameterDescription(
              name: 'currentLocation',
              type: _i1.getType<_i22.GeoLocation>(),
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
                    displayName: params['displayName'],
                    favoriteFaction: params['favoriteFaction'],
                    currentLocation: params['currentLocation'],
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
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['getPlayerData'] as _i3.GetPlayerData).v1(session),
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
            'displayName': _i1.ParameterDescription(
              name: 'displayName',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'favoriteFaction': _i1.ParameterDescription(
              name: 'favoriteFaction',
              type: _i1.getType<_i21.Faction?>(),
              nullable: true,
            ),
            'currentLocation': _i1.ParameterDescription(
              name: 'currentLocation',
              type: _i1.getType<_i22.GeoLocation?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['updatePlayerData'] as _i4.UpdatePlayerData).v1(
                    session,
                    displayName: params['displayName'],
                    favoriteFaction: params['favoriteFaction'],
                    currentLocation: params['currentLocation'],
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
              ) async => (endpoints['userProfileEdit'] as _i5.UserProfileEdit)
                  .removeUserImage(session),
        ),
        'setUserImage': _i1.MethodConnector(
          name: 'setUserImage',
          params: {
            'image': _i1.ParameterDescription(
              name: 'image',
              type: _i1.getType<_i23.ByteData>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['userProfileEdit'] as _i5.UserProfileEdit)
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
              ) async => (endpoints['userProfileEdit'] as _i5.UserProfileEdit)
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
              ) async => (endpoints['userProfileEdit'] as _i5.UserProfileEdit)
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
              ) async => (endpoints['userProfileEdit'] as _i5.UserProfileEdit)
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
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i24.Language>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['createComment'] as _i6.CreateCommentEndpoint).v1(
                    session,
                    postId: params['postId'],
                    content: params['content'],
                    language: params['language'],
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
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i24.Language>(),
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
              ) async => (endpoints['createPost'] as _i7.CreatePostEndpoint).v1(
                session,
                title: params['title'],
                content: params['content'],
                language: params['language'],
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
                  (endpoints['getComments'] as _i8.GetCommentsEndpoint).v1(
                    session,
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
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i24.Language?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['getPosts'] as _i9.GetPostsEndpoint).v1(
                session,
                page: params['page'],
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
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['getMyMatches'] as _i10.GetMyMatches).v1(session),
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
              type: _i1.getType<List<_i25.PlayerMatchResultInput>>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['registerMatchData'] as _i11.RegisterMatchData).v1(
                    session,
                    matchStartedAt: params['matchStartedAt'],
                    matchEstimatedDuration: params['matchEstimatedDuration'],
                    locationId: params['locationId'],
                    scheduledPairingAttemptId:
                        params['scheduledPairingAttemptId'],
                    players: params['players'],
                  ),
        ),
      },
    );
    connectors['matchChatGetMessages'] = _i1.EndpointConnector(
      name: 'matchChatGetMessages',
      endpoint: endpoints['matchChatGetMessages']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'matchChatHistoryId': _i1.ParameterDescription(
              name: 'matchChatHistoryId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['matchChatGetMessages']
                          as _i12.MatchChatGetMessages)
                      .v1(
                        session,
                        matchChatHistoryId: params['matchChatHistoryId'],
                      ),
        ),
      },
    );
    connectors['matchChatSendMessage'] = _i1.EndpointConnector(
      name: 'matchChatSendMessage',
      endpoint: endpoints['matchChatSendMessage']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {
            'matchChatHistoryId': _i1.ParameterDescription(
              name: 'matchChatHistoryId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'content': _i1.ParameterDescription(
              name: 'content',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['matchChatSendMessage']
                          as _i13.MatchChatSendMessage)
                      .v1(
                        session,
                        matchChatHistoryId: params['matchChatHistoryId'],
                        content: params['content'],
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
            'aditionalLocationInfo': _i1.ParameterDescription(
              name: 'aditionalLocationInfo',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'minAmountOfPlayers': _i1.ParameterDescription(
              name: 'minAmountOfPlayers',
              type: _i1.getType<_i26.MatchPodium>(),
              nullable: false,
            ),
            'maxAmountOfPlayers': _i1.ParameterDescription(
              name: 'maxAmountOfPlayers',
              type: _i1.getType<_i26.MatchPodium>(),
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
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['createMatchSchedule'] as _i14.CreateMatchSchedule)
                      .v1(
                        session,
                        title: params['title'],
                        description: params['description'],
                        aditionalLocationInfo: params['aditionalLocationInfo'],
                        minAmountOfPlayers: params['minAmountOfPlayers'],
                        maxAmountOfPlayers: params['maxAmountOfPlayers'],
                        attemptedAt: params['attemptedAt'],
                        locationId: params['locationId'],
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
                  (endpoints['getMatchLocation'] as _i15.GetMatchLocation).v1(
                    session,
                    query: params['query'],
                    page: params['page'],
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
                          as _i16.GetPlayerSubscribedMatches)
                      .v1(
                        session,
                        page: params['page'],
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
                  (endpoints['subscribeToMatch'] as _i17.SubscribeToMatch).v1(
                    session,
                    scheduledMatchId: params['scheduledMatchId'],
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
              ) async => (endpoints['emailIdp'] as _i18.EmailIdpEndpoint).login(
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
              ) async => (endpoints['emailIdp'] as _i18.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i18.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i18.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i18.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i18.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i18.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i18.EmailIdpEndpoint)
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
                  (endpoints['googleIdp'] as _i19.GoogleIdpEndpoint).login(
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
              ) async => (endpoints['googleIdp'] as _i19.GoogleIdpEndpoint)
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
              ) async => (endpoints['jwtRefresh'] as _i20.JwtRefreshEndpoint)
                  .refreshAccessToken(
                    session,
                    refreshToken: params['refreshToken'],
                  ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _i27.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _i28.Endpoints()
      ..initializeEndpoints(server);
  }
}
