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
class TranslationsFr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsFr _root = this; // ignore: unused_field

	@override 
	TranslationsFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppFr app = _TranslationsAppFr._(_root);
	@override late final _TranslationsAuthFr auth = _TranslationsAuthFr._(_root);
	@override late final _TranslationsDashboardFr dashboard = _TranslationsDashboardFr._(_root);
	@override late final _TranslationsActivityFr activity = _TranslationsActivityFr._(_root);
	@override late final _TranslationsHomeFr home = _TranslationsHomeFr._(_root);
	@override late final _TranslationsMatchFr match = _TranslationsMatchFr._(_root);
	@override late final _TranslationsRegisterMatchFr register_match = _TranslationsRegisterMatchFr._(_root);
	@override late final _TranslationsShopFr shop = _TranslationsShopFr._(_root);
}

// Path: app
class _TranslationsAppFr extends TranslationsAppEn {
	_TranslationsAppFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get rootHub => 'Root Hub';
}

// Path: auth
class _TranslationsAuthFr extends TranslationsAuthEn {
	_TranslationsAuthFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsAuthAuthOnboardingScreenFr auth_onboarding_screen = _TranslationsAuthAuthOnboardingScreenFr._(_root);
	@override late final _TranslationsAuthAuthOnboardingProfileScreenFr auth_onboarding_profile_screen = _TranslationsAuthAuthOnboardingProfileScreenFr._(_root);
	@override late final _TranslationsAuthAuthLoadingScreenFr auth_loading_screen = _TranslationsAuthAuthLoadingScreenFr._(_root);
	@override late final _TranslationsAuthAuthLoginScreenFr auth_login_screen = _TranslationsAuthAuthLoginScreenFr._(_root);
	@override late final _TranslationsAuthAuthOnboardingContinueButtonWidgetFr auth_onboarding_continue_button_widget = _TranslationsAuthAuthOnboardingContinueButtonWidgetFr._(_root);
}

// Path: dashboard
class _TranslationsDashboardFr extends TranslationsDashboardEn {
	_TranslationsDashboardFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsDashboardUiScreensDashboardScreenFr ui_screens_dashboard_screen = _TranslationsDashboardUiScreensDashboardScreenFr._(_root);
	@override late final _TranslationsDashboardUiScreensDashboardFactionEditorScreenFr ui_screens_dashboard_faction_editor_screen = _TranslationsDashboardUiScreensDashboardFactionEditorScreenFr._(_root);
	@override late final _TranslationsDashboardUiDialogsEditLocationDialogFr ui_dialogs_edit_location_dialog = _TranslationsDashboardUiDialogsEditLocationDialogFr._(_root);
	@override late final _TranslationsDashboardUiDialogsEditDisplayNameDialogFr ui_dialogs_edit_display_name_dialog = _TranslationsDashboardUiDialogsEditDisplayNameDialogFr._(_root);
	@override late final _TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetFr ui_widgets_dashboard_profile_drawer_widget = _TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetFr._(_root);
}

// Path: activity
class _TranslationsActivityFr extends TranslationsActivityEn {
	_TranslationsActivityFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsActivityUiScreensActivityScreenFr ui_screens_activity_screen = _TranslationsActivityUiScreensActivityScreenFr._(_root);
	@override late final _TranslationsActivityUiWidgetsActivitySubscribedScheduleCardFr ui_widgets_activity_subscribed_schedule_card = _TranslationsActivityUiWidgetsActivitySubscribedScheduleCardFr._(_root);
	@override late final _TranslationsActivityUiWidgetsActivityChatCardFr ui_widgets_activity_chat_card = _TranslationsActivityUiWidgetsActivityChatCardFr._(_root);
}

// Path: home
class _TranslationsHomeFr extends TranslationsHomeEn {
	_TranslationsHomeFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeUiSectionsHomeStatsSectionFr ui_sections_home_stats_section = _TranslationsHomeUiSectionsHomeStatsSectionFr._(_root);
	@override late final _TranslationsHomeUiScreensHomeScreenFr ui_screens_home_screen = _TranslationsHomeUiScreensHomeScreenFr._(_root);
	@override late final _TranslationsHomeUiWidgetsHomeStatsPieChartWidgetFr ui_widgets_home_stats_pie_chart_widget = _TranslationsHomeUiWidgetsHomeStatsPieChartWidgetFr._(_root);
}

// Path: match
class _TranslationsMatchFr extends TranslationsMatchEn {
	_TranslationsMatchFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMatchUiSheetsMatchEditTableErrorWidgetFr ui_sheets_match_edit_table_error_widget = _TranslationsMatchUiSheetsMatchEditTableErrorWidgetFr._(_root);
	@override late final _TranslationsMatchUiSheetsMatchEditTableLoadingWidgetFr ui_sheets_match_edit_table_loading_widget = _TranslationsMatchUiSheetsMatchEditTableLoadingWidgetFr._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoSheetFr ui_sheets_match_table_info_sheet = _TranslationsMatchUiSheetsMatchTableInfoSheetFr._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoContentWidgetFr ui_sheets_match_table_info_content_widget = _TranslationsMatchUiSheetsMatchTableInfoContentWidgetFr._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoErrorWidgetFr ui_sheets_match_table_info_error_widget = _TranslationsMatchUiSheetsMatchTableInfoErrorWidgetFr._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetFr ui_sheets_match_table_info_participant_card_widget = _TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetFr._(_root);
	@override late final _TranslationsMatchUiSheetsMatchEditTableSheetFr ui_sheets_match_edit_table_sheet = _TranslationsMatchUiSheetsMatchEditTableSheetFr._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetFr ui_sheets_match_table_info_loading_widget = _TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetFr._(_root);
	@override late final _TranslationsMatchUiSheetsMatchEditTableFormWidgetFr ui_sheets_match_edit_table_form_widget = _TranslationsMatchUiSheetsMatchEditTableFormWidgetFr._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetFr ui_sheets_match_table_info_bottom_actions_widget = _TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetFr._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetFr ui_screens_match_create_table_location_loading_search_widget = _TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetFr._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableLocationScreenFr ui_screens_match_create_table_location_screen = _TranslationsMatchUiScreensMatchCreateTableLocationScreenFr._(_root);
	@override late final _TranslationsMatchUiScreensMatchJoinSheetErrorWidgetFr ui_screens_match_join_sheet_error_widget = _TranslationsMatchUiScreensMatchJoinSheetErrorWidgetFr._(_root);
	@override late final _TranslationsMatchUiScreensMatchScreenFr ui_screens_match_screen = _TranslationsMatchUiScreensMatchScreenFr._(_root);
	@override late final _TranslationsMatchUiScreensMatchLoadingErrorStateWidgetFr ui_screens_match_loading_error_state_widget = _TranslationsMatchUiScreensMatchLoadingErrorStateWidgetFr._(_root);
	@override late final _TranslationsMatchUiScreensMatchNearbyHeaderWidgetFr ui_screens_match_nearby_header_widget = _TranslationsMatchUiScreensMatchNearbyHeaderWidgetFr._(_root);
	@override late final _TranslationsMatchUiScreensMatchNoMatchesStateWidgetFr ui_screens_match_no_matches_state_widget = _TranslationsMatchUiScreensMatchNoMatchesStateWidgetFr._(_root);
	@override late final _TranslationsMatchUiScreensMatchTimeStatusChipWidgetFr ui_screens_match_time_status_chip_widget = _TranslationsMatchUiScreensMatchTimeStatusChipWidgetFr._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetFr ui_screens_match_create_table_location_no_search_results_widget = _TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetFr._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableScreenFr ui_screens_match_create_table_screen = _TranslationsMatchUiScreensMatchCreateTableScreenFr._(_root);
	@override late final _TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetFr ui_screens_match_chat_loading_error_state_widget = _TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetFr._(_root);
	@override late final _TranslationsMatchUiScreensMatchReportAvailableChipWidgetFr ui_screens_match_report_available_chip_widget = _TranslationsMatchUiScreensMatchReportAvailableChipWidgetFr._(_root);
	@override late final _TranslationsMatchUiScreensMatchInitialLoadingStateWidgetFr ui_screens_match_initial_loading_state_widget = _TranslationsMatchUiScreensMatchInitialLoadingStateWidgetFr._(_root);
	@override late final _TranslationsMatchUiScreensMatchParticipantCardWidgetFr ui_screens_match_participant_card_widget = _TranslationsMatchUiScreensMatchParticipantCardWidgetFr._(_root);
	@override late final _TranslationsMatchUiScreensMatchJoinSheetContentWidgetFr ui_screens_match_join_sheet_content_widget = _TranslationsMatchUiScreensMatchJoinSheetContentWidgetFr._(_root);
	@override late final _TranslationsMatchUiScreensMatchTableCardWidgetFr ui_screens_match_table_card_widget = _TranslationsMatchUiScreensMatchTableCardWidgetFr._(_root);
	@override late final _TranslationsMatchUiScreensMatchLocationHeaderImageWidgetFr ui_screens_match_location_header_image_widget = _TranslationsMatchUiScreensMatchLocationHeaderImageWidgetFr._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetFr ui_screens_match_create_table_location_no_recent_locations_widget = _TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetFr._(_root);
	@override late final _TranslationsMatchUiScreensMatchChatScreenFr ui_screens_match_chat_screen = _TranslationsMatchUiScreensMatchChatScreenFr._(_root);
	@override late final _TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogFr ui_dialogs_match_played_match_summary_dialog = _TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogFr._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetFr ui_screens_match_create_table_location_loading_recent_widget = _TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetFr._(_root);
}

// Path: register_match
class _TranslationsRegisterMatchFr extends TranslationsRegisterMatchEn {
	_TranslationsRegisterMatchFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionFr ui_sheets_register_match_wizard_winner_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionFr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionFr ui_sheets_register_match_wizard_timing_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionFr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionFr ui_sheets_register_match_wizard_participants_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionFr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionFr ui_sheets_register_match_picker_error_section = _TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionFr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardFr ui_sheets_register_match_picker_match_item_card = _TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardFr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionFr ui_sheets_register_match_wizard_factions_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionFr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetFr ui_sheets_register_match_search_registered_player_sheet = _TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetFr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionFr ui_sheets_register_match_wizard_points_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionFr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionFr ui_sheets_register_match_wizard_bottom_actions_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionFr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionFr ui_sheets_register_match_picker_empty_section = _TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionFr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionFr ui_sheets_register_match_wizard_loading_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionFr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetFr ui_sheets_register_match_picker_sheet = _TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetFr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetFr ui_sheets_register_match_add_anonymous_player_sheet = _TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetFr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionFr ui_sheets_register_match_wizard_top_bar_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionFr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionFr ui_sheets_register_match_wizard_error_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionFr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetFr ui_sheets_register_match_wizard_sheet = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetFr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionFr ui_sheets_register_match_wizard_review_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionFr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileFr ui_sheets_register_match_wizard_review_photo_tile = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileFr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionFr ui_sheets_register_match_wizard_proof_card_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionFr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionFr ui_sheets_register_match_picker_header_section = _TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionFr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionFr ui_sheets_register_match_wizard_social_proof_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionFr._(_root);
}

// Path: shop
class _TranslationsShopFr extends TranslationsShopEn {
	_TranslationsShopFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsShopUiScreensShopScreenFr ui_screens_shop_screen = _TranslationsShopUiScreensShopScreenFr._(_root);
}

// Path: auth.auth_onboarding_screen
class _TranslationsAuthAuthOnboardingScreenFr extends TranslationsAuthAuthOnboardingScreenEn {
	_TranslationsAuthAuthOnboardingScreenFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get pickYourFavoriteRootFactionBeforeEnteringTheHub => 'Choisissez votre faction ROOT préférée avant d’entrer dans le hub.';
	@override String get chooseYourFaction => 'Choisissez votre faction';
	@override String get iAlreadyHaveAnAccount => 'J\'ai déjà un compte';
}

// Path: auth.auth_onboarding_profile_screen
class _TranslationsAuthAuthOnboardingProfileScreenFr extends TranslationsAuthAuthOnboardingProfileScreenEn {
	_TranslationsAuthAuthOnboardingProfileScreenFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get currentLocationUsesYourPhoneCoordinatesXAndYAndIsRequiredToShowNearbyMat => 'La position actuelle utilise les coordonnées de votre téléphone (x et y) et est nécessaire pour afficher des parties proches.';
	@override String get yourDisplayNameIsHowOtherPlayersWillSeeYouInRootHub => 'Votre nom d’affichage est la façon dont les autres joueurs vous verront sur Root Hub.';
	@override String get setYourHubIdentity => 'Définir votre identité de hub';
	@override String get continueButton => 'Continuer';
	@override String get chooseHowYouAppearAndSetYourLocationToFindNearbyMatches => 'Choisissez votre apparence et définissez votre position pour trouver des parties proches.';
	@override String get howYouWillBeCalled => 'Comment tu seras appelé';
	@override String get thisIsHowOtherPlayersWillSeeYourProfileInRootHub => 'C’est ainsi que les autres joueurs verront votre profil sur Root Hub.';
	@override String get enterYourDisplayName => 'Entrez votre nom d\'affichage';
	@override String get currentLocation => 'Emplacement actuel';
	@override String get whereDoYouWantToPlay => 'Où veux-tu jouer ?';
	@override String get locationIsRequiredToShowNearbyTablesChooseDeviceOrSearch => 'La position est nécessaire pour afficher les parties proches. Choisissez la position de l’appareil ou recherchez un lieu.';
	@override String get chooseTheAreaWhereYouWantToFindNearbyPlayers => 'Choisissez la zone où vous voulez trouver des joueurs et des tables à proximité.';
	@override String get useMyCurrentDeviceLocation => 'Utiliser la position actuelle de mon appareil';
	@override String get capturingCoordinates => 'Capturer les coordonnées...';
	@override String get instantlyUseYourPhonesGpsCoordinates => 'Utilisez instantanément les coordonnées GPS de votre téléphone.';
	@override String get searchForATableLocation => 'Rechercher un emplacement';
	@override String get openTheSearchAndSelectAnyPlaceYouPrefer => 'Ouvrez la recherche et sélectionnez l\'endroit que vous préférez.';
	@override String get yourPlayArea => 'Votre zone de jeu';
	@override String get findingCityName => 'Recherche du nom de la ville...';
	@override String get selectedArea => 'Zone sélectionnée';
	@override String weWillShowMatchesNear({required Object city}) => 'Nous afficherons des parties près de ${city}.';
	@override String get weWillShowMatchesNearTheSelectedArea => 'Nous afficherons des parties près de votre zone sélectionnée.';
	@override String get changeLocation => 'Changer l\'emplacement';
	@override String get selectedCoordinates => 'Coordonnées sélectionnées';
	@override String get searchAreaRadius => 'Rayon de la zone de recherche';
	@override String get howFarShouldWeSearchForNearbyPlayersAroundYou => 'Jusqu’où devrions-nous rechercher des joueurs à proximité autour de vous ?';
	@override String get value25KmIsTheRecommendedStartingPoint => '25 km est le point de départ recommandé.';
	@override String get disableVpnOrProxyBeforeCapturingLocationWrongCoordinatesMayHideNearby => 'Désactivez le VPN ou le proxy avant de capturer la position. De mauvaises coordonnées peuvent masquer des parties proches.';
	@override String get locationSelectedFromSearch => 'Emplacement sélectionné dans la recherche.';
	@override String get enableLocationServicesOnYourPhoneAndTryAgain => 'Activez les services de localisation sur votre téléphone et réessayez.';
	@override String get locationPermissionDeniedLocationIsRequiredToContinue => 'Autorisation de localisation refusée. La localisation est requise pour continuer.';
	@override String get locationPermissionIsDeniedForeverEnableItInSystemSettingsToContinue => 'L\'autorisation de localisation est refusée pour toujours. Activez-le dans les paramètres système pour continuer.';
	@override String get locationCapturedSuccessfully => 'Emplacement capturé avec succès.';
	@override String get unableToCaptureLocationRightNowLocationIsRequiredToContinue => 'Impossible de capturer l\'emplacement pour le moment. La localisation est requise pour continuer.';
	@override String get unableToResolveCityNameRightNow => 'Impossible de résoudre le nom de la ville pour le moment.';
	@override String get searchForLocation => 'Rechercher un emplacement';
	@override String get searchAndPickOnePlaceWeWillUseItsCoordinatesForNearbyMatches => 'Recherchez et choisissez un endroit. Nous utiliserons ses coordonnées pour les matchs à proximité.';
	@override String get useSelectedLocation => 'Utiliser l\'emplacement sélectionné';
	@override String get selectALocationFromTheListBeforeContinuing => 'Sélectionnez un emplacement dans la liste avant de continuer.';
	@override String get unableToUseTheSelectedLocationCoordinatesRightNow => 'Impossible d\'utiliser les coordonnées de l\'emplacement sélectionné pour le moment.';
	@override String get kilometersUnit => 'kilomètres';
}

// Path: auth.auth_loading_screen
class _TranslationsAuthAuthLoadingScreenFr extends TranslationsAuthAuthLoadingScreenEn {
	_TranslationsAuthAuthLoadingScreenFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get rootHub => 'ROOT HUB';
}

// Path: auth.auth_login_screen
class _TranslationsAuthAuthLoginScreenFr extends TranslationsAuthAuthLoginScreenEn {
	_TranslationsAuthAuthLoginScreenFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get signInToBrowseSchedulesAndJoinTables => 'Connectez-vous pour consulter les horaires et rejoindre des parties.';
	@override String get findYourNextRootMatch => 'Trouvez votre prochaine\npartie de ROOT';
}

// Path: auth.auth_onboarding_continue_button_widget
class _TranslationsAuthAuthOnboardingContinueButtonWidgetFr extends TranslationsAuthAuthOnboardingContinueButtonWidgetEn {
	_TranslationsAuthAuthOnboardingContinueButtonWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get continueButton => 'Continuer';
}

// Path: dashboard.ui_screens_dashboard_screen
class _TranslationsDashboardUiScreensDashboardScreenFr extends TranslationsDashboardUiScreensDashboardScreenEn {
	_TranslationsDashboardUiScreensDashboardScreenFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get shop => 'Boutique';
	@override String get match => 'Parties';
	@override String get activity => 'Activité';
	@override String get home => 'Accueil';
	@override String get rootHub => 'ROOT HUB';
	@override String get chooseFromGallery => 'Choisissez dans la galerie';
	@override String get takePhoto => 'Prendre une photo';
	@override String get cancel => 'Annuler';
	@override String get chooseFromLibrary => 'Choisissez dans la bibliothèque';
	@override String get takePhoto2 => 'Prendre une photo';
	@override String get changeProfilePhoto => 'Changer la photo de profil';
	@override String get allowCameraAndPhotoPermissionsInSystemSettingsAndTryAgain => 'Autorisez les autorisations de l\'appareil photo et des photos dans les paramètres système et réessayez.';
	@override String get unableToAccessCameraOrGallery => 'Impossible d\'accéder à la caméra ou à la galerie';
	@override String get rootPlayer => 'Joueur Root';
	@override String welcomeBack({required Object displayName}) => 'Bon retour, ${displayName}';
	@override String get communityDashboardTitle => 'Tableau Communautaire';
	@override String get matchFinderTitle => 'Trouver des parties';
	@override String get activityCenterTitle => 'Centre d\'Activité';
	@override String get shopPreviewTitle => 'Aperçu de la boutique';
	@override String get communityDashboardSubtitle => 'Découvrez ce qui se passe dans la communauté ROOT.';
	@override String get matchFinderSubtitle => 'Trouvez des parties proches ou créez-en une avec votre groupe local.';
	@override String get activityCenterSubtitle => 'Suivez vos tables actives et les mises à jour de chat en un seul endroit.';
	@override String get shopPreviewSubtitle => 'Récupérez bientôt des cosmétiques, jetons et packs communautaires.';
}

// Path: dashboard.ui_screens_dashboard_faction_editor_screen
class _TranslationsDashboardUiScreensDashboardFactionEditorScreenFr extends TranslationsDashboardUiScreensDashboardFactionEditorScreenEn {
	_TranslationsDashboardUiScreensDashboardFactionEditorScreenFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get chooseTheFactionShownInYourProfileAndUsedAsYourDefaultPreference => 'Choisissez la faction affichée dans votre profil et utilisée comme préférence par défaut.';
	@override String get changeFavoriteFaction => 'Changer de faction préférée';
}

// Path: dashboard.ui_dialogs_edit_location_dialog
class _TranslationsDashboardUiDialogsEditLocationDialogFr extends TranslationsDashboardUiDialogsEditLocationDialogEn {
	_TranslationsDashboardUiDialogsEditLocationDialogFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get save => 'Sauvegarder';
	@override String get cancel => 'Annuler';
	@override String get updateYourCoordinatesAndTargetSearchRatioForMatchDiscovery => 'Mettez à jour vos coordonnées et le rayon de recherche pour trouver des parties.';
	@override String get editLocation => 'Modifier l\'emplacement';
}

// Path: dashboard.ui_dialogs_edit_display_name_dialog
class _TranslationsDashboardUiDialogsEditDisplayNameDialogFr extends TranslationsDashboardUiDialogsEditDisplayNameDialogEn {
	_TranslationsDashboardUiDialogsEditDisplayNameDialogFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get save => 'Sauvegarder';
	@override String get cancel => 'Annuler';
	@override String get thisIsHowPlayersWillSeeYouAcrossRootHub => 'C’est ainsi que les joueurs vous verront sur Root Hub.';
	@override String get editDisplayName => 'Modifier le nom d\'affichage';
}

// Path: dashboard.ui_widgets_dashboard_profile_drawer_widget
class _TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetFr extends TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetEn {
	_TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get logOut => 'Se déconnecter';
	@override String get changeFaction => 'Changer de faction';
	@override String get saving => 'Économie...';
	@override String get favoriteFaction => 'Faction préférée';
	@override String get location => 'Emplacement';
	@override String get displayName => 'Nom d\'affichage';
	@override String get edit => 'Modifier';
	@override String get change => 'Changement';
	@override String get noLocationConfigured => 'Aucun emplacement configuré';
	@override String get xLabel => 'x';
	@override String get yLabel => 'oui';
	@override String get ratioLabel => 'rayon';
	@override String get language => 'Langue';
	@override String get useDeviceLanguage => 'Utiliser la langue de l\'appareil';
	@override String get english => 'Anglais';
	@override String get portugueseBrazil => 'Portugais (Brésil)';
	@override String get spanish => 'Espagnol';
	@override String get french => 'Français';
	@override String get german => 'Allemand';
}

// Path: activity.ui_screens_activity_screen
class _TranslationsActivityUiScreensActivityScreenFr extends TranslationsActivityUiScreensActivityScreenEn {
	_TranslationsActivityUiScreensActivityScreenFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get myScheduledTablesTitle => 'Mes Tables Planifiées';
	@override String get tablesYouSubscribedToThatAreStillWithinTheActiveWindow => 'Tables auxquelles vous êtes inscrit et qui n\'ont pas encore commencé ou ont commencé il y a moins de 6 heures.';
	@override String get noActiveSchedules => 'Aucun abonnement actif';
	@override String get whenYouJoinATableItWillAppearHereAsASwipeableCard => 'Quand vous rejoignez une table, elle apparaît ici sous forme de carte à faire glisser.';
	@override String get activeChatsTitle => 'Chats Actifs';
	@override String get chatsForUpcomingOrRecentlyStartedTablesOrderedByUnreadMessages => 'Chats des tables à venir ou récemment lancées, triés d\'abord par messages non lus.';
	@override String get noActiveChats => 'Aucun chat actif';
	@override String get openAnyTableChatAndItWillBeTrackedHereEvenWithoutASubscription => 'Ouvrez n\'importe quel chat de table et il sera suivi ici, même sans abonnement.';
	@override String get completedMatchesTitle => 'Chats de Parties Terminées';
	@override String get latestEightCompletedOrArchivedMatchChatsYouParticipatedIn => 'Les 8 derniers chats de parties déjà jouées.';
	@override String get noCompletedChats => 'Aucun chat terminé pour le moment';
	@override String get onceMatchesFinishTheirChatsWillStayAvailableHere => 'Une fois les parties terminées, leurs chats restent disponibles dans cette section.';
}

// Path: activity.ui_widgets_activity_subscribed_schedule_card
class _TranslationsActivityUiWidgetsActivitySubscribedScheduleCardFr extends TranslationsActivityUiWidgetsActivitySubscribedScheduleCardEn {
	_TranslationsActivityUiWidgetsActivitySubscribedScheduleCardFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get unknownLocation => 'Lieu inconnu';
	@override String get selected => 'Sélectionné';
	@override String get alreadyStarted => 'Déjà commencée';
	@override String get notStartedYet => 'Pas encore commencée';
	@override String playersLabel({required Object minPlayers, required Object maxPlayers}) => '${minPlayers}-${maxPlayers} joueurs';
	@override String get openChatHint => 'Touchez la carte pour ouvrir le chat';
}

// Path: activity.ui_widgets_activity_chat_card
class _TranslationsActivityUiWidgetsActivityChatCardFr extends TranslationsActivityUiWidgetsActivityChatCardEn {
	_TranslationsActivityUiWidgetsActivityChatCardFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get ended => 'Terminée';
	@override String get started => 'Commencée';
	@override String get upcoming => 'À venir';
	@override String senderMessage({required Object sender, required Object message}) => '${sender}: ${message}';
	@override String get newMessage => 'Nouveau message';
	@override String get photoShared => 'Photo partagée';
	@override String get systemUpdate => 'Mise à jour système';
	@override String get noMessagesYet => 'Pas encore de messages';
}

// Path: home.ui_sections_home_stats_section
class _TranslationsHomeUiSectionsHomeStatsSectionFr extends TranslationsHomeUiSectionsHomeStatsSectionEn {
	_TranslationsHomeUiSectionsHomeStatsSectionFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get allFactionsTotal => 'Toutes les factions au total';
	@override String get allFactionsAvg => 'Moyenne de toutes les factions';
	@override String get allFactionsTotal2 => 'Toutes les factions au total';
	@override String get allFactionsAvg2 => 'Moyenne de toutes les factions';
	@override String get absoluteNumberOfWinsForEachFaction => 'Nombre absolu de victoires pour chaque faction.';
	@override String get totalWins => 'Total des gains';
	@override String get averageScorePerFactionWhenPointsWereTracked => 'Score moyen par faction lorsque les points ont été suivis.';
	@override String get averagePoints => 'Points moyens';
	@override String get howOftenEachFactionAppearsInCompletedGames => 'La fréquence à laquelle chaque faction apparaît dans les parties terminées.';
	@override String get playedGames => 'Jeux joués';
	@override String get whoIsWinningTheMostOftenRightNow => 'Qui gagne le plus souvent en ce moment.';
	@override String get factionWinRate => 'Taux de victoire des factions';
}

// Path: home.ui_screens_home_screen
class _TranslationsHomeUiScreensHomeScreenFr extends TranslationsHomeUiScreensHomeScreenEn {
	_TranslationsHomeUiScreensHomeScreenFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get yourPersonalFactionPerformanceAndMatchProfile => 'Vos performances personnelles de faction et votre profil de match.';
	@override String get myStats => 'Mes statistiques';
	@override String get factionPerformanceFromAllPlayedMatchesInRootHub => 'Performance des factions sur toutes les parties jouées dans Root Hub.';
	@override String get communityStats => 'Statistiques de la communauté';
}

// Path: home.ui_widgets_home_stats_pie_chart_widget
class _TranslationsHomeUiWidgetsHomeStatsPieChartWidgetFr extends TranslationsHomeUiWidgetsHomeStatsPieChartWidgetEn {
	_TranslationsHomeUiWidgetsHomeStatsPieChartWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get noValuesForThisMetricYet => 'Aucune valeur pour cette métrique pour l\'instant.';
}

// Path: match.ui_sheets_match_edit_table_error_widget
class _TranslationsMatchUiSheetsMatchEditTableErrorWidgetFr extends TranslationsMatchUiSheetsMatchEditTableErrorWidgetEn {
	_TranslationsMatchUiSheetsMatchEditTableErrorWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get close => 'Fermer';
}

// Path: match.ui_sheets_match_edit_table_loading_widget
class _TranslationsMatchUiSheetsMatchEditTableLoadingWidgetFr extends TranslationsMatchUiSheetsMatchEditTableLoadingWidgetEn {
	_TranslationsMatchUiSheetsMatchEditTableLoadingWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get loadingTableDetails => 'Chargement des détails de la partie...';
}

// Path: match.ui_sheets_match_table_info_sheet
class _TranslationsMatchUiSheetsMatchTableInfoSheetFr extends TranslationsMatchUiSheetsMatchTableInfoSheetEn {
	_TranslationsMatchUiSheetsMatchTableInfoSheetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get remove => 'Retirer';
	@override String get cancel => 'Annuler';
	@override String get rejoinIfSeatsAreStillAvailable => 'rejoignez-nous si des places sont encore disponibles.';
	@override String get cancel2 => 'Annuler';
	@override String get selectAPlayerToRemoveFromTheTable => 'Sélectionnez un joueur à retirer de la partie.';
	@override String get removeAPlayer => 'Supprimer un joueur';
	@override String get leave => 'Partir';
	@override String get cancel3 => 'Annuler';
	@override String get playersListYouCanRejoinLaterIfSeatsAreStillAvailable => 'liste des joueurs. Vous pourrez revenir plus tard si des places sont encore disponibles.';
	@override String get youWillBeUnsubscribedFromThisMatchAndRemovedFromThe => 'Vous serez désabonné de cette partie et supprimé du';
	@override String get leaveThisTable => 'Quitter cette partie ?';
	@override String get unableToLoadTableDetails => 'Impossible de charger les détails de la partie.';
	@override String get tableNotFound => 'Partie introuvable';
}

// Path: match.ui_sheets_match_table_info_content_widget
class _TranslationsMatchUiSheetsMatchTableInfoContentWidgetFr extends TranslationsMatchUiSheetsMatchTableInfoContentWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoContentWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get noPlayersHaveJoinedThisTableYet => 'Aucun joueur n\'a encore rejoint cette partie.';
	@override String get theseAreTheCurrentPlayersThatWillParticipate => 'Ce sont les joueurs actuels qui participeront.';
	@override String get noPlayersSubscribedYet => 'Aucun joueur abonné pour l\'instant.';
	@override String get playersInThisMatch => 'Joueurs dans cette partie';
	@override String get unknownHost => 'Hôte inconnu';
	@override String get tableDetails => 'Détails de la partie';
}

// Path: match.ui_sheets_match_table_info_error_widget
class _TranslationsMatchUiSheetsMatchTableInfoErrorWidgetFr extends TranslationsMatchUiSheetsMatchTableInfoErrorWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoErrorWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get retry => 'Réessayer';
	@override String get close => 'Fermer';
}

// Path: match.ui_sheets_match_table_info_participant_card_widget
class _TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetFr extends TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get favoriteFaction => 'Faction préférée';
}

// Path: match.ui_sheets_match_edit_table_sheet
class _TranslationsMatchUiSheetsMatchEditTableSheetFr extends TranslationsMatchUiSheetsMatchEditTableSheetEn {
	_TranslationsMatchUiSheetsMatchEditTableSheetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get theScheduledTimeCannotBeMoreThan => 'L\'heure prévue ne peut pas être supérieure à';
	@override String get dateIsTooFar => 'La date est trop loin';
	@override String get theScheduledTimeMustBeAtLeast => 'L\'heure prévue doit être au moins';
	@override String get timeIsTooSoon => 'Le temps est trop tôt';
	@override String get youCannotSetTheMaximumBelowThatNumber => 'Vous ne pouvez pas définir le maximum en dessous de ce nombre.';
	@override String get tooManyPlayersSubscribed => 'Trop de joueurs abonnés';
	@override String get withMinimumNotGreaterThanMaximum => 'avec un minimum pas supérieur au maximum.';
	@override String get playersRangeMustBeBetween2And6 => 'La gamme de joueurs doit être comprise entre 2 et 6,';
	@override String get invalidPlayersRange => 'Plage de joueurs invalide';
	@override String get pleaseAddATitleForYourTable => 'Veuillez ajouter un titre pour votre partie.';
	@override String get titleRequired => 'Titre requis';
	@override String get unableToLoadTableDetails => 'Impossible de charger les détails de la partie.';
	@override String get tableNotFound => 'Partie introuvable';
}

// Path: match.ui_sheets_match_table_info_loading_widget
class _TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetFr extends TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get loadingTableDetails => 'Chargement des détails de la partie...';
}

// Path: match.ui_sheets_match_edit_table_form_widget
class _TranslationsMatchUiSheetsMatchEditTableFormWidgetFr extends TranslationsMatchUiSheetsMatchEditTableFormWidgetEn {
	_TranslationsMatchUiSheetsMatchEditTableFormWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get saveChanges => 'Enregistrer les modifications';
	@override String get saving => 'Économie...';
	@override String get cancel => 'Annuler';
	@override String get mustBeAtLeast10MinutesFromNowUpTo => 'Cela doit être dans au moins 10 minutes, jusqu\'à';
	@override String get schedule => 'Calendrier';
	@override String get maximum => 'Maximum';
	@override String get minimum => 'Minimum';
	@override String get setBetween2And6Players => 'Se déroule entre 2 et 6 joueurs.';
	@override String get playersRange => 'Gamme de joueurs';
	@override String get exampleWeHaveMarauderExpansion => 'Exemple : nous avons l’extension Marauder.';
	@override String get extraDetailsLikeExpansionsParkingTipsEtc => 'Détails supplémentaires comme les extensions, les conseils de stationnement, etc.';
	@override String get descriptionOptional => 'Description (facultatif)';
	@override String get exampleSaturdayRootAtLanternCaf => 'Exemple : ROOT du samedi au Lantern Café';
	@override String get aShortNameSoPlayersCanFindYourTable => 'Un nom court pour que les joueurs puissent trouver votre partie.';
	@override String get tableTitle => 'Titre de la partie';
	@override String get newPlayersCanStillJoinThisTable => 'De nouveaux joueurs peuvent toujours rejoindre cette partie.';
	@override String get newPlayersCannotJoinThisTable => 'Les nouveaux joueurs ne peuvent pas rejoindre cette partie.';
	@override String get closeSubscriptions => 'Fermer les inscriptions';
	@override String get editDetails => 'Modifier les détails';
	@override String get editTable => 'Modifier la partie';
}

// Path: match.ui_sheets_match_table_info_bottom_actions_widget
class _TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetFr extends TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get removePlayer => 'Supprimer un joueur';
	@override String get removing => 'Suppression...';
	@override String get leaveTable => 'Quitter la partie';
	@override String get leaving => 'Sortie...';
	@override String get close => 'Fermer';
}

// Path: match.ui_screens_match_create_table_location_loading_search_widget
class _TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetFr extends TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get searchingLocations => 'Recherche d\'emplacements...';
}

// Path: match.ui_screens_match_create_table_location_screen
class _TranslationsMatchUiScreensMatchCreateTableLocationScreenFr extends TranslationsMatchUiScreensMatchCreateTableLocationScreenEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationScreenFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get previouslySelectedLocations => 'Emplacements précédemment sélectionnés';
	@override String get searchResults => 'Résultats de la recherche';
	@override String get tapALocationToSelectItPreviouslySelectedLocationsAreSavedHereForFasterHo => 'Appuyez sur un emplacement pour le sélectionner. Les emplacements précédemment sélectionnés sont enregistrés ici pour un hébergement plus rapide.';
	@override String get searchLocationGooglePlaces => 'Localisation de recherche (Google Places)';
	@override String get chooseTableLocation => 'Choisir l\'emplacement de la partie';
	@override String get chooseOneLocationFromTheListBeforeCreatingTheTable => 'Choisissez un lieu dans la liste avant de créer la partie.';
	@override String get locationRequired => 'Emplacement requis';
	@override String get continueButton => 'Continuer';
}

// Path: match.ui_screens_match_join_sheet_error_widget
class _TranslationsMatchUiScreensMatchJoinSheetErrorWidgetFr extends TranslationsMatchUiScreensMatchJoinSheetErrorWidgetEn {
	_TranslationsMatchUiScreensMatchJoinSheetErrorWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get retry => 'Réessayer';
	@override String get close => 'Fermer';
}

// Path: match.ui_screens_match_screen
class _TranslationsMatchUiScreensMatchScreenFr extends TranslationsMatchUiScreensMatchScreenEn {
	_TranslationsMatchUiScreensMatchScreenFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get unableToOpenTheDialerRightNow => 'Impossible d\'ouvrir le composeur pour le moment.';
	@override String get invalidPhoneNumberFormat => 'Format de numéro de téléphone invalide.';
	@override String get unableToOpenTheLinkRightNow => 'Impossible d\'ouvrir le lien pour le moment.';
	@override String get invalidUrlFormat => 'Format d\'URL invalide.';
	@override String get close => 'Fermer';
	@override String get manualLocationNotes => 'Notes de localisation manuelles';
	@override String get phone => 'Téléphone';
	@override String get phone2 => 'Téléphone';
	@override String get website => 'Site web';
	@override String get website2 => 'Site web';
	@override String get mapLink => 'Lien vers la carte';
	@override String get mapLink2 => 'Lien vers la carte';
	@override String get public => 'Publique';
	@override String get private => 'Privé';
	@override String get matchesPlayedHere => 'parties joués ici';
	@override String get matchPlayedHere => 'partie joué ici';
	@override String get hostTable => 'Créer une partie';
	@override String get reportResult => 'Enregistrer le résultat';
}

// Path: match.ui_screens_match_loading_error_state_widget
class _TranslationsMatchUiScreensMatchLoadingErrorStateWidgetFr extends TranslationsMatchUiScreensMatchLoadingErrorStateWidgetEn {
	_TranslationsMatchUiScreensMatchLoadingErrorStateWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get tryAgain => 'Essayer à nouveau';
}

// Path: match.ui_screens_match_nearby_header_widget
class _TranslationsMatchUiScreensMatchNearbyHeaderWidgetFr extends TranslationsMatchUiScreensMatchNearbyHeaderWidgetEn {
	_TranslationsMatchUiScreensMatchNearbyHeaderWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get onlyTablesThatDidNotStartMoreThan2HoursAgoAreListed => 'Seules les parties qui n\'ont pas démarré il y a plus de 2 heures sont répertoriées.';
	@override String get nearbyMatchTables => 'Parties proches';
	@override String get matchFinder => 'Trouver des parties';
	@override String get setProfileLocation => 'Définissez la position du profil';
	@override String searchAreaKm({required Object ratioKm}) => '${ratioKm} km de rayon';
}

// Path: match.ui_screens_match_no_matches_state_widget
class _TranslationsMatchUiScreensMatchNoMatchesStateWidgetFr extends TranslationsMatchUiScreensMatchNoMatchesStateWidgetEn {
	_TranslationsMatchUiScreensMatchNoMatchesStateWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get hostTheFirstTable => 'Créez la première partie';
	@override String get beTheFirstToStartOneHostANewTableSoNearbyPlayersCanSubscribe => 'Soyez le premier à en lancer une. Créez une nouvella partie pour que les joueurs proches puissent s’inscrire.';
	@override String get noTablesInYourAreaYet => 'Pas encore de parties dans votre région';
}

// Path: match.ui_screens_match_time_status_chip_widget
class _TranslationsMatchUiScreensMatchTimeStatusChipWidgetFr extends TranslationsMatchUiScreensMatchTimeStatusChipWidgetEn {
	_TranslationsMatchUiScreensMatchTimeStatusChipWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get remainingTimeUntilTheMatchStarts => 'Temps restant jusqu\'au début de la partie.';
	@override String get thisMatchAlreadyStartedRecentlyStartedTablesStayVisibleForAShortPeriod => 'Ce partie a déjà commencé. Les parties récemment démarrées restent visibles pendant une courte période.';
}

// Path: match.ui_screens_match_create_table_location_no_search_results_widget
class _TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetFr extends TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get noLocationsFoundForThisQueryTryAnotherPlaceNameOrArea => 'Aucun emplacement trouvé pour cette requête. Essayez un autre nom de lieu ou une autre zone.';
}

// Path: match.ui_screens_match_create_table_screen
class _TranslationsMatchUiScreensMatchCreateTableScreenFr extends TranslationsMatchUiScreensMatchCreateTableScreenEn {
	_TranslationsMatchUiScreensMatchCreateTableScreenFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get noIAmOnlyHostingThisTable => 'Non, j\'héberge seulement cette partie';
	@override String get yesIWillPlayThisMatch => 'Oui, je jouerai cette partie';
	@override String get ifYouAreAVenueBoardGameClubOrOrganizerBringingPlayersTogetherButNotJoini => 'Si vous êtes un lieu, un club de jeux de société ou un organisateur réunissant des joueurs mais ne rejoignant pas la partie, laissez cette case décochée.';
	@override String get willYouTheHostPlay => 'Allez-vous, l\'hôte, jouer ?';
	@override String get pickTheDayAndStartHourChooseATimeYouCanReliablyShowUp => 'Choisissez le jour et l\'heure de début. Choisissez une heure à laquelle vous pouvez vous présenter de manière fiable.';
	@override String get schedule => 'Calendrier';
	@override String get maximum => 'Maximum';
	@override String get minimum => 'Minimum';
	@override String get defaultIs34YouCanSetBetween2And6Players => 'La valeur par défaut est 3-4. Vous pouvez définir entre 2 et 6 joueurs.';
	@override String get playersRange => 'Gamme de joueurs';
	@override String get exampleWeHaveMarauderExpansionAndSpareSleeves => 'Exemple : Nous avons une extension Marauder et des manchons de rechange.';
	@override String get addExtraDetailsLikeExpansionsAvailableParkingTipsOrReferencePoints => 'Ajoutez des détails supplémentaires tels que des extensions disponibles, des conseils de stationnement ou des points de référence.';
	@override String get descriptionOptional => 'Description (facultatif)';
	@override String get exampleSaturdayRootAtLanternCaf => 'Exemple : ROOT du samedi au Lantern Café';
	@override String get thisCanBeAnythingThatHelpsIdentifyTheTableLikeAPlaceNameOrEventStyle => 'Il peut s\'agir de tout ce qui permet d\'identifier la partie, comme le nom d\'un lieu ou le style d\'un événement.';
	@override String get tableTitle => 'Titre de la partie';
	@override String get setTableDetailsFirstOnTheNextScreenYouWillChooseTheLocation => 'Définissez d’abord les détails de la partie. Sur l’écran suivant, vous choisirez le lieu.';
	@override String get hostANewTable => 'Créer une nouvella partie';
	@override String get selectTheStartHourForThisTableBeforeContinuing => 'Sélectionnez l’heure de début de cette partie avant de continuer.';
	@override String get startHourRequired => 'Heure de début requise';
	@override String get youCannotSelectADayInThePast => 'Vous ne pouvez pas sélectionner un jour dans le passé.';
	@override String get invalidDate => 'Date invalide';
	@override String get selectTheDayForThisTableBeforeContinuing => 'Sélectionnez le jour de cette partie avant de continuer.';
	@override String get dayRequired => 'Jour requis';
	@override String get addATitleSoPlayersCanQuicklyIdentifyYourTableExampleDowntownCafNight => 'Ajoutez un titre pour que les joueurs puissent identifier rapidement votre partie. Exemple : « Soirée au café du centre-ville ».';
	@override String get titleRequired => 'Titre requis';
	@override String get youCannotSelectADayInThePast2 => 'Vous ne pouvez pas sélectionner un jour dans le passé.';
	@override String get invalidDate2 => 'Date invalide';
	@override String get continueButton => 'Continuer';
}

// Path: match.ui_screens_match_chat_loading_error_state_widget
class _TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetFr extends TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetEn {
	_TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get tryAgain => 'Essayer à nouveau';
}

// Path: match.ui_screens_match_report_available_chip_widget
class _TranslationsMatchUiScreensMatchReportAvailableChipWidgetFr extends TranslationsMatchUiScreensMatchReportAvailableChipWidgetEn {
	_TranslationsMatchUiScreensMatchReportAvailableChipWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get reportAvailable => 'Rapport disponible';
	@override String get youCanReportThisMatchResultNow => 'Vous pouvez signaler ce résultat de partie maintenant.';
}

// Path: match.ui_screens_match_initial_loading_state_widget
class _TranslationsMatchUiScreensMatchInitialLoadingStateWidgetFr extends TranslationsMatchUiScreensMatchInitialLoadingStateWidgetEn {
	_TranslationsMatchUiScreensMatchInitialLoadingStateWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get loadingNearbyTables => 'Chargement des parties à proximité...';
}

// Path: match.ui_screens_match_participant_card_widget
class _TranslationsMatchUiScreensMatchParticipantCardWidgetFr extends TranslationsMatchUiScreensMatchParticipantCardWidgetEn {
	_TranslationsMatchUiScreensMatchParticipantCardWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get favoriteFaction => 'Faction préférée';
}

// Path: match.ui_screens_match_join_sheet_content_widget
class _TranslationsMatchUiScreensMatchJoinSheetContentWidgetFr extends TranslationsMatchUiScreensMatchJoinSheetContentWidgetEn {
	_TranslationsMatchUiScreensMatchJoinSheetContentWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get confirmJoin => 'Confirmer l\'adhésion';
	@override String get subscriptionsClosed => 'Inscriptions clôturées';
	@override String get alreadySubscribed => 'Déjà abonné';
	@override String get cancel => 'Annuler';
	@override String get youCanBeTheFirstPlayerToLockThisTableIn => 'Vous pouvez être le premier joueur à verrouiller cette partie.';
	@override String get theseAreTheCurrentPlayersThatWillParticipate => 'Ce sont les joueurs actuels qui participeront.';
	@override String get noPlayersSubscribedYet => 'Aucun joueur abonné pour l\'instant.';
	@override String get playersInThisMatch => 'Joueurs dans cette partie';
	@override String get unknownHost => 'Hôte inconnu';
	@override String get seeTableChat => 'Voir le chat en partie';
	@override String get newPlayersCannotJoinAtThisTime => 'Les nouveaux joueurs ne peuvent pas s\'inscrire pour le moment.';
	@override String get theHostHasClosedSubscriptionsForThisTable => 'L\'hôte a fermé les abonnements pour cette partie.';
	@override String get confirmTableSubscription => 'Confirmer l\'abonnement à la partie';
}

// Path: match.ui_screens_match_table_card_widget
class _TranslationsMatchUiScreensMatchTableCardWidgetFr extends TranslationsMatchUiScreensMatchTableCardWidgetEn {
	_TranslationsMatchUiScreensMatchTableCardWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get subscribed => 'Abonné';
	@override String get tapCardToOpenChat => 'Appuyez sur la carte pour ouvrir le chat';
	@override String get subscriptionsClosed => 'Inscriptions clôturées';
	@override String get openFullLocationDetails => 'Ouvrir les détails complets de l\'emplacement';
	@override String get places => 'places';
	@override String get place => 'place';
	@override String get s => 's';
	@override String get joining => 'Connexion...';
	@override String get closed => 'Fermée';
	@override String get tableFull => 'Partie complète';
	@override String get joinTable => 'Rejoindre la partie';
	@override String get unknownLocation => 'Lieu non renseigné';
	@override String get addressUnavailable => 'Adresse indisponible';
	@override String get player => 'joueur';
	@override String get players => 'joueurs';
	@override String subscriptionTooltip({required Object subscribedPlayersCount, required Object playersWord, required Object remainingSeats, required Object placesWord}) => '${subscribedPlayersCount} ${playersWord} inscrits et ${remainingSeats} ${placesWord} restantes pour fermer la partie.';
}

// Path: match.ui_screens_match_location_header_image_widget
class _TranslationsMatchUiScreensMatchLocationHeaderImageWidgetFr extends TranslationsMatchUiScreensMatchLocationHeaderImageWidgetEn {
	_TranslationsMatchUiScreensMatchLocationHeaderImageWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get locationDetails => 'Détails de l\'emplacement';
}

// Path: match.ui_screens_match_create_table_location_no_recent_locations_widget
class _TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetFr extends TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get noPreviousLocationsYetSearchAndSelectOneAbove => 'Aucun emplacement précédent pour l\'instant. Recherchez et sélectionnez-en un ci-dessus.';
}

// Path: match.ui_screens_match_chat_screen
class _TranslationsMatchUiScreensMatchChatScreenFr extends TranslationsMatchUiScreensMatchChatScreenEn {
	_TranslationsMatchUiScreensMatchChatScreenFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get chooseFromGallery => 'Choisissez dans la galerie';
	@override String get takePhoto => 'Prendre une photo';
	@override String get cancel => 'Annuler';
	@override String get chooseFromLibrary => 'Choisissez dans la bibliothèque';
	@override String get takePhoto2 => 'Prendre une photo';
	@override String get sendAPhoto => 'Envoyer une photo';
	@override String get compress => 'Compresse';
	@override String get cancel2 => 'Annuler';
	@override String get imageIsTooLarge => 'L\'image est trop grande';
	@override String get subscribed => 'Abonné';
	@override String get unableToResolveYourAccountInformation => 'Impossible de résoudre les informations de votre compte.';
	@override String get tableInfo => 'Infos de la partie';
	@override String get playedMatchInfo => 'Infos de la partie terminée';
	@override String get editTable => 'Modifier la partie';
}

// Path: match.ui_dialogs_match_played_match_summary_dialog
class _TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogFr extends TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogEn {
	_TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get completedMatchReport => 'Rapport de Partie Terminée';
	@override String get winner => 'Vainqueur';
	@override String get notAvailable => 'Non disponible';
	@override String startedAtLabel({required Object value}) => 'Début : ${value}';
	@override String durationLabel({required Object value}) => 'Durée : ${value}';
	@override String scheduledAtLabel({required Object value}) => 'Planifiée : ${value}';
	@override String get matchProofs => 'Preuves de la Partie';
	@override String get players => 'Joueurs';
	@override String get domination => 'Domination';
	@override String scoreLabel({required Object value}) => '${value} pts';
	@override String get close => 'Fermer';
	@override String hoursMinutes({required Object hours, required Object minutes}) => '${hours}h ${minutes}m';
}

// Path: match.ui_screens_match_create_table_location_loading_recent_widget
class _TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetFr extends TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get loadingPreviousLocations => 'Chargement des emplacements précédents...';
}

// Path: register_match.ui_sheets_register_match_wizard_winner_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionFr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get dominance => 'Dominance';
	@override String get totalPoints30 => 'Total de points (30)';
	@override String get dominanceMeansTheWinnerCompletedADominanceCardObjectiveInsteadOfWinningB => 'Domination signifie que le vainqueur a atteint un objectif de carte Domination au lieu de gagner par points.';
	@override String get totalPointsMeansTheWinnerReached30VictoryPointsOnTheScoreTrack => 'Le total des points signifie que le vainqueur a atteint 30 points de victoire sur la piste de score.';
	@override String get howDidTheWinnerWon => 'Comment le gagnant a-t-il gagné ?';
	@override String get pickThePlayerWhoWonThisMatch => 'Choisissez le joueur qui a gagné ce match.';
}

// Path: register_match.ui_sheets_register_match_wizard_timing_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionFr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get estimatedDuration => 'Durée estimée';
	@override String get estimatedDuration2 => 'Durée estimée';
	@override String get setTheEstimatedDurationAdjustIn15MinuteStepsMax8Hours => 'Définissez la durée estimée. Ajustez par étapes de 15 minutes (max 8 heures).';
	@override String get changeTime => 'Changer l\'heure';
	@override String get matchStartedAt => 'Le match a commencé à';
	@override String get setTheTimeTheMatchActuallyStarted => 'Réglez l’heure à laquelle le match a réellement commencé.';
}

// Path: register_match.ui_sheets_register_match_wizard_participants_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionFr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get addRegisteredPlayerFromPlatform => 'Ajouter un joueur enregistré depuis la plateforme';
	@override String get addAnonymousPlayer => 'Ajouter un joueur anonyme';
	@override String get registeredPlayer => 'Joueur inscrit';
	@override String get anonymousPlayer => 'Joueur anonyme';
	@override String get selectRegisteredPlayersWhoWerePresentYouCanAddAnonymousPlayersOrSearchFo => 'Sélectionnez les joueurs inscrits qui étaient présents. Vous pouvez ajouter des joueurs anonymes ou rechercher d\'autres joueurs enregistrés.';
	@override String get value1WhoActuallyPlayed => '1) Qui a réellement joué ?';
}

// Path: register_match.ui_sheets_register_match_picker_error_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionFr extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get retry => 'Réessayer';
}

// Path: register_match.ui_sheets_register_match_picker_match_item_card
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardFr extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get notAvailableYet => 'Pas encore disponible';
	@override String get tapToReport => 'Appuyez pour signaler';
}

// Path: register_match.ui_sheets_register_match_wizard_factions_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionFr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get selectFaction => 'Sélectionnez une faction';
	@override String get faction => 'Faction';
	@override String get chooseTheFactionUsedByEachPlayerInThisMatch => 'Choisissez la faction utilisée par chaque joueur dans ce match.';
	@override String get value2SelectFactions => '2) Sélectionnez les factions';
}

// Path: register_match.ui_sheets_register_match_search_registered_player_sheet
class _TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetFr extends TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get tapToAdd => 'Appuyez pour ajouter';
	@override String get alreadyAddedToThisReport => 'Déjà ajouté à ce rapport';
	@override String get noRegisteredPlayersWereFound => 'Aucun joueur inscrit n\'a été trouvé.';
	@override String get searchByDisplayName => 'Rechercher par nom d\'affichage';
	@override String get addRegisteredPlayer => 'Ajouter un joueur enregistré';
}

// Path: register_match.ui_sheets_register_match_wizard_points_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionFr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get value0To29 => '0 à 29';
	@override String get points => 'Points';
	@override String get dominanceAttempt => 'Tentative de domination';
	@override String get winnerByDominance => 'Gagnant par domination';
	@override String get winnerByPoints => 'Gagnant aux points';
	@override String get failedDominance => 'Domination ratée';
	@override String get points2 => 'Points';
	@override String get winner => 'Gagnant';
	@override String get failedDominanceAlwaysCountsAsNoPoints => 'Une domination ratée compte toujours comme aucun point.';
	@override String get forEachNonWinnerSetPointsOrMarkFailedDominanceAttempt => 'Pour chaque non-gagnant, marquez des points ou marquez une tentative de domination ratée.';
}

// Path: register_match.ui_sheets_register_match_wizard_bottom_actions_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionFr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get submitReport => 'Soumettre le rapport';
	@override String get back => 'Dos';
	@override String get cancel => 'Annuler';
	@override String get continueButton => 'Continuer';
}

// Path: register_match.ui_sheets_register_match_picker_empty_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionFr extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get youDoNotHaveAnyHostedSubscribedMatchPendingResultRegistration => 'Vous n\'avez aucun match hébergé/abonné en attente d\'enregistrement des résultats.';
	@override String get noPendingMatches => 'Aucun match en attente';
}

// Path: register_match.ui_sheets_register_match_wizard_loading_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionFr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get loadingMatchDetails => 'Chargement des détails du match...';
}

// Path: register_match.ui_sheets_register_match_picker_sheet
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetFr extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get youCanRegisterThisMatchFrom2HoursBeforeItsScheduledStart => 'Vous pouvez enregistrer ce match 2 heures avant son début prévu.';
	@override String get resultRegistrationNotAvailableYet => 'L\'enregistrement des résultats n\'est pas encore disponible';
}

// Path: register_match.ui_sheets_register_match_add_anonymous_player_sheet
class _TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetFr extends TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get tapToAdd => 'Appuyez pour ajouter';
	@override String get alreadyAddedToThisReport => 'Déjà ajouté à ce rapport';
	@override String get noAnonymousPlayersYetCreateOneUsingFirstAndLastName => 'Pas encore de joueurs anonymes. Créez-en un en utilisant le prénom et le nom.';
	@override String get createAndAddPlayer => 'Créer et ajouter un joueur';
	@override String get lastName => 'Nom de famille';
	@override String get firstName => 'Prénom';
	@override String get addAnonymousPlayer => 'Ajouter un joueur anonyme';
}

// Path: register_match.ui_sheets_register_match_wizard_top_bar_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionFr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get registerMatchResult => 'Enregistrer le résultat du match';
}

// Path: register_match.ui_sheets_register_match_wizard_error_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionFr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get close => 'Fermer';
	@override String get registerMatch => 'S\'inscrire';
}

// Path: register_match.ui_sheets_register_match_wizard_sheet
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetFr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get gallery => 'Galerie';
	@override String get camera => 'Caméra';
	@override String get cancel => 'Annuler';
	@override String get gallery2 => 'Galerie';
	@override String get camera2 => 'Caméra';
	@override String get selectSource => 'Sélectionnez la source';
	@override String get selectedImageIsEmptyChooseAnotherImage => 'L\'image sélectionnée est vide. Choisissez une autre image.';
	@override String get invalidImage => 'Image invalide';
	@override String get allowCameraAndPhotoPermissionsInSystemSettingsAndTryAgain => 'Autorisez les autorisations de l\'appareil photo et des photos dans les paramètres système et réessayez.';
	@override String get unableToAccessCameraOrGallery => 'Impossible d\'accéder à la caméra ou à la galerie';
	@override String get ok => 'D\'accord';
	@override String get takeASelfieWithEveryoneAtTheTableIfPossibleIncludeTheBoardInTheSamePhoto => 'Prenez un selfie avec tout le monde à table. Si possible, incluez le tableau sur la même photo.';
	@override String get groupSelfieProof => 'Preuve de selfie de groupe';
	@override String get completeAllReportStepsBeforeSubmitting => 'Terminez toutes les étapes du rapport avant de le soumettre.';
	@override String get incompleteReport => 'Rapport incomplet';
	@override String get addTheBoardPhotoBeforeContinuing => 'Ajoutez la photo du tableau avant de continuer.';
	@override String get boardPhotoRequired => 'Photo du tableau requise';
	@override String get addTheGroupSelfieBeforeContinuing => 'Ajoutez le selfie de groupe avant de continuer.';
	@override String get groupPhotoRequired => 'Photo de groupe obligatoire';
	@override String get matchDurationMustBeAtMost8Hours => 'La durée du match doit être au maximum de 8 heures.';
	@override String get invalidDuration => 'Durée invalide';
	@override String get matchDurationMustBeGreaterThanZero => 'La durée du match doit être supérieure à zéro.';
	@override String get invalidDuration2 => 'Durée invalide';
	@override String get matchStartTimeCannotBeInTheFuture => 'L’heure du début du match ne peut pas être postérieure.';
	@override String get invalidMatchRegistration => 'Inscription au match invalide';
	@override String get selectWhenThisMatchStarted => 'Sélectionnez quand ce match a commencé.';
	@override String get matchStartMissing => 'Début de match manquant';
	@override String get invalidPoints => 'Points invalides';
	@override String get pointsMissing => 'Points manquants';
	@override String get selectHowTheWinnerWonBeforeContinuing => 'Sélectionnez comment le gagnant a gagné avant de continuer.';
	@override String get winnerMethodMissing => 'Méthode gagnante manquante';
	@override String get selectTheWinnerBeforeContinuing => 'Sélectionnez le gagnant avant de continuer.';
	@override String get winnerMissing => 'Gagnant manquant';
	@override String get theSelectedWinnerIsNoLongerInTheParticipantList => 'Le gagnant sélectionné ne figure plus dans la liste des participants.';
	@override String get winnerMissing2 => 'Gagnant manquant';
	@override String get selectTheWinnerBeforeContinuing2 => 'Sélectionnez le gagnant avant de continuer.';
	@override String get winnerMissing3 => 'Gagnant manquant';
	@override String get invalidFactionSetup => 'Configuration de faction invalide';
	@override String get factionMissing => 'Faction disparue';
	@override String get selectAtLeast2ParticipantsRegisteredAndOrAnonymousToContinue => 'Sélectionnez au moins 2 participants (inscrits et/ou anonymes) pour continuer.';
	@override String get notEnoughPlayers => 'Pas assez de joueurs';
	@override String get edit => 'Modifier';
	@override String get youKeptTheDefaultDurationOf1HourDoYouWantToContinueWithIt => 'Vous avez conservé la durée par défaut de 1 heure. Voulez-vous continuer?';
	@override String get keepDefaultDuration => 'Conserver la durée par défaut ?';
	@override String get matchStartTimeCannotBeInTheFuture2 => 'L’heure du début du match ne peut pas être postérieure.';
	@override String get invalidMatchRegistration2 => 'Inscription au match invalide';
	@override String get matchStartTimeCannotBeInTheFuture3 => 'L’heure du début du match ne peut pas être postérieure.';
	@override String get invalidMatchRegistration3 => 'Inscription au match invalide';
	@override String get unableToLoadThisMatchReportFlow => 'Impossible de charger ce flux de rapport de partie.';
	@override String get matchNotFound => 'Partie introuvable';
	@override String get unableToLoadThisMatchReportFlow2 => 'Impossible de charger ce flux de rapport de partie.';
	@override String get invalidMatch => 'Partie invalide';
	@override String get continueButton => 'Continuer';
	@override String selectFactionForParticipantBeforeContinuing({required Object participantName}) => 'Sélectionnez une faction pour ${participantName} avant de continuer.';
	@override String factionWasSelectedMoreThanOnceEachFactionCanOnlyBeSelectedOnce({required Object factionName}) => '${factionName} a été sélectionnée plus d’une fois. Chaque faction ne peut être choisie qu’une seule fois.';
}

// Path: register_match.ui_sheets_register_match_wizard_review_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionFr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get boardPhoto => 'Photo du tableau';
	@override String get groupPhoto => 'Photo de groupe';
	@override String get socialProof => 'Preuve sociale';
	@override String get ranking => 'Classement';
	@override String get confirmAllDetailsBeforeLoggingThisMatch => 'Confirmez tous les détails avant d’enregistrer cette partie.';
}

// Path: register_match.ui_sheets_register_match_wizard_review_photo_tile
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileFr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get ready => 'Prêt';
	@override String get missing => 'Manquant';
}

// Path: register_match.ui_sheets_register_match_wizard_proof_card_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionFr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get tapToReplace => 'Appuyez pour remplacer';
	@override String get tapToAddPhoto => 'Appuyez pour ajouter une photo';
}

// Path: register_match.ui_sheets_register_match_picker_header_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionFr extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get selectAMatchYouParticipatedInYouCanRegisterAResultFrom2HoursBeforeSchedu => 'Sélectionnez un match auquel vous avez participé. Vous pouvez enregistrer un résultat 2 heures avant le début prévu.';
	@override String get registerMatchResult => 'Enregistrer le résultat du match';
}

// Path: register_match.ui_sheets_register_match_wizard_social_proof_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionFr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get captureTheBoardAndScoreTrackClearly => 'Capturez le tableau et marquez clairement la piste.';
	@override String get boardPhoto => 'Photo du tableau';
	@override String get uploadAPhotoOfTheBoardWithTheScoreTrackClearlyVisible => 'Téléchargez une photo du tableau avec la piste de score clairement visible.';
	@override String get boardPhotoProof => 'Preuve photo du tableau';
	@override String get selfieWithAllPlayersIncludeTheBoardIfPossible => 'Selfie avec tous les joueurs. Incluez le tableau si possible.';
	@override String get groupPhoto => 'Photo de groupe';
	@override String get uploadBothPhotosToConfirmThisMatchHappenedInPerson => 'Téléchargez les deux photos pour confirmer que cette partie a eu lieu en personne.';
}

// Path: shop.ui_screens_shop_screen
class _TranslationsShopUiScreensShopScreenFr extends TranslationsShopUiScreensShopScreenEn {
	_TranslationsShopUiScreensShopScreenFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get overviewTitle => 'Construisez votre collection Root';
	@override String get overviewDescription => 'Achetez le jeu de base et les extensions avec les détails localisés de la boîte et des raccourcis vers les marketplaces.';
	@override String get imageInteractionHint => 'Touchez une image pour l’ouvrir en plein écran avec zoom';
	@override String get catalogSectionTitle => 'Boîtes disponibles';
	@override String get catalogSectionDescription => 'Chaque carte inclut les factions, le contenu de la boîte et des liens d’achat.';
	@override String get whereToBuy => 'Où acheter';
	@override String buyAt({required Object store}) => 'Acheter sur ${store}';
	@override String get invalidStoreUrl => 'Ce lien de boutique est invalide.';
	@override String get unableToOpenStoreUrl => 'Impossible d’ouvrir ce lien de boutique pour le moment.';
	@override String get closeGallery => 'Fermer la galerie';
	@override String get noProductsAvailable => 'Aucun produit disponible pour cette langue pour le moment.';
	@override String get supporterPacksLinkedToCommunityTournaments => 'des packs de supporters liés aux tournois communautaires.';
	@override String get plannedThemedProfilePacksFactionCosmeticsAndEvent => 'Prévu : packs de profils thématiques, cosmétiques de faction et événement';
	@override String get roadmapPlaceholder => 'Espace réservé pour la feuille de route';
	@override String get communityDrivenBundlesForRootPlayers => 'packs communautaires pour les joueurs de ROOT.';
	@override String get thisAreaWillHostFutureDigitalGoodsCosmeticsAnd => 'Cet espace accueillera les futurs biens numériques, cosmétiques et';
	@override String get shopFeaturePlaceholder => 'Espace réservé aux fonctionnalités de la boutique';
}
