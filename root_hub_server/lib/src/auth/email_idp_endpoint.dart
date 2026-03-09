import 'package:email_validator/email_validator.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';
import 'package:root_hub_server/src/generated/protocol.dart';

/// Exposes the email identity provider with Root Hub specific auth feedback.
class EmailIdpEndpoint extends EmailIdpBaseEndpoint {
  static const _emailAuthMethod = EmailIdp.method;

  AuthUsers get _authUsers => AuthServices.instance.authUsers;
  UserProfiles get _userProfiles => AuthServices.instance.userProfiles;
  TokenManager get _tokenManager => AuthServices.instance.tokenManager;

  @override
  Future<AuthSuccess> login(
    Session session, {
    required String email,
    required String password,
  }) async {
    final normalizedEmail = _normalizeAndValidateEmail(email);

    return DatabaseUtil.runInTransactionOrSavepoint(
      session.db,
      null,
      (transaction) async {
        return EmailIdpUtils.withReplacedServerEmailException(() async {
          try {
            final authUserId = await emailIdp.utils.authentication.authenticate(
              session,
              email: normalizedEmail,
              password: password,
              transaction: transaction,
            );
            final authUser = await _authUsers.get(
              session,
              authUserId: authUserId,
              transaction: transaction,
            );

            return _issueEmailToken(
              session,
              authUserId: authUserId,
              scopes: authUser.scopes,
              transaction: transaction,
            );
          } on EmailAccountNotFoundException {
            throw AuthFeedbackException(
              reason: AuthFeedbackExceptionReason.accountNotFound,
            );
          } on EmailAuthenticationInvalidCredentialsException {
            throw AuthFeedbackException(
              reason: AuthFeedbackExceptionReason.invalidPassword,
            );
          }
        });
      },
    );
  }

  @override
  Future<UuidValue> startRegistration(
    Session session, {
    required String email,
  }) async {
    final normalizedEmail = _normalizeAndValidateEmail(email);

    return DatabaseUtil.runInTransactionOrSavepoint(
      session.db,
      null,
      (transaction) async {
        return EmailIdpUtils.withReplacedServerEmailException(() async {
          try {
            return await emailIdp.utils.accountCreation.startRegistration(
              session,
              email: normalizedEmail,
              transaction: transaction,
            );
          } on EmailAccountAlreadyRegisteredException {
            throw AuthFeedbackException(
              reason: AuthFeedbackExceptionReason.accountAlreadyExists,
            );
          }
        });
      },
    );
  }

  @override
  Future<AuthSuccess> finishRegistration(
    Session session, {
    required String registrationToken,
    required String password,
  }) async {
    return DatabaseUtil.runInTransactionOrSavepoint(
      session.db,
      null,
      (transaction) async {
        return EmailIdpUtils.withReplacedServerEmailException(() async {
          final result = await emailIdp.utils.accountCreation
              .completeAccountCreation(
                session,
                completeAccountCreationToken: registrationToken,
                password: password,
                transaction: transaction,
              );

          await _userProfiles.createUserProfile(
            session,
            result.authUserId,
            UserProfileData(email: result.email),
            transaction: transaction,
          );

          return _issueEmailToken(
            session,
            authUserId: result.authUserId,
            scopes: result.scopes,
            transaction: transaction,
          );
        });
      },
    );
  }

  @override
  Future<UuidValue> startPasswordReset(
    Session session, {
    required String email,
  }) async {
    final normalizedEmail = _normalizeAndValidateEmail(email);

    return DatabaseUtil.runInTransactionOrSavepoint(
      session.db,
      null,
      (transaction) async {
        return EmailIdpUtils.withReplacedServerEmailException(() async {
          try {
            return await emailIdp.utils.passwordReset.startPasswordReset(
              session,
              email: normalizedEmail,
              transaction: transaction,
            );
          } on EmailPasswordResetEmailNotFoundException {
            throw AuthFeedbackException(
              reason: AuthFeedbackExceptionReason.accountNotFound,
            );
          }
        });
      },
    );
  }

  @override
  Future<void> finishPasswordReset(
    Session session, {
    required String finishPasswordResetToken,
    required String newPassword,
  }) async {
    return DatabaseUtil.runInTransactionOrSavepoint(
      session.db,
      null,
      (transaction) async {
        return EmailIdpUtils.withReplacedServerEmailException(() async {
          try {
            final authUserId = await emailIdp.utils.passwordReset
                .completePasswordReset(
                  session,
                  completePasswordResetToken: finishPasswordResetToken,
                  newPassword: newPassword,
                  transaction: transaction,
                );

            await _tokenManager.revokeAllTokens(
              session,
              authUserId: authUserId,
              method: _emailAuthMethod,
              transaction: transaction,
            );
          } on EmailPasswordResetEmailNotFoundException {
            throw AuthFeedbackException(
              reason: AuthFeedbackExceptionReason.accountNotFound,
            );
          }
        });
      },
    );
  }

  String _normalizeAndValidateEmail(String email) {
    final normalizedEmail = email.trim().toLowerCase();

    if (!EmailValidator.validate(normalizedEmail)) {
      throw AuthFeedbackException(
        reason: AuthFeedbackExceptionReason.invalidEmail,
      );
    }

    if (normalizedEmail.contains('+')) {
      throw AuthFeedbackException(
        reason: AuthFeedbackExceptionReason.emailAliasNotAllowed,
      );
    }

    return normalizedEmail;
  }

  Future<AuthSuccess> _issueEmailToken(
    Session session, {
    required UuidValue authUserId,
    required Set<Scope> scopes,
    required Transaction transaction,
  }) async {
    try {
      return await _tokenManager.issueToken(
        session,
        authUserId: authUserId,
        method: _emailAuthMethod,
        scopes: scopes,
        transaction: transaction,
      );
    } on AuthUserBlockedException {
      throw AuthFeedbackException(
        reason: AuthFeedbackExceptionReason.accountBlocked,
      );
    }
  }
}
