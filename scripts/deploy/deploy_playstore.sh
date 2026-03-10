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

is_configured() {
  local value="${1:-}"
  [[ -n "${value}" && "${value}" != "REPLACE_ME" && "${value}" != "CHANGE_ME" ]]
}

TEMP_FILES=()
KEY_PROPERTIES_BACKUP=""
GENERATED_KEY_PROPERTIES=0
KEY_PROPERTIES_FILE=""

register_temp_file() {
  TEMP_FILES+=("$1")
}

cleanup_temp_artifacts() {
  local temp_file

  if [[ -n "${KEY_PROPERTIES_BACKUP}" && -f "${KEY_PROPERTIES_BACKUP}" && -n "${KEY_PROPERTIES_FILE}" ]]; then
    mv "${KEY_PROPERTIES_BACKUP}" "${KEY_PROPERTIES_FILE}"
  elif [[ "${GENERATED_KEY_PROPERTIES}" == "1" && -n "${KEY_PROPERTIES_FILE}" ]]; then
    rm -f "${KEY_PROPERTIES_FILE}"
  fi

  for temp_file in "${TEMP_FILES[@]}"; do
    rm -f "${temp_file}"
  done
}

trap cleanup_temp_artifacts EXIT

decode_base64_to_file() {
  local encoded_value="$1"
  local output_file="$2"

  if printf '%s' "${encoded_value}" | base64 --decode > "${output_file}" 2>/dev/null; then
    return
  fi

  if printf '%s' "${encoded_value}" | base64 -D > "${output_file}" 2>/dev/null; then
    return
  fi

  fail "Failed to decode base64 content into ${output_file}."
}

read_android_sdk_from_local_properties() {
  local local_properties_file="$1"

  [[ -f "${local_properties_file}" ]] || return 1

  awk -F'=' '
    /^sdk\.dir=/ {
      value = substr($0, index($0, "=") + 1)
      gsub(/\\\\:/, ":", value)
      gsub(/\\\\ /, " ", value)
      print value
      exit
    }
  ' "${local_properties_file}"
}

ensure_android_sdk() {
  local local_properties_file="$1"
  local sdk_root="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-}}"

  if [[ -z "${sdk_root}" ]]; then
    sdk_root="$(read_android_sdk_from_local_properties "${local_properties_file}" || true)"
  fi

  if [[ -z "${sdk_root}" ]]; then
    for candidate in \
      "${HOME}/Library/Android/sdk" \
      "/opt/homebrew/share/android-commandlinetools" \
      "/usr/local/share/android-commandlinetools"; do
      if [[ -d "${candidate}" ]]; then
        sdk_root="${candidate}"
        break
      fi
    done
  fi

  [[ -n "${sdk_root}" ]] || fail "Android SDK not found. Install it and set ANDROID_HOME or ANDROID_SDK_ROOT."
  [[ -d "${sdk_root}" ]] || fail "Android SDK path does not exist: ${sdk_root}"

  export ANDROID_HOME="${sdk_root}"
  export ANDROID_SDK_ROOT="${sdk_root}"

  if [[ -d "${ANDROID_HOME}/platform-tools" ]]; then
    export PATH="${ANDROID_HOME}/platform-tools:${PATH}"
  fi
  if [[ -d "${ANDROID_HOME}/cmdline-tools/latest/bin" ]]; then
    export PATH="${ANDROID_HOME}/cmdline-tools/latest/bin:${PATH}"
  fi
}

prepare_android_release_signing() {
  local android_dir="$1"
  local keystore_path="${ANDROID_KEYSTORE_PATH:-}"
  local temp_keystore=""

  if is_configured "${ANDROID_KEYSTORE_BASE64:-}"; then
    temp_keystore="$(mktemp "${android_dir}/upload-keystore-ci.XXXXXX")"
    decode_base64_to_file "${ANDROID_KEYSTORE_BASE64}" "${temp_keystore}"
    register_temp_file "${temp_keystore}"
    keystore_path="${temp_keystore}"
  fi

  if ! is_configured "${ANDROID_KEYSTORE_PASSWORD:-}" \
    && ! is_configured "${ANDROID_KEY_ALIAS:-}" \
    && ! is_configured "${ANDROID_KEY_PASSWORD:-}" \
    && ! is_configured "${keystore_path:-}"; then
    return
  fi

  require_env ANDROID_KEYSTORE_PASSWORD
  require_env ANDROID_KEY_ALIAS
  require_env ANDROID_KEY_PASSWORD
  [[ -n "${keystore_path}" ]] || fail "ANDROID_KEYSTORE_PATH or ANDROID_KEYSTORE_BASE64 is required when configuring CI signing."
  [[ -f "${keystore_path}" ]] || fail "Android keystore file does not exist: ${keystore_path}"

  if [[ -f "${KEY_PROPERTIES_FILE}" ]]; then
    KEY_PROPERTIES_BACKUP="$(mktemp)"
    cp "${KEY_PROPERTIES_FILE}" "${KEY_PROPERTIES_BACKUP}"
    register_temp_file "${KEY_PROPERTIES_BACKUP}"
  else
    GENERATED_KEY_PROPERTIES=1
  fi

  cat > "${KEY_PROPERTIES_FILE}" <<EOF
storePassword=${ANDROID_KEYSTORE_PASSWORD}
keyPassword=${ANDROID_KEY_PASSWORD}
keyAlias=${ANDROID_KEY_ALIAS}
storeFile=${keystore_path}
EOF

  log "Prepared Android release signing from environment variables"
}

prepare_google_play_service_account_json() {
  local temp_json=""

  if ! is_configured "${GOOGLE_PLAY_SERVICE_ACCOUNT_JSON_BASE64:-}"; then
    return
  fi

  temp_json="$(mktemp)"
  decode_base64_to_file "${GOOGLE_PLAY_SERVICE_ACCOUNT_JSON_BASE64}" "${temp_json}"
  register_temp_file "${temp_json}"
  GOOGLE_PLAY_SERVICE_ACCOUNT_JSON_PATH="${temp_json}"
  log "Prepared Google Play service account JSON from environment variables"
}

ensure_java_runtime() {
  if command -v java >/dev/null 2>&1 && java -version >/dev/null 2>&1; then
    return
  fi

  local jdk_home=""
  for candidate in \
    "/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home" \
    "/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home"; do
    if [[ -x "${candidate}/bin/java" ]]; then
      jdk_home="${candidate}"
      break
    fi
  done

  if [[ -n "${jdk_home}" ]]; then
    export JAVA_HOME="${jdk_home}"
    export PATH="${JAVA_HOME}/bin:${PATH}"
  fi

  command -v java >/dev/null 2>&1 || fail "Java runtime not found. Install OpenJDK 17 and/or set JAVA_HOME."
  java -version >/dev/null 2>&1 || fail "Java runtime is not usable. Set JAVA_HOME to a working JDK installation."
}

ensure_java_runtime
require_cmd flutter

FLUTTER_PROJECT_DIR="${FLUTTER_PROJECT_DIR:-${REPO_ROOT}/root_hub_flutter}"
ANDROID_GRADLE_FILE="${FLUTTER_PROJECT_DIR}/android/app/build.gradle.kts"
ANDROID_LOCAL_PROPERTIES_FILE="${FLUTTER_PROJECT_DIR}/android/local.properties"
PUBSPEC_FILE="${FLUTTER_PROJECT_DIR}/pubspec.yaml"
ANDROID_AAB_PATH="${ANDROID_AAB_PATH:-}"
ANDROID_PACKAGE_NAME="${ANDROID_PACKAGE_NAME:-com.root_hub_flutter}"
ANDROID_BUILD_NAME="${ANDROID_BUILD_NAME:-}"
ANDROID_BUILD_NUMBER="${ANDROID_BUILD_NUMBER:-}"
PLAY_TRACK="${PLAY_TRACK:-internal}"
PLAY_RELEASE_STATUS="${PLAY_RELEASE_STATUS:-draft}"
PLAY_SKIP_UPLOAD="${PLAY_SKIP_UPLOAD:-0}"
GOOGLE_PLAY_SERVICE_ACCOUNT_JSON_PATH="${GOOGLE_PLAY_SERVICE_ACCOUNT_JSON_PATH:-REPLACE_ME}"
GOOGLE_PLAY_SERVICE_ACCOUNT_JSON_BASE64="${GOOGLE_PLAY_SERVICE_ACCOUNT_JSON_BASE64:-}"
ANDROID_KEYSTORE_PATH="${ANDROID_KEYSTORE_PATH:-}"
ANDROID_KEYSTORE_BASE64="${ANDROID_KEYSTORE_BASE64:-}"
ANDROID_KEYSTORE_PASSWORD="${ANDROID_KEYSTORE_PASSWORD:-}"
ANDROID_KEY_ALIAS="${ANDROID_KEY_ALIAS:-}"
ANDROID_KEY_PASSWORD="${ANDROID_KEY_PASSWORD:-}"
AUTO_BUMP_VERSION="${AUTO_BUMP_VERSION:-1}"
VERSION_BUMP_PART="${VERSION_BUMP_PART:-patch}"

[[ -d "${FLUTTER_PROJECT_DIR}" ]] || fail "Flutter project directory not found: ${FLUTTER_PROJECT_DIR}"
[[ -f "${ANDROID_GRADLE_FILE}" ]] || fail "Android Gradle file not found: ${ANDROID_GRADLE_FILE}"
[[ -f "${PUBSPEC_FILE}" ]] || fail "Flutter pubspec file not found: ${PUBSPEC_FILE}"

KEY_PROPERTIES_FILE="${FLUTTER_PROJECT_DIR}/android/key.properties"

ensure_android_sdk "${ANDROID_LOCAL_PROPERTIES_FILE}"
prepare_android_release_signing "${FLUTTER_PROJECT_DIR}/android"

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

read_pubspec_version() {
  local version_value
  version_value="$(awk '/^version:[[:space:]]*/ { print $2; exit }' "${PUBSPEC_FILE}")"
  [[ -n "${version_value}" ]] || fail "Could not read version from ${PUBSPEC_FILE}."

  local build_name="${version_value%%+*}"
  local build_number="${version_value##*+}"
  if [[ "${build_name}" == "${version_value}" ]]; then
    build_number="1"
  fi

  [[ "${build_number}" =~ ^[0-9]+$ ]] || fail "Invalid build number in ${PUBSPEC_FILE}: ${build_number}"
  printf '%s %s\n' "${build_name}" "${build_number}"
}

bump_build_name() {
  local current="$1"
  local part="$2"
  local major minor patch
  IFS='.' read -r major minor patch <<< "${current}"
  [[ "${major}" =~ ^[0-9]+$ && "${minor}" =~ ^[0-9]+$ && "${patch}" =~ ^[0-9]+$ ]] || fail "Build name '${current}' is not in x.y.z format."

  case "${part}" in
    major)
      major=$((major + 1))
      minor=0
      patch=0
      ;;
    minor)
      minor=$((minor + 1))
      patch=0
      ;;
    patch)
      patch=$((patch + 1))
      ;;
    *)
      fail "VERSION_BUMP_PART must be one of: major, minor, patch."
      ;;
  esac

  printf '%s.%s.%s\n' "${major}" "${minor}" "${patch}"
}

write_pubspec_version() {
  local build_name="$1"
  local build_number="$2"
  local temp_file
  temp_file="$(mktemp)"

  awk -v line="version: ${build_name}+${build_number}" '
    BEGIN { updated = 0 }
    /^version:[[:space:]]*/ && updated == 0 {
      print line
      updated = 1
      next
    }
    { print }
    END {
      if (updated == 0) {
        exit 1
      }
    }
  ' "${PUBSPEC_FILE}" > "${temp_file}" || fail "Failed to update version in ${PUBSPEC_FILE}."

  mv "${temp_file}" "${PUBSPEC_FILE}"
}

read -r current_build_name current_build_number < <(read_pubspec_version)
target_build_name="${ANDROID_BUILD_NAME:-${current_build_name}}"
target_build_number="${ANDROID_BUILD_NUMBER:-${current_build_number}}"

if [[ "${AUTO_BUMP_VERSION}" == "1" ]]; then
  if [[ -z "${ANDROID_BUILD_NAME}" ]]; then
    target_build_name="$(bump_build_name "${current_build_name}" "${VERSION_BUMP_PART}")"
  fi

  if [[ -z "${ANDROID_BUILD_NUMBER}" ]]; then
    target_build_number="$((current_build_number + 1))"
  fi
fi

[[ "${target_build_number}" =~ ^[0-9]+$ ]] || fail "Target build number must be numeric, got '${target_build_number}'."

write_pubspec_version "${target_build_name}" "${target_build_number}"
log "Using app version ${target_build_name}+${target_build_number}"

log "Building Android App Bundle"
build_cmd=(
  flutter
  build
  appbundle
  --release
  --build-name
  "${target_build_name}"
  --build-number
  "${target_build_number}"
)

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

require_cmd fastlane
prepare_google_play_service_account_json
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
