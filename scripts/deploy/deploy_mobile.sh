#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

AUTO_BUMP_VERSION=1 "${SCRIPT_DIR}/deploy_appstore.sh"
AUTO_BUMP_VERSION=0 "${SCRIPT_DIR}/deploy_playstore.sh"
