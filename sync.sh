#!/usr/bin/env bash

set -e

NOTES_DIR="${HOME}/notes/bear"
SCRIPT_DIR="$(git rev-parse --show-toplevel)"

cd "${SCRIPT_DIR}"

pushd "${NOTES_DIR}"
git add "${NOTES_DIR}"
git commit --allow-empty-message -m '' || true
git pull --rebase
popd

python3 ./bear_export_sync.py --out "${NOTES_DIR}" --backup ./backup

pushd "${NOTES_DIR}"
git add "${NOTES_DIR}"
git commit --allow-empty-message -m '' || true
git push
popd
