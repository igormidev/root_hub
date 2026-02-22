import 'package:root_hub_server/src/auth/auth_email_template.dart';
import 'package:root_hub_server/src/auth/send_email.dart';
import 'package:serverpod/serverpod.dart';

Future<void> onSendPasswordResetVerificationCode(
  Session session, {
  required String email,
  required UuidValue passwordResetRequestId,
  required String verificationCode,
  required Transaction? transaction,
}) async {
  final resendApiKey = session.passwords['resendApiKey'];
  if (resendApiKey == null || resendApiKey.trim().isEmpty) {
    session.log(
      '[EmailIdp] resendApiKey is missing. Password reset code ($email): '
      '$verificationCode',
      level: LogLevel.warning,
    );
    return;
  }

  final html = buildAuthEmailHtml(
    title: 'Reset Your Root Hub Password',
    description:
        'Enter this verification code in Root Hub to continue resetting your password.',
    code: verificationCode,
    footerNote:
        'If you did not request a password reset, please ignore this email.',
  );

  final delivered = await sendEmailWithResend(
    session: session,
    apiKey: resendApiKey,
    toEmail: email,
    subject: 'Root Hub | Password reset code',
    html: html,
  );

  if (!delivered) {
    session.log(
      '[EmailIdp] Fallback password reset code ($email): $verificationCode',
      level: LogLevel.warning,
    );
  }
}
