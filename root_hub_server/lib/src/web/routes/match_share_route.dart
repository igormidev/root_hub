import 'dart:io';

import 'package:serverpod/serverpod.dart';

class MatchShareRoute extends SpaRoute {
  MatchShareRoute(super.directory)
    : super(
        fallback: File('${directory.path}/index.html'),
      );
}
