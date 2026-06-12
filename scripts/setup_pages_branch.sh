#!/usr/bin/env bash
set -euo pipefail

REPO_NAME="${1:-dingtalk-zhishen-dingnei-interactive}"
VISIBILITY="${2:---public}"

if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI 'gh' is required. Install it first." >&2
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  gh auth login
fi

git init
git branch -M main
git add .
git commit -m "Publish DingTalk interactive insight page" || true

gh repo create "$REPO_NAME" "$VISIBILITY" --source=. --remote=origin --push || git push -u origin main

echo "Repository pushed. In GitHub Settings → Pages, select Source: GitHub Actions if it is not already enabled."
