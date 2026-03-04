#!/bin/sh

# Fail fast if any command errors.
set -e

# The script lives in ios/ci_scripts. Move to the Flutter project root.
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
FLUTTER_PROJECT_DIR="$(cd "${SCRIPT_DIR}/../.." && pwd)"
cd "${FLUTTER_PROJECT_DIR}"

# Install Flutter in Xcode Cloud if missing.
if ! command -v flutter >/dev/null 2>&1; then
  git clone https://github.com/flutter/flutter.git --depth 1 -b stable "$HOME/flutter"
  export PATH="$PATH:$HOME/flutter/bin"
fi

# Precache iOS artifacts and install Dart/Flutter dependencies.
flutter precache --ios
flutter pub get

# Install CocoaPods if missing, then install iOS pods.
if ! command -v pod >/dev/null 2>&1; then
  HOMEBREW_NO_AUTO_UPDATE=1 brew install cocoapods
fi

cd ios
pod install

exit 0
