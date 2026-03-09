import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class UploadThingStorageClient {
  const UploadThingStorageClient();

  static const _prepareUploadEndpoint =
      'https://api.uploadthing.com/v7/prepareUpload';
  static const _getAppInfoEndpoint =
      'https://api.uploadthing.com/v7/getAppInfo';
  static final _uploadKeyPattern = RegExp(r'^[A-Za-z0-9._/-]+$');

  Future<UploadThingPreparedUpload> preparePublicImageUpload(
    Session session, {
    required ServerSupportedTranslation language,
    required String fileName,
    required int fileSize,
    String? contentType,
  }) async {
    final credentials = _resolveCredentials(
      session,
      language: language,
    );
    final normalizedFileName = _resolveFileName(fileName);
    final normalizedContentType = _resolveContentType(contentType);

    final preparedUpload = await _prepareUpload(
      session: session,
      language: language,
      apiKey: credentials.apiKey,
      fileName: normalizedFileName,
      fileSize: fileSize,
      fileType: normalizedContentType,
    );

    final appId = await _resolveAppId(
      session,
      language: language,
      credentials: credentials,
    );
    final publicUrl = buildPublicImageUrl(
      appId: appId,
      uploadKey: preparedUpload.key,
    );

    return UploadThingPreparedUpload(
      uploadKey: preparedUpload.key,
      uploadUrl: preparedUpload.uploadUrl,
      publicUrl: publicUrl,
    );
  }

  Future<String> buildPublicImageUrlFromUploadKey(
    Session session, {
    required ServerSupportedTranslation language,
    required String uploadKey,
  }) async {
    final credentials = _resolveCredentials(
      session,
      language: language,
    );
    final appId = await _resolveAppId(
      session,
      language: language,
      credentials: credentials,
    );
    return buildPublicImageUrl(
      appId: appId,
      uploadKey: uploadKey,
    );
  }

  String buildPublicImageUrl({
    required String appId,
    required String uploadKey,
  }) {
    return 'https://$appId.ufs.sh/f/$uploadKey';
  }

  String normalizeUploadKey(String uploadKey) => uploadKey.trim();

  bool isUploadKeyFormatValid(String uploadKey) {
    if (uploadKey.isEmpty) {
      return false;
    }

    return _uploadKeyPattern.hasMatch(uploadKey);
  }

  Future<String> uploadPublicImage(
    Session session, {
    required ServerSupportedTranslation language,
    required Uint8List imageBytes,
    required String fileName,
    String? contentType,
  }) async {
    final t = ServerTranslations.of(language);
    final normalizedFileName = _resolveFileName(fileName);
    final normalizedContentType = _resolveContentType(contentType);
    session.log(
      '[MatchChat][UploadThing] Starting upload. '
      'fileName=$normalizedFileName contentType=$normalizedContentType '
      'bytes=${imageBytes.length}',
      level: LogLevel.info,
    );

    try {
      final preparedUpload = await preparePublicImageUpload(
        session,
        language: language,
        fileName: normalizedFileName,
        fileSize: imageBytes.length,
        contentType: normalizedContentType,
      );

      await _performUpload(
        session: session,
        language: language,
        uploadUrl: preparedUpload.uploadUrl,
        uploadKey: preparedUpload.uploadKey,
        fileBytes: imageBytes,
      );
      session.log(
        '[MatchChat][UploadThing] Upload completed. url=${preparedUpload.publicUrl}',
        level: LogLevel.info,
      );
      return preparedUpload.publicUrl;
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
        language: language,
        description: t.fallback.unableToUploadImage,
      );
    }
  }

  Future<String> uploadPublicFile(
    Session session, {
    required ServerSupportedTranslation language,
    required Uint8List fileBytes,
    required String fileName,
    String? contentType,
  }) async {
    final t = ServerTranslations.of(language);
    final normalizedFileName = _resolveGenericFileName(fileName);
    final normalizedContentType = _resolveGenericContentType(contentType);
    session.log(
      '[MatchChat][UploadThing] Starting generic upload. '
      'fileName=$normalizedFileName contentType=$normalizedContentType '
      'bytes=${fileBytes.length}',
      level: LogLevel.info,
    );

    try {
      final credentials = _resolveCredentials(
        session,
        language: language,
      );
      final preparedUpload = await _prepareUpload(
        session: session,
        language: language,
        apiKey: credentials.apiKey,
        fileName: normalizedFileName,
        fileSize: fileBytes.length,
        fileType: normalizedContentType,
      );

      final appId = await _resolveAppId(
        session,
        language: language,
        credentials: credentials,
      );
      final publicUrl = buildPublicImageUrl(
        appId: appId,
        uploadKey: preparedUpload.key,
      );

      await _performUpload(
        session: session,
        language: language,
        uploadUrl: preparedUpload.uploadUrl,
        uploadKey: preparedUpload.key,
        fileBytes: fileBytes,
      );
      session.log(
        '[MatchChat][UploadThing] Generic upload completed. url=$publicUrl',
        level: LogLevel.info,
      );
      return publicUrl;
    } on RootHubException catch (error) {
      session.log(
        '[MatchChat][UploadThing] Generic upload failed with RootHubException. '
        'title=${error.title} description=${error.description}',
        level: LogLevel.warning,
      );
      rethrow;
    } catch (error, stackTrace) {
      session.log(
        '[MatchChat][UploadThing] Generic upload failed with unexpected error: $error',
        level: LogLevel.error,
        exception: error,
        stackTrace: stackTrace,
      );
      throw RootHubEndpointError.endpointUnavailable(
        language: language,
        description: t.fallback.unableToUploadImage,
      );
    }
  }

  Future<String> _resolveAppId(
    Session session, {
    required ServerSupportedTranslation language,
    required _UploadThingCredentials credentials,
  }) async {
    final appIdFromToken = credentials.appId?.trim();
    if (appIdFromToken != null && appIdFromToken.isNotEmpty) {
      return appIdFromToken;
    }

    return _fetchAppId(
      session,
      credentials.apiKey,
      language: language,
    );
  }

  _UploadThingCredentials _resolveCredentials(
    Session session, {
    required ServerSupportedTranslation language,
  }) {
    final t = ServerTranslations.of(language);

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
        language: language,
        description: t.errors.uploadThingApiKeyNotConfigured,
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

  String _resolveGenericFileName(String inputFileName) {
    final normalized = inputFileName.trim();
    if (normalized.isNotEmpty) {
      return normalized;
    }
    return 'match-chat-upload.bin';
  }

  String _resolveContentType(String? inputContentType) {
    final normalized = inputContentType?.trim();
    if (normalized != null && normalized.isNotEmpty) {
      return normalized;
    }
    return 'image/jpeg';
  }

  String _resolveGenericContentType(String? inputContentType) {
    final normalized = inputContentType?.trim();
    if (normalized != null && normalized.isNotEmpty) {
      return normalized;
    }
    return 'application/octet-stream';
  }

  Future<_PreparedUpload> _prepareUpload({
    required Session session,
    required ServerSupportedTranslation language,
    required String apiKey,
    required String fileName,
    required int fileSize,
    required String fileType,
  }) async {
    final t = ServerTranslations.of(language);

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
        language: language,
        description: _buildErrorDescription(
          fallback: t.errors.uploadThingPrepareUploadFailed,
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
        language: language,
        description: t.errors.uploadThingInvalidUploadPreparationFormat,
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
        language: language,
        description: t.errors.uploadThingMissingKeyOrUrl,
      );
    }

    return _PreparedUpload(
      key: key.trim(),
      uploadUrl: uploadUrl.trim(),
    );
  }

  Future<void> _performUpload({
    required Session session,
    required ServerSupportedTranslation language,
    required String uploadUrl,
    required String uploadKey,
    required Uint8List fileBytes,
  }) async {
    final t = ServerTranslations.of(language);

    final request = http.MultipartRequest(
      'PUT',
      Uri.parse(uploadUrl),
    );
    request.files.add(
      http.MultipartFile.fromBytes(
        'file',
        fileBytes,
        filename: uploadKey,
      ),
    );
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode < 200 || response.statusCode >= 300) {
      session.log(
        '[MatchChat][UploadThing] Signed upload request failed. '
        'uploadKey=$uploadKey status=${response.statusCode} '
        'body=${_previewBodyForLog(response.body)}',
        level: LogLevel.warning,
      );
      throw RootHubEndpointError.endpointUnavailable(
        language: language,
        description: _buildErrorDescription(
          fallback: t.errors.uploadThingRejectedImageBytes,
          responseBody: response.body,
        ),
      );
    }
  }

  Future<String> _fetchAppId(
    Session session,
    String apiKey, {
    required ServerSupportedTranslation language,
  }) async {
    final t = ServerTranslations.of(language);

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
        language: language,
        description: _buildErrorDescription(
          fallback: t.errors.uploadThingAppInfoLookupFailed,
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
        language: language,
        description: t.errors.uploadThingInvalidAppInfoFormat,
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
        language: language,
        description: t.errors.uploadThingAppIdMissing,
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

class UploadThingPreparedUpload {
  UploadThingPreparedUpload({
    required this.uploadKey,
    required this.uploadUrl,
    required this.publicUrl,
  });

  final String uploadKey;
  final String uploadUrl;
  final String publicUrl;
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
