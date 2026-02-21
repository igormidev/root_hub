import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

PluginBase createPlugin() => _RootHubFlutterLintsPlugin();

class _RootHubFlutterLintsPlugin extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) {
    return [
      _FeatureSingleWidgetPerFileRule(),
      _FeatureWidgetNameMatchesFileSuffixRule(),
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

bool _isLintableFeatureFile(String path) {
  final normalizedPath = path.replaceAll('\\', '/');

  return normalizedPath.contains('/lib/src/features/') &&
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

String? _expectedWidgetClassSuffix(String path) {
  final normalizedPath = path.replaceAll('\\', '/');

  for (final entry in _widgetFileSuffixToClassSuffix.entries) {
    if (normalizedPath.endsWith(entry.key)) {
      return entry.value;
    }
  }

  return null;
}
