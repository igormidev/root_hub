# AGENTS
Root Hub is a mobile app for the **ROOT** board game community. It has a lot of things to unify the community of root.
The app is only available for mobile platforms, and all screens must be adapted for mobile usage.

## Required Reading Order
1. Read `/Users/igor/PersonalProjects/root_hub/README.md`.
2. Read the README of the project you are modifying.
3. If working on the Flutter client (`root_hub_flutter`), reading `/Users/igor/PersonalProjects/root_hub/root_hub_flutter_lints/README.md` is mandatory.

## Mandatory Validation Workflow (No Exceptions)
After finishing any task, run all of the following:

1. `serverpod generate` in `/Users/igor/PersonalProjects/root_hub/root_hub_server`
2. `dart pub get` in `/Users/igor/PersonalProjects/root_hub`
3. `dart analyze` in `/Users/igor/PersonalProjects/root_hub/root_hub_server`
4. `dart analyze` in `/Users/igor/PersonalProjects/root_hub/root_hub_flutter_lints`
5. `flutter analyze` in `/Users/igor/PersonalProjects/root_hub/root_hub_flutter`
6. `dart run root_hub_flutter_lints:check_flutter_feature_lints --flutter-root ../root_hub_flutter` in `/Users/igor/PersonalProjects/root_hub/root_hub_flutter_lints`

Do not finalize while any static analysis error, warning, or custom lint issue remains.

## Formatting Rule
If Flutter code was touched, run `dart format` on all changed Flutter Dart files before finalizing.

## Documentation Rule
If structural/architectural conventions, folder conventions, or workflow conventions change, update the related README files in the same task.

## Serverpod MCP Rule
If a task requires changing the Serverpod backend and there is any uncertainty about framework-specific behavior, API usage, generation workflow, or best practice, consult the Serverpod MCP/docs before implementing the change.
