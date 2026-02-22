import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';

const _resendEndpoint = 'https://api.resend.com/emails';
const _fromEmail = 'Root Hub <onboarding@resend.dev>';

Future<bool> sendEmailWithResend({
  required Session session,
  required String apiKey,
  required String toEmail,
  required String subject,
  required String html,
}) async {
  final payload = jsonEncode({
    'from': _fromEmail,
    'to': [toEmail],
    'subject': subject,
    'html': html,
  });

  try {
    final response = await http.post(
      Uri.parse(_resendEndpoint),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: payload,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      session.log(
        '[EmailIdp] Resend accepted email to $toEmail.',
        level: LogLevel.info,
      );
      return true;
    }

    session.log(
      '[EmailIdp] Resend rejected email to $toEmail. '
      'status=${response.statusCode} body=${response.body}',
      level: LogLevel.warning,
    );
    return false;
  } catch (error, stackTrace) {
    session.log(
      '[EmailIdp] Failed to call Resend API for $toEmail: $error',
      level: LogLevel.error,
      exception: error,
      stackTrace: stackTrace,
    );
    return false;
  }
}
