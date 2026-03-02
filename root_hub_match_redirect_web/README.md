# root_hub_match_redirect_web

Lightweight Jaspr web app for shared Root Hub match links.

This project is intentionally small and only handles one flow:
- receive `/join?matchId=...` links
- detect mobile platform (Android / iOS)
- try to open the app using the custom deep link (`roothub://join?matchId=...`)
- fallback to Play Store / App Store if the app is not installed
- show a mobile-only explanation with store buttons on desktop

## Running the project

Run the app in dev mode:

```bash
dart pub global run jaspr_cli:jaspr serve
```

## Building the project

Build static output:

```bash
dart pub global run jaspr_cli:jaspr build
```

Output is generated under `build/jaspr/`.

## Serverpod Hosting

`root_hub_server` serves this project at `/join` from:
- `../root_hub_match_redirect_web/build/jaspr`

When files are missing, Serverpod serves `web/pages/build_match_redirect_web.html` as a fallback page.
