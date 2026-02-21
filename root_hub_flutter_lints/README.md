# root_hub_flutter_lints

Custom lint plugin used by `root_hub_flutter` to enforce UI file conventions.

## Purpose
This package enforces strict component-splitting and naming conventions in feature UI code.

Scope: **only** files under `lib/src/features/**` in the Flutter app.

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
