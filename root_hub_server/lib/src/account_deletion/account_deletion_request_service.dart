import 'package:root_hub_server/src/auth/send_email.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

const _notificationEmailPasswordKey = 'accountDeletionNotificationEmail';

class AccountDeletionRequestService {
  const AccountDeletionRequestService._();

  static Future<AccountDeletionRequest> createAndNotify(
    Session session, {
    required String email,
  }) async {
    var request = await AccountDeletionRequest.db.insertRow(
      session,
      AccountDeletionRequest(
        createdAt: DateTime.now().toUtc(),
        email: email,
      ),
    );

    final notificationTargetEmail = _resolveNotificationTargetEmail(session);
    if (notificationTargetEmail == null) {
      session.log(
        '[AccountDeletionRequest] Saved request ${request.id} for $email without notification target email.',
        level: LogLevel.warning,
      );
      return request;
    }

    request = await AccountDeletionRequest.db.updateRow(
      session,
      request.copyWith(notificationTargetEmail: notificationTargetEmail),
    );

    final resendApiKey = session.passwords['resendApiKey']?.trim();
    if (resendApiKey == null || resendApiKey.isEmpty) {
      session.log(
        '[AccountDeletionRequest] Saved request ${request.id} for $email but resendApiKey is missing.',
        level: LogLevel.warning,
      );
      return request;
    }

    final notificationAttemptedAt = DateTime.now().toUtc();
    request = await AccountDeletionRequest.db.updateRow(
      session,
      request.copyWith(notificationAttemptedAt: notificationAttemptedAt),
    );

    final delivered = await sendEmailWithResend(
      session: session,
      apiKey: resendApiKey,
      toEmail: notificationTargetEmail,
      subject: 'Root Hub account deletion request',
      html: _buildNotificationHtml(
        email: email,
        requestedAt: request.createdAt,
        requestId: request.id!,
      ),
    );

    if (!delivered) {
      session.log(
        '[AccountDeletionRequest] Email notification failed for request ${request.id}.',
        level: LogLevel.warning,
      );
      return request;
    }

    request = await AccountDeletionRequest.db.updateRow(
      session,
      request.copyWith(notificationSentAt: DateTime.now().toUtc()),
    );

    session.log(
      '[AccountDeletionRequest] Request ${request.id} for $email saved and notification sent to $notificationTargetEmail.',
      level: LogLevel.info,
    );

    return request;
  }

  static String? _resolveNotificationTargetEmail(Session session) {
    final configured = session.passwords[_notificationEmailPasswordKey]?.trim();
    if (configured == null || configured.isEmpty) {
      return null;
    }

    return configured;
  }

  static String _buildNotificationHtml({
    required String email,
    required DateTime requestedAt,
    required int requestId,
  }) {
    final requestedAtIso = requestedAt.toIso8601String();

    return '''
      <div style="font-family:Arial,sans-serif;max-width:640px;margin:0 auto;padding:24px;color:#2f1a0f;">
        <h1 style="margin:0 0 12px;font-size:24px;">Root Hub account deletion request</h1>
        <p style="margin:0 0 16px;">A new account deletion request was submitted from the public Root Hub web portal.</p>
        <table style="width:100%;border-collapse:collapse;">
          <tr>
            <td style="padding:8px 0;font-weight:700;">Request ID</td>
            <td style="padding:8px 0;">$requestId</td>
          </tr>
          <tr>
            <td style="padding:8px 0;font-weight:700;">Email</td>
            <td style="padding:8px 0;">$email</td>
          </tr>
          <tr>
            <td style="padding:8px 0;font-weight:700;">Requested at</td>
            <td style="padding:8px 0;">$requestedAtIso</td>
          </tr>
        </table>
        <p style="margin:20px 0 0;">This request is also stored in the <code>account_deletion_request</code> table.</p>
      </div>
    ''';
  }
}
