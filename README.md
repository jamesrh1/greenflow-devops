# Greenflow DevOps

Infrastructure and tooling for running and testing the full stack locally.

## Folder Layout

- `infra/` - Docker Compose configuration and other infrastructure files.
- `scripts/` - Utility scripts to deploy contracts and seed the database.
- `config/` - Environment configuration templates.

## Usage

1. Copy `config/.env.example` to `config/.env` and adjust values as needed.
2. Start the services:
   ```bash
   docker compose -f infra/docker-compose.yml up -d
   ```
3. Deploy smart contracts to the local Hardhat node:
   ```bash
   ./scripts/deploy_contracts.sh
   ```
4. Seed the PostgreSQL database:
   ```bash
   ./scripts/seed_db.sh
   ```
