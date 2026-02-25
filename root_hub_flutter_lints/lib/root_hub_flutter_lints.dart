import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

PluginBase createPlugin() => _RootHubFlutterLintsPlugin();

class _RootHubFlutterLintsPlugin extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) {
    return [
      _FeatureSingleWidgetPerFileRule(),
      _FeatureWidgetNameMatchesFileSuffixRule(),
      _NoWidgetReturningFunctionRule(),
    ];
  }
}

class _FeatureSingleWidgetPerFileRule extends DartLintRule {
  _FeatureSingleWidgetPerFileRule()
    : super(
        code: const LintCode(
          name: 'feature_single_widget_per_file',
          problemMessage:
              'Only one widget class is allowed per file in lib/src/features/.',
          correctionMessage:
              'Move extra widgets into separate files so each file has a single widget.',
        ),
      );

  @override
  void run(
    CustomLintResolver resolver,
    DiagnosticReporter reporter,
    CustomLintContext context,
  ) {
    final filePath = resolver.source.fullName;
    if (!_isLintableFeatureFile(filePath)) {
      return;
    }

    context.registry.addCompilationUnit((unit) {
      final classes = unit.declarations
          .whereType<ClassDeclaration>()
          .where(_isWidgetClass)
          .toList(growable: false);

      if (classes.length <= 1) {
        return;
      }

      for (final extraClass in classes.skip(1)) {
        reporter.atNode(extraClass, code);
      }
    });
  }
}

class _FeatureWidgetNameMatchesFileSuffixRule extends DartLintRule {
  _FeatureWidgetNameMatchesFileSuffixRule()
    : super(
        code: const LintCode(
          name: 'feature_widget_name_matches_file_suffix',
          problemMessage:
              'Widget name does not match this file suffix convention.',
          correctionMessage:
              'Use a widget class name that ends with the suffix required by the file name (for example: _screen.dart => Screen, _widget.dart => Widget).',
        ),
      );

  @override
  void run(
    CustomLintResolver resolver,
    DiagnosticReporter reporter,
    CustomLintContext context,
  ) {
    final filePath = resolver.source.fullName;
    if (!_isLintableFeatureFile(filePath)) {
      return;
    }

    final expectedSuffix = _expectedWidgetClassSuffix(filePath);
    if (expectedSuffix == null) {
      return;
    }

    context.registry.addClassDeclaration((declaration) {
      if (!_isWidgetClass(declaration)) {
        return;
      }

      final className = declaration.declaredFragment?.element.name;
      if (className == null || className.endsWith(expectedSuffix)) {
        return;
      }

      reporter.atNode(declaration, code);
    });
  }
}

class _NoWidgetReturningFunctionRule extends DartLintRule {
  _NoWidgetReturningFunctionRule()
    : super(
        code: const LintCode(
          name: 'no_widget_returning_function',
          problemMessage:
              'Functions and helper methods must not return widgets.',
          correctionMessage:
              'Extract this UI block into a dedicated widget class in its own file.',
        ),
      );

  @override
  void run(
    CustomLintResolver resolver,
    DiagnosticReporter reporter,
    CustomLintContext context,
  ) {
    final filePath = resolver.source.fullName;
    if (!_isLintableFlutterLibFile(filePath)) {
      return;
    }

    context.registry.addFunctionDeclaration((declaration) {
      if (!_returnsWidgetType(declaration.returnType)) {
        return;
      }

      reporter.atNode(declaration, code);
    });

    context.registry.addMethodDeclaration((declaration) {
      if (_isAllowedFrameworkBuildMethod(declaration)) {
        return;
      }

      if (!_returnsWidgetType(declaration.returnType)) {
        return;
      }

      reporter.atNode(declaration, code);
    });
  }
}

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

bool _isLintableFeatureFile(String path) {
  final normalizedPath = path.replaceAll('\\', '/');

  return normalizedPath.contains('/lib/src/features/') &&
      normalizedPath.endsWith('.dart') &&
      !normalizedPath.endsWith('.g.dart') &&
      !normalizedPath.endsWith('.freezed.dart');
}

bool _isLintableFlutterLibFile(String path) {
  final normalizedPath = path.replaceAll('\\', '/');

  return normalizedPath.contains('/lib/') &&
      normalizedPath.endsWith('.dart') &&
      !normalizedPath.endsWith('.g.dart') &&
      !normalizedPath.endsWith('.freezed.dart');
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

  final staticType = returnType.type;
  if (_isWidgetDartType(staticType)) {
    return true;
  }

  final typeName = _normalizeTypeName(returnType.toSource());
  return _widgetTypeNames.contains(typeName) || typeName.endsWith('Widget');
}

bool _isWidgetDartType(DartType? type) {
  if (type is! InterfaceType) {
    return false;
  }

  final selfTypeName = _normalizeTypeName(type.element.name ?? '');
  if (selfTypeName == 'Widget') {
    return true;
  }

  for (final supertype in type.allSupertypes) {
    final superTypeName = _normalizeTypeName(supertype.element.name ?? '');
    if (superTypeName == 'Widget') {
      return true;
    }
  }

  return false;
}

bool _isAllowedFrameworkBuildMethod(MethodDeclaration declaration) {
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

  final parent = declaration.parent;
  if (parent is! ClassDeclaration) {
    return false;
  }

  final containerTypeNames = <String>{
    if (parent.extendsClause != null)
      _normalizeTypeName(parent.extendsClause!.superclass.toSource()),
    ...parent.implementsClause?.interfaces.map(
          (type) => _normalizeTypeName(type.toSource()),
        ) ??
        const <String>[],
    ...parent.withClause?.mixinTypes.map(
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

String? _expectedWidgetClassSuffix(String path) {
  final normalizedPath = path.replaceAll('\\', '/');

  for (final entry in _widgetFileSuffixToClassSuffix.entries) {
    if (normalizedPath.endsWith(entry.key)) {
      return entry.value;
    }
  }

  return null;
}
