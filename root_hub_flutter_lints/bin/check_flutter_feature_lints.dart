import 'dart:io';

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:path/path.dart' as p;

const _widgetTypeNames = <String>{
  'Widget',
  'StatelessWidget',
  'StatefulWidget',
  'ConsumerWidget',
  'HookWidget',
  'HookConsumerWidget',
};

const _widgetFileSuffixToClassSuffix = <String, String>{
  '_screen.dart': 'Screen',
  '_widget.dart': 'Widget',
  '_section.dart': 'Section',
  '_dialog.dart': 'Dialog',
  '_sheet.dart': 'Sheet',
  '_tile.dart': 'Tile',
  '_card.dart': 'Card',
  '_item.dart': 'Item',
  '_page.dart': 'Page',
  '_view.dart': 'View',
};

void main(List<String> args) {
  final flutterRoot = _resolveFlutterRoot(args);
  final featuresDir = Directory(
    p.join(flutterRoot.path, 'lib', 'src', 'features'),
  );

  if (!featuresDir.existsSync()) {
    stdout.writeln('No feature directory found at ${featuresDir.path}.');
    exitCode = 0;
    return;
  }

  final issues = <_LintIssue>[];

  for (final file in _featureDartFiles(featuresDir)) {
    final source = file.readAsStringSync();
    final parsed = parseString(
      path: file.path,
      content: source,
      throwIfDiagnostics: false,
    );

    final classes = parsed.unit.declarations
        .whereType<ClassDeclaration>()
        .toList(growable: false);

    final widgetClasses = classes.where(_isWidgetClass).toList(growable: false);

    if (widgetClasses.length > 1) {
      for (final extraWidget in widgetClasses.skip(1)) {
        final location = parsed.lineInfo.getLocation(extraWidget.offset);
        issues.add(
          _LintIssue(
            code: 'feature_single_widget_per_file',
            filePath: file.path,
            line: location.lineNumber,
            column: location.columnNumber,
            message:
                'Only one widget class is allowed in this feature file. Move extra widgets to separate files.',
          ),
        );
      }
    }

    final expectedSuffix = _expectedWidgetClassSuffix(file.path);
    if (expectedSuffix != null) {
      for (final widgetClass in widgetClasses) {
        final className = widgetClass.name.lexeme;
        if (className.endsWith(expectedSuffix)) {
          continue;
        }

        final location = parsed.lineInfo.getLocation(widgetClass.name.offset);
        issues.add(
          _LintIssue(
            code: 'feature_widget_name_matches_file_suffix',
            filePath: file.path,
            line: location.lineNumber,
            column: location.columnNumber,
            message:
                'Widget class "$className" must end with "$expectedSuffix" for this file suffix.',
          ),
        );
      }
    }
  }

  if (issues.isEmpty) {
    stdout.writeln('No feature lint violations found.');
    exitCode = 0;
    return;
  }

  for (final issue in issues) {
    final displayPath = p.relative(
      issue.filePath,
      from: Directory.current.path,
    );
    stdout.writeln(
      '$displayPath:${issue.line}:${issue.column} '
      '[${issue.code}] ${issue.message}',
    );
  }

  stderr.writeln('\nFound ${issues.length} feature lint violation(s).');
  exitCode = 1;
}

Directory _resolveFlutterRoot(List<String> args) {
  const defaultRelativePath = '../root_hub_flutter';

  String? value;
  for (var i = 0; i < args.length; i++) {
    if (args[i] == '--flutter-root' && i + 1 < args.length) {
      value = args[i + 1];
      break;
    }
  }

  final rawPath = value ?? defaultRelativePath;
  final resolvedPath = p.normalize(p.absolute(rawPath));
  return Directory(resolvedPath);
}

Iterable<File> _featureDartFiles(Directory featuresDir) sync* {
  for (final entity in featuresDir.listSync(recursive: true)) {
    if (entity is! File) {
      continue;
    }

    final path = entity.path.replaceAll('\\', '/');
    if (!path.endsWith('.dart') ||
        path.endsWith('.g.dart') ||
        path.endsWith('.freezed.dart')) {
      continue;
    }

    yield entity;
  }
}

bool _isWidgetClass(ClassDeclaration declaration) {
  final typeNames = <String>{
    if (declaration.extendsClause != null)
      _normalizeTypeName(declaration.extendsClause!.superclass.toSource()),
    ...declaration.implementsClause?.interfaces.map(
          (type) => _normalizeTypeName(type.toSource()),
        ) ??
        const <String>[],
    ...declaration.withClause?.mixinTypes.map(
          (type) => _normalizeTypeName(type.toSource()),
        ) ??
        const <String>[],
  };

  return typeNames.any(_widgetTypeNames.contains);
}

String _normalizeTypeName(String typeName) {
  return typeName.split('<').first.split('.').last;
}

String? _expectedWidgetClassSuffix(String filePath) {
  final normalizedPath = filePath.replaceAll('\\', '/');

  for (final entry in _widgetFileSuffixToClassSuffix.entries) {
    if (normalizedPath.endsWith(entry.key)) {
      return entry.value;
    }
  }

  return null;
}

class _LintIssue {
  _LintIssue({
    required this.code,
    required this.filePath,
    required this.line,
    required this.column,
    required this.message,
  });

  final String code;
  final String filePath;
  final int line;
  final int column;
  final String message;
}
