import 'dart:convert';

import 'package:googleapis_auth/auth_io.dart';
import 'package:serverpod/serverpod.dart';

class FcmCredentials {
  FcmCredentials({
    required this.projectId,
    required this.serviceAccountCredentials,
  });

  final String projectId;
  final ServiceAccountCredentials serviceAccountCredentials;

  static FcmCredentials? tryFromSession(Session session) {
    final rawServiceAccount = _readPasswordString(
      session.passwords['firebaseServiceAccountJson'],
    );
    if (rawServiceAccount.isEmpty) {
      return null;
    }

    final decodedJson = jsonDecode(rawServiceAccount);
    if (decodedJson is! Map<String, dynamic>) {
      throw const FormatException(
        'firebaseServiceAccountJson must decode to a JSON object.',
      );
    }

    final normalizedServiceAccount = <String, dynamic>{
      ...decodedJson,
      if (decodedJson['private_key'] is String)
        'private_key': (decodedJson['private_key'] as String).replaceAll(
          r'\n',
          '\n',
        ),
    };

    final overrideProjectId = _readPasswordString(
      session.passwords['firebaseMessagingProjectId'],
    );
    final projectId = overrideProjectId.isNotEmpty
        ? overrideProjectId
        : (normalizedServiceAccount['project_id'] as String?)?.trim() ?? '';

    if (projectId.isEmpty) {
      throw const FormatException(
        'Missing Firebase project id in firebaseServiceAccountJson '
        'or firebaseMessagingProjectId.',
      );
    }

    return FcmCredentials(
      projectId: projectId,
      serviceAccountCredentials: ServiceAccountCredentials.fromJson(
        normalizedServiceAccount,
      ),
    );
  }

  static String _readPasswordString(Object? value) {
    if (value is! String) {
      return '';
    }
    return value.trim();
  }
}
