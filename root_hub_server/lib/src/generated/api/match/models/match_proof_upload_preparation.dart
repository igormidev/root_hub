/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class MatchProofUploadPreparation
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  MatchProofUploadPreparation._({
    required this.uploadUrl,
    required this.uploadKey,
  });

  factory MatchProofUploadPreparation({
    required String uploadUrl,
    required String uploadKey,
  }) = _MatchProofUploadPreparationImpl;

  factory MatchProofUploadPreparation.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return MatchProofUploadPreparation(
      uploadUrl: jsonSerialization['uploadUrl'] as String,
      uploadKey: jsonSerialization['uploadKey'] as String,
    );
  }

  String uploadUrl;

  String uploadKey;

  /// Returns a shallow copy of this [MatchProofUploadPreparation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchProofUploadPreparation copyWith({
    String? uploadUrl,
    String? uploadKey,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchProofUploadPreparation',
      'uploadUrl': uploadUrl,
      'uploadKey': uploadKey,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MatchProofUploadPreparation',
      'uploadUrl': uploadUrl,
      'uploadKey': uploadKey,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _MatchProofUploadPreparationImpl extends MatchProofUploadPreparation {
  _MatchProofUploadPreparationImpl({
    required String uploadUrl,
    required String uploadKey,
  }) : super._(
         uploadUrl: uploadUrl,
         uploadKey: uploadKey,
       );

  /// Returns a shallow copy of this [MatchProofUploadPreparation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchProofUploadPreparation copyWith({
    String? uploadUrl,
    String? uploadKey,
  }) {
    return MatchProofUploadPreparation(
      uploadUrl: uploadUrl ?? this.uploadUrl,
      uploadKey: uploadKey ?? this.uploadKey,
    );
  }
}
