# Root Hub Flutter App

Root Hub is a mobile app for the **ROOT** board game community.
The main goal is to solve a real problem: players do not have one unified place to find matches.
The app is only available for mobile platforms, and every screen must be adapted for mobile layouts.

With Root Hub, users can:
- Find open match schedules created by other players.
- Create new match schedules and receive subscriptions from other players.
- Interact in a social feed (posts + comments).
- Register match results (winner + factions used), creating the base for future ratings and competitive history.

## Main User Flow
1. App validates session and player profile on startup.
2. If user is not authenticated, user signs in (email/password or Google when enabled on server).
3. After authentication, app calls `getPlayerData.v1()` to check if profile data exists.
4. If profile data is missing, user completes onboarding (favorite faction + display name + mandatory device location coordinates and match search ratio).
5. User sees the list of available match schedules.
6. User subscribes to an existing match or creates a new one.
7. Shared match links (`/join`) are resolved through app deep links (`roothub://join?matchId=...`) and the app opens the subscribe flow after authentication.
8. User tracks subscribed tables in the Schedules tab and chat activity in the Chat tab.
9. User can interact socially via posts/comments.
10. After a game, user registers the result and factions.
11. App syncs Firebase push tokens to the authenticated account so match chat notifications can reach subscribed players.

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
  - Routes users through login first, then onboarding only when `getPlayerData` returns `null`.

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
│       │   ├── deep_link/
│       │   ├── onboarding/
│       │   ├── activity/          # Dashboard schedules/chat overview + unread badge state
│       │   └── dashboard/
│       └── features/              # UI feature modules (screens/widgets/sections/dialogs)
│           ├── auth/
│           ├── chat/
│           ├── dashboard/
│           ├── home/
│           ├── match/
│           ├── schedules/
│           └── shop/
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
- EVERY UI component must live in its own file.
- Every file in feature UI must contain at most **one widget class**.
- NEVER create top-level functions or class helper methods that return a widget subtree (`Widget`, widget subclasses, or equivalent).
- The only allowed widget-returning method is Flutter framework-required `build` overrides.
- If a UI block has only 5 lines, still create a dedicated widget class in a dedicated file.
- Do not bypass component-splitting rules with private `_buildX` helper methods.
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
- `no_widget_returning_function`
  - Scope: all `lib/**` Flutter source files (except generated files).
  - Enforces: helper functions/methods cannot return widgets. Extract each UI block into a dedicated widget class in its own file.
  - Allowed exception: Flutter framework-required `build` overrides.
- `feature_hardcoded_ui_string`
  - Scope: `lib/src/features/**` and `lib/src/states/register_match/**`.
  - Enforces: feature UI code must not keep user-facing strings hard-coded.
  - Allowed escape hatch for non-translatable values: add `// ignore: feature_hardcoded_ui_string` above that line.

These rules are intentionally strict to force component separation and predictable naming.

## Mandatory Packages
- `flutter_riverpod` / `riverpod`: state management.
- `freezed_annotation` + `freezed` + `build_runner`: immutable union states and codegen.
- `serverpod_flutter` + `serverpod_auth_idp_flutter`: backend client and auth session.
- `result_dart`: typed success/failure result handling.
- `go_router`: app routing.
- `google_fonts`: project typography (configured in app theme).
- `flutter_animate`: onboarding and authentication motion design.
- `slang` + `slang_flutter`: JSON localization + generated typed translation accessors.
- `firebase_core` + `firebase_messaging`: push token sync and background push reception.
- `app_links`: custom deep-link intake (`roothub://join?matchId=...`) for shared match links.
- `share_plus`: native share dialog support for match invite links.

## Typography
The app theme uses Google Fonts to avoid generic defaults:
- Headings: `Cinzel`
- Body/UI text: `Nunito Sans`

## Localization (Mandatory)
- Locale files live in `lib/i18n/*.json`.
- Generated localization file: `lib/i18n/strings.g.dart`.
- Server calls must forward locale as `ServerSupportedTranslation` using `serverSupportedTranslationProvider` (`lib/src/global_providers/server_supported_translation_provider.dart`) on every endpoint `vN(...)` call.
- Supported locales:
  - `en` (English)
  - `pt-BR` (Portuguese - Brazil)
  - `es` (Spanish)
  - `fr` (French)
  - `de` (German)
- Localization key convention in feature UI:
  - Start keys with the feature name (dot notation), e.g. `auth.login.title`, `match.join.confirmButton`.

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

### Localized Faction Names
- Faction names must be resolved through `FactionUiExtension.displayName` in `lib/src/core/extension/faction_ui_extension.dart`.
- Do not derive faction names from enum keys or machine-translate them at runtime.
- The extension stores locale-specific canonical names for:
  - `en`, `pt-BR`, `es`, `fr`, `de`.
- Source policy:
  - `pt-BR`, `es`, `de`: localized names validated against the corresponding language pages in The Root Database (Law of Root).
  - `fr`: names follow the French ROOT ecosystem naming used in Matagot/French releases.

## Daily Commands
```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
cd ../root_hub_flutter_lints && dart run root_hub_flutter_lints:check_flutter_feature_lints --flutter-root ../root_hub_flutter && cd ../root_hub_flutter
flutter analyze
```

## Xcode Cloud (iOS)
If Xcode Cloud fails with missing CocoaPods file lists (for example `Pods-Runner-frameworks-Release-*.xcfilelist`), ensure the post-clone script exists and is executable:

- `ios/ci_scripts/ci_post_clone.sh`

This script runs:
- `flutter precache --ios`
- `flutter pub get`
- `pod install` in `ios/`

It ensures cloud archives can resolve Pod-generated file lists before the Xcode archive step.

## Notes
- Keep feature modules isolated and composable.
- Keep API and error handling in providers.
- Keep UI files small, single-purpose, and explicitly named.
