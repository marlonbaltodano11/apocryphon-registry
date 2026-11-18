#!/usr/bin/env bash
set -euo pipefail
echo "== release preflight =="

if [ -n "$(git status --porcelain)" ]; then
  echo "error: working tree is not clean" >&2
  git status --short >&2
  exit 1
fi

if [ -n "${1:-}" ]; then
  echo "== running: $* =="
  "$@"
fi

echo "== node/npm =="
node --version
npm --version
echo "preflight: ok"
