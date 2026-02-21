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
import 'package:root_hub_client/src/protocol/entities/core/faction.dart' as _i4;
import 'package:root_hub_client/src/protocol/entities/core/country.dart' as _i5;
import 'package:root_hub_client/src/protocol/entities/community/post_comment.dart'
    as _i6;
import 'package:root_hub_client/src/protocol/entities/core/language.dart'
    as _i7;
import 'package:root_hub_client/src/protocol/entities/community/post.dart'
    as _i8;
import 'package:root_hub_client/src/protocol/api/community/models/comments_pagination.dart'
    as _i9;
import 'package:root_hub_client/src/protocol/api/community/models/post_pagination.dart'
    as _i10;
import 'package:root_hub_client/src/protocol/entities/match/played_match.dart'
    as _i11;
import 'package:root_hub_client/src/protocol/api/match/models/player_match_result_input.dart'
    as _i12;
import 'package:root_hub_client/src/protocol/entities/match_making/chat/match_chat_message.dart'
    as _i13;
import 'package:root_hub_client/src/protocol/entities/match_making/match_schedule.dart'
    as _i14;
import 'package:root_hub_client/src/protocol/entities/core/match_podium.dart'
    as _i15;
import 'package:root_hub_client/src/protocol/entities/match_making/location.dart'
    as _i16;
import 'package:root_hub_client/src/protocol/api/match_making/models/subscribed_matches_pagination.dart'
    as _i17;
import 'package:root_hub_client/src/protocol/entities/match_making/match_subscription.dart'
    as _i18;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i19;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i20;
import 'protocol.dart' as _i21;

/// {@category Endpoint}
class EndpointCreatePlayerData extends _i1.EndpointRef {
  EndpointCreatePlayerData(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'createPlayerData';

  _i2.Future<_i3.PlayerData> v1({
    required String displayName,
    required _i4.Faction favoriteFaction,
    _i5.Country? currentCountry,
    _i5.Country? nationality,
  }) => caller.callServerEndpoint<_i3.PlayerData>(
    'createPlayerData',
    'v1',
    {
      'displayName': displayName,
      'favoriteFaction': favoriteFaction,
      'currentCountry': currentCountry,
      'nationality': nationality,
    },
  );
}

/// {@category Endpoint}
class EndpointGetAccount extends _i1.EndpointRef {
  EndpointGetAccount(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'getAccount';

  _i2.Future<_i3.PlayerData?> v1() =>
      caller.callServerEndpoint<_i3.PlayerData?>(
        'getAccount',
        'v1',
        {},
      );
}

/// {@category Endpoint}
class EndpointCreateComment extends _i1.EndpointRef {
  EndpointCreateComment(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'createComment';

  _i2.Future<_i6.PostComment> v1({
    required int postId,
    required String content,
    required _i7.Language language,
  }) => caller.callServerEndpoint<_i6.PostComment>(
    'createComment',
    'v1',
    {
      'postId': postId,
      'content': content,
      'language': language,
    },
  );
}

/// {@category Endpoint}
class EndpointCreatePost extends _i1.EndpointRef {
  EndpointCreatePost(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'createPost';

  _i2.Future<_i8.Post> v1({
    required String title,
    required String content,
    required _i7.Language language,
    int? attachedMatchId,
  }) => caller.callServerEndpoint<_i8.Post>(
    'createPost',
    'v1',
    {
      'title': title,
      'content': content,
      'language': language,
      'attachedMatchId': attachedMatchId,
    },
  );
}

/// {@category Endpoint}
class EndpointGetComments extends _i1.EndpointRef {
  EndpointGetComments(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'getComments';

  _i2.Future<_i9.CommentsPagination> v1({
    required int postId,
    required int page,
  }) => caller.callServerEndpoint<_i9.CommentsPagination>(
    'getComments',
    'v1',
    {
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

  _i2.Future<_i10.PostPagination> v1({
    required int page,
    _i7.Language? language,
  }) => caller.callServerEndpoint<_i10.PostPagination>(
    'getPosts',
    'v1',
    {
      'page': page,
      'language': language,
    },
  );
}

/// {@category Endpoint}
class EndpointGetMyMatches extends _i1.EndpointRef {
  EndpointGetMyMatches(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'getMyMatches';

  _i2.Future<List<_i11.PlayedMatch>> v1() =>
      caller.callServerEndpoint<List<_i11.PlayedMatch>>(
        'getMyMatches',
        'v1',
        {},
      );
}

/// {@category Endpoint}
class EndpointRegisterMatchData extends _i1.EndpointRef {
  EndpointRegisterMatchData(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'registerMatchData';

  _i2.Future<_i11.PlayedMatch> v1({
    required DateTime matchStartedAt,
    required Duration matchEstimatedDuration,
    required int locationId,
    required int scheduledPairingAttemptId,
    required List<_i12.PlayerMatchResultInput> players,
  }) => caller.callServerEndpoint<_i11.PlayedMatch>(
    'registerMatchData',
    'v1',
    {
      'matchStartedAt': matchStartedAt,
      'matchEstimatedDuration': matchEstimatedDuration,
      'locationId': locationId,
      'scheduledPairingAttemptId': scheduledPairingAttemptId,
      'players': players,
    },
  );
}

/// {@category Endpoint}
class EndpointMatchChatGetMessages extends _i1.EndpointRef {
  EndpointMatchChatGetMessages(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'matchChatGetMessages';

  _i2.Future<List<_i13.MatchChatMessage>> v1({
    required int matchChatHistoryId,
  }) => caller.callServerEndpoint<List<_i13.MatchChatMessage>>(
    'matchChatGetMessages',
    'v1',
    {'matchChatHistoryId': matchChatHistoryId},
  );
}

/// {@category Endpoint}
class EndpointMatchChatSendMessage extends _i1.EndpointRef {
  EndpointMatchChatSendMessage(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'matchChatSendMessage';

  _i2.Future<_i13.MatchChatMessage> v1({
    required int matchChatHistoryId,
    required String content,
  }) => caller.callServerEndpoint<_i13.MatchChatMessage>(
    'matchChatSendMessage',
    'v1',
    {
      'matchChatHistoryId': matchChatHistoryId,
      'content': content,
    },
  );
}

/// {@category Endpoint}
class EndpointCreateMatchSchedule extends _i1.EndpointRef {
  EndpointCreateMatchSchedule(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'createMatchSchedule';

  _i2.Future<_i14.MatchSchedulePairingAttempt> v1({
    required String title,
    String? description,
    String? aditionalLocationInfo,
    required _i15.MatchPodium minAmountOfPlayers,
    required _i15.MatchPodium maxAmountOfPlayers,
    required DateTime attemptedAt,
    required int locationId,
  }) => caller.callServerEndpoint<_i14.MatchSchedulePairingAttempt>(
    'createMatchSchedule',
    'v1',
    {
      'title': title,
      'description': description,
      'aditionalLocationInfo': aditionalLocationInfo,
      'minAmountOfPlayers': minAmountOfPlayers,
      'maxAmountOfPlayers': maxAmountOfPlayers,
      'attemptedAt': attemptedAt,
      'locationId': locationId,
    },
  );
}

/// {@category Endpoint}
class EndpointGetMatchLocation extends _i1.EndpointRef {
  EndpointGetMatchLocation(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'getMatchLocation';

  _i2.Future<List<_i16.Location>> v1({
    required String query,
    required int page,
  }) => caller.callServerEndpoint<List<_i16.Location>>(
    'getMatchLocation',
    'v1',
    {
      'query': query,
      'page': page,
    },
  );
}

/// {@category Endpoint}
class EndpointGetPlayerSubscribedMatches extends _i1.EndpointRef {
  EndpointGetPlayerSubscribedMatches(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'getPlayerSubscribedMatches';

  _i2.Future<_i17.SubscribedMatchesPagination> v1({required int page}) =>
      caller.callServerEndpoint<_i17.SubscribedMatchesPagination>(
        'getPlayerSubscribedMatches',
        'v1',
        {'page': page},
      );
}

/// {@category Endpoint}
class EndpointSubscribeToMatch extends _i1.EndpointRef {
  EndpointSubscribeToMatch(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'subscribeToMatch';

  _i2.Future<_i18.MatchSubscription> v1({required int scheduledMatchId}) =>
      caller.callServerEndpoint<_i18.MatchSubscription>(
        'subscribeToMatch',
        'v1',
        {'scheduledMatchId': scheduledMatchId},
      );
}

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
/// {@category Endpoint}
class EndpointEmailIdp extends _i19.EndpointEmailIdpBase {
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
  _i2.Future<_i20.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_i20.AuthSuccess>(
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
  _i2.Future<_i20.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_i20.AuthSuccess>(
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

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
/// {@category Endpoint}
class EndpointJwtRefresh extends _i20.EndpointRefreshJwtTokens {
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
  _i2.Future<_i20.AuthSuccess> refreshAccessToken({
    required String refreshToken,
  }) => caller.callServerEndpoint<_i20.AuthSuccess>(
    'jwtRefresh',
    'refreshAccessToken',
    {'refreshToken': refreshToken},
    authenticated: false,
  );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _i19.Caller(client);
    serverpod_auth_core = _i20.Caller(client);
  }

  late final _i19.Caller serverpod_auth_idp;

  late final _i20.Caller serverpod_auth_core;
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
         _i21.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    createPlayerData = EndpointCreatePlayerData(this);
    getAccount = EndpointGetAccount(this);
    createComment = EndpointCreateComment(this);
    createPost = EndpointCreatePost(this);
    getComments = EndpointGetComments(this);
    getPosts = EndpointGetPosts(this);
    getMyMatches = EndpointGetMyMatches(this);
    registerMatchData = EndpointRegisterMatchData(this);
    matchChatGetMessages = EndpointMatchChatGetMessages(this);
    matchChatSendMessage = EndpointMatchChatSendMessage(this);
    createMatchSchedule = EndpointCreateMatchSchedule(this);
    getMatchLocation = EndpointGetMatchLocation(this);
    getPlayerSubscribedMatches = EndpointGetPlayerSubscribedMatches(this);
    subscribeToMatch = EndpointSubscribeToMatch(this);
    emailIdp = EndpointEmailIdp(this);
    jwtRefresh = EndpointJwtRefresh(this);
    modules = Modules(this);
  }

  late final EndpointCreatePlayerData createPlayerData;

  late final EndpointGetAccount getAccount;

  late final EndpointCreateComment createComment;

  late final EndpointCreatePost createPost;

  late final EndpointGetComments getComments;

  late final EndpointGetPosts getPosts;

  late final EndpointGetMyMatches getMyMatches;

  late final EndpointRegisterMatchData registerMatchData;

  late final EndpointMatchChatGetMessages matchChatGetMessages;

  late final EndpointMatchChatSendMessage matchChatSendMessage;

  late final EndpointCreateMatchSchedule createMatchSchedule;

  late final EndpointGetMatchLocation getMatchLocation;

  late final EndpointGetPlayerSubscribedMatches getPlayerSubscribedMatches;

  late final EndpointSubscribeToMatch subscribeToMatch;

  late final EndpointEmailIdp emailIdp;

  late final EndpointJwtRefresh jwtRefresh;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
    'createPlayerData': createPlayerData,
    'getAccount': getAccount,
    'createComment': createComment,
    'createPost': createPost,
    'getComments': getComments,
    'getPosts': getPosts,
    'getMyMatches': getMyMatches,
    'registerMatchData': registerMatchData,
    'matchChatGetMessages': matchChatGetMessages,
    'matchChatSendMessage': matchChatSendMessage,
    'createMatchSchedule': createMatchSchedule,
    'getMatchLocation': getMatchLocation,
    'getPlayerSubscribedMatches': getPlayerSubscribedMatches,
    'subscribeToMatch': subscribeToMatch,
    'emailIdp': emailIdp,
    'jwtRefresh': jwtRefresh,
  };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}
