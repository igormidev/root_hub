import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:test/test.dart';

void main() {
  group('check_flutter_feature_lints', () {
    late Directory tempRoot;
    late Directory flutterRoot;
    late Directory serverRoot;

    setUp(() async {
      tempRoot = await Directory.systemTemp.createTemp(
        'root_hub_flutter_lints_test_',
      );
      flutterRoot = Directory(p.join(tempRoot.path, 'root_hub_flutter'));
      serverRoot = Directory(p.join(tempRoot.path, 'root_hub_server'));

      _createLocaleScaffold(
        root: flutterRoot,
        relativeI18nPath: p.join('lib', 'i18n'),
      );
      _createLocaleScaffold(
        root: serverRoot,
        relativeI18nPath: p.join('lib', 'src', 'i18n'),
      );
    });

    tearDown(() async {
      if (tempRoot.existsSync()) {
        await tempRoot.delete(recursive: true);
      }
    });

    test('flags interpolated ui text with hardcoded literal segment', () async {
      final featureFile = File(
        p.join(
          flutterRoot.path,
          'lib',
          'src',
          'features',
          'demo',
          'ui',
          'screens',
          'demo_screen.dart',
        ),
      );
      await featureFile.create(recursive: true);
      await featureFile.writeAsString('''
import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final retryAt = DateTime.now().toIso8601String();
    return Text('\$retryAt. Try again after \$retryAt.');
  }
}
''');

      final result = await _runChecker(
        flutterRoot: flutterRoot,
        serverRoot: serverRoot,
      );
      final output = '${result.stdout}\n${result.stderr}';

      expect(result.exitCode, isNot(0));
      expect(output, contains('[feature_hardcoded_ui_string]'));
      expect(output, contains('demo_screen.dart'));
    });

    test('flags locale keys missing in non-english files', () async {
      final ptBrFile = File(
        p.join(flutterRoot.path, 'lib', 'i18n', 'pt-BR.json'),
      );
      _writeJson(ptBrFile, const <String, Object?>{
        'shared': <String, Object?>{},
      });

      final result = await _runChecker(
        flutterRoot: flutterRoot,
        serverRoot: serverRoot,
      );
      final output = '${result.stdout}\n${result.stderr}';

      expect(result.exitCode, isNot(0));
      expect(output, contains('[flutter_i18n_missing_key]'));
      expect(output, contains('pt-BR.json'));
    });
  });
}

Future<ProcessResult> _runChecker({
  required Directory flutterRoot,
  required Directory serverRoot,
}) {
  return Process.run('dart', <String>[
    'run',
    'root_hub_flutter_lints:check_flutter_feature_lints',
    '--flutter-root',
    flutterRoot.path,
    '--server-root',
    serverRoot.path,
  ], workingDirectory: Directory.current.path);
}

void _createLocaleScaffold({
  required Directory root,
  required String relativeI18nPath,
}) {
  final i18nDir = Directory(p.join(root.path, relativeI18nPath));
  i18nDir.createSync(recursive: true);

  final localeContent = <String, Map<String, Object?>>{
    'en': const <String, Object?>{
      'shared': <String, Object?>{'value': 'Value'},
    },
    'pt-BR': const <String, Object?>{
      'shared': <String, Object?>{'value': 'Valor'},
    },
    'es': const <String, Object?>{
      'shared': <String, Object?>{'value': 'Valor'},
    },
    'fr': const <String, Object?>{
      'shared': <String, Object?>{'value': 'Valeur'},
    },
    'de': const <String, Object?>{
      'shared': <String, Object?>{'value': 'Wert'},
    },
  };

  for (final entry in localeContent.entries) {
    final localeFile = File(p.join(i18nDir.path, '${entry.key}.json'));
    _writeJson(localeFile, entry.value);
  }
}

void _writeJson(File file, Map<String, Object?> data) {
  file.createSync(recursive: true);
  file.writeAsStringSync(const JsonEncoder.withIndent('  ').convert(data));
}
