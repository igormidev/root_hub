# Serverpod Cloud DB Debug Runbook

## Context
- Date: 2026-03-05
- Incident: login/loading loop caused by backend `getPlayerData` failures.
- Affected app user id (from logs): `019cbbcd-472d-7ef1-9296-7b1bcfb75125`
- Error: `column player_data.preferredLanguage does not exist`

## Project
- Workspace: `/Users/igor/PersonalProjects/root_hub`
- Server package: `/Users/igor/PersonalProjects/root_hub/root_hub_server`
- Cloud DB host: `ep-sparkling-morning-al5fg4w9-pooler.c-3.eu-central-1.aws.neon.tech`
- Cloud DB name: `default`

## Commands Used
1. Show DB CLI help:

```bash
cd /Users/igor/PersonalProjects/root_hub/root_hub_server
scloud db -h
```

2. Get DB connection metadata:

```bash
cd /Users/igor/PersonalProjects/root_hub/root_hub_server
scloud db connection
```

3. Create a debug DB user:

```bash
cd /Users/igor/PersonalProjects/root_hub/root_hub_server
scloud db user create --username dbdebug_igor
```

4. Inspect `player_data` columns:

```bash
PGPASSWORD='npg_0Xxu3bEklQTG' psql "postgresql://ep-sparkling-morning-al5fg4w9-pooler.c-3.eu-central-1.aws.neon.tech/default?sslmode=require" --user dbdebug_igor -c "SELECT column_name, data_type FROM information_schema.columns WHERE table_schema='public' AND table_name='player_data' ORDER BY ordinal_position;"
```

5. Inspect Serverpod migration version in DB:

```bash
PGPASSWORD='npg_0Xxu3bEklQTG' psql "postgresql://ep-sparkling-morning-al5fg4w9-pooler.c-3.eu-central-1.aws.neon.tech/default?sslmode=require" --user dbdebug_igor -c "SELECT module, version, timestamp FROM serverpod_migrations ORDER BY module;"
```

## Findings
- `player_data` had only:
  - `id`
  - `authUserId`
  - `displayName`
  - `currentLocationId`
  - `favoriteFaction`
- Missing required column: `preferredLanguage`.
- `serverpod_migrations.root_hub` was at:
  - `20260302165028948-web-analytics`

## Notes
- Debug DB user `dbdebug_igor` can inspect but could not run migration DDL because table owner is `owner`.
- Migration DDL must be applied through normal Serverpod deployment/apply-migrations path (owner privileges).
