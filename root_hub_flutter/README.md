
## Architecture

The application follows clean architecture principles with:
- **Presentation Layer**: Flutter widgets and screens
- **Domain Layer**: Business logic and use cases
- **Data Layer**: Serverpod client integration

```
shoebill_template_flutter/
├── lib/
│   ├── src/
│   │   ├── core/              # Core utilities and extensions
│   │   │   ├── extensions/    # Dart/Flutter extensions
│   │   │   └── utils/         # Helper functions
│   │   ├── global_states/     # SHARED freezed states class that will be used between more then one features
│   │   ├── global_providers/     # SHARED riverpod providers that will be used between more then one features
│   │   ├── design_system/     # SHARED UI components and theming
│   │   │   ├── dialog_message.dart
│   │   │   └── default_error_snackbar.dart
│   │   └── features/          # Feature modules
│   │       ├── auth/  # The auth module
│   │       │   ├── screens/ # Screens
│   │       │   ├── sections/ # Section of screens
│   │       │   ├── template/ # If there is a template scaffold of something that is used in other places
│   │       │   ├── widgets/ # Widgets that are inside
│   │       │   ├── dialogs/ # Dialogs that exists in the screens/widgets/sections
│   │       │   └── ... other logical ui separations
│   │       ├── dashboard/  # The dashboard structure for all tabs
│   │       │   └── ... same structure of other features
│   │       ├── settings/  # The settings page where users can change things
│   │       │   └── ... same structure of other features
│   │       ├── home/  # The home of the app
│   │       │   └── ... same structure of other features
│   │       ├── find_match/  # Where the user can find schedules of matches or host a table
│   │       │   └── ... same structure of other features
│   │       ├── shop/  # Where the user will be able to see assets of the root game and be redirected to the 
│   │       │   └── ... same structure of other features
│   │       └── ... other features
│   └── main.dart             # App entry point
├── assets/                    # Images, fonts, etc.
└── pubspec.yaml
```


### Using toResult Extension
Always use the `toResult` extension for API calls:
```dart
// Make API call with proper error handling
final result = await client.example.endpointExample(request).toResult;

result.fold(
  (success) => _handleSuccess(success),
  (error) => handleBabelException(context, error),
);
```

### Error Handling in Dialogs
```dart
final result = await client.scraper.generateRules(request).toResult;

result.fold(
  (success) {
    Navigator.of(context).pop();
    // Handle success
  },
  (error) {
    Navigator.of(context).pop();
    handleBabelException(context, error);
  },
);
```

## 🐛 Common Issues

### "withOpacity is deprecated" Error
Always use `withAlpha()` instead:
```dart
// ✅ Correct
color.withAlpha(128)

// ❌ Wrong
color.withOpacity(0.5)
```

### Serverpod Generation Errors
```bash
serverpod generate
```

### Widget Rebuild Performance
- Use `const` constructors
- Break down large widgets
- Use widget classes, not functions