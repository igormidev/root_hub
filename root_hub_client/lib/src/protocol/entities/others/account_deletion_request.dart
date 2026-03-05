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
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class AccountDeletionRequest implements _i1.SerializableModel {
  AccountDeletionRequest._({
    this.id,
    required this.createdAt,
    required this.email,
    this.notificationTargetEmail,
    this.notificationAttemptedAt,
    this.notificationSentAt,
  });

  factory AccountDeletionRequest({
    int? id,
    required DateTime createdAt,
    required String email,
    String? notificationTargetEmail,
    DateTime? notificationAttemptedAt,
    DateTime? notificationSentAt,
  }) = _AccountDeletionRequestImpl;

  factory AccountDeletionRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return AccountDeletionRequest(
      id: jsonSerialization['id'] as int?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      email: jsonSerialization['email'] as String,
      notificationTargetEmail:
          jsonSerialization['notificationTargetEmail'] as String?,
      notificationAttemptedAt:
          jsonSerialization['notificationAttemptedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['notificationAttemptedAt'],
            ),
      notificationSentAt: jsonSerialization['notificationSentAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['notificationSentAt'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  DateTime createdAt;

  String email;

  String? notificationTargetEmail;

  DateTime? notificationAttemptedAt;

  DateTime? notificationSentAt;

  /// Returns a shallow copy of this [AccountDeletionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AccountDeletionRequest copyWith({
    int? id,
    DateTime? createdAt,
    String? email,
    String? notificationTargetEmail,
    DateTime? notificationAttemptedAt,
    DateTime? notificationSentAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AccountDeletionRequest',
      if (id != null) 'id': id,
      'createdAt': createdAt.toJson(),
      'email': email,
      if (notificationTargetEmail != null)
        'notificationTargetEmail': notificationTargetEmail,
      if (notificationAttemptedAt != null)
        'notificationAttemptedAt': notificationAttemptedAt?.toJson(),
      if (notificationSentAt != null)
        'notificationSentAt': notificationSentAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AccountDeletionRequestImpl extends AccountDeletionRequest {
  _AccountDeletionRequestImpl({
    int? id,
    required DateTime createdAt,
    required String email,
    String? notificationTargetEmail,
    DateTime? notificationAttemptedAt,
    DateTime? notificationSentAt,
  }) : super._(
         id: id,
         createdAt: createdAt,
         email: email,
         notificationTargetEmail: notificationTargetEmail,
         notificationAttemptedAt: notificationAttemptedAt,
         notificationSentAt: notificationSentAt,
       );

  /// Returns a shallow copy of this [AccountDeletionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AccountDeletionRequest copyWith({
    Object? id = _Undefined,
    DateTime? createdAt,
    String? email,
    Object? notificationTargetEmail = _Undefined,
    Object? notificationAttemptedAt = _Undefined,
    Object? notificationSentAt = _Undefined,
  }) {
    return AccountDeletionRequest(
      id: id is int? ? id : this.id,
      createdAt: createdAt ?? this.createdAt,
      email: email ?? this.email,
      notificationTargetEmail: notificationTargetEmail is String?
          ? notificationTargetEmail
          : this.notificationTargetEmail,
      notificationAttemptedAt: notificationAttemptedAt is DateTime?
          ? notificationAttemptedAt
          : this.notificationAttemptedAt,
      notificationSentAt: notificationSentAt is DateTime?
          ? notificationSentAt
          : this.notificationSentAt,
    );
  }
}
