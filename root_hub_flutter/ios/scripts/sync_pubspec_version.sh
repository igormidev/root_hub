#!/bin/sh
set -eu

PUBSPEC_PATH="${PROJECT_DIR}/../pubspec.yaml"
APP_INFO_PLIST="${TARGET_BUILD_DIR}/${INFOPLIST_PATH}"

APP_VERSION="$(
  awk '
    /^[[:space:]]*version:[[:space:]]*/ {
      sub(/^[[:space:]]*version:[[:space:]]*/, "", $0)
      print $0
      exit
    }
  ' "${PUBSPEC_PATH}"
)"

if [ -z "${APP_VERSION}" ]; then
  echo "error: Could not read version from ${PUBSPEC_PATH}." >&2
  exit 1
fi

BUILD_NAME="${APP_VERSION%%+*}"
BUILD_NUMBER="${APP_VERSION#*+}"

if [ "${BUILD_NUMBER}" = "${APP_VERSION}" ]; then
  BUILD_NUMBER="1"
fi

if [ ! -f "${APP_INFO_PLIST}" ]; then
  echo "error: Built Info.plist not found at ${APP_INFO_PLIST}." >&2
  exit 1
fi

set_plist_value() {
  key="$1"
  value="$2"

  if ! /usr/libexec/PlistBuddy -c "Set :${key} ${value}" "${APP_INFO_PLIST}" >/dev/null 2>&1; then
    /usr/libexec/PlistBuddy -c "Add :${key} string ${value}" "${APP_INFO_PLIST}" >/dev/null
  fi
}

set_plist_value "CFBundleShortVersionString" "${BUILD_NAME}"
set_plist_value "CFBundleVersion" "${BUILD_NUMBER}"

echo "Synced ${APP_INFO_PLIST} to ${BUILD_NAME} (${BUILD_NUMBER}) from ${PUBSPEC_PATH}"
