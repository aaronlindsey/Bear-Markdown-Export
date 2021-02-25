#!/usr/bin/env bash

WORK_DIR=$(git rev-parse --show-toplevel)

python3 bear_export_sync.py --out ~/notes/bear --backup "${WORK_DIR}/backup"
