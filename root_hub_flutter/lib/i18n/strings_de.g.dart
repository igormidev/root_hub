///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsDe extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsDe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.de,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <de>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsDe _root = this; // ignore: unused_field

	@override 
	TranslationsDe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsDe(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppDe app = _TranslationsAppDe._(_root);
	@override late final _TranslationsAuthDe auth = _TranslationsAuthDe._(_root);
	@override late final _TranslationsDashboardDe dashboard = _TranslationsDashboardDe._(_root);
	@override late final _TranslationsActivityDe activity = _TranslationsActivityDe._(_root);
	@override late final _TranslationsHomeDe home = _TranslationsHomeDe._(_root);
	@override late final _TranslationsMatchDe match = _TranslationsMatchDe._(_root);
	@override late final _TranslationsRegisterMatchDe register_match = _TranslationsRegisterMatchDe._(_root);
	@override late final _TranslationsShopDe shop = _TranslationsShopDe._(_root);
}

// Path: app
class _TranslationsAppDe extends TranslationsAppEn {
	_TranslationsAppDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get rootHub => 'Root Hub';
}

// Path: auth
class _TranslationsAuthDe extends TranslationsAuthEn {
	_TranslationsAuthDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsAuthAuthOnboardingScreenDe auth_onboarding_screen = _TranslationsAuthAuthOnboardingScreenDe._(_root);
	@override late final _TranslationsAuthAuthOnboardingProfileScreenDe auth_onboarding_profile_screen = _TranslationsAuthAuthOnboardingProfileScreenDe._(_root);
	@override late final _TranslationsAuthAuthLoadingScreenDe auth_loading_screen = _TranslationsAuthAuthLoadingScreenDe._(_root);
	@override late final _TranslationsAuthAuthLoginScreenDe auth_login_screen = _TranslationsAuthAuthLoginScreenDe._(_root);
	@override late final _TranslationsAuthAuthOnboardingContinueButtonWidgetDe auth_onboarding_continue_button_widget = _TranslationsAuthAuthOnboardingContinueButtonWidgetDe._(_root);
}

// Path: dashboard
class _TranslationsDashboardDe extends TranslationsDashboardEn {
	_TranslationsDashboardDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsDashboardUiScreensDashboardScreenDe ui_screens_dashboard_screen = _TranslationsDashboardUiScreensDashboardScreenDe._(_root);
	@override late final _TranslationsDashboardUiScreensDashboardFactionEditorScreenDe ui_screens_dashboard_faction_editor_screen = _TranslationsDashboardUiScreensDashboardFactionEditorScreenDe._(_root);
	@override late final _TranslationsDashboardUiDialogsEditLocationDialogDe ui_dialogs_edit_location_dialog = _TranslationsDashboardUiDialogsEditLocationDialogDe._(_root);
	@override late final _TranslationsDashboardUiDialogsEditDisplayNameDialogDe ui_dialogs_edit_display_name_dialog = _TranslationsDashboardUiDialogsEditDisplayNameDialogDe._(_root);
	@override late final _TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetDe ui_widgets_dashboard_profile_drawer_widget = _TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetDe._(_root);
}

// Path: activity
class _TranslationsActivityDe extends TranslationsActivityEn {
	_TranslationsActivityDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsActivityUiScreensActivityScreenDe ui_screens_activity_screen = _TranslationsActivityUiScreensActivityScreenDe._(_root);
	@override late final _TranslationsActivityUiWidgetsActivitySubscribedScheduleCardDe ui_widgets_activity_subscribed_schedule_card = _TranslationsActivityUiWidgetsActivitySubscribedScheduleCardDe._(_root);
	@override late final _TranslationsActivityUiWidgetsActivityChatCardDe ui_widgets_activity_chat_card = _TranslationsActivityUiWidgetsActivityChatCardDe._(_root);
}

// Path: home
class _TranslationsHomeDe extends TranslationsHomeEn {
	_TranslationsHomeDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeUiSectionsHomeStatsSectionDe ui_sections_home_stats_section = _TranslationsHomeUiSectionsHomeStatsSectionDe._(_root);
	@override late final _TranslationsHomeUiScreensHomeScreenDe ui_screens_home_screen = _TranslationsHomeUiScreensHomeScreenDe._(_root);
	@override late final _TranslationsHomeUiWidgetsHomeStatsPieChartWidgetDe ui_widgets_home_stats_pie_chart_widget = _TranslationsHomeUiWidgetsHomeStatsPieChartWidgetDe._(_root);
}

// Path: match
class _TranslationsMatchDe extends TranslationsMatchEn {
	_TranslationsMatchDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMatchUiSheetsMatchEditTableErrorWidgetDe ui_sheets_match_edit_table_error_widget = _TranslationsMatchUiSheetsMatchEditTableErrorWidgetDe._(_root);
	@override late final _TranslationsMatchUiSheetsMatchEditTableLoadingWidgetDe ui_sheets_match_edit_table_loading_widget = _TranslationsMatchUiSheetsMatchEditTableLoadingWidgetDe._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoSheetDe ui_sheets_match_table_info_sheet = _TranslationsMatchUiSheetsMatchTableInfoSheetDe._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoContentWidgetDe ui_sheets_match_table_info_content_widget = _TranslationsMatchUiSheetsMatchTableInfoContentWidgetDe._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoErrorWidgetDe ui_sheets_match_table_info_error_widget = _TranslationsMatchUiSheetsMatchTableInfoErrorWidgetDe._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetDe ui_sheets_match_table_info_participant_card_widget = _TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetDe._(_root);
	@override late final _TranslationsMatchUiSheetsMatchEditTableSheetDe ui_sheets_match_edit_table_sheet = _TranslationsMatchUiSheetsMatchEditTableSheetDe._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetDe ui_sheets_match_table_info_loading_widget = _TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetDe._(_root);
	@override late final _TranslationsMatchUiSheetsMatchEditTableFormWidgetDe ui_sheets_match_edit_table_form_widget = _TranslationsMatchUiSheetsMatchEditTableFormWidgetDe._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetDe ui_sheets_match_table_info_bottom_actions_widget = _TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetDe._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetDe ui_screens_match_create_table_location_loading_search_widget = _TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetDe._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableLocationScreenDe ui_screens_match_create_table_location_screen = _TranslationsMatchUiScreensMatchCreateTableLocationScreenDe._(_root);
	@override late final _TranslationsMatchUiScreensMatchJoinSheetErrorWidgetDe ui_screens_match_join_sheet_error_widget = _TranslationsMatchUiScreensMatchJoinSheetErrorWidgetDe._(_root);
	@override late final _TranslationsMatchUiScreensMatchScreenDe ui_screens_match_screen = _TranslationsMatchUiScreensMatchScreenDe._(_root);
	@override late final _TranslationsMatchUiScreensMatchLoadingErrorStateWidgetDe ui_screens_match_loading_error_state_widget = _TranslationsMatchUiScreensMatchLoadingErrorStateWidgetDe._(_root);
	@override late final _TranslationsMatchUiScreensMatchNearbyHeaderWidgetDe ui_screens_match_nearby_header_widget = _TranslationsMatchUiScreensMatchNearbyHeaderWidgetDe._(_root);
	@override late final _TranslationsMatchUiScreensMatchNoMatchesStateWidgetDe ui_screens_match_no_matches_state_widget = _TranslationsMatchUiScreensMatchNoMatchesStateWidgetDe._(_root);
	@override late final _TranslationsMatchUiScreensMatchTimeStatusChipWidgetDe ui_screens_match_time_status_chip_widget = _TranslationsMatchUiScreensMatchTimeStatusChipWidgetDe._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetDe ui_screens_match_create_table_location_no_search_results_widget = _TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetDe._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableScreenDe ui_screens_match_create_table_screen = _TranslationsMatchUiScreensMatchCreateTableScreenDe._(_root);
	@override late final _TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetDe ui_screens_match_chat_loading_error_state_widget = _TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetDe._(_root);
	@override late final _TranslationsMatchUiScreensMatchReportAvailableChipWidgetDe ui_screens_match_report_available_chip_widget = _TranslationsMatchUiScreensMatchReportAvailableChipWidgetDe._(_root);
	@override late final _TranslationsMatchUiScreensMatchInitialLoadingStateWidgetDe ui_screens_match_initial_loading_state_widget = _TranslationsMatchUiScreensMatchInitialLoadingStateWidgetDe._(_root);
	@override late final _TranslationsMatchUiScreensMatchParticipantCardWidgetDe ui_screens_match_participant_card_widget = _TranslationsMatchUiScreensMatchParticipantCardWidgetDe._(_root);
	@override late final _TranslationsMatchUiScreensMatchJoinSheetContentWidgetDe ui_screens_match_join_sheet_content_widget = _TranslationsMatchUiScreensMatchJoinSheetContentWidgetDe._(_root);
	@override late final _TranslationsMatchUiScreensMatchTableCardWidgetDe ui_screens_match_table_card_widget = _TranslationsMatchUiScreensMatchTableCardWidgetDe._(_root);
	@override late final _TranslationsMatchUiScreensMatchLocationHeaderImageWidgetDe ui_screens_match_location_header_image_widget = _TranslationsMatchUiScreensMatchLocationHeaderImageWidgetDe._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetDe ui_screens_match_create_table_location_no_recent_locations_widget = _TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetDe._(_root);
	@override late final _TranslationsMatchUiScreensMatchChatScreenDe ui_screens_match_chat_screen = _TranslationsMatchUiScreensMatchChatScreenDe._(_root);
	@override late final _TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogDe ui_dialogs_match_played_match_summary_dialog = _TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogDe._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetDe ui_screens_match_create_table_location_loading_recent_widget = _TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetDe._(_root);
}

// Path: register_match
class _TranslationsRegisterMatchDe extends TranslationsRegisterMatchEn {
	_TranslationsRegisterMatchDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionDe ui_sheets_register_match_wizard_winner_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionDe._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionDe ui_sheets_register_match_wizard_timing_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionDe._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionDe ui_sheets_register_match_wizard_participants_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionDe._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionDe ui_sheets_register_match_picker_error_section = _TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionDe._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardDe ui_sheets_register_match_picker_match_item_card = _TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardDe._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionDe ui_sheets_register_match_wizard_factions_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionDe._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetDe ui_sheets_register_match_search_registered_player_sheet = _TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetDe._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionDe ui_sheets_register_match_wizard_points_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionDe._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionDe ui_sheets_register_match_wizard_bottom_actions_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionDe._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionDe ui_sheets_register_match_picker_empty_section = _TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionDe._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionDe ui_sheets_register_match_wizard_loading_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionDe._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetDe ui_sheets_register_match_picker_sheet = _TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetDe._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetDe ui_sheets_register_match_add_anonymous_player_sheet = _TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetDe._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionDe ui_sheets_register_match_wizard_top_bar_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionDe._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionDe ui_sheets_register_match_wizard_error_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionDe._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetDe ui_sheets_register_match_wizard_sheet = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetDe._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionDe ui_sheets_register_match_wizard_review_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionDe._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileDe ui_sheets_register_match_wizard_review_photo_tile = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileDe._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionDe ui_sheets_register_match_wizard_proof_card_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionDe._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionDe ui_sheets_register_match_picker_header_section = _TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionDe._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionDe ui_sheets_register_match_wizard_social_proof_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionDe._(_root);
}

// Path: shop
class _TranslationsShopDe extends TranslationsShopEn {
	_TranslationsShopDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsShopUiScreensShopScreenDe ui_screens_shop_screen = _TranslationsShopUiScreensShopScreenDe._(_root);
}

// Path: auth.auth_onboarding_screen
class _TranslationsAuthAuthOnboardingScreenDe extends TranslationsAuthAuthOnboardingScreenEn {
	_TranslationsAuthAuthOnboardingScreenDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get pickYourFavoriteRootFactionBeforeEnteringTheHub => 'Wähle deine bevorzugte ROOT-Fraktion, bevor du den Hub betrittst.';
	@override String get chooseYourFaction => 'Wähle deine Fraktion';
	@override String get iAlreadyHaveAnAccount => 'Ich habe bereits ein Konto';
}

// Path: auth.auth_onboarding_profile_screen
class _TranslationsAuthAuthOnboardingProfileScreenDe extends TranslationsAuthAuthOnboardingProfileScreenEn {
	_TranslationsAuthAuthOnboardingProfileScreenDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get currentLocationUsesYourPhoneCoordinatesXAndYAndIsRequiredToShowNearbyMat => 'Dein aktueller Standort nutzt die Koordinaten deines Telefons (x und y) und ist nötig, um Partien in der Nähe zu sehen.';
	@override String get yourDisplayNameIsHowOtherPlayersWillSeeYouInRootHub => 'Dein Anzeigename ist so, wie dich andere Spieler im Root Hub sehen.';
	@override String get setYourHubIdentity => 'Legen Sie Ihre Hub-Identität fest';
	@override String get continueButton => 'Weitermachen';
	@override String get chooseHowYouAppearAndSetYourLocationToFindNearbyMatches => 'Lege fest, wie du angezeigt wirst, und setze deinen Standort, um Partien in der Nähe zu finden.';
	@override String get howYouWillBeCalled => 'So werden Sie angerufen';
	@override String get thisIsHowOtherPlayersWillSeeYourProfileInRootHub => 'So sehen andere Spieler dein Profil im Root Hub.';
	@override String get enterYourDisplayName => 'Geben Sie Ihren Anzeigenamen ein';
	@override String get currentLocation => 'Aktueller Standort';
	@override String get whereDoYouWantToPlay => 'Wo möchtest du spielen?';
	@override String get locationIsRequiredToShowNearbyTablesChooseDeviceOrSearch => 'Ein Standort ist nötig, um Partien in der Nähe zu sehen. Wähle den Gerätestandort oder suche nach einem Ort.';
	@override String get chooseTheAreaWhereYouWantToFindNearbyPlayers => 'Wähle den Bereich, in dem du Spieler und Tische in der Nähe finden möchtest.';
	@override String get useMyCurrentDeviceLocation => 'Verwenden Sie meinen aktuellen Gerätestandort';
	@override String get capturingCoordinates => 'Koordinaten erfassen...';
	@override String get instantlyUseYourPhonesGpsCoordinates => 'Nutzen Sie sofort die GPS-Koordinaten Ihres Telefons.';
	@override String get searchForATableLocation => 'Suchen Sie nach einem Ort';
	@override String get openTheSearchAndSelectAnyPlaceYouPrefer => 'Öffnen Sie die Suche und wählen Sie einen beliebigen Ort aus.';
	@override String get yourPlayArea => 'Dein Spielbereich';
	@override String get findingCityName => 'Stadtname wird gesucht...';
	@override String get selectedArea => 'Ausgewählter Bereich';
	@override String weWillShowMatchesNear({required Object city}) => 'Wir zeigen Spiele in der Nähe von ${city}.';
	@override String get weWillShowMatchesNearTheSelectedArea => 'Wir zeigen Spiele in der Nähe deines ausgewählten Bereichs.';
	@override String get changeLocation => 'Standort ändern';
	@override String get selectedCoordinates => 'Ausgewählte Koordinaten';
	@override String get searchAreaRadius => 'Suchbereichsradius';
	@override String get howFarShouldWeSearchForNearbyPlayersAroundYou => 'Wie weit sollten wir nach Spielern in Ihrer Nähe suchen?';
	@override String get value25KmIsTheRecommendedStartingPoint => '25 km sind der empfohlene Ausgangspunkt.';
	@override String get disableVpnOrProxyBeforeCapturingLocationWrongCoordinatesMayHideNearby => 'Deaktiviere VPN oder Proxy vor der Standorterfassung. Falsche Koordinaten können Partien in der Nähe ausblenden.';
	@override String get locationSelectedFromSearch => 'Aus der Suche ausgewählter Standort.';
	@override String get enableLocationServicesOnYourPhoneAndTryAgain => 'Aktivieren Sie die Ortungsdienste auf Ihrem Telefon und versuchen Sie es erneut.';
	@override String get locationPermissionDeniedLocationIsRequiredToContinue => 'Standortberechtigung verweigert. Zum Fortfahren ist der Standort erforderlich.';
	@override String get locationPermissionIsDeniedForeverEnableItInSystemSettingsToContinue => 'Die Standorterlaubnis wird für immer verweigert. Aktivieren Sie es in den Systemeinstellungen, um fortzufahren.';
	@override String get locationCapturedSuccessfully => 'Standort erfolgreich erfasst.';
	@override String get unableToCaptureLocationRightNowLocationIsRequiredToContinue => 'Der Standort kann derzeit nicht erfasst werden. Zum Fortfahren ist der Standort erforderlich.';
	@override String get unableToResolveCityNameRightNow => 'Der Stadtname kann derzeit nicht aufgelöst werden.';
	@override String get searchForLocation => 'Nach Standort suchen';
	@override String get searchAndPickOnePlaceWeWillUseItsCoordinatesForNearbyMatches => 'Suchen Sie einen Ort und wählen Sie ihn aus. Wir werden seine Koordinaten für Spiele in der Nähe verwenden.';
	@override String get useSelectedLocation => 'Ausgewählten Standort verwenden';
	@override String get selectALocationFromTheListBeforeContinuing => 'Wählen Sie einen Standort aus der Liste aus, bevor Sie fortfahren.';
	@override String get unableToUseTheSelectedLocationCoordinatesRightNow => 'Die ausgewählten Standortkoordinaten können derzeit nicht verwendet werden.';
	@override String get kilometersUnit => 'km';
}

// Path: auth.auth_loading_screen
class _TranslationsAuthAuthLoadingScreenDe extends TranslationsAuthAuthLoadingScreenEn {
	_TranslationsAuthAuthLoadingScreenDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get rootHub => 'ROOT HUB';
}

// Path: auth.auth_login_screen
class _TranslationsAuthAuthLoginScreenDe extends TranslationsAuthAuthLoginScreenEn {
	_TranslationsAuthAuthLoginScreenDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get signInToBrowseSchedulesAndJoinTables => 'Melde dich an, um Spieltermine zu sehen und Partien beizutreten.';
	@override String get findYourNextRootMatch => 'Finde dein nächstes\nROOT-Spiel';
	@override String get signInWithEmailTitle => 'Mit E-Mail anmelden';
	@override String get signUpWithEmailTitle => 'Konto mit E-Mail erstellen';
	@override String get verifyAccountTitle => 'Konto verifizieren';
	@override String get verifyAccountMessage => 'Eine Verifizierungs-E-Mail wurde gesendet. Prüfe dein Postfach und gib den Code unten ein.';
	@override String get setAccountPasswordTitle => 'Kontopasswort festlegen';
	@override String get resetPasswordTitle => 'Passwort zurücksetzen';
	@override String get requestResetDescription => 'Gib die E-Mail deines Kontos ein, um einen Zurücksetzungscode zu erhalten.';
	@override String get verifyResetCodeTitle => 'Zurücksetzungscode verifizieren';
	@override String get verifyResetMessage => 'Gib den an deine E-Mail gesendeten Zurücksetzungscode ein.';
	@override String get setNewPasswordTitle => 'Neues Passwort festlegen';
	@override String get emailLabel => 'E-Mail';
	@override String get passwordLabel => 'Passwort';
	@override String get newPasswordLabel => 'Neues Passwort';
	@override String get forgotPasswordButton => 'Passwort vergessen?';
	@override String get signInButton => 'Anmelden';
	@override String get signUpButton => 'Konto erstellen';
	@override String get continueButton => 'Weiter';
	@override String get verifyButton => 'Verifizieren';
	@override String get requestResetButton => 'Zurücksetzung anfordern';
	@override String get resetPasswordButton => 'Passwort zurücksetzen';
	@override String get dontHaveAnAccount => 'Du hast noch kein Konto?';
	@override String get alreadyHaveAnAccount => 'Du hast bereits ein Konto?';
	@override String get signUpLink => 'Konto erstellen';
	@override String get signInLink => 'Anmelden';
	@override String get backToSignIn => 'Zurück zur Anmeldung';
	@override String get resendCode => 'Nicht erhalten? Neuen Code senden';
	@override String resendCodeIn({required Object time}) => 'Neuen Code senden (${time})';
	@override String get passwordRuleMinLength => 'Mindestens 8 Zeichen';
	@override String get passwordRuleUppercase => 'Enthält mindestens einen Großbuchstaben';
	@override String get passwordRuleLowercase => 'Enthält mindestens einen Kleinbuchstaben';
	@override String get passwordRuleNumber => 'Enthält mindestens eine Zahl';
	@override late final _TranslationsAuthAuthLoginScreenErrorsDe errors = _TranslationsAuthAuthLoginScreenErrorsDe._(_root);
}

// Path: auth.auth_onboarding_continue_button_widget
class _TranslationsAuthAuthOnboardingContinueButtonWidgetDe extends TranslationsAuthAuthOnboardingContinueButtonWidgetEn {
	_TranslationsAuthAuthOnboardingContinueButtonWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get continueButton => 'Weitermachen';
}

// Path: dashboard.ui_screens_dashboard_screen
class _TranslationsDashboardUiScreensDashboardScreenDe extends TranslationsDashboardUiScreensDashboardScreenEn {
	_TranslationsDashboardUiScreensDashboardScreenDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get shop => 'Shop';
	@override String get match => 'Partien';
	@override String get activity => 'Aktivität';
	@override String get home => 'Start';
	@override String get rootHub => 'ROOT HUB';
	@override String get chooseFromGallery => 'Wählen Sie aus der Galerie';
	@override String get takePhoto => 'Machen Sie ein Foto';
	@override String get cancel => 'Stornieren';
	@override String get chooseFromLibrary => 'Wählen Sie aus der Bibliothek';
	@override String get takePhoto2 => 'Machen Sie ein Foto';
	@override String get changeProfilePhoto => 'Profilfoto ändern';
	@override String get allowCameraAndPhotoPermissionsInSystemSettingsAndTryAgain => 'Erlauben Sie Kamera- und Fotoberechtigungen in den Systemeinstellungen und versuchen Sie es erneut.';
	@override String get unableToAccessCameraOrGallery => 'Auf Kamera oder Galerie kann nicht zugegriffen werden';
	@override String get rootPlayer => 'Root-Spieler';
	@override String welcomeBack({required Object displayName}) => 'Willkommen zurück, ${displayName}';
	@override String get communityDashboardTitle => 'Community-Dashboard';
	@override String get matchFinderTitle => 'Partien finden';
	@override String get activityCenterTitle => 'Aktivitätszentrum';
	@override String get communityDashboardSubtitle => 'Sieh dir an, was in der ROOT-Community passiert.';
	@override String get matchFinderSubtitle => 'Finde Partien in deiner Nähe oder erstelle eine neue mit deiner Gruppe.';
	@override String get activityCenterSubtitle => 'Verfolge deine aktiven Tische und Chat-Updates an einem Ort.';
}

// Path: dashboard.ui_screens_dashboard_faction_editor_screen
class _TranslationsDashboardUiScreensDashboardFactionEditorScreenDe extends TranslationsDashboardUiScreensDashboardFactionEditorScreenEn {
	_TranslationsDashboardUiScreensDashboardFactionEditorScreenDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get chooseTheFactionShownInYourProfileAndUsedAsYourDefaultPreference => 'Wählen Sie die Fraktion aus, die in Ihrem Profil angezeigt und als Standardeinstellung verwendet wird.';
	@override String get changeFavoriteFaction => 'Lieblingsfraktion ändern';
}

// Path: dashboard.ui_dialogs_edit_location_dialog
class _TranslationsDashboardUiDialogsEditLocationDialogDe extends TranslationsDashboardUiDialogsEditLocationDialogEn {
	_TranslationsDashboardUiDialogsEditLocationDialogDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get save => 'Speichern';
	@override String get cancel => 'Stornieren';
	@override String get updateYourCoordinatesAndTargetSearchRatioForMatchDiscovery => 'Aktualisiere deine Koordinaten und den Suchradius, um Partien zu finden.';
	@override String get editLocation => 'Standort bearbeiten';
}

// Path: dashboard.ui_dialogs_edit_display_name_dialog
class _TranslationsDashboardUiDialogsEditDisplayNameDialogDe extends TranslationsDashboardUiDialogsEditDisplayNameDialogEn {
	_TranslationsDashboardUiDialogsEditDisplayNameDialogDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get save => 'Speichern';
	@override String get cancel => 'Stornieren';
	@override String get thisIsHowPlayersWillSeeYouAcrossRootHub => 'So sehen dich die Spieler im Root Hub.';
	@override String get editDisplayName => 'Anzeigenamen bearbeiten';
}

// Path: dashboard.ui_widgets_dashboard_profile_drawer_widget
class _TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetDe extends TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetEn {
	_TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get logOut => 'Abmelden';
	@override String get changeFaction => 'Fraktion wechseln';
	@override String get saving => 'Sparen...';
	@override String get favoriteFaction => 'Lieblingsfraktion';
	@override String get location => 'Standort';
	@override String get displayName => 'Anzeigename';
	@override String get edit => 'Bearbeiten';
	@override String get change => 'Ändern';
	@override String get noLocationConfigured => 'Kein Standort konfiguriert';
	@override String get xLabel => 'X';
	@override String get yLabel => 'j';
	@override String get ratioLabel => 'Radius';
	@override String get language => 'Sprache';
	@override String get useDeviceLanguage => 'Verwenden Sie die Gerätesprache';
	@override String get english => 'Englisch';
	@override String get portugueseBrazil => 'Portugiesisch (Brasilien)';
	@override String get spanish => 'Spanisch';
	@override String get french => 'Französisch';
	@override String get german => 'Deutsch';
}

// Path: activity.ui_screens_activity_screen
class _TranslationsActivityUiScreensActivityScreenDe extends TranslationsActivityUiScreensActivityScreenEn {
	_TranslationsActivityUiScreensActivityScreenDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get myScheduledTablesTitle => 'Meine Geplanten Tische';
	@override String get tablesYouSubscribedToThatAreStillWithinTheActiveWindow => 'Tische, denen du beigetreten bist und die noch nicht gestartet sind oder vor weniger als 6 Stunden gestartet haben.';
	@override String get noActiveSchedules => 'Keine aktiven Anmeldungen';
	@override String get whenYouJoinATableItWillAppearHereAsASwipeableCard => 'Wenn du einem Tisch beitrittst, erscheint er hier als wischbare Karte.';
	@override String get activeChatsTitle => 'Aktive Chats';
	@override String get chatsForUpcomingOrRecentlyStartedTablesOrderedByUnreadMessages => 'Chats für kommende oder kürzlich gestartete Tische, zuerst nach ungelesenen Nachrichten sortiert.';
	@override String get noActiveChats => 'Keine aktiven Chats';
	@override String get openAnyTableChatAndItWillBeTrackedHereEvenWithoutASubscription => 'Öffne einen Tisch-Chat und er wird hier verfolgt, auch ohne Anmeldung.';
	@override String get completedMatchesTitle => 'Chats Abgeschlossener Partien';
	@override String get latestEightCompletedOrArchivedMatchChatsYouParticipatedIn => 'Die letzten 8 Chats von bereits gespielten Partien.';
	@override String get noCompletedChats => 'Noch keine abgeschlossenen Chats';
	@override String get onceMatchesFinishTheirChatsWillStayAvailableHere => 'Sobald Partien beendet sind, bleiben ihre Chats in diesem Bereich verfügbar.';
}

// Path: activity.ui_widgets_activity_subscribed_schedule_card
class _TranslationsActivityUiWidgetsActivitySubscribedScheduleCardDe extends TranslationsActivityUiWidgetsActivitySubscribedScheduleCardEn {
	_TranslationsActivityUiWidgetsActivitySubscribedScheduleCardDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get unknownLocation => 'Unbekannter Ort';
	@override String get selected => 'Ausgewählt';
	@override String get alreadyStarted => 'Bereits gestartet';
	@override String get notStartedYet => 'Noch nicht gestartet';
	@override String playersLabel({required Object minPlayers, required Object maxPlayers}) => '${minPlayers}-${maxPlayers} Spieler';
	@override String get openChatHint => 'Karte antippen, um den Chat zu öffnen';
}

// Path: activity.ui_widgets_activity_chat_card
class _TranslationsActivityUiWidgetsActivityChatCardDe extends TranslationsActivityUiWidgetsActivityChatCardEn {
	_TranslationsActivityUiWidgetsActivityChatCardDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get ended => 'Beendet';
	@override String get started => 'Gestartet';
	@override String get upcoming => 'Bevorstehend';
	@override String senderMessage({required Object sender, required Object message}) => '${sender}: ${message}';
	@override String get newMessage => 'Neue Nachricht';
	@override String get photoShared => 'Foto geteilt';
	@override String get systemUpdate => 'System-Update';
	@override String get noMessagesYet => 'Noch keine Nachrichten';
}

// Path: home.ui_sections_home_stats_section
class _TranslationsHomeUiSectionsHomeStatsSectionDe extends TranslationsHomeUiSectionsHomeStatsSectionEn {
	_TranslationsHomeUiSectionsHomeStatsSectionDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get allFactionsTotal => 'Alle Fraktionen insgesamt';
	@override String get allFactionsAvg => 'Alle Fraktionen im Durchschnitt';
	@override String get allFactionsTotal2 => 'Alle Fraktionen insgesamt';
	@override String get allFactionsAvg2 => 'Alle Fraktionen im Durchschnitt';
	@override String get absoluteNumberOfWinsForEachFaction => 'Absolute Anzahl an Siegen für jede Fraktion.';
	@override String get totalWins => 'Gesamtsiege';
	@override String get averageScorePerFactionWhenPointsWereTracked => 'Durchschnittliche Punktzahl pro Fraktion, wenn die Punkte verfolgt wurden.';
	@override String get averagePoints => 'Durchschnittliche Punkte';
	@override String get howOftenEachFactionAppearsInCompletedGames => 'Wie oft erscheint jede Fraktion in abgeschlossenen Spielen?';
	@override String get playedGames => 'Gespielte Spiele';
	@override String get whoIsWinningTheMostOftenRightNow => 'Wer gewinnt derzeit am häufigsten?';
	@override String get factionWinRate => 'Fraktionssiegrate';
}

// Path: home.ui_screens_home_screen
class _TranslationsHomeUiScreensHomeScreenDe extends TranslationsHomeUiScreensHomeScreenEn {
	_TranslationsHomeUiScreensHomeScreenDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get yourPersonalFactionPerformanceAndMatchProfile => 'Deine persönlichen Fraktionsstatistiken basieren nur auf Fraktionen, die du gespielt hast.';
	@override String get myStats => 'Meine Statistiken';
	@override String get factionPerformanceFromAllPlayedMatchesInRootHub => 'Fraktionsleistung aus allen in Root Hub gespielten Partien.';
	@override String get communityStats => 'Community-Statistiken';
}

// Path: home.ui_widgets_home_stats_pie_chart_widget
class _TranslationsHomeUiWidgetsHomeStatsPieChartWidgetDe extends TranslationsHomeUiWidgetsHomeStatsPieChartWidgetEn {
	_TranslationsHomeUiWidgetsHomeStatsPieChartWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get noValuesForThisMetricYet => 'Für diese Metrik liegen noch keine Werte vor.';
}

// Path: match.ui_sheets_match_edit_table_error_widget
class _TranslationsMatchUiSheetsMatchEditTableErrorWidgetDe extends TranslationsMatchUiSheetsMatchEditTableErrorWidgetEn {
	_TranslationsMatchUiSheetsMatchEditTableErrorWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get close => 'Schließen';
}

// Path: match.ui_sheets_match_edit_table_loading_widget
class _TranslationsMatchUiSheetsMatchEditTableLoadingWidgetDe extends TranslationsMatchUiSheetsMatchEditTableLoadingWidgetEn {
	_TranslationsMatchUiSheetsMatchEditTableLoadingWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get loadingTableDetails => 'Partiedetails werden geladen...';
}

// Path: match.ui_sheets_match_table_info_sheet
class _TranslationsMatchUiSheetsMatchTableInfoSheetDe extends TranslationsMatchUiSheetsMatchTableInfoSheetEn {
	_TranslationsMatchUiSheetsMatchTableInfoSheetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get remove => 'Entfernen';
	@override String get cancel => 'Stornieren';
	@override String get rejoinIfSeatsAreStillAvailable => 'Melden Sie sich erneut an, wenn noch Plätze frei sind.';
	@override String get cancel2 => 'Stornieren';
	@override String get selectAPlayerToRemoveFromTheTable => 'Wählen Sie einen Spieler aus, den Sie vom Partie entfernen möchten.';
	@override String get removeAPlayer => 'Entferne einen Spieler';
	@override String get leave => 'Verlassen';
	@override String get cancel3 => 'Stornieren';
	@override String get playersListYouCanRejoinLaterIfSeatsAreStillAvailable => 'Spielerliste. Sie können später wieder einsteigen, wenn noch Plätze frei sind.';
	@override String get youWillBeUnsubscribedFromThisMatchAndRemovedFromThe => 'Du wirst von diesem Match abgemeldet und aus dem entfernt';
	@override String get leaveThisTable => 'Diesen Partie verlassen?';
	@override String get unableToLoadTableDetails => 'Partiedetails können nicht geladen werden.';
	@override String get tableNotFound => 'Partie nicht gefunden';
}

// Path: match.ui_sheets_match_table_info_content_widget
class _TranslationsMatchUiSheetsMatchTableInfoContentWidgetDe extends TranslationsMatchUiSheetsMatchTableInfoContentWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoContentWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get noPlayersHaveJoinedThisTableYet => 'Es sind noch keine Spieler diesem Partie beigetreten.';
	@override String get theseAreTheCurrentPlayersThatWillParticipate => 'Dies sind die aktuellen Spieler, die teilnehmen werden.';
	@override String get noPlayersSubscribedYet => 'Noch kein Spieler angemeldet.';
	@override String get playersInThisMatch => 'Spieler in diesem Spiel';
	@override String get unknownHost => 'Unbekannter Host';
	@override String get tableDetails => 'Partiedetails';
}

// Path: match.ui_sheets_match_table_info_error_widget
class _TranslationsMatchUiSheetsMatchTableInfoErrorWidgetDe extends TranslationsMatchUiSheetsMatchTableInfoErrorWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoErrorWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get retry => 'Wiederholen';
	@override String get close => 'Schließen';
}

// Path: match.ui_sheets_match_table_info_participant_card_widget
class _TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetDe extends TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get favoriteFaction => 'Lieblingsfraktion';
}

// Path: match.ui_sheets_match_edit_table_sheet
class _TranslationsMatchUiSheetsMatchEditTableSheetDe extends TranslationsMatchUiSheetsMatchEditTableSheetEn {
	_TranslationsMatchUiSheetsMatchEditTableSheetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get theScheduledTimeCannotBeMoreThan => 'Die geplante Zeit darf nicht länger als sein';
	@override String get dateIsTooFar => 'Das Datum ist zu weit entfernt';
	@override String get theScheduledTimeMustBeAtLeast => 'Die geplante Zeit muss mindestens sein';
	@override String get timeIsTooSoon => 'Die Zeit ist zu früh';
	@override String get youCannotSetTheMaximumBelowThatNumber => 'Sie können den Höchstwert nicht unter diesem Wert festlegen.';
	@override String get tooManyPlayersSubscribed => 'Zu viele Spieler haben sich angemeldet';
	@override String get withMinimumNotGreaterThanMaximum => 'wobei das Minimum nicht größer als das Maximum ist.';
	@override String get playersRangeMustBeBetween2And6 => 'Die Spielerreichweite muss zwischen 2 und 6 liegen,';
	@override String get invalidPlayersRange => 'Ungültiger Spielerbereich';
	@override String get pleaseAddATitleForYourTable => 'Bitte fügen Sie einen Titel für Ihre Partie hinzu.';
	@override String get titleRequired => 'Titel erforderlich';
	@override String get unableToLoadTableDetails => 'Partiedetails können nicht geladen werden.';
	@override String get tableNotFound => 'Partie nicht gefunden';
}

// Path: match.ui_sheets_match_table_info_loading_widget
class _TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetDe extends TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get loadingTableDetails => 'Partiedetails werden geladen...';
}

// Path: match.ui_sheets_match_edit_table_form_widget
class _TranslationsMatchUiSheetsMatchEditTableFormWidgetDe extends TranslationsMatchUiSheetsMatchEditTableFormWidgetEn {
	_TranslationsMatchUiSheetsMatchEditTableFormWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get saveChanges => 'Änderungen speichern';
	@override String get saving => 'Sparen...';
	@override String get cancel => 'Stornieren';
	@override String get mustBeAtLeast10MinutesFromNowUpTo => 'Muss in mindestens 10 Minuten liegen';
	@override String get schedule => 'Zeitplan';
	@override String get maximum => 'Maximal';
	@override String get minimum => 'Minimum';
	@override String get setBetween2And6Players => 'Stellen Sie zwischen 2 und 6 Spielern ein.';
	@override String get playersRange => 'Reichweite der Spieler';
	@override String get exampleWeHaveMarauderExpansion => 'Beispiel: Wir haben die Marauder-Erweiterung.';
	@override String get extraDetailsLikeExpansionsParkingTipsEtc => 'Zusätzliche Details wie Erweiterungen, Parktipps usw.';
	@override String get descriptionOptional => 'Beschreibung (optional)';
	@override String get exampleSaturdayRootAtLanternCaf => 'Beispiel: ROOT am Samstag im Lantern Café';
	@override String get aShortNameSoPlayersCanFindYourTable => 'Ein kurzer Name, damit Spieler Ihren Partie finden können.';
	@override String get tableTitle => 'Partietitel';
	@override String get newPlayersCanStillJoinThisTable => 'Neue Spieler können sich diesem Partie noch anschließen.';
	@override String get newPlayersCannotJoinThisTable => 'Neue Spieler können diesem Partie nicht beitreten.';
	@override String get closeSubscriptions => 'Anmeldungen schließen';
	@override String get editDetails => 'Details bearbeiten';
	@override String get editTable => 'Partie bearbeiten';
}

// Path: match.ui_sheets_match_table_info_bottom_actions_widget
class _TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetDe extends TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get removePlayer => 'Spieler entfernen';
	@override String get removing => 'Entfernen...';
	@override String get leaveTable => 'Verlassen Sie den Partie';
	@override String get leaving => 'Verlassen...';
	@override String get close => 'Schließen';
}

// Path: match.ui_screens_match_create_table_location_loading_search_widget
class _TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetDe extends TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get searchingLocations => 'Standorte werden gesucht...';
}

// Path: match.ui_screens_match_create_table_location_screen
class _TranslationsMatchUiScreensMatchCreateTableLocationScreenDe extends TranslationsMatchUiScreensMatchCreateTableLocationScreenEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationScreenDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get previouslySelectedLocations => 'Zuvor ausgewählte Standorte';
	@override String get searchResults => 'Suchergebnisse';
	@override String get tapALocationToSelectItPreviouslySelectedLocationsAreSavedHereForFasterHo => 'Tippen Sie auf einen Ort, um ihn auszuwählen. Zuvor ausgewählte Standorte werden hier für ein schnelleres Hosting gespeichert.';
	@override String get searchLocationGooglePlaces => 'Standort suchen (Google Places)';
	@override String get chooseTableLocation => 'Wählen Sie Partie-Standort';
	@override String get chooseOneLocationFromTheListBeforeCreatingTheTable => 'Wählen Sie einen Standort aus der Liste aus, bevor Sie die Partie erstellen.';
	@override String get locationRequired => 'Standort erforderlich';
	@override String get continueButton => 'Weitermachen';
}

// Path: match.ui_screens_match_join_sheet_error_widget
class _TranslationsMatchUiScreensMatchJoinSheetErrorWidgetDe extends TranslationsMatchUiScreensMatchJoinSheetErrorWidgetEn {
	_TranslationsMatchUiScreensMatchJoinSheetErrorWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get retry => 'Wiederholen';
	@override String get close => 'Schließen';
}

// Path: match.ui_screens_match_screen
class _TranslationsMatchUiScreensMatchScreenDe extends TranslationsMatchUiScreensMatchScreenEn {
	_TranslationsMatchUiScreensMatchScreenDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get unableToOpenTheDialerRightNow => 'Der Dialer kann derzeit nicht geöffnet werden.';
	@override String get invalidPhoneNumberFormat => 'Ungültiges Telefonnummernformat.';
	@override String get unableToOpenTheLinkRightNow => 'Der Link kann derzeit nicht geöffnet werden.';
	@override String get invalidUrlFormat => 'Ungültiges URL-Format.';
	@override String get close => 'Schließen';
	@override String get manualLocationNotes => 'Manuelle Standortnotizen';
	@override String get phone => 'Telefon';
	@override String get phone2 => 'Telefon';
	@override String get website => 'Webseite';
	@override String get website2 => 'Webseite';
	@override String get mapLink => 'Kartenlink';
	@override String get mapLink2 => 'Kartenlink';
	@override String get public => 'Öffentlich';
	@override String get private => 'Privat';
	@override String get matchesPlayedHere => 'Spiele, die hier gespielt werden';
	@override String get matchPlayedHere => 'Spiel hier gespielt';
	@override String get hostTable => 'Partie erstellen';
	@override String get reportResult => 'Ergebnis melden';
}

// Path: match.ui_screens_match_loading_error_state_widget
class _TranslationsMatchUiScreensMatchLoadingErrorStateWidgetDe extends TranslationsMatchUiScreensMatchLoadingErrorStateWidgetEn {
	_TranslationsMatchUiScreensMatchLoadingErrorStateWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get tryAgain => 'Versuchen Sie es erneut';
}

// Path: match.ui_screens_match_nearby_header_widget
class _TranslationsMatchUiScreensMatchNearbyHeaderWidgetDe extends TranslationsMatchUiScreensMatchNearbyHeaderWidgetEn {
	_TranslationsMatchUiScreensMatchNearbyHeaderWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get onlyTablesThatDidNotStartMoreThan2HoursAgoAreListed => 'Es werden nur Partien aufgelistet, die nicht vor mehr als 2 Stunden gestartet wurden.';
	@override String get nearbyMatchTables => 'Partien in der Nähe';
	@override String get matchFinder => 'Partien finden';
	@override String get setProfileLocation => 'Profilstandort festlegen';
	@override String searchAreaKm({required Object ratioKm}) => '${ratioKm} km Radius';
}

// Path: match.ui_screens_match_no_matches_state_widget
class _TranslationsMatchUiScreensMatchNoMatchesStateWidgetDe extends TranslationsMatchUiScreensMatchNoMatchesStateWidgetEn {
	_TranslationsMatchUiScreensMatchNoMatchesStateWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get hostTheFirstTable => 'Erstelle die erste Partie';
	@override String get beTheFirstToStartOneHostANewTableSoNearbyPlayersCanSubscribe => 'Sei der Erste, der startet. Erstelle eine neue Partie, damit Spieler in der Nähe beitreten können.';
	@override String get noTablesInYourAreaYet => 'Noch keine Partien in Ihrer Nähe';
}

// Path: match.ui_screens_match_time_status_chip_widget
class _TranslationsMatchUiScreensMatchTimeStatusChipWidgetDe extends TranslationsMatchUiScreensMatchTimeStatusChipWidgetEn {
	_TranslationsMatchUiScreensMatchTimeStatusChipWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get remainingTimeUntilTheMatchStarts => 'Verbleibende Zeit bis zum Spielbeginn.';
	@override String get thisMatchAlreadyStartedRecentlyStartedTablesStayVisibleForAShortPeriod => 'Dieses Spiel hat bereits begonnen. Kürzlich gestartete Partien bleiben für kurze Zeit sichtbar.';
}

// Path: match.ui_screens_match_create_table_location_no_search_results_widget
class _TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetDe extends TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get noLocationsFoundForThisQueryTryAnotherPlaceNameOrArea => 'Für diese Abfrage wurden keine Standorte gefunden. Versuchen Sie es mit einem anderen Ortsnamen oder Gebiet.';
}

// Path: match.ui_screens_match_create_table_screen
class _TranslationsMatchUiScreensMatchCreateTableScreenDe extends TranslationsMatchUiScreensMatchCreateTableScreenEn {
	_TranslationsMatchUiScreensMatchCreateTableScreenDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get noIAmOnlyHostingThisTable => 'Nein, ich moderiere nur diesen Partie';
	@override String get yesIWillPlayThisMatch => 'Ja, ich werde dieses Match spielen';
	@override String get ifYouAreAVenueBoardGameClubOrOrganizerBringingPlayersTogetherButNotJoini => 'Wenn Sie ein Veranstaltungsort, ein Brettspielclub oder ein Veranstalter sind, der Spieler zusammenbringt, aber nicht am Spiel teilnimmt, lassen Sie diese Option deaktiviert.';
	@override String get willYouTheHostPlay => 'Werden Sie als Gastgeber mitspielen?';
	@override String get pickTheDayAndStartHourChooseATimeYouCanReliablyShowUp => 'Wählen Sie den Tag und die Startstunde. Wählen Sie eine Zeit, zu der Sie zuverlässig erscheinen können.';
	@override String get schedule => 'Zeitplan';
	@override String get maximum => 'Maximal';
	@override String get minimum => 'Minimum';
	@override String get defaultIs34YouCanSetBetween2And6Players => 'Der Standardwert ist 3-4. Sie können zwischen 2 und 6 Spieler einstellen.';
	@override String get playersRange => 'Reichweite der Spieler';
	@override String get exampleWeHaveMarauderExpansionAndSpareSleeves => 'Beispiel: Wir haben Marauder-Erweiterungs- und Ersatzhülsen.';
	@override String get addExtraDetailsLikeExpansionsAvailableParkingTipsOrReferencePoints => 'Fügen Sie zusätzliche Details wie verfügbare Erweiterungen, Parktipps oder Referenzpunkte hinzu.';
	@override String get descriptionOptional => 'Beschreibung (optional)';
	@override String get exampleSaturdayRootAtLanternCaf => 'Beispiel: ROOT am Samstag im Lantern Café';
	@override String get thisCanBeAnythingThatHelpsIdentifyTheTableLikeAPlaceNameOrEventStyle => 'Dies kann alles sein, was zur Identifizierung der Partie beiträgt, etwa ein Ortsname oder ein Veranstaltungsstil.';
	@override String get tableTitle => 'Partietitel';
	@override String get setTableDetailsFirstOnTheNextScreenYouWillChooseTheLocation => 'Legen Sie zuerst die Partiedetails fest. Auf dem nächsten Bildschirm wählen Sie den Standort aus.';
	@override String get hostANewTable => 'Neue Partie erstellen';
	@override String get selectTheStartHourForThisTableBeforeContinuing => 'Wählen Sie die Startstunde für diesen Partie aus, bevor Sie fortfahren.';
	@override String get startHourRequired => 'Startstunde erforderlich';
	@override String get youCannotSelectADayInThePast => 'Sie können keinen Tag in der Vergangenheit auswählen.';
	@override String get invalidDate => 'Ungültiges Datum';
	@override String get selectTheDayForThisTableBeforeContinuing => 'Wählen Sie den Tag für diese Partie aus, bevor Sie fortfahren.';
	@override String get dayRequired => 'Tag erforderlich';
	@override String get addATitleSoPlayersCanQuicklyIdentifyYourTableExampleDowntownCafNight => 'Fügen Sie einen Titel hinzu, damit die Spieler Ihren Partie schnell identifizieren können. Beispiel: „Downtown Café Night“.';
	@override String get titleRequired => 'Titel erforderlich';
	@override String get youCannotSelectADayInThePast2 => 'Sie können keinen Tag in der Vergangenheit auswählen.';
	@override String get invalidDate2 => 'Ungültiges Datum';
	@override String get continueButton => 'Weitermachen';
}

// Path: match.ui_screens_match_chat_loading_error_state_widget
class _TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetDe extends TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetEn {
	_TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get tryAgain => 'Versuchen Sie es erneut';
}

// Path: match.ui_screens_match_report_available_chip_widget
class _TranslationsMatchUiScreensMatchReportAvailableChipWidgetDe extends TranslationsMatchUiScreensMatchReportAvailableChipWidgetEn {
	_TranslationsMatchUiScreensMatchReportAvailableChipWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get reportAvailable => 'Bericht verfügbar';
	@override String get youCanReportThisMatchResultNow => 'Sie können dieses Spielergebnis jetzt melden.';
}

// Path: match.ui_screens_match_initial_loading_state_widget
class _TranslationsMatchUiScreensMatchInitialLoadingStateWidgetDe extends TranslationsMatchUiScreensMatchInitialLoadingStateWidgetEn {
	_TranslationsMatchUiScreensMatchInitialLoadingStateWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get loadingNearbyTables => 'Partien in der Nähe werden geladen...';
}

// Path: match.ui_screens_match_participant_card_widget
class _TranslationsMatchUiScreensMatchParticipantCardWidgetDe extends TranslationsMatchUiScreensMatchParticipantCardWidgetEn {
	_TranslationsMatchUiScreensMatchParticipantCardWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get favoriteFaction => 'Lieblingsfraktion';
}

// Path: match.ui_screens_match_join_sheet_content_widget
class _TranslationsMatchUiScreensMatchJoinSheetContentWidgetDe extends TranslationsMatchUiScreensMatchJoinSheetContentWidgetEn {
	_TranslationsMatchUiScreensMatchJoinSheetContentWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get confirmJoin => 'Bestätigen Sie den Beitritt';
	@override String get subscriptionsClosed => 'Abonnements geschlossen';
	@override String get alreadySubscribed => 'Bereits abonniert';
	@override String get cancel => 'Stornieren';
	@override String get youCanBeTheFirstPlayerToLockThisTableIn => 'Sie können der erste Spieler sein, der diesen Partie sperrt.';
	@override String get theseAreTheCurrentPlayersThatWillParticipate => 'Dies sind die aktuellen Spieler, die teilnehmen werden.';
	@override String get noPlayersSubscribedYet => 'Noch kein Spieler angemeldet.';
	@override String get playersInThisMatch => 'Spieler in diesem Spiel';
	@override String get unknownHost => 'Unbekannter Host';
	@override String get seeTableChat => 'Siehe Partiechat';
	@override String get newPlayersCannotJoinAtThisTime => 'Neue Spieler können derzeit nicht beitreten.';
	@override String get theHostHasClosedSubscriptionsForThisTable => 'Der Host hat Abonnements für diese Partie geschlossen.';
	@override String get confirmTableSubscription => 'Partieabonnement bestätigen';
}

// Path: match.ui_screens_match_table_card_widget
class _TranslationsMatchUiScreensMatchTableCardWidgetDe extends TranslationsMatchUiScreensMatchTableCardWidgetEn {
	_TranslationsMatchUiScreensMatchTableCardWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get subscribed => 'Gezeichnet';
	@override String get tapCardToOpenChat => 'Tippen Sie auf die Karte, um den Chat zu öffnen';
	@override String get subscriptionsClosed => 'Abonnements geschlossen';
	@override String get openFullLocationDetails => 'Vollständige Standortdetails öffnen';
	@override String get places => 'Plätze';
	@override String get place => 'Platz';
	@override String get s => 'S';
	@override String get joining => 'Beitritt läuft...';
	@override String get closed => 'Geschlossen';
	@override String get tableFull => 'Partie voll';
	@override String get joinTable => 'Partie beitreten';
	@override String get unknownLocation => 'Ort nicht angegeben';
	@override String get addressUnavailable => 'Adresse nicht verfügbar';
	@override String get player => 'Spieler';
	@override String get players => 'Spieler';
	@override String subscriptionTooltip({required Object subscribedPlayersCount, required Object playersWord, required Object remainingSeats, required Object placesWord}) => '${subscribedPlayersCount} ${playersWord} angemeldet und ${remainingSeats} ${placesWord} frei, um die Partie zu schließen.';
}

// Path: match.ui_screens_match_location_header_image_widget
class _TranslationsMatchUiScreensMatchLocationHeaderImageWidgetDe extends TranslationsMatchUiScreensMatchLocationHeaderImageWidgetEn {
	_TranslationsMatchUiScreensMatchLocationHeaderImageWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get locationDetails => 'Standortdetails';
}

// Path: match.ui_screens_match_create_table_location_no_recent_locations_widget
class _TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetDe extends TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get noPreviousLocationsYetSearchAndSelectOneAbove => 'Noch keine vorherigen Standorte. Suchen Sie oben und wählen Sie eines aus.';
}

// Path: match.ui_screens_match_chat_screen
class _TranslationsMatchUiScreensMatchChatScreenDe extends TranslationsMatchUiScreensMatchChatScreenEn {
	_TranslationsMatchUiScreensMatchChatScreenDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get chooseFromGallery => 'Wählen Sie aus der Galerie';
	@override String get takePhoto => 'Machen Sie ein Foto';
	@override String get cancel => 'Stornieren';
	@override String get chooseFromLibrary => 'Wählen Sie aus der Bibliothek';
	@override String get takePhoto2 => 'Machen Sie ein Foto';
	@override String get sendAPhoto => 'Schicken Sie ein Foto';
	@override String get compress => 'Kompresse';
	@override String get cancel2 => 'Stornieren';
	@override String get imageIsTooLarge => 'Bild ist zu groß';
	@override String get subscribed => 'Gezeichnet';
	@override String get unableToResolveYourAccountInformation => 'Ihre Kontoinformationen können nicht aufgelöst werden.';
	@override String get tableInfo => 'Partieinfo';
	@override String get playedMatchInfo => 'Info zur beendeten Partie';
	@override String get editTable => 'Partie bearbeiten';
}

// Path: match.ui_dialogs_match_played_match_summary_dialog
class _TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogDe extends TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogEn {
	_TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get completedMatchReport => 'Bericht zur Abgeschlossenen Partie';
	@override String get winner => 'Sieger';
	@override String get notAvailable => 'Nicht verfügbar';
	@override String startedAtLabel({required Object value}) => 'Start: ${value}';
	@override String durationLabel({required Object value}) => 'Dauer: ${value}';
	@override String scheduledAtLabel({required Object value}) => 'Geplant: ${value}';
	@override String get matchProofs => 'Partie-Nachweise';
	@override String get players => 'Spieler';
	@override String get domination => 'Dominanz';
	@override String scoreLabel({required Object value}) => '${value} Pkt';
	@override String get close => 'Schließen';
	@override String hoursMinutes({required Object hours, required Object minutes}) => '${hours}h ${minutes}m';
}

// Path: match.ui_screens_match_create_table_location_loading_recent_widget
class _TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetDe extends TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get loadingPreviousLocations => 'Vorherige Standorte werden geladen...';
}

// Path: register_match.ui_sheets_register_match_wizard_winner_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionDe extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get dominance => 'Dominanz';
	@override String get totalPoints30 => 'Gesamtpunktzahl (30)';
	@override String get dominanceMeansTheWinnerCompletedADominanceCardObjectiveInsteadOfWinningB => 'Dominanz bedeutet, dass der Gewinner ein Dominanzkartenziel erreicht hat, anstatt nach Punkten zu gewinnen.';
	@override String get totalPointsMeansTheWinnerReached30VictoryPointsOnTheScoreTrack => 'Die Gesamtpunktzahl bedeutet, dass der Gewinner 30 Siegpunkte auf der Punkteleiste erreicht hat.';
	@override String get howDidTheWinnerWon => 'Wie hat der Gewinner gewonnen?';
	@override String get pickThePlayerWhoWonThisMatch => 'Wählen Sie den Spieler aus, der dieses Spiel gewonnen hat.';
}

// Path: register_match.ui_sheets_register_match_wizard_timing_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionDe extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get estimatedDuration => 'Geschätzte Dauer';
	@override String get estimatedDuration2 => 'Geschätzte Dauer';
	@override String get setTheEstimatedDurationAdjustIn15MinuteStepsMax8Hours => 'Legen Sie die geschätzte Dauer fest. Passen Sie die Einstellung in 15-Minuten-Schritten an (maximal 8 Stunden).';
	@override String get changeTime => 'Zeit ändern';
	@override String get matchStartedAt => 'Das Spiel begann um';
	@override String get setTheTimeTheMatchActuallyStarted => 'Legen Sie die Uhrzeit fest, zu der das Spiel tatsächlich begonnen hat.';
}

// Path: register_match.ui_sheets_register_match_wizard_participants_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionDe extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get addRegisteredPlayerFromPlatform => 'Registrierten Spieler von der Plattform hinzufügen';
	@override String get addAnonymousPlayer => 'Anonymen Spieler hinzufügen';
	@override String get registeredPlayer => 'Registrierter Spieler';
	@override String get anonymousPlayer => 'Anonymer Spieler';
	@override String get selectRegisteredPlayersWhoWerePresentYouCanAddAnonymousPlayersOrSearchFo => 'Wählen Sie registrierte Spieler aus, die anwesend waren. Sie können anonyme Spieler hinzufügen oder nach anderen registrierten Spielern suchen.';
	@override String get value1WhoActuallyPlayed => '1) Wer hat eigentlich gespielt?';
}

// Path: register_match.ui_sheets_register_match_picker_error_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionDe extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get retry => 'Wiederholen';
}

// Path: register_match.ui_sheets_register_match_picker_match_item_card
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardDe extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get notAvailableYet => 'Noch nicht verfügbar';
	@override String get tapToReport => 'Zum Melden tippen';
}

// Path: register_match.ui_sheets_register_match_wizard_factions_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionDe extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get selectFaction => 'Fraktion auswählen';
	@override String get faction => 'Fraktion';
	@override String get chooseTheFactionUsedByEachPlayerInThisMatch => 'Wählen Sie die Fraktion, die jeder Spieler in diesem Spiel verwendet.';
	@override String get value2SelectFactions => '2) Fraktionen auswählen';
}

// Path: register_match.ui_sheets_register_match_search_registered_player_sheet
class _TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetDe extends TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get tapToAdd => 'Zum Hinzufügen tippen';
	@override String get alreadyAddedToThisReport => 'Bereits zu diesem Bericht hinzugefügt';
	@override String get noRegisteredPlayersWereFound => 'Es wurden keine registrierten Spieler gefunden.';
	@override String get searchByDisplayName => 'Suche nach Anzeigename';
	@override String get addRegisteredPlayer => 'Registrierten Spieler hinzufügen';
}

// Path: register_match.ui_sheets_register_match_wizard_points_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionDe extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get value0To29 => '0 bis 29';
	@override String get points => 'Punkte';
	@override String get dominanceAttempt => 'Dominanzversuch';
	@override String get winnerByDominance => 'Sieger durch Dominanz';
	@override String get winnerByPoints => 'Sieger nach Punkten';
	@override String get failedDominance => 'Fehlgeschlagene Dominanz';
	@override String get points2 => 'Punkte';
	@override String get winner => 'Gewinner';
	@override String get failedDominanceAlwaysCountsAsNoPoints => 'Eine misslungene Dominanz zählt immer als keine Punkte.';
	@override String get forEachNonWinnerSetPointsOrMarkFailedDominanceAttempt => 'Für jeden Nichtsieger werden Punkte vergeben oder ein gescheiterter Dominanzversuch markiert.';
}

// Path: register_match.ui_sheets_register_match_wizard_bottom_actions_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionDe extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get submitReport => 'Bericht absenden';
	@override String get back => 'Zurück';
	@override String get cancel => 'Stornieren';
	@override String get continueButton => 'Weitermachen';
}

// Path: register_match.ui_sheets_register_match_picker_empty_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionDe extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get youDoNotHaveAnyHostedSubscribedMatchPendingResultRegistration => 'Bis zur Ergebnisregistrierung haben Sie kein gehostetes/abonniertes Spiel.';
	@override String get noPendingMatches => 'Keine ausstehenden Spiele';
}

// Path: register_match.ui_sheets_register_match_wizard_loading_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionDe extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get loadingMatchDetails => 'Spieldetails werden geladen...';
}

// Path: register_match.ui_sheets_register_match_picker_sheet
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetDe extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get youCanRegisterThisMatchFrom2HoursBeforeItsScheduledStart => 'Sie können dieses Spiel ab 2 Stunden vor dem geplanten Beginn anmelden.';
	@override String get resultRegistrationNotAvailableYet => 'Ergebnisregistrierung noch nicht verfügbar';
}

// Path: register_match.ui_sheets_register_match_add_anonymous_player_sheet
class _TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetDe extends TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get tapToAdd => 'Zum Hinzufügen tippen';
	@override String get alreadyAddedToThisReport => 'Bereits zu diesem Bericht hinzugefügt';
	@override String get noAnonymousPlayersYetCreateOneUsingFirstAndLastName => 'Noch keine anonymen Spieler. Erstellen Sie eines mit Vor- und Nachnamen.';
	@override String get createAndAddPlayer => 'Spieler erstellen und hinzufügen';
	@override String get lastName => 'Nachname';
	@override String get firstName => 'Vorname';
	@override String get addAnonymousPlayer => 'Anonymen Spieler hinzufügen';
}

// Path: register_match.ui_sheets_register_match_wizard_top_bar_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionDe extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get registerMatchResult => 'Spielergebnis registrieren';
}

// Path: register_match.ui_sheets_register_match_wizard_error_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionDe extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get close => 'Schließen';
	@override String get registerMatch => 'Spiel registrieren';
}

// Path: register_match.ui_sheets_register_match_wizard_sheet
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetDe extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get gallery => 'Galerie';
	@override String get camera => 'Kamera';
	@override String get cancel => 'Stornieren';
	@override String get gallery2 => 'Galerie';
	@override String get camera2 => 'Kamera';
	@override String get selectSource => 'Quelle auswählen';
	@override String get selectedImageIsEmptyChooseAnotherImage => 'Das ausgewählte Bild ist leer. Wählen Sie ein anderes Bild.';
	@override String get invalidImage => 'Ungültiges Bild';
	@override String get allowCameraAndPhotoPermissionsInSystemSettingsAndTryAgain => 'Erlauben Sie Kamera- und Fotoberechtigungen in den Systemeinstellungen und versuchen Sie es erneut.';
	@override String get unableToAccessCameraOrGallery => 'Auf Kamera oder Galerie kann nicht zugegriffen werden';
	@override String get ok => 'OK';
	@override String get takeASelfieWithEveryoneAtTheTableIfPossibleIncludeTheBoardInTheSamePhoto => 'Machen Sie ein Selfie mit allen am Tisch. Wenn möglich, fügen Sie die Tafel auf demselben Foto ein.';
	@override String get groupSelfieProof => 'Gruppen-Selfie-Beweis';
	@override String get completeAllReportStepsBeforeSubmitting => 'Schließen Sie alle Berichtsschritte ab, bevor Sie den Bericht absenden.';
	@override String get incompleteReport => 'Unvollständiger Bericht';
	@override String get addTheBoardPhotoBeforeContinuing => 'Fügen Sie das Board-Foto hinzu, bevor Sie fortfahren.';
	@override String get boardPhotoRequired => 'Board-Foto erforderlich';
	@override String get addTheGroupSelfieBeforeContinuing => 'Fügen Sie das Gruppen-Selfie hinzu, bevor Sie fortfahren.';
	@override String get groupPhotoRequired => 'Gruppenfoto erforderlich';
	@override String get matchDurationMustBeAtMost8Hours => 'Die Spieldauer darf höchstens 8 Stunden betragen.';
	@override String get invalidDuration => 'Ungültige Dauer';
	@override String get matchDurationMustBeGreaterThanZero => 'Die Spieldauer muss größer als Null sein.';
	@override String get invalidDuration2 => 'Ungültige Dauer';
	@override String get matchStartTimeCannotBeInTheFuture => 'Die Startzeit des Spiels darf nicht in der Zukunft liegen.';
	@override String get invalidMatchRegistration => 'Ungültige Spielregistrierung';
	@override String get selectWhenThisMatchStarted => 'Wählen Sie aus, wann dieses Spiel begonnen hat.';
	@override String get matchStartMissing => 'Spielbeginn fehlt';
	@override String get invalidPoints => 'Ungültige Punkte';
	@override String get pointsMissing => 'Punkte fehlen';
	@override String get selectHowTheWinnerWonBeforeContinuing => 'Wählen Sie aus, wie der Gewinner gewonnen hat, bevor Sie fortfahren.';
	@override String get winnerMethodMissing => 'Winner-Methode fehlt';
	@override String get selectTheWinnerBeforeContinuing => 'Wählen Sie den Gewinner aus, bevor Sie fortfahren.';
	@override String get winnerMissing => 'Gewinner fehlt';
	@override String get theSelectedWinnerIsNoLongerInTheParticipantList => 'Der ausgewählte Gewinner ist nicht mehr in der Teilnehmerliste.';
	@override String get winnerMissing2 => 'Gewinner fehlt';
	@override String get selectTheWinnerBeforeContinuing2 => 'Wählen Sie den Gewinner aus, bevor Sie fortfahren.';
	@override String get winnerMissing3 => 'Gewinner fehlt';
	@override String get invalidFactionSetup => 'Ungültige Fraktionskonfiguration';
	@override String get factionMissing => 'Fraktion fehlt';
	@override String get selectAtLeast2ParticipantsRegisteredAndOrAnonymousToContinue => 'Wählen Sie mindestens 2 Teilnehmer (registriert und/oder anonym) aus, um fortzufahren.';
	@override String get notEnoughPlayers => 'Nicht genügend Spieler';
	@override String get edit => 'Bearbeiten';
	@override String get youKeptTheDefaultDurationOf1HourDoYouWantToContinueWithIt => 'Sie haben die Standarddauer von 1 Stunde beibehalten. Möchten Sie damit fortfahren?';
	@override String get keepDefaultDuration => 'Standarddauer beibehalten?';
	@override String get matchStartTimeCannotBeInTheFuture2 => 'Die Startzeit des Spiels darf nicht in der Zukunft liegen.';
	@override String get invalidMatchRegistration2 => 'Ungültige Spielregistrierung';
	@override String get matchStartTimeCannotBeInTheFuture3 => 'Die Startzeit des Spiels darf nicht in der Zukunft liegen.';
	@override String get invalidMatchRegistration3 => 'Ungültige Spielregistrierung';
	@override String get unableToLoadThisMatchReportFlow => 'Dieser Match-Berichtsfluss kann nicht geladen werden.';
	@override String get matchNotFound => 'Partie nicht gefunden';
	@override String get unableToLoadThisMatchReportFlow2 => 'Dieser Match-Berichtsfluss kann nicht geladen werden.';
	@override String get invalidMatch => 'Ungültige Partie';
	@override String get continueButton => 'Weitermachen';
	@override String selectFactionForParticipantBeforeContinuing({required Object participantName}) => 'Wähle vor dem Fortfahren eine Fraktion für ${participantName} aus.';
	@override String factionWasSelectedMoreThanOnceEachFactionCanOnlyBeSelectedOnce({required Object factionName}) => '${factionName} wurde mehr als einmal ausgewählt. Jede Fraktion darf nur einmal gewählt werden.';
}

// Path: register_match.ui_sheets_register_match_wizard_review_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionDe extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get boardPhoto => 'Brettfoto';
	@override String get groupPhoto => 'Gruppenfoto';
	@override String get socialProof => 'Sozialer Beweis';
	@override String get ranking => 'Rang';
	@override String get confirmAllDetailsBeforeLoggingThisMatch => 'Bestätigen Sie alle Details, bevor Sie dieses Spiel protokollieren.';
}

// Path: register_match.ui_sheets_register_match_wizard_review_photo_tile
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileDe extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get ready => 'Bereit';
	@override String get missing => 'Fehlen';
}

// Path: register_match.ui_sheets_register_match_wizard_proof_card_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionDe extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get tapToReplace => 'Zum Ersetzen antippen';
	@override String get tapToAddPhoto => 'Tippen Sie, um ein Foto hinzuzufügen';
}

// Path: register_match.ui_sheets_register_match_picker_header_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionDe extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get selectAMatchYouParticipatedInYouCanRegisterAResultFrom2HoursBeforeSchedu => 'Wählen Sie ein Spiel aus, an dem Sie teilgenommen haben. Sie können ein Ergebnis ab 2 Stunden vor dem geplanten Beginn registrieren.';
	@override String get registerMatchResult => 'Spielergebnis registrieren';
}

// Path: register_match.ui_sheets_register_match_wizard_social_proof_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionDe extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get captureTheBoardAndScoreTrackClearly => 'Erfassen Sie die Tafel und die Punkteleiste deutlich.';
	@override String get boardPhoto => 'Brettfoto';
	@override String get uploadAPhotoOfTheBoardWithTheScoreTrackClearlyVisible => 'Laden Sie ein Foto der Tafel hoch, auf dem die Punkteleiste deutlich sichtbar ist.';
	@override String get boardPhotoProof => 'Fotobeweis der Platine';
	@override String get selfieWithAllPlayersIncludeTheBoardIfPossible => 'Selfie mit allen Spielern. Beziehen Sie nach Möglichkeit die Tafel mit ein.';
	@override String get groupPhoto => 'Gruppenfoto';
	@override String get uploadBothPhotosToConfirmThisMatchHappenedInPerson => 'Lade beide Fotos hoch, um zu bestätigen, dass diese Partie persönlich stattgefunden hat.';
}

// Path: shop.ui_screens_shop_screen
class _TranslationsShopUiScreensShopScreenDe extends TranslationsShopUiScreensShopScreenEn {
	_TranslationsShopUiScreensShopScreenDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get shopHeaderTitle => 'Baue deine Root-Sammlung auf';
	@override String get shopHeaderDescription => 'Kaufe das Grundspiel und Erweiterungen mit lokalisierten Boxdetails und schnellen Marketplace-Links.';
	@override String get whereToBuy => 'Wo kaufen';
	@override String buyAt({required Object store}) => 'Bei ${store} kaufen';
	@override String get invalidStoreUrl => 'Dieser Shop-Link ist ungültig.';
	@override String get unableToOpenStoreUrl => 'Dieser Shop-Link kann gerade nicht geöffnet werden.';
	@override String get closeGallery => 'Galerie schließen';
	@override String get noProductsAvailable => 'Für diese Sprache sind noch keine Produkte verfügbar.';
}

// Path: auth.auth_login_screen.errors
class _TranslationsAuthAuthLoginScreenErrorsDe extends TranslationsAuthAuthLoginScreenErrorsEn {
	_TranslationsAuthAuthLoginScreenErrorsDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get invalidEmail => 'Ungültige E-Mail-Adresse.';
	@override String get invalidCredentials => 'Ungültige E-Mail oder Passwort. Bitte überprüfe deine Daten und versuche es erneut.';
	@override String get tooManyLoginAttempts => 'Zu viele fehlgeschlagene Anmeldeversuche. Bitte versuche es später erneut.';
	@override String get loginFailed => 'Bei der Anmeldung ist ein Fehler aufgetreten. Bitte versuche es erneut.';
	@override String get tooManyRegistrationAttempts => 'Zu viele fehlgeschlagene Registrierungsversuche. Bitte versuche es später erneut.';
	@override String get verificationCodeExpired => 'Der Verifizierungscode ist abgelaufen. Bitte fordere einen neuen an.';
	@override String get invalidVerificationCode => 'Ungültiger Verifizierungscode. Bitte prüfe ihn und versuche es erneut.';
	@override String get passwordPolicyViolation => 'Das Passwort erfüllt die Anforderungen nicht. Bitte wähle ein anderes Passwort.';
	@override String get registrationFailed => 'Bei der Registrierung ist ein Fehler aufgetreten. Bitte versuche es später erneut.';
	@override String get tooManyPasswordResetAttempts => 'Zu viele fehlgeschlagene Zurücksetzungsversuche. Bitte versuche es später erneut.';
	@override String get passwordResetFailed => 'Beim Zurücksetzen des Passworts ist ein Fehler aufgetreten. Bitte versuche es später erneut.';
	@override String get networkUnavailable => 'Keine Verbindung zum Server möglich. Prüfe deine Verbindung und versuche es erneut.';
	@override String get unexpected => 'Ein unerwarteter Fehler ist aufgetreten. Bitte versuche es erneut.';
}
