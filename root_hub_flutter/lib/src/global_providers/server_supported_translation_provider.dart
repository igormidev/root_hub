import 'package:root_hub_client/root_hub_client.dart';
import 'package:root_hub_flutter/i18n/strings.g.dart';
import 'package:riverpod/riverpod.dart';

final appLocaleProvider = StreamProvider<AppLocale>((ref) {
  return LocaleSettings.getLocaleStream();
});

final serverSupportedTranslationProvider = Provider<ServerSupportedTranslation>(
  (ref) {
    final appLocale = ref.watch(appLocaleProvider).maybeWhen<AppLocale?>(
      data: (locale) => locale,
      orElse: () => null,
    );
    return (appLocale ?? LocaleSettings.currentLocale)
        .toServerSupportedTranslation;
  },
);

extension AppLocaleServerSupportedTranslationX on AppLocale {
  ServerSupportedTranslation get toServerSupportedTranslation => switch (this) {
    AppLocale.en => ServerSupportedTranslation.english,
    AppLocale.ptBr => ServerSupportedTranslation.portugueseBrazil,
    AppLocale.es => ServerSupportedTranslation.spanish,
    AppLocale.fr => ServerSupportedTranslation.french,
    AppLocale.de => ServerSupportedTranslation.german,
  };
}
