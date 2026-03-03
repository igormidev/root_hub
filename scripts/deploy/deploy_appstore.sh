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
  printf '[deploy-appstore] %s\n' "$*"
}

fail() {
  printf '[deploy-appstore] ERROR: %s\n' "$*" >&2
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

is_configured() {
  local value="${1:-}"
  [[ -n "${value}" && "${value}" != "REPLACE_ME" && "${value}" != "CHANGE_ME" ]]
}

require_cmd flutter
require_cmd xcrun

FLUTTER_PROJECT_DIR="${FLUTTER_PROJECT_DIR:-${REPO_ROOT}/root_hub_flutter}"
IOS_PROJECT_FILE="${FLUTTER_PROJECT_DIR}/ios/Runner.xcodeproj/project.pbxproj"
IOS_EXPORT_OPTIONS_PLIST="${IOS_EXPORT_OPTIONS_PLIST:-REPLACE_ME}"
IOS_BUNDLE_ID="${IOS_BUNDLE_ID:-com.rootHubFlutter}"
IOS_BUILD_NAME="${IOS_BUILD_NAME:-}"
IOS_BUILD_NUMBER="${IOS_BUILD_NUMBER:-}"
IOS_IPA_PATH="${IOS_IPA_PATH:-}"
APPSTORE_SKIP_UPLOAD="${APPSTORE_SKIP_UPLOAD:-0}"
APPSTORE_VERIFY_APP_LINK="${APPSTORE_VERIFY_APP_LINK:-0}"

APP_STORE_CONNECT_PROVIDER_PUBLIC_ID="${APP_STORE_CONNECT_PROVIDER_PUBLIC_ID:-}"
APP_STORE_CONNECT_API_KEY_ID="${APP_STORE_CONNECT_API_KEY_ID:-}"
APP_STORE_CONNECT_API_ISSUER_ID="${APP_STORE_CONNECT_API_ISSUER_ID:-}"
APP_STORE_CONNECT_API_KEY_PATH="${APP_STORE_CONNECT_API_KEY_PATH:-}"

[[ -d "${FLUTTER_PROJECT_DIR}" ]] || fail "Flutter project directory not found: ${FLUTTER_PROJECT_DIR}"
[[ -f "${IOS_PROJECT_FILE}" ]] || fail "iOS project file not found: ${IOS_PROJECT_FILE}"

if [[ "${IOS_EXPORT_OPTIONS_PLIST}" == "REPLACE_ME" || ! -f "${IOS_EXPORT_OPTIONS_PLIST}" ]]; then
  fail "Set IOS_EXPORT_OPTIONS_PLIST to a valid ExportOptions.plist path for App Store export."
fi

project_bundle_id="$({
  awk -F' = ' '/PRODUCT_BUNDLE_IDENTIFIER = / {
    if ($2 ~ /RunnerTests/) {
      next
    }

    gsub(/;|[[:space:]]/, "", $2)
    print $2
    exit
  }' "${IOS_PROJECT_FILE}"
} || true)"

[[ -n "${project_bundle_id}" ]] || fail "Could not detect iOS bundle identifier from ${IOS_PROJECT_FILE}."

if [[ "${project_bundle_id}" != "${IOS_BUNDLE_ID}" ]]; then
  fail "IOS_BUNDLE_ID (${IOS_BUNDLE_ID}) does not match project bundle id (${project_bundle_id})."
fi

if [[ "${APPSTORE_VERIFY_APP_LINK}" == "1" ]]; then
  require_env APP_STORE_CONNECT_PROVIDER_PUBLIC_ID

  if is_configured "${APP_STORE_CONNECT_API_KEY_ID}" && is_configured "${APP_STORE_CONNECT_API_ISSUER_ID}" && is_configured "${APP_STORE_CONNECT_API_KEY_PATH}"; then
    [[ -f "${APP_STORE_CONNECT_API_KEY_PATH}" ]] || fail "APP_STORE_CONNECT_API_KEY_PATH does not exist: ${APP_STORE_CONNECT_API_KEY_PATH}"

    verify_key_dir="$(mktemp -d)"
    cp "${APP_STORE_CONNECT_API_KEY_PATH}" "${verify_key_dir}/AuthKey_${APP_STORE_CONNECT_API_KEY_ID}.p8"

    verify_output="$(
      API_PRIVATE_KEYS_DIR="${verify_key_dir}" xcrun altool \
        --list-apps \
        --provider-public-id "${APP_STORE_CONNECT_PROVIDER_PUBLIC_ID}" \
        --filter-bundle-id "${IOS_BUNDLE_ID}" \
        --output-format json \
        --apiKey "${APP_STORE_CONNECT_API_KEY_ID}" \
        --apiIssuer "${APP_STORE_CONNECT_API_ISSUER_ID}"
    )"
    rm -rf "${verify_key_dir}"
  else
    require_env APP_STORE_CONNECT_USERNAME
    require_env APP_STORE_CONNECT_APP_SPECIFIC_PASSWORD

    verify_output="$(
      xcrun altool \
        --list-apps \
        --provider-public-id "${APP_STORE_CONNECT_PROVIDER_PUBLIC_ID}" \
        --filter-bundle-id "${IOS_BUNDLE_ID}" \
        --output-format json \
        --username "${APP_STORE_CONNECT_USERNAME}" \
        --password "${APP_STORE_CONNECT_APP_SPECIFIC_PASSWORD}"
    )"
  fi

  if ! printf '%s' "${verify_output}" | tr -d '[:space:]' | grep -Fq "\"bundleId\":\"${IOS_BUNDLE_ID}\""; then
    fail "Bundle id ${IOS_BUNDLE_ID} was not found in provider ${APP_STORE_CONNECT_PROVIDER_PUBLIC_ID}. Confirm the app exists in App Store Connect."
  fi

  log "Verified App Store Connect mapping for bundle id ${IOS_BUNDLE_ID}"
fi

log "Building iOS IPA"
build_cmd=(flutter build ipa --release --export-options-plist "${IOS_EXPORT_OPTIONS_PLIST}")
if [[ -n "${IOS_BUILD_NAME}" ]]; then
  build_cmd+=(--build-name "${IOS_BUILD_NAME}")
fi
if [[ -n "${IOS_BUILD_NUMBER}" ]]; then
  build_cmd+=(--build-number "${IOS_BUILD_NUMBER}")
fi

(
  cd "${FLUTTER_PROJECT_DIR}"
  flutter pub get
  "${build_cmd[@]}"
)

if [[ -z "${IOS_IPA_PATH}" ]]; then
  IOS_IPA_PATH="$(find "${FLUTTER_PROJECT_DIR}/build/ios/ipa" -maxdepth 1 -type f -name '*.ipa' | sort | tail -n 1)"
fi

[[ -n "${IOS_IPA_PATH}" && -f "${IOS_IPA_PATH}" ]] || fail "Could not find generated IPA."
log "Generated IPA: ${IOS_IPA_PATH}"

if [[ "${APPSTORE_SKIP_UPLOAD}" == "1" ]]; then
  log "Skipping upload because APPSTORE_SKIP_UPLOAD=1"
  exit 0
fi

if is_configured "${APP_STORE_CONNECT_API_KEY_ID}" && is_configured "${APP_STORE_CONNECT_API_ISSUER_ID}" && is_configured "${APP_STORE_CONNECT_API_KEY_PATH}"; then
  [[ -f "${APP_STORE_CONNECT_API_KEY_PATH}" ]] || fail "APP_STORE_CONNECT_API_KEY_PATH does not exist: ${APP_STORE_CONNECT_API_KEY_PATH}"

  key_dir="$(mktemp -d)"
  trap 'rm -rf "${key_dir}"' EXIT
  cp "${APP_STORE_CONNECT_API_KEY_PATH}" "${key_dir}/AuthKey_${APP_STORE_CONNECT_API_KEY_ID}.p8"

  log "Uploading IPA with App Store Connect API key"
  API_PRIVATE_KEYS_DIR="${key_dir}" xcrun altool \
    --upload-app \
    --type ios \
    --file "${IOS_IPA_PATH}" \
    --apiKey "${APP_STORE_CONNECT_API_KEY_ID}" \
    --apiIssuer "${APP_STORE_CONNECT_API_ISSUER_ID}"
else
  require_env APP_STORE_CONNECT_USERNAME
  require_env APP_STORE_CONNECT_APP_SPECIFIC_PASSWORD

  log "Uploading IPA with Apple ID credentials"
  xcrun altool \
    --upload-app \
    --type ios \
    --file "${IOS_IPA_PATH}" \
    --username "${APP_STORE_CONNECT_USERNAME}" \
    --password "${APP_STORE_CONNECT_APP_SPECIFIC_PASSWORD}"
fi

log "App Store upload submitted"
