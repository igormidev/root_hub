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
  printf '[deploy-server] %s\n' "$*"
}

fail() {
  printf '[deploy-server] ERROR: %s\n' "$*" >&2
  exit 1
}

require_cmd() {
  command -v "$1" >/dev/null 2>&1 || fail "Missing required command: $1"
}

require_cmd serverpod
require_cmd dart
require_cmd scloud

SCLOUD_PROJECT_ID="${SCLOUD_PROJECT_ID:-roothub}"
SERVER_PACKAGE_DIR="${SERVER_PACKAGE_DIR:-${REPO_ROOT}/root_hub_server}"
WEB_PORTAL_DIR="${WEB_PORTAL_DIR:-${REPO_ROOT}/root_hub_web_portal}"
CREATE_MIGRATION="${CREATE_MIGRATION:-1}"
MIGRATION_FORCE="${MIGRATION_FORCE:-0}"
MIGRATION_TAG="${MIGRATION_TAG:-deploy-$(date +%Y%m%d%H%M%S)}"
SCLOUD_DEPLOY_DRY_RUN="${SCLOUD_DEPLOY_DRY_RUN:-0}"

[[ -d "${SERVER_PACKAGE_DIR}" ]] || fail "Server package directory not found: ${SERVER_PACKAGE_DIR}"
[[ -d "${WEB_PORTAL_DIR}" ]] || fail "Web portal directory not found: ${WEB_PORTAL_DIR}"

log "Running serverpod generate"
(
  cd "${SERVER_PACKAGE_DIR}"
  serverpod generate
)

if [[ "${CREATE_MIGRATION}" == "1" ]]; then
  log "Creating migration (tag: ${MIGRATION_TAG})"
  migration_cmd=(serverpod create-migration --tag "${MIGRATION_TAG}")
  if [[ "${MIGRATION_FORCE}" == "1" ]]; then
    migration_cmd+=(--force)
  fi

  (
    cd "${SERVER_PACKAGE_DIR}"
    "${migration_cmd[@]}"
  )
else
  log "Skipping migration creation because CREATE_MIGRATION=${CREATE_MIGRATION}"
fi

log "Building Jaspr web portal into root_hub_server/web/join"
(
  cd "${SERVER_PACKAGE_DIR}"
  serverpod run web_portal_build
)

log "Deploying to Serverpod Cloud project '${SCLOUD_PROJECT_ID}'"
deploy_cmd=(scloud --yes -d "${SERVER_PACKAGE_DIR}" deploy -p "${SCLOUD_PROJECT_ID}")
if [[ "${SCLOUD_DEPLOY_DRY_RUN}" == "1" ]]; then
  deploy_cmd+=(--dry-run --show-files)
fi
"${deploy_cmd[@]}"

log "Server deployment completed"
