import 'dart:convert';

import 'package:http/http.dart' as http;

import 'fcm_access_token_provider.dart';
import 'fcm_credentials.dart';
import 'fcm_send_result.dart';

class FcmHttpV1Client {
  const FcmHttpV1Client();

  static final http.Client _httpClient = http.Client();
  static const _requestTimeout = Duration(seconds: 8);

  Future<FcmSendResult> sendToToken({
    required FcmCredentials credentials,
    required String token,
    required String title,
    required String body,
    required Map<String, String> data,
    String? accessToken,
  }) async {
    final resolvedAccessToken =
        accessToken ??
        await FcmAccessTokenProvider.getAccessToken(
          credentials,
        );

    final endpoint = Uri.https(
      'fcm.googleapis.com',
      '/v1/projects/${credentials.projectId}/messages:send',
    );

    final payload = <String, Object?>{
      'message': <String, Object?>{
        'token': token,
        'notification': <String, String>{
          'title': title,
          'body': body,
        },
        'data': data,
        'android': <String, Object?>{
          'priority': 'HIGH',
          'notification': <String, String>{
            'channel_id': 'match_chat',
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          },
        },
        'apns': <String, Object?>{
          'headers': <String, String>{
            'apns-priority': '10',
            'apns-push-type': 'alert',
          },
          'payload': <String, Object?>{
            'aps': <String, Object?>{
              'sound': 'default',
            },
          },
        },
      },
    };

    final response = await _httpClient
        .post(
          endpoint,
          headers: <String, String>{
            'Authorization': 'Bearer $resolvedAccessToken',
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(payload),
        )
        .timeout(_requestTimeout);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return const FcmSendResult.success();
    }

    return _parseErrorResponse(
      statusCode: response.statusCode,
      responseBody: utf8.decode(response.bodyBytes),
    );
  }

  FcmSendResult _parseErrorResponse({
    required int statusCode,
    required String responseBody,
  }) {
    try {
      final decoded = jsonDecode(responseBody);
      if (decoded is! Map<String, dynamic>) {
        return FcmSendResult(
          success: false,
          errorCode: null,
          errorStatus: null,
          httpStatusCode: statusCode,
        );
      }

      final error = decoded['error'];
      if (error is! Map<String, dynamic>) {
        return FcmSendResult(
          success: false,
          errorCode: null,
          errorStatus: null,
          httpStatusCode: statusCode,
        );
      }

      final status = error['status'] as String?;
      final details = error['details'];
      String? errorCode;
      if (details is List<Object?>) {
        for (final detail in details) {
          if (detail is! Map<String, dynamic>) {
            continue;
          }
          final detailCode = detail['errorCode'];
          if (detailCode is String && detailCode.isNotEmpty) {
            errorCode = detailCode;
            break;
          }
        }
      }

      return FcmSendResult(
        success: false,
        errorCode: errorCode,
        errorStatus: status,
        httpStatusCode: statusCode,
      );
    } catch (_) {
      return FcmSendResult(
        success: false,
        errorCode: null,
        errorStatus: null,
        httpStatusCode: statusCode,
      );
    }
  }
}
