import 'package:root_hub_server/src/auth/auth_email_template.dart';
import 'package:root_hub_server/src/auth/send_email.dart';
import 'package:serverpod/serverpod.dart';

Future<void> onSendRegistrationVerificationCode(
  Session session, {
  required String email,
  required UuidValue accountRequestId,
  required String verificationCode,
  required Transaction? transaction,
}) async {
  final resendApiKey = session.passwords['resendApiKey'];
  if (resendApiKey == null || resendApiKey.trim().isEmpty) {
    session.log(
      '[EmailIdp] resendApiKey is missing. Registration code ($email): '
      '$verificationCode',
      level: LogLevel.warning,
    );
    return;
  }

  final html = buildAuthEmailHtml(
    title: 'Confirm Your Root Hub Account',
    description:
        'Enter this verification code in Root Hub to complete your registration.',
    code: verificationCode,
    footerNote:
        'If you did not request this code, you can ignore this message.',
  );

  final delivered = await sendEmailWithResend(
    session: session,
    apiKey: resendApiKey,
    toEmail: email,
    subject: 'Root Hub | Confirm your email',
    html: html,
  );

  if (!delivered) {
    session.log(
      '[EmailIdp] Fallback registration code ($email): $verificationCode',
      level: LogLevel.warning,
    );
  }
}
