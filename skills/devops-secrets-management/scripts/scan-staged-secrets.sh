#!/usr/bin/env bash
set -euo pipefail

if ! git rev-parse --git-dir >/dev/null 2>&1; then
  echo "scan-staged-secrets: not a git repository" >&2
  exit 0
fi

diff="$(git diff --cached -U0 || true)"
if [ -z "$diff" ]; then
  echo "scan-staged-secrets: no staged changes"
  exit 0
fi

patterns='-----BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY-----|AKIA[0-9A-Z]{16}|sk-[A-Za-z0-9_-]{20,}|ghp_[A-Za-z0-9]{36}|xox[baprs]-[A-Za-z0-9-]{10,}|(ANTHROPIC|OPENAI|CURSOR|DEEPSEEK|NPM)_[A-Z_]*KEY[[:space:]]*='

if printf '%s
' "$diff" | grep -nEI "$patterns" >/dev/null 2>&1; then
  echo "scan-staged-secrets: possible secret in staged changes" >&2
  printf '%s
' "$diff" | grep -nEI "$patterns" | sed -E 's/(sk-|ghp_|xox[baprs]-)[A-Za-z0-9_-]+/[REDACTED]/g' >&2
  exit 1
fi

echo "scan-staged-secrets: clean"
