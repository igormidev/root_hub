# root_hub_web_portal

Lightweight Jaspr web portal for Root Hub.

## What This Project Is
This project runs under `/join` in `root_hub_server` and currently serves two flows:
- Match invite redirect (`/join?matchId=...`) with mobile deep-link + app-store fallback.
- Password-protected analytics admin panel (`/join/analytics`) for invite click metrics.
- Public legal pages for store compliance:
  - `/join/privacy`
  - `/join/terms`
  - `/join/account-deletion`
  - `/join/account-deletion/success`
- Runtime web portal config (`/join/config.json`) used by the Jaspr app to resolve the correct API URL per server run mode.

It is intentionally framework-light (Jaspr only) and is the place for lightweight web utilities, admin pages, and redirect pages.

## Dependencies
- `jaspr`: web UI/runtime.
- `root_hub_client`: generated Serverpod client for calling backend endpoints.

## Run In Development
```bash
cd /Users/igor/PersonalProjects/root_hub/root_hub_web_portal
dart pub global run jaspr_cli:jaspr serve
```

## Build Static Output
```bash
cd /Users/igor/PersonalProjects/root_hub/root_hub_web_portal
dart pub global run jaspr_cli:jaspr build
```

Build artifacts are generated in `build/jaspr/`.

To stage the built portal into the server package for local runs and cloud deploys:

```bash
cd /Users/igor/PersonalProjects/root_hub/root_hub_server
serverpod run web_portal_build
```

## How Serverpod Uses This Build
`root_hub_server/lib/server.dart` serves the staged portal at `/join` from:
- `root_hub_server/web/join`

If the build does not exist, Serverpod serves:
- `root_hub_server/web/pages/build_web_portal.html`

## Common Update Workflow
1. Implement changes in this Jaspr project.
2. Stage the server-served bundle with `cd ../root_hub_server && serverpod run web_portal_build`.
3. Restart Serverpod.
4. Open:
   - redirect flow: `http://localhost:8082/join/?matchId=...`
   - analytics panel: `http://localhost:8082/join/analytics`
   - privacy policy: `http://localhost:8082/join/privacy`
   - terms of service: `http://localhost:8082/join/terms`
   - account deletion request page: `http://localhost:8082/join/account-deletion`
