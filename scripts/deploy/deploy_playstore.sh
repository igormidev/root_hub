#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "${SCRIPT_DIR}/../.." && pwd)"
ENV_FILE="${DEPLOY_ENV_FILE:-${SCRIPT_DIR}/deploy.env}"

if [[ -f "${ENV_FILE}" ]]; then
  # shellcheck disable=SC1090
  source "${ENV_FILE}"
fi

log() {
  printf '[deploy-playstore] %s\n' "$*"
}

fail() {
  printf '[deploy-playstore] ERROR: %s\n' "$*" >&2
  exit 1
}

require_cmd() {
  command -v "$1" >/dev/null 2>&1 || fail "Missing required command: $1"
}

require_env() {
  local key="$1"
  local value="${!key:-}"
  if [[ -z "${value}" || "${value}" == "REPLACE_ME" || "${value}" == "CHANGE_ME" ]]; then
    fail "Environment variable ${key} is required. Set it in ${ENV_FILE} or the shell."
  fi
}

require_cmd flutter
require_cmd fastlane

FLUTTER_PROJECT_DIR="${FLUTTER_PROJECT_DIR:-${REPO_ROOT}/root_hub_flutter}"
ANDROID_GRADLE_FILE="${FLUTTER_PROJECT_DIR}/android/app/build.gradle.kts"
ANDROID_AAB_PATH="${ANDROID_AAB_PATH:-}"
ANDROID_PACKAGE_NAME="${ANDROID_PACKAGE_NAME:-com.root_hub_flutter}"
ANDROID_BUILD_NAME="${ANDROID_BUILD_NAME:-}"
ANDROID_BUILD_NUMBER="${ANDROID_BUILD_NUMBER:-}"
PLAY_TRACK="${PLAY_TRACK:-internal}"
PLAY_RELEASE_STATUS="${PLAY_RELEASE_STATUS:-draft}"
PLAY_SKIP_UPLOAD="${PLAY_SKIP_UPLOAD:-0}"
GOOGLE_PLAY_SERVICE_ACCOUNT_JSON_PATH="${GOOGLE_PLAY_SERVICE_ACCOUNT_JSON_PATH:-REPLACE_ME}"

[[ -d "${FLUTTER_PROJECT_DIR}" ]] || fail "Flutter project directory not found: ${FLUTTER_PROJECT_DIR}"
[[ -f "${ANDROID_GRADLE_FILE}" ]] || fail "Android Gradle file not found: ${ANDROID_GRADLE_FILE}"

if grep -q 'signingConfig = signingConfigs.getByName("debug")' "${ANDROID_GRADLE_FILE}"; then
  fail "Android release still uses debug signing in ${ANDROID_GRADLE_FILE}. Configure release keystore signing before Play Store upload."
fi

project_package_name="$({
  awk -F' = ' '/applicationId = / {
    gsub(/"|[[:space:]]/, "", $2)
    print $2
    exit
  }' "${ANDROID_GRADLE_FILE}"
} || true)"

[[ -n "${project_package_name}" ]] || fail "Could not detect Android applicationId from ${ANDROID_GRADLE_FILE}."

if [[ "${project_package_name}" != "${ANDROID_PACKAGE_NAME}" ]]; then
  fail "ANDROID_PACKAGE_NAME (${ANDROID_PACKAGE_NAME}) does not match project applicationId (${project_package_name})."
fi

log "Building Android App Bundle"
build_cmd=(flutter build appbundle --release)
if [[ -n "${ANDROID_BUILD_NAME}" ]]; then
  build_cmd+=(--build-name "${ANDROID_BUILD_NAME}")
fi
if [[ -n "${ANDROID_BUILD_NUMBER}" ]]; then
  build_cmd+=(--build-number "${ANDROID_BUILD_NUMBER}")
fi

(
  cd "${FLUTTER_PROJECT_DIR}"
  flutter pub get
  "${build_cmd[@]}"
)

if [[ -z "${ANDROID_AAB_PATH}" ]]; then
  ANDROID_AAB_PATH="$(find "${FLUTTER_PROJECT_DIR}/build/app/outputs/bundle/release" -maxdepth 1 -type f -name '*.aab' | sort | tail -n 1)"
fi

[[ -n "${ANDROID_AAB_PATH}" && -f "${ANDROID_AAB_PATH}" ]] || fail "Could not find generated AAB."
log "Generated AAB: ${ANDROID_AAB_PATH}"

if [[ "${PLAY_SKIP_UPLOAD}" == "1" ]]; then
  log "Skipping upload because PLAY_SKIP_UPLOAD=1"
  exit 0
fi

require_env GOOGLE_PLAY_SERVICE_ACCOUNT_JSON_PATH
[[ -f "${GOOGLE_PLAY_SERVICE_ACCOUNT_JSON_PATH}" ]] || fail "GOOGLE_PLAY_SERVICE_ACCOUNT_JSON_PATH does not exist: ${GOOGLE_PLAY_SERVICE_ACCOUNT_JSON_PATH}"

log "Uploading AAB to Google Play track '${PLAY_TRACK}'"
fastlane supply \
  --aab "${ANDROID_AAB_PATH}" \
  --package_name "${ANDROID_PACKAGE_NAME}" \
  --json_key "${GOOGLE_PLAY_SERVICE_ACCOUNT_JSON_PATH}" \
  --track "${PLAY_TRACK}" \
  --release_status "${PLAY_RELEASE_STATUS}" \
  --skip_upload_metadata \
  --skip_upload_images \
  --skip_upload_screenshots

log "Play Store upload submitted"
