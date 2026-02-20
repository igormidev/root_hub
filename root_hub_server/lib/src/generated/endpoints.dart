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
import '../api/community/create_comment_endpoint.dart' as _i2;
import '../api/community/create_post_endpoint.dart' as _i3;
import '../api/community/get_comments_endpoint.dart' as _i4;
import '../api/community/get_posts_endpoint.dart' as _i5;
import '../api/match/get_match_data.dart' as _i6;
import '../api/match_chat/match_chat_get_messages.dart' as _i7;
import '../api/match_chat/match_chat_send_message.dart' as _i8;
import '../api/match_making/create_match_schedule.dart' as _i9;
import '../api/match_making/get_match_location.dart' as _i10;
import '../api/match_making/get_player_matches.dart' as _i11;
import '../api/match_making/subscribe_to_match.dart' as _i12;
import '../auth/email_idp_endpoint.dart' as _i13;
import '../auth/jwt_refresh_endpoint.dart' as _i14;
import 'package:root_hub_server/src/generated/entities/core/language.dart'
    as _i15;
import 'package:root_hub_server/src/generated/entities/core/match_podium.dart'
    as _i16;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i17;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i18;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'createComment': _i2.CreateCommentEndpoint()
        ..initialize(
          server,
          'createComment',
          null,
        ),
      'createPost': _i3.CreatePostEndpoint()
        ..initialize(
          server,
          'createPost',
          null,
        ),
      'getComments': _i4.GetCommentsEndpoint()
        ..initialize(
          server,
          'getComments',
          null,
        ),
      'getPosts': _i5.GetPostsEndpoint()
        ..initialize(
          server,
          'getPosts',
          null,
        ),
      'getMatchData': _i6.GetMatchData()
        ..initialize(
          server,
          'getMatchData',
          null,
        ),
      'matchChatGetMessages': _i7.MatchChatGetMessages()
        ..initialize(
          server,
          'matchChatGetMessages',
          null,
        ),
      'matchChatSendMessage': _i8.MatchChatSendMessage()
        ..initialize(
          server,
          'matchChatSendMessage',
          null,
        ),
      'createMatchSchedule': _i9.CreateMatchSchedule()
        ..initialize(
          server,
          'createMatchSchedule',
          null,
        ),
      'getMatchLocation': _i10.GetMatchLocation()
        ..initialize(
          server,
          'getMatchLocation',
          null,
        ),
      'getPlayerMatches': _i11.GetPlayerMatches()
        ..initialize(
          server,
          'getPlayerMatches',
          null,
        ),
      'subscribeToMatch': _i12.SubscribeToMatch()
        ..initialize(
          server,
          'subscribeToMatch',
          null,
        ),
      'emailIdp': _i13.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _i14.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
    };
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
              type: _i1.getType<_i15.Language>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['createComment'] as _i2.CreateCommentEndpoint).v1(
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
              type: _i1.getType<_i15.Language>(),
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
              ) async => (endpoints['createPost'] as _i3.CreatePostEndpoint).v1(
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
                  (endpoints['getComments'] as _i4.GetCommentsEndpoint).v1(
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
              type: _i1.getType<_i15.Language?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['getPosts'] as _i5.GetPostsEndpoint).v1(
                session,
                page: params['page'],
                language: params['language'],
              ),
        ),
      },
    );
    connectors['getMatchData'] = _i1.EndpointConnector(
      name: 'getMatchData',
      endpoint: endpoints['getMatchData']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['getMatchData'] as _i6.GetMatchData).v1(session),
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
                          as _i7.MatchChatGetMessages)
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
                          as _i8.MatchChatSendMessage)
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
              type: _i1.getType<_i16.MatchPodium>(),
              nullable: false,
            ),
            'maxAmountOfPlayers': _i1.ParameterDescription(
              name: 'maxAmountOfPlayers',
              type: _i1.getType<_i16.MatchPodium>(),
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
                  (endpoints['createMatchSchedule'] as _i9.CreateMatchSchedule)
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
                  (endpoints['getMatchLocation'] as _i10.GetMatchLocation).v1(
                    session,
                    query: params['query'],
                    page: params['page'],
                  ),
        ),
      },
    );
    connectors['getPlayerMatches'] = _i1.EndpointConnector(
      name: 'getPlayerMatches',
      endpoint: endpoints['getPlayerMatches']!,
      methodConnectors: {
        'v1': _i1.MethodConnector(
          name: 'v1',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['getPlayerMatches'] as _i11.GetPlayerMatches).v1(
                    session,
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
                  (endpoints['subscribeToMatch'] as _i12.SubscribeToMatch).v1(
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
              ) async => (endpoints['emailIdp'] as _i13.EmailIdpEndpoint).login(
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
              ) async => (endpoints['emailIdp'] as _i13.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i13.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i13.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i13.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i13.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i13.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i13.EmailIdpEndpoint)
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
              ) async => (endpoints['jwtRefresh'] as _i14.JwtRefreshEndpoint)
                  .refreshAccessToken(
                    session,
                    refreshToken: params['refreshToken'],
                  ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _i17.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _i18.Endpoints()
      ..initializeEndpoints(server);
  }
}
