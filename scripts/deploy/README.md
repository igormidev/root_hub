# Root Hub Deploy Setup (iOS + Android)

Last reviewed: 2026-03-03

This file lists what is still missing so `scripts/deploy/*.sh` can run end-to-end.

`deploy.env` uses `VAR=${VAR:-...}` style assignments, so shell-exported variables still override file defaults.

## What scripts do now
- iOS deploy script:
  - auto bumps `root_hub_flutter/pubspec.yaml` version/build by default
  - runs `flutter pub get`
  - runs `pod install` (`IOS_POD_REPO_UPDATE=1` to force repo update)
  - builds IPA and uploads
- Android deploy script:
  - auto bumps `root_hub_flutter/pubspec.yaml` version/build by default
  - runs `flutter pub get`
  - builds AAB and uploads
- `deploy_mobile.sh` bumps once (in iOS step) and reuses that version for Android.

## How to run
From repo root:

```bash
scripts/deploy/deploy_everything.sh
```

Only server:

```bash
scripts/deploy/deploy_server.sh
```

Only mobile (iOS then Android):

```bash
scripts/deploy/deploy_mobile.sh
```

Only iOS upload:

```bash
scripts/deploy/deploy_appstore.sh
```

Only Android upload:

```bash
scripts/deploy/deploy_playstore.sh
```

Disable auto bump for one run:

```bash
AUTO_BUMP_VERSION=0 scripts/deploy/deploy_appstore.sh
```

## Already known (pre-filled in `deploy.env`)
- `SCLOUD_PROJECT_ID=roothub`
- `IOS_BUNDLE_ID=com.rootHubFlutter`
- `ANDROID_PACKAGE_NAME=com.root_hub_flutter`

## iOS keys still missing

### 1) `IOS_EXPORT_OPTIONS_PLIST`
- Used by: `flutter build ipa --export-options-plist ...`.
- Where to get it:
  1. Open Xcode Organizer for your archive.
  2. Use **Distribute App** for **App Store Connect** export.
  3. Save/export once and keep the generated `ExportOptions.plist` path.
- Notes:
  - Flutter documents this parameter; generating the plist via Xcode export flow is the practical path.

### 2) App Store Connect API auth (preferred)
- Variables:
  - `APP_STORE_CONNECT_API_KEY_ID`
  - `APP_STORE_CONNECT_API_ISSUER_ID`
  - `APP_STORE_CONNECT_API_KEY_PATH`
  - `APP_STORE_CONNECT_PROVIDER_PUBLIC_ID` (needed only if `APPSTORE_VERIFY_APP_LINK=1`)
- Where to get API key values (latest UI path):
  1. App Store Connect -> **Users and Access** -> **Integrations** -> **Team Keys**.
  2. Click **Generate API key**.
  3. Save the `.p8` file (this becomes `APP_STORE_CONNECT_API_KEY_PATH`).
  4. Copy Key ID and Issuer ID shown in that area.
- Provider Public ID:
  - Get it with CLI (reliable): `xcrun altool --list-providers ... --output-format json`.

### 3) Apple ID auth (fallback)
- Variables:
  - `APP_STORE_CONNECT_USERNAME`
  - `APP_STORE_CONNECT_APP_SPECIFIC_PASSWORD`
- Where to get app-specific password:
  1. Open `account.apple.com`.
  2. Go to **Sign-In and Security**.
  3. Open **App-Specific Passwords** and generate one.

### 4) Confirm app/bundle mapping (if you were unsure)
- In App Store Connect, open your app and check App Information (Bundle ID).
- In scripts, set:
  - `IOS_BUNDLE_ID` to that exact value.
  - `APPSTORE_VERIFY_APP_LINK=1` to make `deploy_appstore.sh` validate it before upload.

## Android keys still missing

### 1) Release signing (mandatory before Play upload)
Current project status:
- `root_hub_flutter/android/app/build.gradle.kts` still signs release with debug key.

What you need:
- A release keystore (`.jks` / `.keystore`).
- Keystore alias + passwords.
- Gradle release signing wired to that keystore (instead of debug signing).

Where to create/manage it:
- Android Studio: **Build -> Generate Signed Bundle / APK**.
- Android app signing docs: Android Developers and Play Console help.

### 2) `GOOGLE_PLAY_SERVICE_ACCOUNT_JSON_PATH`
- Used by `fastlane supply` (`--json_key`).
- Where to get it (latest flow):
  1. In Google Play Console, go to **Setup -> API access**.
  2. Link or create a Google Cloud project.
  3. In Google Cloud Console, create a service account and create a JSON key.
  4. Back in Play Console API access, grant this service account app permissions.
  5. Save JSON locally and set `GOOGLE_PLAY_SERVICE_ACCOUNT_JSON_PATH` to it.

## Web-verified references
- Flutter iOS deployment (`build ipa`, `export-options-plist`):
  - https://docs.flutter.dev/deployment/ios
- Apple: generating App Store Connect API keys (Users and Access -> Integrations -> Team Keys):
  - https://developer.apple.com/help/app-store-connect/get-started/app-store-connect-homepage
- Apple: app-specific passwords location:
  - https://support.apple.com/en-us/102654
- Apple: app info in App Store Connect:
  - https://developer.apple.com/help/app-store-connect/manage-your-apps/view-app-information
- Google Play Android Publisher API getting started (service accounts / API access):
  - https://developers.google.com/android-publisher/getting_started
- Google Play app signing overview/help:
  - https://support.google.com/googleplay/android-developer/answer/9842756
- Android app signing (keystore/signing guidance):
  - https://developer.android.com/studio/publish/app-signing
- Fastlane `supply` action (Play upload parameters):
  - https://docs.fastlane.tools/actions/supply/

## Inference notes
- Apple UI wording/placement changes often. The Team Keys page path is official; exact button text can vary.
- Issuer ID visibility is inferred from the same App Store Connect API keys area used to generate Team Keys.
