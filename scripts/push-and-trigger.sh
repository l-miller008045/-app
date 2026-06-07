#!/usr/bin/env bash
set -euo pipefail

BRANCH="main"
TRIGGER=false
while [[ "$#" -gt 0 ]]; do
  case $1 in
    -b|--branch) BRANCH="$2"; shift 2;;
    -t|--trigger) TRIGGER=true; shift;;
    *) shift;;
  esac
done

ROOT_DIR=$(dirname "$(realpath "$0")")/..
cd "$ROOT_DIR"

echo "Running daily log script..."
node scripts/daily-log.js

echo "Staging changes..."
git add . || true

MSG="chore(ci): daily-log update $(date +%F_%H-%M)"
if git commit -m "$MSG" 2>/dev/null; then
  echo "Committed changes."
else
  echo "No changes to commit."
fi

echo "Pulling latest from origin/$BRANCH..."
git pull --rebase origin "$BRANCH" || true

echo "Pushing to origin/$BRANCH..."
git push origin "$BRANCH"

if [ "$TRIGGER" = true ]; then
  if command -v gh >/dev/null 2>&1; then
    echo "Triggering workflow..."
    gh workflow run .github/workflows/daily-log.yml --ref "$BRANCH"
  else
    echo "gh CLI not found. Install GitHub CLI to enable workflow trigger."
  fi
fi

echo "Done."
