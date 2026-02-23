import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class UploadThingStorageClient {
  const UploadThingStorageClient();

  static const _prepareUploadEndpoint =
      'https://api.uploadthing.com/v7/prepareUpload';
  static const _getAppInfoEndpoint =
      'https://api.uploadthing.com/v7/getAppInfo';

  Future<String> uploadPublicImage(
    Session session, {
    required Uint8List imageBytes,
    required String fileName,
    String? contentType,
  }) async {
    final credentials = _resolveCredentials(session);
    final normalizedFileName = _resolveFileName(fileName);
    final normalizedContentType = _resolveContentType(contentType);
    session.log(
      '[MatchChat][UploadThing] Starting upload. '
      'fileName=$normalizedFileName contentType=$normalizedContentType '
      'bytes=${imageBytes.length}',
      level: LogLevel.info,
    );

    try {
      final preparedUpload = await _prepareUpload(
        session: session,
        apiKey: credentials.apiKey,
        fileName: normalizedFileName,
        fileSize: imageBytes.length,
        fileType: normalizedContentType,
      );

      await _performUpload(
        session: session,
        uploadUrl: preparedUpload.uploadUrl,
        uploadKey: preparedUpload.key,
        imageBytes: imageBytes,
        contentType: normalizedContentType,
      );

      final appId =
          credentials.appId ?? await _fetchAppId(session, credentials.apiKey);
      final publicUrl = 'https://$appId.ufs.sh/f/${preparedUpload.key}';
      session.log(
        '[MatchChat][UploadThing] Upload completed. url=$publicUrl',
        level: LogLevel.info,
      );
      return publicUrl;
    } on RootHubException catch (error) {
      session.log(
        '[MatchChat][UploadThing] Upload failed with RootHubException. '
        'title=${error.title} description=${error.description}',
        level: LogLevel.warning,
      );
      rethrow;
    } catch (error, stackTrace) {
      session.log(
        '[MatchChat][UploadThing] Upload failed with unexpected error: $error',
        level: LogLevel.error,
        exception: error,
        stackTrace: stackTrace,
      );
      throw RootHubEndpointError.endpointUnavailable(
        description: 'Unable to upload image right now. Please try again.',
      );
    }
  }

  _UploadThingCredentials _resolveCredentials(Session session) {
    final rawApiKey = _sanitizeSecret(
      _readPassword(
        session,
        'uploadThingApiKey',
      ),
    );
    final rawToken = _sanitizeSecret(
      _readPassword(
        session,
        'uploadThingToken',
      ),
    );

    final parsedToken = _parseToken(rawToken);
    if (rawToken != null && parsedToken == null) {
      session.log(
        '[MatchChat][UploadThing] uploadThingToken is set but could not be parsed. '
        'Falling back to uploadThingApiKey when available.',
        level: LogLevel.warning,
      );
    }

    final apiKey = parsedToken?.apiKey ?? rawApiKey;
    if (apiKey == null || apiKey.isEmpty) {
      throw RootHubEndpointError.configuration(
        description:
            'UploadThing API key is not configured. Set `uploadThingApiKey` '
            'or `uploadThingToken` in config/passwords.yaml.',
      );
    }

    session.log(
      '[MatchChat][UploadThing] Credentials resolved. '
      'source=${parsedToken != null ? 'token' : 'apiKey'} '
      'hasAppId=${parsedToken?.appId != null}',
      level: LogLevel.info,
    );

    return _UploadThingCredentials(
      apiKey: apiKey,
      appId: parsedToken?.appId,
    );
  }

  String? _readPassword(
    Session session,
    String key,
  ) {
    final value = session.passwords[key];
    return value is String ? value : null;
  }

  String? _sanitizeSecret(String? rawValue) {
    if (rawValue == null) {
      return null;
    }

    var normalized = rawValue.trim();
    if (normalized.isEmpty) {
      return null;
    }

    if (normalized.startsWith('UPLOADTHING_API_KEY=')) {
      normalized = normalized.substring('UPLOADTHING_API_KEY='.length);
    } else if (normalized.startsWith('UPLOADTHING_TOKEN=')) {
      normalized = normalized.substring('UPLOADTHING_TOKEN='.length);
    }

    normalized = _stripWrappingQuotes(normalized.trim());
    return normalized.isEmpty ? null : normalized;
  }

  String _stripWrappingQuotes(String value) {
    if (value.length < 2) {
      return value;
    }

    final first = value[0];
    final last = value[value.length - 1];
    final hasMatchingQuotes =
        (first == '\'' && last == '\'') || (first == '"' && last == '"');
    if (!hasMatchingQuotes) {
      return value;
    }

    return value.substring(1, value.length - 1).trim();
  }

  _UploadThingToken? _parseToken(String? rawToken) {
    if (rawToken == null || rawToken.isEmpty) {
      return null;
    }

    try {
      final normalizedToken = _normalizeBase64(rawToken);
      final decodedBytes = base64Url.decode(normalizedToken);
      final decodedPayload = jsonDecode(utf8.decode(decodedBytes));
      if (decodedPayload is! Map<String, dynamic>) {
        return null;
      }

      final apiKey = decodedPayload['apiKey'];
      final appId = decodedPayload['appId'];
      if (apiKey is! String || apiKey.trim().isEmpty) {
        return null;
      }

      return _UploadThingToken(
        apiKey: apiKey.trim(),
        appId: appId is String && appId.trim().isNotEmpty ? appId.trim() : null,
      );
    } catch (_) {
      return null;
    }
  }

  String _normalizeBase64(String value) {
    final sanitized = value.replaceAll('\n', '').trim();
    final remainder = sanitized.length % 4;
    if (remainder == 0) {
      return sanitized;
    }

    return sanitized.padRight(sanitized.length + (4 - remainder), '=');
  }

  String _resolveFileName(String inputFileName) {
    final normalized = inputFileName.trim();
    if (normalized.isNotEmpty) {
      return normalized;
    }
    return 'match-chat-image.jpg';
  }

  String _resolveContentType(String? inputContentType) {
    final normalized = inputContentType?.trim();
    if (normalized != null && normalized.isNotEmpty) {
      return normalized;
    }
    return 'image/jpeg';
  }

  Future<_PreparedUpload> _prepareUpload({
    required Session session,
    required String apiKey,
    required String fileName,
    required int fileSize,
    required String fileType,
  }) async {
    final response = await http.post(
      Uri.parse(_prepareUploadEndpoint),
      headers: <String, String>{
        'content-type': 'application/json',
        'x-uploadthing-api-key': apiKey,
      },
      body: jsonEncode({
        'fileName': fileName,
        'fileSize': fileSize,
        'fileType': fileType,
        'acl': 'public-read',
        'contentDisposition': 'inline',
      }),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      session.log(
        '[MatchChat][UploadThing] prepareUpload failed. '
        'status=${response.statusCode} body=${_previewBodyForLog(response.body)}',
        level: LogLevel.warning,
      );
      throw RootHubEndpointError.endpointUnavailable(
        description: _buildErrorDescription(
          fallback:
              'UploadThing failed to prepare image upload. Please try again.',
          responseBody: response.body,
        ),
      );
    }

    final parsedBody = jsonDecode(response.body);
    if (parsedBody is! Map<String, dynamic>) {
      session.log(
        '[MatchChat][UploadThing] prepareUpload returned non-map body. '
        'body=${_previewBodyForLog(response.body)}',
        level: LogLevel.warning,
      );
      throw RootHubEndpointError.endpointUnavailable(
        description:
            'UploadThing returned an invalid upload preparation format.',
      );
    }

    final key = parsedBody['key'];
    final uploadUrl = parsedBody['url'];
    if (key is! String ||
        key.trim().isEmpty ||
        uploadUrl is! String ||
        uploadUrl.trim().isEmpty) {
      session.log(
        '[MatchChat][UploadThing] prepareUpload missing key/url. '
        'body=${_previewBodyForLog(response.body)}',
        level: LogLevel.warning,
      );
      throw RootHubEndpointError.endpointUnavailable(
        description: 'UploadThing response is missing key or upload URL.',
      );
    }

    return _PreparedUpload(
      key: key.trim(),
      uploadUrl: uploadUrl.trim(),
    );
  }

  Future<void> _performUpload({
    required Session session,
    required String uploadUrl,
    required String uploadKey,
    required Uint8List imageBytes,
    required String contentType,
  }) async {
    final response = await http.put(
      Uri.parse(uploadUrl),
      headers: <String, String>{
        'content-type': contentType,
      },
      body: imageBytes,
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      session.log(
        '[MatchChat][UploadThing] Signed upload request failed. '
        'uploadKey=$uploadKey status=${response.statusCode} '
        'body=${_previewBodyForLog(response.body)}',
        level: LogLevel.warning,
      );
      throw RootHubEndpointError.endpointUnavailable(
        description: _buildErrorDescription(
          fallback: 'UploadThing rejected the uploaded image bytes.',
          responseBody: response.body,
        ),
      );
    }
  }

  Future<String> _fetchAppId(
    Session session,
    String apiKey,
  ) async {
    final response = await http.post(
      Uri.parse(_getAppInfoEndpoint),
      headers: <String, String>{
        'content-type': 'application/json',
        'x-uploadthing-api-key': apiKey,
      },
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      session.log(
        '[MatchChat][UploadThing] getAppInfo failed. '
        'status=${response.statusCode} body=${_previewBodyForLog(response.body)}',
        level: LogLevel.warning,
      );
      throw RootHubEndpointError.endpointUnavailable(
        description: _buildErrorDescription(
          fallback: 'UploadThing app info lookup failed.',
          responseBody: response.body,
        ),
      );
    }

    final parsedBody = jsonDecode(response.body);
    if (parsedBody is! Map<String, dynamic>) {
      session.log(
        '[MatchChat][UploadThing] getAppInfo returned non-map body. '
        'body=${_previewBodyForLog(response.body)}',
        level: LogLevel.warning,
      );
      throw RootHubEndpointError.endpointUnavailable(
        description: 'UploadThing returned an invalid app info format.',
      );
    }

    final appId = parsedBody['appId'];
    if (appId is! String || appId.trim().isEmpty) {
      session.log(
        '[MatchChat][UploadThing] getAppInfo missing appId. '
        'body=${_previewBodyForLog(response.body)}',
        level: LogLevel.warning,
      );
      throw RootHubEndpointError.endpointUnavailable(
        description: 'UploadThing app id is missing in app info response.',
      );
    }

    return appId.trim();
  }

  String _buildErrorDescription({
    required String fallback,
    required String responseBody,
  }) {
    final extractedMessage = _extractErrorMessage(responseBody);
    return extractedMessage ?? fallback;
  }

  String? _extractErrorMessage(String responseBody) {
    if (responseBody.trim().isEmpty) {
      return null;
    }

    try {
      final parsed = jsonDecode(responseBody);
      if (parsed is! Map<String, dynamic>) {
        return null;
      }

      final message = parsed['message'];
      if (message is String && message.trim().isNotEmpty) {
        return message.trim();
      }

      final error = parsed['error'];
      if (error is String && error.trim().isNotEmpty) {
        return error.trim();
      }

      return null;
    } catch (_) {
      return null;
    }
  }

  String _previewBodyForLog(String body) {
    final normalized = body.replaceAll(RegExp(r'\s+'), ' ').trim();
    if (normalized.isEmpty) {
      return '<empty>';
    }
    if (normalized.length <= 350) {
      return normalized;
    }
    return '${normalized.substring(0, 350)}...';
  }
}

class _PreparedUpload {
  _PreparedUpload({
    required this.key,
    required this.uploadUrl,
  });

  final String key;
  final String uploadUrl;
}

class _UploadThingCredentials {
  _UploadThingCredentials({
    required this.apiKey,
    required this.appId,
  });

  final String apiKey;
  final String? appId;
}

class _UploadThingToken {
  _UploadThingToken({
    required this.apiKey,
    required this.appId,
  });

  final String apiKey;
  final String? appId;
}
