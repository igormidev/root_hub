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
import '../../entities/others/auth_feedback_exception_reason.dart' as _i2;

abstract class AuthFeedbackException
    implements
        _i1.SerializableException,
        _i1.SerializableModel,
        _i1.ProtocolSerialization {
  AuthFeedbackException._({required this.reason});

  factory AuthFeedbackException({
    required _i2.AuthFeedbackExceptionReason reason,
  }) = _AuthFeedbackExceptionImpl;

  factory AuthFeedbackException.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return AuthFeedbackException(
      reason: _i2.AuthFeedbackExceptionReason.fromJson(
        (jsonSerialization['reason'] as String),
      ),
    );
  }

  _i2.AuthFeedbackExceptionReason reason;

  /// Returns a shallow copy of this [AuthFeedbackException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AuthFeedbackException copyWith({_i2.AuthFeedbackExceptionReason? reason});
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AuthFeedbackException',
      'reason': reason.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AuthFeedbackException',
      'reason': reason.toJson(),
    };
  }

  @override
  String toString() {
    return 'AuthFeedbackException(reason: $reason)';
  }
}

class _AuthFeedbackExceptionImpl extends AuthFeedbackException {
  _AuthFeedbackExceptionImpl({required _i2.AuthFeedbackExceptionReason reason})
    : super._(reason: reason);

  /// Returns a shallow copy of this [AuthFeedbackException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AuthFeedbackException copyWith({_i2.AuthFeedbackExceptionReason? reason}) {
    return AuthFeedbackException(reason: reason ?? this.reason);
  }
}
