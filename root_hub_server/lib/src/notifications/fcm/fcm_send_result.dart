class FcmSendResult {
  const FcmSendResult({
    required this.success,
    required this.errorCode,
    required this.errorStatus,
    required this.httpStatusCode,
  });

  const FcmSendResult.success()
    : success = true,
      errorCode = null,
      errorStatus = null,
      httpStatusCode = 200;

  final bool success;
  final String? errorCode;
  final String? errorStatus;
  final int httpStatusCode;

  bool get indicatesInvalidToken {
    if (errorCode == null) {
      return false;
    }

    return errorCode == 'UNREGISTERED' || errorCode == 'INVALID_ARGUMENT';
  }
}
