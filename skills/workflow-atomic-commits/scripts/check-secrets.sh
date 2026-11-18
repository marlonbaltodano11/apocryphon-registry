#!/usr/bin/env bash
# Fail when the staged diff looks like it contains a credential.
# Run it after `git add` and before `git commit`.
set -euo pipefail

if ! git rev-parse --git-dir >/dev/null 2>&1; then
  echo "check-secrets: not a git repository; skipping." >&2
  exit 0
fi

diff="$(git diff --cached -U0 || true)"
if [ -z "$diff" ]; then
  echo "check-secrets: no staged changes."
  exit 0
fi

patterns='-----BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY-----|AKIA[0-9A-Z]{16}|sk-[A-Za-z0-9_-]{20,}|ghp_[A-Za-z0-9]{36}|xox[baprs]-[A-Za-z0-9-]{10,}|(ANTHROPIC|OPENAI|CURSOR|DEEPSEEK)_API_KEY[[:space:]]*='

if printf '%s\n' "$diff" | grep -nEI "$patterns" >/dev/null 2>&1; then
  echo "check-secrets: possible secret detected in staged changes." >&2
  printf '%s\n' "$diff" \
    | grep -nEI "$patterns" \
    | sed -E 's/(sk-|ghp_|xox[baprs]-)[A-Za-z0-9_-]+/\1[REDACTED]/g' >&2
  echo "Move the secret to an untracked local file (or a secret manager) and unstage it." >&2
  exit 1
fi

echo "check-secrets: staged changes look clean."
