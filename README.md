# Root Hub Monorepo

Root Hub is a Serverpod + Flutter workspace for the ROOT boardgame community.

This repository is split into focused projects. Start with the project README that matches the area you are changing:

- Flutter app: [`root_hub_flutter/README.md`](root_hub_flutter/README.md)
- Backend server: [`root_hub_server/README.md`](root_hub_server/README.md)
- Custom lint package (Flutter + server endpoint rules): [`root_hub_flutter_lints/README.md`](root_hub_flutter_lints/README.md)
- Generated client package: [`root_hub_client/README.md`](root_hub_client/README.md)
- Web portal (Jaspr): `root_hub_web_portal`

## Workspace Projects
- `root_hub_server`: Serverpod backend.
- `root_hub_client`: generated Dart/Flutter client from Serverpod protocol.
- `root_hub_flutter`: Flutter mobile/web app.
- `root_hub_flutter_lints`: custom analyzer rules enforced in the Flutter app and Serverpod backend.
- `root_hub_web_portal`: lightweight Jaspr web app used by shared match links and admin panels (`/join`).

## Lint Coverage
- Client lints: UI architecture and feature localization rules enforced by `root_hub_flutter_lints` + `check_flutter_feature_lints`.
- Server lints: endpoint contract rules enforced by `root_hub_flutter_lints` through `custom_lint` in `root_hub_server`:
  - endpoint methods must be versioned (`v1`, `v2`, ...)
  - endpoint version methods must receive `required ServerSupportedTranslation language`
  - endpoint response texts must not be hardcoded

## Baseline Commands
From repository root:

```bash
dart pub get
```

When backend protocol/endpoints/entities change:

```bash
cd root_hub_server
serverpod generate
```

Always rerun `serverpod generate` after changing endpoint signatures, protocol enums, or `.spy.yaml` entities.
