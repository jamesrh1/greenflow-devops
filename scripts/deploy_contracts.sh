#!/usr/bin/env bash
# Deploy smart contracts to a local Hardhat network

set -euo pipefail

# Change to project root if script is in subdir
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
cd "$PROJECT_ROOT"

# Ensure dependencies are installed
if ! command -v npx >/dev/null 2>&1; then
  echo "npx is required to run Hardhat" >&2
  exit 1
fi

# Compile and deploy
npx hardhat compile
npx hardhat run scripts/deploy.ts --network localhost
