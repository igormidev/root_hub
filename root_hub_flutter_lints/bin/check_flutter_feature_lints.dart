import 'dart:io';

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:path/path.dart' as p;

const _widgetTypeNames = <String>{
  'Widget',
  'StatelessWidget',
  'StatefulWidget',
  'ConsumerStatefulWidget',
  'HookConsumerWidget',
  'ConsumerWidget',
  'HookWidget',
};

const _stateTypeNames = <String>{'State', 'ConsumerState', 'HookConsumerState'};

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
  final libDir = Directory(p.join(flutterRoot.path, 'lib'));
  final featuresDirPath = p.join(flutterRoot.path, 'lib', 'src', 'features');

  if (!libDir.existsSync()) {
    stdout.writeln('No Flutter lib directory found at ${libDir.path}.');
    exitCode = 0;
    return;
  }

  final issues = <_LintIssue>[];

  for (final file in _flutterLibDartFiles(libDir)) {
    final source = file.readAsStringSync();
    final parsed = parseString(
      path: file.path,
      content: source,
      throwIfDiagnostics: false,
    );

    final functionDeclarations = parsed.unit.declarations
        .whereType<FunctionDeclaration>()
        .toList(growable: false);
    final classes = parsed.unit.declarations
        .whereType<ClassDeclaration>()
        .toList(growable: false);

    for (final functionDeclaration in functionDeclarations) {
      if (!_returnsWidgetType(functionDeclaration.returnType)) {
        continue;
      }

      final location = parsed.lineInfo.getLocation(
        functionDeclaration.name.offset,
      );
      issues.add(
        _LintIssue(
          code: 'no_widget_returning_function',
          filePath: file.path,
          line: location.lineNumber,
          column: location.columnNumber,
          message:
              'Functions and helper methods must not return widgets. Extract this UI block into a dedicated widget class in its own file.',
        ),
      );
    }

    for (final classDeclaration in classes) {
      for (final member
          in classDeclaration.members.whereType<MethodDeclaration>()) {
        if (_isAllowedFrameworkBuildMethod(member, classDeclaration)) {
          continue;
        }
        if (!_returnsWidgetType(member.returnType)) {
          continue;
        }

        final location = parsed.lineInfo.getLocation(member.name.offset);
        issues.add(
          _LintIssue(
            code: 'no_widget_returning_function',
            filePath: file.path,
            line: location.lineNumber,
            column: location.columnNumber,
            message:
                'Functions and helper methods must not return widgets. Extract this UI block into a dedicated widget class in its own file.',
          ),
        );
      }
    }

    if (!_isFeatureFile(file.path, featuresDirPath)) {
      continue;
    }

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

  stderr.writeln('\nFound ${issues.length} lint violation(s).');
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

Iterable<File> _flutterLibDartFiles(Directory libDir) sync* {
  for (final entity in libDir.listSync(recursive: true)) {
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

bool _isFeatureFile(String filePath, String featuresDirPath) {
  final normalizedFilePath = p.normalize(filePath);
  final normalizedFeaturesDirPath = p.normalize(featuresDirPath);
  return p.isWithin(normalizedFeaturesDirPath, normalizedFilePath);
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

bool _returnsWidgetType(TypeAnnotation? returnType) {
  if (returnType == null) {
    return false;
  }

  final typeName = _normalizeTypeName(returnType.toSource());
  return _widgetTypeNames.contains(typeName) || typeName.endsWith('Widget');
}

bool _isAllowedFrameworkBuildMethod(
  MethodDeclaration declaration,
  ClassDeclaration classDeclaration,
) {
  if (declaration.name.lexeme != 'build') {
    return false;
  }

  final parameters = declaration.parameters?.parameters;
  if (parameters == null || parameters.isEmpty) {
    return false;
  }

  final firstParameterType = _normalizeTypeName(
    _formalParameterTypeSource(parameters.first),
  );
  if (firstParameterType != 'BuildContext') {
    return false;
  }

  final containerTypeNames = <String>{
    if (classDeclaration.extendsClause != null)
      _normalizeTypeName(classDeclaration.extendsClause!.superclass.toSource()),
    ...classDeclaration.implementsClause?.interfaces.map(
          (type) => _normalizeTypeName(type.toSource()),
        ) ??
        const <String>[],
    ...classDeclaration.withClause?.mixinTypes.map(
          (type) => _normalizeTypeName(type.toSource()),
        ) ??
        const <String>[],
  };

  return containerTypeNames.any(
    (typeName) =>
        _widgetTypeNames.contains(typeName) ||
        _stateTypeNames.contains(typeName),
  );
}

String _formalParameterTypeSource(FormalParameter parameter) {
  if (parameter is DefaultFormalParameter) {
    return _formalParameterTypeSource(parameter.parameter);
  }

  if (parameter is SimpleFormalParameter) {
    return parameter.type?.toSource() ?? '';
  }

  if (parameter is FieldFormalParameter) {
    return parameter.type?.toSource() ?? '';
  }

  return '';
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
