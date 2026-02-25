import 'dart:io';

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
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

const _uiTextNamedArgumentNames = <String>{
  'buttonText',
  'cancelButtonText',
  'confirmButtonText',
  'content',
  'counterText',
  'description',
  'errorText',
  'helperText',
  'hint',
  'hintText',
  'label',
  'labelText',
  'message',
  'placeholder',
  'prefixText',
  'semanticLabel',
  'subtitle',
  'suffixText',
  'text',
  'title',
  'tooltip',
};

const _uiTextPositionalInvocationNames = <String>{
  'BabelText',
  'SelectableText',
  'Text',
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
    final sourceLines = source.split('\n');
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

    if (_containsIgnoreForFile(sourceLines, 'feature_hardcoded_ui_string')) {
      continue;
    }

    final stringLiteralCollector = _FeatureStringLiteralCollector();
    parsed.unit.accept(stringLiteralCollector);
    for (final node in stringLiteralCollector.nodes) {
      if (!_shouldReportFeatureStringNode(node)) {
        continue;
      }

      final location = parsed.lineInfo.getLocation(node.offset);
      if (_isIgnoredByComment(
        sourceLines,
        lineNumber: location.lineNumber,
        lintCode: 'feature_hardcoded_ui_string',
      )) {
        continue;
      }

      issues.add(
        _LintIssue(
          code: 'feature_hardcoded_ui_string',
          filePath: file.path,
          line: location.lineNumber,
          column: location.columnNumber,
          message:
              'Hard-coded string literal found in feature UI code. Move user-facing text to localization keys, or add // ignore: feature_hardcoded_ui_string above non-translatable strings.',
        ),
      );
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

bool _shouldReportFeatureStringNode(AstNode node) {
  if (_isStringNodeInSkippableParent(node)) {
    return false;
  }

  if (node is SimpleStringLiteral) {
    if (node.value.trim().isEmpty) {
      return false;
    }

    return _isLikelyUiTextLiteral(node);
  }

  return false;
}

bool _isStringNodeInSkippableParent(AstNode node) {
  final parent = node.parent;
  return parent is Directive || parent is Annotation;
}

bool _containsIgnoreForFile(List<String> lines, String lintCode) {
  for (final line in lines) {
    final trimmed = line.trim();
    if (!trimmed.startsWith('//')) {
      continue;
    }

    final match = RegExp(r'^//\s*ignore_for_file:\s*(.+)$').firstMatch(trimmed);
    if (match == null) {
      continue;
    }

    final ignoredCodes = match
        .group(1)!
        .split(',')
        .map((code) => code.trim())
        .where((code) => code.isNotEmpty);
    if (ignoredCodes.contains(lintCode)) {
      return true;
    }
  }

  return false;
}

bool _isIgnoredByComment(
  List<String> lines, {
  required int lineNumber,
  required String lintCode,
}) {
  final currentLineIndex = lineNumber - 1;
  if (currentLineIndex < 0 || currentLineIndex >= lines.length) {
    return false;
  }

  if (_lineHasIgnore(lines[currentLineIndex], lintCode)) {
    return true;
  }

  if (currentLineIndex > 0 &&
      _lineHasIgnore(lines[currentLineIndex - 1], lintCode)) {
    return true;
  }

  return false;
}

bool _lineHasIgnore(String line, String lintCode) {
  final trimmed = line.trim();
  if (!trimmed.startsWith('//')) {
    return false;
  }

  final match = RegExp(r'^//\s*ignore:\s*(.+)$').firstMatch(trimmed);
  if (match == null) {
    return false;
  }

  final ignoredCodes = match
      .group(1)!
      .split(',')
      .map((code) => code.trim())
      .where((code) => code.isNotEmpty);
  return ignoredCodes.contains(lintCode);
}

bool _isLikelyUiTextLiteral(AstNode node) {
  final argumentExpression = _argumentExpressionForNode(node);
  if (argumentExpression == null) {
    return false;
  }

  if (argumentExpression is NamedExpression) {
    final argumentName = argumentExpression.name.label.name;
    return _uiTextNamedArgumentNames.contains(argumentName);
  }

  final argumentList = argumentExpression.parent;
  if (argumentList is! ArgumentList) {
    return false;
  }

  final index = argumentList.arguments.indexOf(argumentExpression);
  if (index != 0) {
    return false;
  }

  final invocationName = _invocationName(argumentList.parent);
  if (invocationName == null) {
    return false;
  }

  return _uiTextPositionalInvocationNames.contains(invocationName);
}

Expression? _argumentExpressionForNode(AstNode node) {
  AstNode? current = node;
  while (current != null) {
    final parent = current.parent;
    if (parent is NamedExpression && parent.expression == current) {
      return parent;
    }

    if (parent is ArgumentList && current is Expression) {
      return current;
    }

    current = parent;
  }

  return null;
}

String? _invocationName(AstNode? node) {
  if (node is InstanceCreationExpression) {
    return _normalizeTypeName(node.constructorName.type.toSource());
  }

  if (node is MethodInvocation) {
    return node.methodName.name;
  }

  if (node is FunctionExpressionInvocation) {
    final function = node.function;
    if (function is Identifier) {
      return function.name;
    }
  }

  return null;
}

class _FeatureStringLiteralCollector extends RecursiveAstVisitor<void> {
  final nodes = <AstNode>[];

  @override
  void visitSimpleStringLiteral(SimpleStringLiteral node) {
    nodes.add(node);
    super.visitSimpleStringLiteral(node);
  }
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
