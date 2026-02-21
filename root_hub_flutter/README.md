# Root Hub Flutter App

Root Hub is a mobile app for the **ROOT** board game community.
The main goal is to solve a real problem: players do not have one unified place to find matches.

With Root Hub, users can:
- Find open match schedules created by other players.
- Create new match schedules and receive subscriptions from other players.
- Interact in a social feed (posts + comments).
- Register match results (winner + factions used), creating the base for future ratings and competitive history.

## Main User Flow
1. App validates session and player profile on startup.
2. If needed, user completes onboarding (favorite faction selection).
3. User authenticates (email/password or Google when enabled on server).
4. User sees the list of available match schedules.
5. User subscribes to an existing match or creates a new one.
6. User can interact socially via posts/comments.
7. After a game, user registers the result and factions.

## Authentication (Serverpod)
Authentication is handled with **Serverpod auth session management**:
- `Client` is created in `lib/main.dart`.
- `client.authSessionManager = FlutterAuthSessionManager()` is set.
- `await client.auth.initialize()` restores persisted sessions at app startup.
- `sessionManagerProvider` exposes the auth session manager via Riverpod.
- Session UI state must be represented with `SessionState` (Freezed union) and consumed by route guards / app screens.

Required behavior for auth-related features:
- Never hardcode auth tokens manually.
- Always rely on `client.auth` + `FlutterAuthSessionManager`.
- Keep auth/session state in Riverpod providers, not inside widgets.
- Startup flow is managed by `auth_flow` state/provider:
  - Checks `client.auth.isAuthenticated`.
  - Calls `getPlayerData.v1()` to verify profile existence.
  - Routes users through onboarding -> login -> authenticated area.

## Architecture
The app follows feature-first presentation with centralized state management:

```text
root_hub_flutter/
├── lib/
│   ├── main.dart
│   └── src/
│       ├── core/
│       │   ├── extension/
│       │   │   └── serverpod_to_result.dart
│       │   ├── theme/
│       │   └── utils/
│       ├── design_system/
│       ├── global_providers/
│       ├── states/                # ALL Freezed states + matching providers
│       │   ├── session/
│       │   ├── account/
│       │   ├── auth_flow/
│       │   └── onboarding/
│       └── features/              # UI feature modules (screens/widgets/sections/dialogs)
│           ├── auth/
│           └── matches/
├── assets/
└── pubspec.yaml
```

### Architecture Rules (Mandatory)
1. **`lib/src/states/` is mandatory for state definitions**.
2. Each state must be **Freezed**.
3. Each state must have a matching provider file.
4. Provider code must use `NotifierProvider` (Riverpod 3 pattern).
5. All Serverpod calls in providers must use `toResult` from `lib/src/core/extension/serverpod_to_result.dart`.

## State + Provider Naming Convention (Mandatory)
Use the same base name for state and provider artifacts.

Example for `find_match`:
- State file: `lib/src/states/find_match/find_match_state.dart`
- Provider file: `lib/src/states/find_match/find_match_provider.dart`
- State type: `FindMatchState`
- Notifier type: `FindMatchNotifier`
- Final provider variable: `findMatchProvider`

Provider file must contain:
- The notifier class (`FindMatchNotifier`).
- The final `NotifierProvider` (`findMatchProvider`).
- Imports for the state and required dependencies.

Freezed-generated files must remain with default naming:
- `*_state.freezed.dart`
- (if needed) `*.g.dart`

## Serverpod Call Pattern (Mandatory)
**Never call Serverpod endpoints directly in providers without `toResult`.**

```dart
final result = await ref.read(clientProvider).someEndpoint.someMethod(args).toResult;

result.fold(
  (success) {
    // update state with success
  },
  (error) {
    // update state with domain exception
  },
);
```

## Widget and Component Rules (Mandatory)
- Every UI component must live in its own file.
- Every file in feature UI must contain at most **one widget class**.
- Prefer `StatelessWidget` for feature UI files.
- Keep mutable/business state in Riverpod providers instead of widget-local state whenever possible.

## Enforced Lints (Very Important)
Custom lints are installed and **must be treated as required quality gates**.

Lint package:
- `root_hub_flutter_lints`
- Lint documentation (mandatory reading for client work):
  - `/Users/igor/PersonalProjects/root_hub/root_hub_flutter_lints/README.md`
- Mandatory checker command:
  - `cd /Users/igor/PersonalProjects/root_hub/root_hub_flutter_lints && dart run root_hub_flutter_lints:check_flutter_feature_lints --flutter-root ../root_hub_flutter`

Rules:
- `feature_single_widget_per_file`
  - Scope: only `lib/src/features/**`
  - Enforces: max 1 widget class per feature file.
- `feature_widget_name_matches_file_suffix`
  - Scope: only `lib/src/features/**`
  - Enforces widget naming suffix by file name:
    - `_screen.dart` => class ends with `Screen`
    - `_widget.dart` => class ends with `Widget`
    - `_section.dart` => class ends with `Section`
    - `_dialog.dart` => class ends with `Dialog`
    - `_sheet.dart` => class ends with `Sheet`
    - `_tile.dart` => class ends with `Tile`
    - `_card.dart` => class ends with `Card`
    - `_item.dart` => class ends with `Item`
    - `_page.dart` => class ends with `Page`
    - `_view.dart` => class ends with `View`

These rules are intentionally strict to force component separation and predictable naming.

## Mandatory Packages
- `flutter_riverpod` / `riverpod`: state management.
- `freezed_annotation` + `freezed` + `build_runner`: immutable union states and codegen.
- `serverpod_flutter` + `serverpod_auth_idp_flutter`: backend client and auth session.
- `result_dart`: typed success/failure result handling.
- `go_router`: app routing.
- `google_fonts`: project typography (configured in app theme).
- `flutter_animate`: onboarding and authentication motion design.

## Typography
The app theme uses Google Fonts to avoid generic defaults:
- Headings: `Cinzel`
- Body/UI text: `Nunito Sans`

## Faction Assets
- Board images are stored in `assets/faction_boards/` and exposed via `getFactionBoardImage` in `lib/src/core/extension/faction_ui_extension.dart`.
- Faction images are stored in `assets/faction_images/` and exposed via `getFactionImage` in `lib/src/core/extension/faction_ui_extension.dart`.
- Faction icon symbols are stored in `assets/faction_icons/` with size folders:
  - `assets/faction_icons/80/`
  - `assets/faction_icons/256/`
  - `assets/faction_icons/512/`
  - `assets/faction_icons/1024/`
- `getFactionImage` should be the default representation when there is enough space (for example, main screen sections and larger surfaces).
- For compact UI (for example card headers and tight rows), use faction icons with the best size for the context.
- `factionIcon` returns the default icon path (`256` size), and `getFactionIconPath(size: ...)` allows selecting a specific size.

## Daily Commands
```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
cd ../root_hub_flutter_lints && dart run root_hub_flutter_lints:check_flutter_feature_lints --flutter-root ../root_hub_flutter && cd ../root_hub_flutter
flutter analyze
```

## Notes
- Keep feature modules isolated and composable.
- Keep API and error handling in providers.
- Keep UI files small, single-purpose, and explicitly named.
