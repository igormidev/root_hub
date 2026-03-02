import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:root_hub_server/src/i18n/strings.g.dart';

class ServerTranslations {
  const ServerTranslations._();

  static final Map<ServerSupportedTranslation, Translations> _preloaded = {
    for (final language in ServerSupportedTranslation.values)
      language: language.appLocale.buildSync(),
  };

  static Translations of(ServerSupportedTranslation language) {
    return _preloaded[language]!;
  }
}

extension ServerSupportedTranslationX on ServerSupportedTranslation {
  AppLocale get appLocale => switch (this) {
    ServerSupportedTranslation.english => AppLocale.en,
    ServerSupportedTranslation.portugueseBrazil => AppLocale.ptBr,
    ServerSupportedTranslation.spanish => AppLocale.es,
    ServerSupportedTranslation.french => AppLocale.fr,
    ServerSupportedTranslation.german => AppLocale.de,
  };
}

extension LanguageToServerSupportedTranslationX on Language {
  ServerSupportedTranslation get toServerSupportedTranslation => switch (this) {
    Language.english => ServerSupportedTranslation.english,
    Language.portugueseBrazil => ServerSupportedTranslation.portugueseBrazil,
    Language.spanish => ServerSupportedTranslation.spanish,
    Language.french => ServerSupportedTranslation.french,
    Language.german => ServerSupportedTranslation.german,
    _ => ServerSupportedTranslation.english,
  };
}
