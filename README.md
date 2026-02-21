# Root Hub Monorepo

Root Hub is a Serverpod + Flutter workspace for the ROOT boardgame community.

This repository is split into focused projects. Start with the project README that matches the area you are changing:

- Flutter app: [`root_hub_flutter/README.md`](root_hub_flutter/README.md)
- Backend server: [`root_hub_server/README.md`](root_hub_server/README.md)
- Custom lint package for Flutter: [`root_hub_flutter_lints/README.md`](root_hub_flutter_lints/README.md)
- Generated client package: [`root_hub_client/README.md`](root_hub_client/README.md)

## Workspace Projects
- `root_hub_server`: Serverpod backend.
- `root_hub_client`: generated Dart/Flutter client from Serverpod protocol.
- `root_hub_flutter`: Flutter mobile/web app.
- `root_hub_flutter_lints`: custom analyzer rules enforced in the Flutter app.

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
