#!/usr/bin/env bash
# Validate the catalog with the published Apocryphon CLI.
#
# Uses an isolated APOCRYPHON_HOME so it never touches the developer's own
# configuration or client directories.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP_HOME="$(mktemp -d)"
trap 'rm -rf "$TMP_HOME"' EXIT

export HOME="$TMP_HOME"
export APOCRYPHON_HOME="$TMP_HOME/.apocryphon"

npx --yes @apocryphon/cli@latest init --registry "$ROOT" --yes >/dev/null
npx --yes @apocryphon/cli@latest validate --registry --strict
