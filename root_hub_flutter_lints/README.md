# root_hub_flutter_lints

Custom lint plugin used by:
- `root_hub_flutter` for client UI architecture conventions.
- `root_hub_server` for endpoint contract and translation conventions.

## Purpose
This package enforces:
- strict component-splitting and naming conventions in Flutter feature UI code.
- strict endpoint contract conventions in Serverpod endpoint classes.

Scope:
- `feature_*` rules: only files under `lib/src/features/**` in the Flutter app.
- `no_widget_returning_function`: all files under `lib/**` in the Flutter app (excluding generated files).
- `server_*` rules: only files under `root_hub_server/lib/src/api/**` (excluding generated files).

## Enforced Rules

### `feature_single_widget_per_file`
- Scope: `lib/src/features/**`
- Enforces: each feature file can contain at most one widget class.
- Widget classes include classes that extend `Widget`, `StatelessWidget`, `StatefulWidget`, `ConsumerWidget`, `HookWidget`, or `HookConsumerWidget`.

### `feature_widget_name_matches_file_suffix`
- Scope: `lib/src/features/**`
- Enforces widget class suffix based on file suffix:
  - `_screen.dart` => widget class must end with `Screen`
  - `_widget.dart` => `Widget`
  - `_section.dart` => `Section`
  - `_dialog.dart` => `Dialog`
  - `_sheet.dart` => `Sheet`
  - `_tile.dart` => `Tile`
  - `_card.dart` => `Card`
  - `_item.dart` => `Item`
  - `_page.dart` => `Page`
  - `_view.dart` => `View`

### `no_widget_returning_function`
- Scope: `lib/**` (excluding generated files)
- Enforces: top-level functions and helper methods must not return widgets.
- Required architecture: extract each UI block into a dedicated widget class in a dedicated file.
- Allowed exception: Flutter framework-required `build` overrides.

### `feature_hardcoded_ui_string`
- Scope: `lib/src/features/**` (excluding generated files)
- Enforces: hard-coded strings in feature UI code must be moved to localization.
- Allowed escape hatch: add `// ignore: feature_hardcoded_ui_string` above non-translatable values (for example keys, IDs, routes, or asset paths).

### `server_endpoint_method_version_rule`
- Scope: `root_hub_server/lib/src/api/**` in classes that extend `Endpoint`.
- Enforces: every public endpoint method must be versioned (`v1`, `v2`, `v3`, ...).

### `server_endpoint_language_parameter_rule`
- Scope: `root_hub_server/lib/src/api/**` in classes that extend `Endpoint`.
- Enforces: each endpoint version method must declare `required ServerSupportedTranslation language` as a named parameter (no default value).

### `server_hardcoded_response_string`
- Scope: `root_hub_server/lib/src/api/**` in classes that extend `Endpoint`.
- Enforces: endpoint response titles/descriptions/fallback text/system chat content must come from server translation files, not hardcoded string literals.
- Allowed escape hatch: add `// ignore: server_hardcoded_response_string` above non-translatable values.

## Where Rules Are Wired
- Rule definitions (custom_lint-compatible): `lib/root_hub_flutter_lints.dart`
- Enforced workspace checker executable: `bin/check_flutter_feature_lints.dart`

## Validation Commands
Run deterministic checker (recommended and mandatory in this workspace):

```bash
cd /Users/igor/PersonalProjects/root_hub/root_hub_flutter_lints
dart run root_hub_flutter_lints:check_flutter_feature_lints --flutter-root ../root_hub_flutter
```

Also run:

```bash
cd /Users/igor/PersonalProjects/root_hub/root_hub_flutter_lints
dart analyze
cd /Users/igor/PersonalProjects/root_hub/root_hub_flutter
flutter analyze
```

For backend lint validation:

```bash
cd /Users/igor/PersonalProjects/root_hub/root_hub_server
dart run custom_lint
dart analyze
```
