import 'package:flutter/foundation.dart';
import 'package:talker_flutter/talker_flutter.dart';

final talker = TalkerFlutter.init(
  settings: TalkerSettings(
    enabled: kDebugMode,
  ),
);

void logError(
  Object exception, [
  StackTrace? stackTrace,
  dynamic msg,
]) {
  talker.handle(
    exception,
    stackTrace,
    msg,
  );
}
