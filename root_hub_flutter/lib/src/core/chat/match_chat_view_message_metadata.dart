import 'dart:typed_data';

import 'package:chatview/chatview.dart';

enum MatchChatViewCustomMessageKind {
  image,
  system,
}

class MatchChatViewMessageMetadata {
  const MatchChatViewMessageMetadata._();

  static const kindKey = 'kind';
  static const imageUrlKey = 'imageUrl';
  static const localPreviewBytesKey = 'localPreviewBytes';
  static const blurhashKey = 'blurhash';
  static const widthKey = 'width';
  static const heightKey = 'height';
  static const systemTypeKey = 'systemType';

  static String encodeKind(MatchChatViewCustomMessageKind kind) {
    return switch (kind) {
      MatchChatViewCustomMessageKind.image => 'image',
      MatchChatViewCustomMessageKind.system => 'system',
    };
  }

  static MatchChatViewCustomMessageKind? decodeKind(String? rawKind) {
    return switch (rawKind) {
      'image' => MatchChatViewCustomMessageKind.image,
      'system' => MatchChatViewCustomMessageKind.system,
      _ => null,
    };
  }
}

extension MatchChatViewMessageMetadataExtension on Message {
  MatchChatViewCustomMessageKind? get customMessageKind {
    return MatchChatViewMessageMetadata.decodeKind(
      update?[MatchChatViewMessageMetadata.kindKey] as String?,
    );
  }

  bool get isCustomImageMessage {
    return customMessageKind == MatchChatViewCustomMessageKind.image;
  }

  bool get isCustomSystemMessage {
    return customMessageKind == MatchChatViewCustomMessageKind.system;
  }

  String? get customImageUrl {
    return update?[MatchChatViewMessageMetadata.imageUrlKey] as String?;
  }

  Uint8List? get customLocalPreviewBytes {
    final value = update?[MatchChatViewMessageMetadata.localPreviewBytesKey];
    return value is Uint8List ? value : null;
  }

  String? get customBlurhash {
    return update?[MatchChatViewMessageMetadata.blurhashKey] as String?;
  }

  double? get customImageWidth {
    final value = update?[MatchChatViewMessageMetadata.widthKey];
    if (value is double) {
      return value;
    }
    if (value is int) {
      return value.toDouble();
    }
    return null;
  }

  double? get customImageHeight {
    final value = update?[MatchChatViewMessageMetadata.heightKey];
    if (value is double) {
      return value;
    }
    if (value is int) {
      return value.toDouble();
    }
    return null;
  }

  String? get customSystemType {
    return update?[MatchChatViewMessageMetadata.systemTypeKey] as String?;
  }
}
