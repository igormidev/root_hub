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
import '../api/community/comments_endpoint.dart' as _i2;
import '../api/community/posts_endpoint.dart' as _i3;
import '../api/match_making/create_match.dart' as _i4;
import '../api/match_making/get_player_matches.dart' as _i5;
import '../api/match_making/subscribe_to_match.dart' as _i6;
import '../auth/email_idp_endpoint.dart' as _i7;
import '../auth/jwt_refresh_endpoint.dart' as _i8;
import 'package:root_hub_server/src/generated/entities/core/language.dart'
    as _i9;
import 'package:root_hub_server/src/generated/entities/core/match_podium.dart'
    as _i10;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i11;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i12;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'comments': _i2.CommentsEndpoint()
        ..initialize(
          server,
          'comments',
          null,
        ),
      'posts': _i3.PostsEndpoint()
        ..initialize(
          server,
          'posts',
          null,
        ),
      'createMatch': _i4.CreateMatch()
        ..initialize(
          server,
          'createMatch',
          null,
        ),
      'getPlayerMatches': _i5.GetPlayerMatches()
        ..initialize(
          server,
          'getPlayerMatches',
          null,
        ),
      'subscribeToMatch': _i6.SubscribeToMatch()
        ..initialize(
          server,
          'subscribeToMatch',
          null,
        ),
      'emailIdp': _i7.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _i8.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
    };
    connectors['comments'] = _i1.EndpointConnector(
      name: 'comments',
      endpoint: endpoints['comments']!,
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
              ) async => (endpoints['comments'] as _i2.CommentsEndpoint).v1(
                session,
                postId: params['postId'],
                page: params['page'],
              ),
        ),
      },
    );
    connectors['posts'] = _i1.EndpointConnector(
      name: 'posts',
      endpoint: endpoints['posts']!,
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
              type: _i1.getType<_i9.Language?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['posts'] as _i3.PostsEndpoint).v1(
                session,
                page: params['page'],
                language: params['language'],
              ),
        ),
      },
    );
    connectors['createMatch'] = _i1.EndpointConnector(
      name: 'createMatch',
      endpoint: endpoints['createMatch']!,
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
              type: _i1.getType<_i10.MatchPodium>(),
              nullable: false,
            ),
            'maxAmountOfPlayers': _i1.ParameterDescription(
              name: 'maxAmountOfPlayers',
              type: _i1.getType<_i10.MatchPodium>(),
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
              ) async => (endpoints['createMatch'] as _i4.CreateMatch).v1(
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
              ) async => (endpoints['getPlayerMatches'] as _i5.GetPlayerMatches)
                  .v1(session),
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
                  (endpoints['subscribeToMatch'] as _i6.SubscribeToMatch).v1(
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
              ) async => (endpoints['emailIdp'] as _i7.EmailIdpEndpoint).login(
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
              ) async => (endpoints['emailIdp'] as _i7.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i7.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i7.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i7.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i7.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i7.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i7.EmailIdpEndpoint)
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
              ) async => (endpoints['jwtRefresh'] as _i8.JwtRefreshEndpoint)
                  .refreshAccessToken(
                    session,
                    refreshToken: params['refreshToken'],
                  ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _i11.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _i12.Endpoints()
      ..initializeEndpoints(server);
  }
}
