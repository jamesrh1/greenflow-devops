#!/usr/bin/env bash
# Seed the PostgreSQL database with test claim data

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
CONFIG_DIR="$PROJECT_ROOT/config"

if [ -f "$CONFIG_DIR/.env" ]; then
  source "$CONFIG_DIR/.env"
elif [ -f "$CONFIG_DIR/.env.example" ]; then
  source "$CONFIG_DIR/.env.example"
fi

PSQL="psql postgresql://$POSTGRES_USER:$POSTGRES_PASSWORD@$POSTGRES_HOST:$POSTGRES_PORT/$POSTGRES_DB"

$PSQL <<'SQL'
CREATE TABLE IF NOT EXISTS claims (
  id SERIAL PRIMARY KEY,
  claim_type TEXT NOT NULL,
  value TEXT NOT NULL
);

INSERT INTO claims (claim_type, value) VALUES
  ('test', 'example claim 1'),
  ('test', 'example claim 2');
SQL
