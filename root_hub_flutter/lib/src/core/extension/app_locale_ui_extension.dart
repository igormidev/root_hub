import 'package:root_hub_flutter/i18n/strings.g.dart';

extension AppLocaleUiExtension on AppLocale {
  String displayLabel(Translations t) => switch (this) {
    AppLocale.en =>
      t.dashboard.ui_widgets_dashboard_profile_drawer_widget.english,
    AppLocale.ptBr =>
      t.dashboard.ui_widgets_dashboard_profile_drawer_widget.portugueseBrazil,
    AppLocale.es =>
      t.dashboard.ui_widgets_dashboard_profile_drawer_widget.spanish,
    AppLocale.fr =>
      t.dashboard.ui_widgets_dashboard_profile_drawer_widget.french,
    AppLocale.de =>
      t.dashboard.ui_widgets_dashboard_profile_drawer_widget.german,
  };
}
