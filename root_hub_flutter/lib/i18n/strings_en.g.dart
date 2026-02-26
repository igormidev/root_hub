///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  );

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsAppEn app = TranslationsAppEn.internal(_root);
	late final TranslationsAuthEn auth = TranslationsAuthEn.internal(_root);
	late final TranslationsDashboardEn dashboard = TranslationsDashboardEn.internal(_root);
	late final TranslationsActivityEn activity = TranslationsActivityEn.internal(_root);
	late final TranslationsHomeEn home = TranslationsHomeEn.internal(_root);
	late final TranslationsMatchEn match = TranslationsMatchEn.internal(_root);
	late final TranslationsRegisterMatchEn register_match = TranslationsRegisterMatchEn.internal(_root);
	late final TranslationsShopEn shop = TranslationsShopEn.internal(_root);
}

// Path: app
class TranslationsAppEn {
	TranslationsAppEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Root Hub'
	String get rootHub => 'Root Hub';
}

// Path: auth
class TranslationsAuthEn {
	TranslationsAuthEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsAuthAuthOnboardingScreenEn auth_onboarding_screen = TranslationsAuthAuthOnboardingScreenEn.internal(_root);
	late final TranslationsAuthAuthOnboardingProfileScreenEn auth_onboarding_profile_screen = TranslationsAuthAuthOnboardingProfileScreenEn.internal(_root);
	late final TranslationsAuthAuthLoadingScreenEn auth_loading_screen = TranslationsAuthAuthLoadingScreenEn.internal(_root);
	late final TranslationsAuthAuthLoginScreenEn auth_login_screen = TranslationsAuthAuthLoginScreenEn.internal(_root);
	late final TranslationsAuthAuthOnboardingContinueButtonWidgetEn auth_onboarding_continue_button_widget = TranslationsAuthAuthOnboardingContinueButtonWidgetEn.internal(_root);
}

// Path: dashboard
class TranslationsDashboardEn {
	TranslationsDashboardEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsDashboardUiScreensDashboardScreenEn ui_screens_dashboard_screen = TranslationsDashboardUiScreensDashboardScreenEn.internal(_root);
	late final TranslationsDashboardUiScreensDashboardFactionEditorScreenEn ui_screens_dashboard_faction_editor_screen = TranslationsDashboardUiScreensDashboardFactionEditorScreenEn.internal(_root);
	late final TranslationsDashboardUiDialogsEditLocationDialogEn ui_dialogs_edit_location_dialog = TranslationsDashboardUiDialogsEditLocationDialogEn.internal(_root);
	late final TranslationsDashboardUiDialogsEditDisplayNameDialogEn ui_dialogs_edit_display_name_dialog = TranslationsDashboardUiDialogsEditDisplayNameDialogEn.internal(_root);
	late final TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetEn ui_widgets_dashboard_profile_drawer_widget = TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetEn.internal(_root);
}

// Path: activity
class TranslationsActivityEn {
	TranslationsActivityEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsActivityUiScreensActivityScreenEn ui_screens_activity_screen = TranslationsActivityUiScreensActivityScreenEn.internal(_root);
	late final TranslationsActivityUiWidgetsActivitySubscribedScheduleCardEn ui_widgets_activity_subscribed_schedule_card = TranslationsActivityUiWidgetsActivitySubscribedScheduleCardEn.internal(_root);
	late final TranslationsActivityUiWidgetsActivityChatCardEn ui_widgets_activity_chat_card = TranslationsActivityUiWidgetsActivityChatCardEn.internal(_root);
}

// Path: home
class TranslationsHomeEn {
	TranslationsHomeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsHomeUiSectionsHomeStatsSectionEn ui_sections_home_stats_section = TranslationsHomeUiSectionsHomeStatsSectionEn.internal(_root);
	late final TranslationsHomeUiScreensHomeScreenEn ui_screens_home_screen = TranslationsHomeUiScreensHomeScreenEn.internal(_root);
	late final TranslationsHomeUiWidgetsHomeStatsPieChartWidgetEn ui_widgets_home_stats_pie_chart_widget = TranslationsHomeUiWidgetsHomeStatsPieChartWidgetEn.internal(_root);
}

// Path: match
class TranslationsMatchEn {
	TranslationsMatchEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsMatchUiSheetsMatchEditTableErrorWidgetEn ui_sheets_match_edit_table_error_widget = TranslationsMatchUiSheetsMatchEditTableErrorWidgetEn.internal(_root);
	late final TranslationsMatchUiSheetsMatchEditTableLoadingWidgetEn ui_sheets_match_edit_table_loading_widget = TranslationsMatchUiSheetsMatchEditTableLoadingWidgetEn.internal(_root);
	late final TranslationsMatchUiSheetsMatchTableInfoSheetEn ui_sheets_match_table_info_sheet = TranslationsMatchUiSheetsMatchTableInfoSheetEn.internal(_root);
	late final TranslationsMatchUiSheetsMatchTableInfoContentWidgetEn ui_sheets_match_table_info_content_widget = TranslationsMatchUiSheetsMatchTableInfoContentWidgetEn.internal(_root);
	late final TranslationsMatchUiSheetsMatchTableInfoErrorWidgetEn ui_sheets_match_table_info_error_widget = TranslationsMatchUiSheetsMatchTableInfoErrorWidgetEn.internal(_root);
	late final TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetEn ui_sheets_match_table_info_participant_card_widget = TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetEn.internal(_root);
	late final TranslationsMatchUiSheetsMatchEditTableSheetEn ui_sheets_match_edit_table_sheet = TranslationsMatchUiSheetsMatchEditTableSheetEn.internal(_root);
	late final TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetEn ui_sheets_match_table_info_loading_widget = TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetEn.internal(_root);
	late final TranslationsMatchUiSheetsMatchEditTableFormWidgetEn ui_sheets_match_edit_table_form_widget = TranslationsMatchUiSheetsMatchEditTableFormWidgetEn.internal(_root);
	late final TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetEn ui_sheets_match_table_info_bottom_actions_widget = TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetEn.internal(_root);
	late final TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetEn ui_screens_match_create_table_location_loading_search_widget = TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetEn.internal(_root);
	late final TranslationsMatchUiScreensMatchCreateTableLocationScreenEn ui_screens_match_create_table_location_screen = TranslationsMatchUiScreensMatchCreateTableLocationScreenEn.internal(_root);
	late final TranslationsMatchUiScreensMatchJoinSheetErrorWidgetEn ui_screens_match_join_sheet_error_widget = TranslationsMatchUiScreensMatchJoinSheetErrorWidgetEn.internal(_root);
	late final TranslationsMatchUiScreensMatchScreenEn ui_screens_match_screen = TranslationsMatchUiScreensMatchScreenEn.internal(_root);
	late final TranslationsMatchUiScreensMatchLoadingErrorStateWidgetEn ui_screens_match_loading_error_state_widget = TranslationsMatchUiScreensMatchLoadingErrorStateWidgetEn.internal(_root);
	late final TranslationsMatchUiScreensMatchNearbyHeaderWidgetEn ui_screens_match_nearby_header_widget = TranslationsMatchUiScreensMatchNearbyHeaderWidgetEn.internal(_root);
	late final TranslationsMatchUiScreensMatchNoMatchesStateWidgetEn ui_screens_match_no_matches_state_widget = TranslationsMatchUiScreensMatchNoMatchesStateWidgetEn.internal(_root);
	late final TranslationsMatchUiScreensMatchTimeStatusChipWidgetEn ui_screens_match_time_status_chip_widget = TranslationsMatchUiScreensMatchTimeStatusChipWidgetEn.internal(_root);
	late final TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetEn ui_screens_match_create_table_location_no_search_results_widget = TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetEn.internal(_root);
	late final TranslationsMatchUiScreensMatchCreateTableScreenEn ui_screens_match_create_table_screen = TranslationsMatchUiScreensMatchCreateTableScreenEn.internal(_root);
	late final TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetEn ui_screens_match_chat_loading_error_state_widget = TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetEn.internal(_root);
	late final TranslationsMatchUiScreensMatchReportAvailableChipWidgetEn ui_screens_match_report_available_chip_widget = TranslationsMatchUiScreensMatchReportAvailableChipWidgetEn.internal(_root);
	late final TranslationsMatchUiScreensMatchInitialLoadingStateWidgetEn ui_screens_match_initial_loading_state_widget = TranslationsMatchUiScreensMatchInitialLoadingStateWidgetEn.internal(_root);
	late final TranslationsMatchUiScreensMatchParticipantCardWidgetEn ui_screens_match_participant_card_widget = TranslationsMatchUiScreensMatchParticipantCardWidgetEn.internal(_root);
	late final TranslationsMatchUiScreensMatchJoinSheetContentWidgetEn ui_screens_match_join_sheet_content_widget = TranslationsMatchUiScreensMatchJoinSheetContentWidgetEn.internal(_root);
	late final TranslationsMatchUiScreensMatchTableCardWidgetEn ui_screens_match_table_card_widget = TranslationsMatchUiScreensMatchTableCardWidgetEn.internal(_root);
	late final TranslationsMatchUiScreensMatchLocationHeaderImageWidgetEn ui_screens_match_location_header_image_widget = TranslationsMatchUiScreensMatchLocationHeaderImageWidgetEn.internal(_root);
	late final TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetEn ui_screens_match_create_table_location_no_recent_locations_widget = TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetEn.internal(_root);
	late final TranslationsMatchUiScreensMatchChatScreenEn ui_screens_match_chat_screen = TranslationsMatchUiScreensMatchChatScreenEn.internal(_root);
	late final TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogEn ui_dialogs_match_played_match_summary_dialog = TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogEn.internal(_root);
	late final TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetEn ui_screens_match_create_table_location_loading_recent_widget = TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetEn.internal(_root);
}

// Path: register_match
class TranslationsRegisterMatchEn {
	TranslationsRegisterMatchEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionEn ui_sheets_register_match_wizard_winner_step_section = TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionEn.internal(_root);
	late final TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionEn ui_sheets_register_match_wizard_timing_step_section = TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionEn.internal(_root);
	late final TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionEn ui_sheets_register_match_wizard_participants_step_section = TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionEn.internal(_root);
	late final TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionEn ui_sheets_register_match_picker_error_section = TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionEn.internal(_root);
	late final TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardEn ui_sheets_register_match_picker_match_item_card = TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardEn.internal(_root);
	late final TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionEn ui_sheets_register_match_wizard_factions_step_section = TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionEn.internal(_root);
	late final TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetEn ui_sheets_register_match_search_registered_player_sheet = TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetEn.internal(_root);
	late final TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionEn ui_sheets_register_match_wizard_points_step_section = TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionEn.internal(_root);
	late final TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionEn ui_sheets_register_match_wizard_bottom_actions_section = TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionEn.internal(_root);
	late final TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionEn ui_sheets_register_match_picker_empty_section = TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionEn.internal(_root);
	late final TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionEn ui_sheets_register_match_wizard_loading_section = TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionEn.internal(_root);
	late final TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetEn ui_sheets_register_match_picker_sheet = TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetEn.internal(_root);
	late final TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetEn ui_sheets_register_match_add_anonymous_player_sheet = TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetEn.internal(_root);
	late final TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionEn ui_sheets_register_match_wizard_top_bar_section = TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionEn.internal(_root);
	late final TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionEn ui_sheets_register_match_wizard_error_section = TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionEn.internal(_root);
	late final TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetEn ui_sheets_register_match_wizard_sheet = TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetEn.internal(_root);
	late final TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionEn ui_sheets_register_match_wizard_review_step_section = TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionEn.internal(_root);
	late final TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileEn ui_sheets_register_match_wizard_review_photo_tile = TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileEn.internal(_root);
	late final TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionEn ui_sheets_register_match_wizard_proof_card_section = TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionEn.internal(_root);
	late final TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionEn ui_sheets_register_match_picker_header_section = TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionEn.internal(_root);
	late final TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionEn ui_sheets_register_match_wizard_social_proof_step_section = TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionEn.internal(_root);
}

// Path: shop
class TranslationsShopEn {
	TranslationsShopEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsShopUiScreensShopScreenEn ui_screens_shop_screen = TranslationsShopUiScreensShopScreenEn.internal(_root);
}

// Path: auth.auth_onboarding_screen
class TranslationsAuthAuthOnboardingScreenEn {
	TranslationsAuthAuthOnboardingScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Pick your favorite ROOT faction before entering the hub.'
	String get pickYourFavoriteRootFactionBeforeEnteringTheHub => 'Pick your favorite ROOT faction before entering the hub.';

	/// en: 'Choose Your Faction'
	String get chooseYourFaction => 'Choose Your Faction';

	/// en: 'I already have an account'
	String get iAlreadyHaveAnAccount => 'I already have an account';
}

// Path: auth.auth_onboarding_profile_screen
class TranslationsAuthAuthOnboardingProfileScreenEn {
	TranslationsAuthAuthOnboardingProfileScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Current location uses your phone coordinates (x and y) and is required to show nearby matches.'
	String get currentLocationUsesYourPhoneCoordinatesXAndYAndIsRequiredToShowNearbyMat => 'Current location uses your phone coordinates (x and y) and is required to show nearby matches.';

	/// en: 'Your display name is how other players will see you in Root Hub. '
	String get yourDisplayNameIsHowOtherPlayersWillSeeYouInRootHub => 'Your display name is how other players will see you in Root Hub. ';

	/// en: 'Set Your Hub Identity'
	String get setYourHubIdentity => 'Set Your Hub Identity';

	/// en: 'Continue'
	String get continueButton => 'Continue';

	/// en: 'Choose how you appear and set your location to find nearby matches.'
	String get chooseHowYouAppearAndSetYourLocationToFindNearbyMatches => 'Choose how you appear and set your location to find nearby matches.';

	/// en: 'How you will be called'
	String get howYouWillBeCalled => 'How you will be called';

	/// en: 'This is how other players will see your profile in Root Hub.'
	String get thisIsHowOtherPlayersWillSeeYourProfileInRootHub => 'This is how other players will see your profile in Root Hub.';

	/// en: 'Enter your display name'
	String get enterYourDisplayName => 'Enter your display name';

	/// en: 'Current location'
	String get currentLocation => 'Current location';

	/// en: 'Location is required to show nearby tables. Choose device location or search for a place.'
	String get locationIsRequiredToShowNearbyTablesChooseDeviceOrSearch => 'Location is required to show nearby tables. Choose device location or search for a place.';

	/// en: 'Use my current device location'
	String get useMyCurrentDeviceLocation => 'Use my current device location';

	/// en: 'Capturing coordinates...'
	String get capturingCoordinates => 'Capturing coordinates...';

	/// en: 'Instantly use your phone GPS coordinates.'
	String get instantlyUseYourPhonesGpsCoordinates => 'Instantly use your phone GPS coordinates.';

	/// en: 'Search for a location'
	String get searchForATableLocation => 'Search for a location';

	/// en: 'Open the search and select any place you prefer.'
	String get openTheSearchAndSelectAnyPlaceYouPrefer => 'Open the search and select any place you prefer.';

	/// en: 'Selected coordinates'
	String get selectedCoordinates => 'Selected coordinates';

	/// en: 'Search area radius'
	String get searchAreaRadius => 'Search area radius';

	/// en: 'How far should we search for nearby players around you?'
	String get howFarShouldWeSearchForNearbyPlayersAroundYou => 'How far should we search for nearby players around you?';

	/// en: '25 km is the recommended starting point.'
	String get value25KmIsTheRecommendedStartingPoint => '25 km is the recommended starting point.';

	/// en: 'Disable VPN or proxy before capturing location. Wrong coordinates may hide nearby matches.'
	String get disableVpnOrProxyBeforeCapturingLocationWrongCoordinatesMayHideNearby => 'Disable VPN or proxy before capturing location. Wrong coordinates may hide nearby matches.';

	/// en: 'Location selected from search.'
	String get locationSelectedFromSearch => 'Location selected from search.';

	/// en: 'Enable location services on your phone and try again.'
	String get enableLocationServicesOnYourPhoneAndTryAgain => 'Enable location services on your phone and try again.';

	/// en: 'Location permission denied. Location is required to continue.'
	String get locationPermissionDeniedLocationIsRequiredToContinue => 'Location permission denied. Location is required to continue.';

	/// en: 'Location permission is denied forever. Enable it in system settings to continue.'
	String get locationPermissionIsDeniedForeverEnableItInSystemSettingsToContinue => 'Location permission is denied forever. Enable it in system settings to continue.';

	/// en: 'Location captured successfully.'
	String get locationCapturedSuccessfully => 'Location captured successfully.';

	/// en: 'Unable to capture location right now. Location is required to continue.'
	String get unableToCaptureLocationRightNowLocationIsRequiredToContinue => 'Unable to capture location right now. Location is required to continue.';

	/// en: 'Search for location'
	String get searchForLocation => 'Search for location';

	/// en: 'Search and pick one place. We will use its coordinates for nearby matches.'
	String get searchAndPickOnePlaceWeWillUseItsCoordinatesForNearbyMatches => 'Search and pick one place. We will use its coordinates for nearby matches.';

	/// en: 'Use selected location'
	String get useSelectedLocation => 'Use selected location';

	/// en: 'Select a location from the list before continuing.'
	String get selectALocationFromTheListBeforeContinuing => 'Select a location from the list before continuing.';

	/// en: 'Unable to use the selected location coordinates right now.'
	String get unableToUseTheSelectedLocationCoordinatesRightNow => 'Unable to use the selected location coordinates right now.';

	/// en: 'km'
	String get kilometersUnit => 'km';
}

// Path: auth.auth_loading_screen
class TranslationsAuthAuthLoadingScreenEn {
	TranslationsAuthAuthLoadingScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'ROOT HUB'
	String get rootHub => 'ROOT HUB';
}

// Path: auth.auth_login_screen
class TranslationsAuthAuthLoginScreenEn {
	TranslationsAuthAuthLoginScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Sign in to browse schedules and join tables.'
	String get signInToBrowseSchedulesAndJoinTables => 'Sign in to browse schedules and join tables.';

	/// en: 'Find Your Next ROOT Match'
	String get findYourNextRootMatch => 'Find Your Next\nROOT Match';
}

// Path: auth.auth_onboarding_continue_button_widget
class TranslationsAuthAuthOnboardingContinueButtonWidgetEn {
	TranslationsAuthAuthOnboardingContinueButtonWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Continue'
	String get continueButton => 'Continue';
}

// Path: dashboard.ui_screens_dashboard_screen
class TranslationsDashboardUiScreensDashboardScreenEn {
	TranslationsDashboardUiScreensDashboardScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Shop'
	String get shop => 'Shop';

	/// en: 'Match'
	String get match => 'Match';

	/// en: 'Activity'
	String get activity => 'Activity';

	/// en: 'Home'
	String get home => 'Home';

	/// en: 'ROOT HUB'
	String get rootHub => 'ROOT HUB';

	/// en: 'Choose from Gallery'
	String get chooseFromGallery => 'Choose from Gallery';

	/// en: 'Take Photo'
	String get takePhoto => 'Take Photo';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Choose from Library'
	String get chooseFromLibrary => 'Choose from Library';

	/// en: 'Take Photo'
	String get takePhoto2 => 'Take Photo';

	/// en: 'Change profile photo'
	String get changeProfilePhoto => 'Change profile photo';

	/// en: 'Allow camera and photo permissions in system settings and try again.'
	String get allowCameraAndPhotoPermissionsInSystemSettingsAndTryAgain => 'Allow camera and photo permissions in system settings and try again.';

	/// en: 'Unable to access camera or gallery'
	String get unableToAccessCameraOrGallery => 'Unable to access camera or gallery';

	/// en: 'Root Player'
	String get rootPlayer => 'Root Player';

	/// en: 'Welcome back, {displayName}'
	String welcomeBack({required Object displayName}) => 'Welcome back, ${displayName}';

	/// en: 'Community Dashboard'
	String get communityDashboardTitle => 'Community Dashboard';

	/// en: 'Match Finder'
	String get matchFinderTitle => 'Match Finder';

	/// en: 'Activity Center'
	String get activityCenterTitle => 'Activity Center';

	/// en: 'Shop Preview'
	String get shopPreviewTitle => 'Shop Preview';

	/// en: 'Discover what is happening around your ROOT community.'
	String get communityDashboardSubtitle => 'Discover what is happening around your ROOT community.';

	/// en: 'Browse and create match schedules with your local group.'
	String get matchFinderSubtitle => 'Browse and create match schedules with your local group.';

	/// en: 'Track your active tables and chat updates in one place.'
	String get activityCenterSubtitle => 'Track your active tables and chat updates in one place.';

	/// en: 'Collect future cosmetics, tokens, and community bundles.'
	String get shopPreviewSubtitle => 'Collect future cosmetics, tokens, and community bundles.';
}

// Path: dashboard.ui_screens_dashboard_faction_editor_screen
class TranslationsDashboardUiScreensDashboardFactionEditorScreenEn {
	TranslationsDashboardUiScreensDashboardFactionEditorScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Choose the faction shown in your profile and used as your default preference.'
	String get chooseTheFactionShownInYourProfileAndUsedAsYourDefaultPreference => 'Choose the faction shown in your profile and used as your default preference.';

	/// en: 'Change Favorite Faction'
	String get changeFavoriteFaction => 'Change Favorite Faction';
}

// Path: dashboard.ui_dialogs_edit_location_dialog
class TranslationsDashboardUiDialogsEditLocationDialogEn {
	TranslationsDashboardUiDialogsEditLocationDialogEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Update your coordinates and target search ratio for match discovery.'
	String get updateYourCoordinatesAndTargetSearchRatioForMatchDiscovery => 'Update your coordinates and target search ratio for match discovery.';

	/// en: 'Edit Location'
	String get editLocation => 'Edit Location';
}

// Path: dashboard.ui_dialogs_edit_display_name_dialog
class TranslationsDashboardUiDialogsEditDisplayNameDialogEn {
	TranslationsDashboardUiDialogsEditDisplayNameDialogEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'This is how players will see you across Root Hub.'
	String get thisIsHowPlayersWillSeeYouAcrossRootHub => 'This is how players will see you across Root Hub.';

	/// en: 'Edit Display Name'
	String get editDisplayName => 'Edit Display Name';
}

// Path: dashboard.ui_widgets_dashboard_profile_drawer_widget
class TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetEn {
	TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Log out'
	String get logOut => 'Log out';

	/// en: 'Change Faction'
	String get changeFaction => 'Change Faction';

	/// en: 'Saving...'
	String get saving => 'Saving...';

	/// en: 'Favorite Faction'
	String get favoriteFaction => 'Favorite Faction';

	/// en: 'Location'
	String get location => 'Location';

	/// en: 'Display Name'
	String get displayName => 'Display Name';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Change'
	String get change => 'Change';

	/// en: 'No location configured'
	String get noLocationConfigured => 'No location configured';

	/// en: 'x'
	String get xLabel => 'x';

	/// en: 'y'
	String get yLabel => 'y';

	/// en: 'ratio'
	String get ratioLabel => 'ratio';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Use device language'
	String get useDeviceLanguage => 'Use device language';

	/// en: 'English'
	String get english => 'English';

	/// en: 'Portuguese (Brazil)'
	String get portugueseBrazil => 'Portuguese (Brazil)';

	/// en: 'Spanish'
	String get spanish => 'Spanish';

	/// en: 'French'
	String get french => 'French';

	/// en: 'German'
	String get german => 'German';
}

// Path: activity.ui_screens_activity_screen
class TranslationsActivityUiScreensActivityScreenEn {
	TranslationsActivityUiScreensActivityScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'My Scheduled Tables'
	String get myScheduledTablesTitle => 'My Scheduled Tables';

	/// en: 'Tables you subscribed to that have not started yet or started less than 6 hours ago.'
	String get tablesYouSubscribedToThatAreStillWithinTheActiveWindow => 'Tables you subscribed to that have not started yet or started less than 6 hours ago.';

	/// en: 'No active subscriptions'
	String get noActiveSchedules => 'No active subscriptions';

	/// en: 'When you subscribe to a table, it appears here as a swipeable card.'
	String get whenYouJoinATableItWillAppearHereAsASwipeableCard => 'When you subscribe to a table, it appears here as a swipeable card.';

	/// en: 'Active Chats'
	String get activeChatsTitle => 'Active Chats';

	/// en: 'Chats for upcoming or recently started tables, ordered by unread messages first.'
	String get chatsForUpcomingOrRecentlyStartedTablesOrderedByUnreadMessages => 'Chats for upcoming or recently started tables, ordered by unread messages first.';

	/// en: 'No active chats'
	String get noActiveChats => 'No active chats';

	/// en: 'Open a table chat and it will be tracked here, even if you are not subscribed.'
	String get openAnyTableChatAndItWillBeTrackedHereEvenWithoutASubscription => 'Open a table chat and it will be tracked here, even if you are not subscribed.';

	/// en: 'Completed Match Chats'
	String get completedMatchesTitle => 'Completed Match Chats';

	/// en: 'Latest 8 chats from matches that already happened.'
	String get latestEightCompletedOrArchivedMatchChatsYouParticipatedIn => 'Latest 8 chats from matches that already happened.';

	/// en: 'No completed chats yet'
	String get noCompletedChats => 'No completed chats yet';

	/// en: 'Once matches finish, their chats remain available in this section.'
	String get onceMatchesFinishTheirChatsWillStayAvailableHere => 'Once matches finish, their chats remain available in this section.';
}

// Path: activity.ui_widgets_activity_subscribed_schedule_card
class TranslationsActivityUiWidgetsActivitySubscribedScheduleCardEn {
	TranslationsActivityUiWidgetsActivitySubscribedScheduleCardEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unknown location'
	String get unknownLocation => 'Unknown location';

	/// en: 'Selected'
	String get selected => 'Selected';

	/// en: 'Already started'
	String get alreadyStarted => 'Already started';

	/// en: 'Not started yet'
	String get notStartedYet => 'Not started yet';

	/// en: '{minPlayers}-{maxPlayers} players'
	String playersLabel({required Object minPlayers, required Object maxPlayers}) => '${minPlayers}-${maxPlayers} players';

	/// en: 'Tap card to open chat'
	String get openChatHint => 'Tap card to open chat';
}

// Path: activity.ui_widgets_activity_chat_card
class TranslationsActivityUiWidgetsActivityChatCardEn {
	TranslationsActivityUiWidgetsActivityChatCardEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Ended'
	String get ended => 'Ended';

	/// en: 'Started'
	String get started => 'Started';

	/// en: 'Upcoming'
	String get upcoming => 'Upcoming';

	/// en: '{sender}: {message}'
	String senderMessage({required Object sender, required Object message}) => '${sender}: ${message}';

	/// en: 'New message'
	String get newMessage => 'New message';

	/// en: 'Photo shared'
	String get photoShared => 'Photo shared';

	/// en: 'System update'
	String get systemUpdate => 'System update';

	/// en: 'No messages yet'
	String get noMessagesYet => 'No messages yet';
}

// Path: home.ui_sections_home_stats_section
class TranslationsHomeUiSectionsHomeStatsSectionEn {
	TranslationsHomeUiSectionsHomeStatsSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'All factions total'
	String get allFactionsTotal => 'All factions total';

	/// en: 'All factions avg'
	String get allFactionsAvg => 'All factions avg';

	/// en: 'All factions total'
	String get allFactionsTotal2 => 'All factions total';

	/// en: 'All factions avg'
	String get allFactionsAvg2 => 'All factions avg';

	/// en: 'Absolute number of wins for each faction.'
	String get absoluteNumberOfWinsForEachFaction => 'Absolute number of wins for each faction.';

	/// en: 'Total Wins'
	String get totalWins => 'Total Wins';

	/// en: 'Average score per faction when points were tracked.'
	String get averageScorePerFactionWhenPointsWereTracked => 'Average score per faction when points were tracked.';

	/// en: 'Average Points'
	String get averagePoints => 'Average Points';

	/// en: 'How often each faction appears in completed games.'
	String get howOftenEachFactionAppearsInCompletedGames => 'How often each faction appears in completed games.';

	/// en: 'Played Games'
	String get playedGames => 'Played Games';

	/// en: 'Who is winning the most often right now.'
	String get whoIsWinningTheMostOftenRightNow => 'Who is winning the most often right now.';

	/// en: 'Faction Win Rate'
	String get factionWinRate => 'Faction Win Rate';
}

// Path: home.ui_screens_home_screen
class TranslationsHomeUiScreensHomeScreenEn {
	TranslationsHomeUiScreensHomeScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Your personal faction performance and match profile.'
	String get yourPersonalFactionPerformanceAndMatchProfile => 'Your personal faction performance and match profile.';

	/// en: 'My Stats'
	String get myStats => 'My Stats';

	/// en: 'Faction performance from all played matches in Root Hub.'
	String get factionPerformanceFromAllPlayedMatchesInRootHub => 'Faction performance from all played matches in Root Hub.';

	/// en: 'Community Stats'
	String get communityStats => 'Community Stats';
}

// Path: home.ui_widgets_home_stats_pie_chart_widget
class TranslationsHomeUiWidgetsHomeStatsPieChartWidgetEn {
	TranslationsHomeUiWidgetsHomeStatsPieChartWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No values for this metric yet.'
	String get noValuesForThisMetricYet => 'No values for this metric yet.';
}

// Path: match.ui_sheets_match_edit_table_error_widget
class TranslationsMatchUiSheetsMatchEditTableErrorWidgetEn {
	TranslationsMatchUiSheetsMatchEditTableErrorWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Close'
	String get close => 'Close';
}

// Path: match.ui_sheets_match_edit_table_loading_widget
class TranslationsMatchUiSheetsMatchEditTableLoadingWidgetEn {
	TranslationsMatchUiSheetsMatchEditTableLoadingWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Loading table details...'
	String get loadingTableDetails => 'Loading table details...';
}

// Path: match.ui_sheets_match_table_info_sheet
class TranslationsMatchUiSheetsMatchTableInfoSheetEn {
	TranslationsMatchUiSheetsMatchTableInfoSheetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Remove'
	String get remove => 'Remove';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'rejoin if seats are still available.'
	String get rejoinIfSeatsAreStillAvailable => 'rejoin if seats are still available.';

	/// en: 'Cancel'
	String get cancel2 => 'Cancel';

	/// en: 'Select a player to remove from the table.'
	String get selectAPlayerToRemoveFromTheTable => 'Select a player to remove from the table.';

	/// en: 'Remove a Player'
	String get removeAPlayer => 'Remove a Player';

	/// en: 'Leave'
	String get leave => 'Leave';

	/// en: 'Cancel'
	String get cancel3 => 'Cancel';

	/// en: 'players list. You can rejoin later if seats are still available.'
	String get playersListYouCanRejoinLaterIfSeatsAreStillAvailable => 'players list. You can rejoin later if seats are still available.';

	/// en: 'You will be unsubscribed from this match and removed from the '
	String get youWillBeUnsubscribedFromThisMatchAndRemovedFromThe => 'You will be unsubscribed from this match and removed from the ';

	/// en: 'Leave this table?'
	String get leaveThisTable => 'Leave this table?';

	/// en: 'Unable to load table details.'
	String get unableToLoadTableDetails => 'Unable to load table details.';

	/// en: 'Table not found'
	String get tableNotFound => 'Table not found';
}

// Path: match.ui_sheets_match_table_info_content_widget
class TranslationsMatchUiSheetsMatchTableInfoContentWidgetEn {
	TranslationsMatchUiSheetsMatchTableInfoContentWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No players have joined this table yet.'
	String get noPlayersHaveJoinedThisTableYet => 'No players have joined this table yet.';

	/// en: 'These are the current players that will participate.'
	String get theseAreTheCurrentPlayersThatWillParticipate => 'These are the current players that will participate.';

	/// en: 'No players subscribed yet.'
	String get noPlayersSubscribedYet => 'No players subscribed yet.';

	/// en: 'Players in this match'
	String get playersInThisMatch => 'Players in this match';

	/// en: 'Unknown host'
	String get unknownHost => 'Unknown host';

	/// en: 'Table Details'
	String get tableDetails => 'Table Details';
}

// Path: match.ui_sheets_match_table_info_error_widget
class TranslationsMatchUiSheetsMatchTableInfoErrorWidgetEn {
	TranslationsMatchUiSheetsMatchTableInfoErrorWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Close'
	String get close => 'Close';
}

// Path: match.ui_sheets_match_table_info_participant_card_widget
class TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetEn {
	TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Favorite Faction'
	String get favoriteFaction => 'Favorite Faction';
}

// Path: match.ui_sheets_match_edit_table_sheet
class TranslationsMatchUiSheetsMatchEditTableSheetEn {
	TranslationsMatchUiSheetsMatchEditTableSheetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'The scheduled time cannot be more than '
	String get theScheduledTimeCannotBeMoreThan => 'The scheduled time cannot be more than ';

	/// en: 'Date is too far'
	String get dateIsTooFar => 'Date is too far';

	/// en: 'The scheduled time must be at least '
	String get theScheduledTimeMustBeAtLeast => 'The scheduled time must be at least ';

	/// en: 'Time is too soon'
	String get timeIsTooSoon => 'Time is too soon';

	/// en: 'You cannot set the maximum below that number.'
	String get youCannotSetTheMaximumBelowThatNumber => 'You cannot set the maximum below that number.';

	/// en: 'Too many players subscribed'
	String get tooManyPlayersSubscribed => 'Too many players subscribed';

	/// en: 'with minimum not greater than maximum.'
	String get withMinimumNotGreaterThanMaximum => 'with minimum not greater than maximum.';

	/// en: 'Players range must be between 2 and 6, '
	String get playersRangeMustBeBetween2And6 => 'Players range must be between 2 and 6, ';

	/// en: 'Invalid players range'
	String get invalidPlayersRange => 'Invalid players range';

	/// en: 'Please add a title for your table.'
	String get pleaseAddATitleForYourTable => 'Please add a title for your table.';

	/// en: 'Title required'
	String get titleRequired => 'Title required';

	/// en: 'Unable to load table details.'
	String get unableToLoadTableDetails => 'Unable to load table details.';

	/// en: 'Table not found'
	String get tableNotFound => 'Table not found';
}

// Path: match.ui_sheets_match_table_info_loading_widget
class TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetEn {
	TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Loading table details...'
	String get loadingTableDetails => 'Loading table details...';
}

// Path: match.ui_sheets_match_edit_table_form_widget
class TranslationsMatchUiSheetsMatchEditTableFormWidgetEn {
	TranslationsMatchUiSheetsMatchEditTableFormWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Save Changes'
	String get saveChanges => 'Save Changes';

	/// en: 'Saving...'
	String get saving => 'Saving...';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Must be at least 10 minutes from now, up to '
	String get mustBeAtLeast10MinutesFromNowUpTo => 'Must be at least 10 minutes from now, up to ';

	/// en: 'Schedule'
	String get schedule => 'Schedule';

	/// en: 'Maximum'
	String get maximum => 'Maximum';

	/// en: 'Minimum'
	String get minimum => 'Minimum';

	/// en: 'Set between 2 and 6 players.'
	String get setBetween2And6Players => 'Set between 2 and 6 players.';

	/// en: 'Players range'
	String get playersRange => 'Players range';

	/// en: 'Example: We have Marauder expansion.'
	String get exampleWeHaveMarauderExpansion => 'Example: We have Marauder expansion.';

	/// en: 'Extra details like expansions, parking tips, etc.'
	String get extraDetailsLikeExpansionsParkingTipsEtc => 'Extra details like expansions, parking tips, etc.';

	/// en: 'Description (optional)'
	String get descriptionOptional => 'Description (optional)';

	/// en: 'Example: Saturday ROOT at Lantern Café'
	String get exampleSaturdayRootAtLanternCaf => 'Example: Saturday ROOT at Lantern Café';

	/// en: 'A short name so players can find your table.'
	String get aShortNameSoPlayersCanFindYourTable => 'A short name so players can find your table.';

	/// en: 'Table title'
	String get tableTitle => 'Table title';

	/// en: 'New players can still join this table.'
	String get newPlayersCanStillJoinThisTable => 'New players can still join this table.';

	/// en: 'New players cannot join this table.'
	String get newPlayersCannotJoinThisTable => 'New players cannot join this table.';

	/// en: 'Close subscriptions'
	String get closeSubscriptions => 'Close subscriptions';

	/// en: 'Edit Details'
	String get editDetails => 'Edit Details';

	/// en: 'Edit Table'
	String get editTable => 'Edit Table';
}

// Path: match.ui_sheets_match_table_info_bottom_actions_widget
class TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetEn {
	TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Remove Player'
	String get removePlayer => 'Remove Player';

	/// en: 'Removing...'
	String get removing => 'Removing...';

	/// en: 'Leave Table'
	String get leaveTable => 'Leave Table';

	/// en: 'Leaving...'
	String get leaving => 'Leaving...';

	/// en: 'Close'
	String get close => 'Close';
}

// Path: match.ui_screens_match_create_table_location_loading_search_widget
class TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetEn {
	TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Searching locations...'
	String get searchingLocations => 'Searching locations...';
}

// Path: match.ui_screens_match_create_table_location_screen
class TranslationsMatchUiScreensMatchCreateTableLocationScreenEn {
	TranslationsMatchUiScreensMatchCreateTableLocationScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Previously selected locations'
	String get previouslySelectedLocations => 'Previously selected locations';

	/// en: 'Search results'
	String get searchResults => 'Search results';

	/// en: 'Tap a location to select it. Previously selected locations are saved here for faster hosting.'
	String get tapALocationToSelectItPreviouslySelectedLocationsAreSavedHereForFasterHo => 'Tap a location to select it. Previously selected locations are saved here for faster hosting.';

	/// en: 'Search location (Google Places)'
	String get searchLocationGooglePlaces => 'Search location (Google Places)';

	/// en: 'Choose Table Location'
	String get chooseTableLocation => 'Choose Table Location';

	/// en: 'Choose one location from the list before creating the table.'
	String get chooseOneLocationFromTheListBeforeCreatingTheTable => 'Choose one location from the list before creating the table.';

	/// en: 'Location required'
	String get locationRequired => 'Location required';

	/// en: 'Continue'
	String get continueButton => 'Continue';
}

// Path: match.ui_screens_match_join_sheet_error_widget
class TranslationsMatchUiScreensMatchJoinSheetErrorWidgetEn {
	TranslationsMatchUiScreensMatchJoinSheetErrorWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Close'
	String get close => 'Close';
}

// Path: match.ui_screens_match_screen
class TranslationsMatchUiScreensMatchScreenEn {
	TranslationsMatchUiScreensMatchScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unable to open the dialer right now.'
	String get unableToOpenTheDialerRightNow => 'Unable to open the dialer right now.';

	/// en: 'Invalid phone number format.'
	String get invalidPhoneNumberFormat => 'Invalid phone number format.';

	/// en: 'Unable to open the link right now.'
	String get unableToOpenTheLinkRightNow => 'Unable to open the link right now.';

	/// en: 'Invalid URL format.'
	String get invalidUrlFormat => 'Invalid URL format.';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'Manual location notes'
	String get manualLocationNotes => 'Manual location notes';

	/// en: 'Phone'
	String get phone => 'Phone';

	/// en: 'Phone'
	String get phone2 => 'Phone';

	/// en: 'Website'
	String get website => 'Website';

	/// en: 'Website'
	String get website2 => 'Website';

	/// en: 'Map link'
	String get mapLink => 'Map link';

	/// en: 'Map link'
	String get mapLink2 => 'Map link';

	/// en: 'Public'
	String get public => 'Public';

	/// en: 'Private'
	String get private => 'Private';

	/// en: 'matches played here'
	String get matchesPlayedHere => 'matches played here';

	/// en: 'match played here'
	String get matchPlayedHere => 'match played here';

	/// en: 'Host Table'
	String get hostTable => 'Host Table';

	/// en: 'Report Result'
	String get reportResult => 'Report Result';
}

// Path: match.ui_screens_match_loading_error_state_widget
class TranslationsMatchUiScreensMatchLoadingErrorStateWidgetEn {
	TranslationsMatchUiScreensMatchLoadingErrorStateWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Try again'
	String get tryAgain => 'Try again';
}

// Path: match.ui_screens_match_nearby_header_widget
class TranslationsMatchUiScreensMatchNearbyHeaderWidgetEn {
	TranslationsMatchUiScreensMatchNearbyHeaderWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Only tables that did not start more than 2 hours ago are listed.'
	String get onlyTablesThatDidNotStartMoreThan2HoursAgoAreListed => 'Only tables that did not start more than 2 hours ago are listed.';

	/// en: 'Nearby Match Tables'
	String get nearbyMatchTables => 'Nearby Match Tables';

	/// en: 'Match Finder'
	String get matchFinder => 'Match Finder';

	/// en: 'Set profile location'
	String get setProfileLocation => 'Set profile location';

	/// en: '{ratioKm} km search area'
	String searchAreaKm({required Object ratioKm}) => '${ratioKm} km search area';
}

// Path: match.ui_screens_match_no_matches_state_widget
class TranslationsMatchUiScreensMatchNoMatchesStateWidgetEn {
	TranslationsMatchUiScreensMatchNoMatchesStateWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Host the first table'
	String get hostTheFirstTable => 'Host the first table';

	/// en: 'Be the first to start one. Host a new table so nearby players can subscribe.'
	String get beTheFirstToStartOneHostANewTableSoNearbyPlayersCanSubscribe => 'Be the first to start one. Host a new table so nearby players can subscribe.';

	/// en: 'No tables in your area yet'
	String get noTablesInYourAreaYet => 'No tables in your area yet';
}

// Path: match.ui_screens_match_time_status_chip_widget
class TranslationsMatchUiScreensMatchTimeStatusChipWidgetEn {
	TranslationsMatchUiScreensMatchTimeStatusChipWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Remaining time until the match starts.'
	String get remainingTimeUntilTheMatchStarts => 'Remaining time until the match starts.';

	/// en: 'This match already started. Recently started tables stay visible for a short period.'
	String get thisMatchAlreadyStartedRecentlyStartedTablesStayVisibleForAShortPeriod => 'This match already started. Recently started tables stay visible for a short period.';
}

// Path: match.ui_screens_match_create_table_location_no_search_results_widget
class TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetEn {
	TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No locations found for this query. Try another place name or area.'
	String get noLocationsFoundForThisQueryTryAnotherPlaceNameOrArea => 'No locations found for this query. Try another place name or area.';
}

// Path: match.ui_screens_match_create_table_screen
class TranslationsMatchUiScreensMatchCreateTableScreenEn {
	TranslationsMatchUiScreensMatchCreateTableScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No, I am only hosting this table'
	String get noIAmOnlyHostingThisTable => 'No, I am only hosting this table';

	/// en: 'Yes, I will play this match'
	String get yesIWillPlayThisMatch => 'Yes, I will play this match';

	/// en: 'If you are a venue, board game club, or organizer bringing players together but not joining the match, leave this unchecked.'
	String get ifYouAreAVenueBoardGameClubOrOrganizerBringingPlayersTogetherButNotJoini => 'If you are a venue, board game club, or organizer bringing players together but not joining the match, leave this unchecked.';

	/// en: 'Will you, the host, play?'
	String get willYouTheHostPlay => 'Will you, the host, play?';

	/// en: 'Pick the day and start hour. Choose a time you can reliably show up.'
	String get pickTheDayAndStartHourChooseATimeYouCanReliablyShowUp => 'Pick the day and start hour. Choose a time you can reliably show up.';

	/// en: 'Schedule'
	String get schedule => 'Schedule';

	/// en: 'Maximum'
	String get maximum => 'Maximum';

	/// en: 'Minimum'
	String get minimum => 'Minimum';

	/// en: 'Default is 3-4. You can set between 2 and 6 players.'
	String get defaultIs34YouCanSetBetween2And6Players => 'Default is 3-4. You can set between 2 and 6 players.';

	/// en: 'Players range'
	String get playersRange => 'Players range';

	/// en: 'Example: We have Marauder expansion and spare sleeves.'
	String get exampleWeHaveMarauderExpansionAndSpareSleeves => 'Example: We have Marauder expansion and spare sleeves.';

	/// en: 'Add extra details like expansions available, parking tips, or reference points.'
	String get addExtraDetailsLikeExpansionsAvailableParkingTipsOrReferencePoints => 'Add extra details like expansions available, parking tips, or reference points.';

	/// en: 'Description (optional)'
	String get descriptionOptional => 'Description (optional)';

	/// en: 'Example: Saturday ROOT at Lantern Café'
	String get exampleSaturdayRootAtLanternCaf => 'Example: Saturday ROOT at Lantern Café';

	/// en: 'This can be anything that helps identify the table, like a place name or event style.'
	String get thisCanBeAnythingThatHelpsIdentifyTheTableLikeAPlaceNameOrEventStyle => 'This can be anything that helps identify the table, like a place name or event style.';

	/// en: 'Table title'
	String get tableTitle => 'Table title';

	/// en: 'Set table details first. On the next screen you will choose the location.'
	String get setTableDetailsFirstOnTheNextScreenYouWillChooseTheLocation => 'Set table details first. On the next screen you will choose the location.';

	/// en: 'Host a New Table'
	String get hostANewTable => 'Host a New Table';

	/// en: 'Select the start hour for this table before continuing.'
	String get selectTheStartHourForThisTableBeforeContinuing => 'Select the start hour for this table before continuing.';

	/// en: 'Start hour required'
	String get startHourRequired => 'Start hour required';

	/// en: 'You cannot select a day in the past.'
	String get youCannotSelectADayInThePast => 'You cannot select a day in the past.';

	/// en: 'Invalid date'
	String get invalidDate => 'Invalid date';

	/// en: 'Select the day for this table before continuing.'
	String get selectTheDayForThisTableBeforeContinuing => 'Select the day for this table before continuing.';

	/// en: 'Day required'
	String get dayRequired => 'Day required';

	/// en: 'Add a title so players can quickly identify your table. Example: "Downtown Café Night".'
	String get addATitleSoPlayersCanQuicklyIdentifyYourTableExampleDowntownCafNight => 'Add a title so players can quickly identify your table. Example: "Downtown Café Night".';

	/// en: 'Title required'
	String get titleRequired => 'Title required';

	/// en: 'You cannot select a day in the past.'
	String get youCannotSelectADayInThePast2 => 'You cannot select a day in the past.';

	/// en: 'Invalid date'
	String get invalidDate2 => 'Invalid date';

	/// en: 'Continue'
	String get continueButton => 'Continue';
}

// Path: match.ui_screens_match_chat_loading_error_state_widget
class TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetEn {
	TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Try again'
	String get tryAgain => 'Try again';
}

// Path: match.ui_screens_match_report_available_chip_widget
class TranslationsMatchUiScreensMatchReportAvailableChipWidgetEn {
	TranslationsMatchUiScreensMatchReportAvailableChipWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Report available'
	String get reportAvailable => 'Report available';

	/// en: 'You can report this match result now.'
	String get youCanReportThisMatchResultNow => 'You can report this match result now.';
}

// Path: match.ui_screens_match_initial_loading_state_widget
class TranslationsMatchUiScreensMatchInitialLoadingStateWidgetEn {
	TranslationsMatchUiScreensMatchInitialLoadingStateWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Loading nearby tables...'
	String get loadingNearbyTables => 'Loading nearby tables...';
}

// Path: match.ui_screens_match_participant_card_widget
class TranslationsMatchUiScreensMatchParticipantCardWidgetEn {
	TranslationsMatchUiScreensMatchParticipantCardWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Favorite Faction'
	String get favoriteFaction => 'Favorite Faction';
}

// Path: match.ui_screens_match_join_sheet_content_widget
class TranslationsMatchUiScreensMatchJoinSheetContentWidgetEn {
	TranslationsMatchUiScreensMatchJoinSheetContentWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Confirm Join'
	String get confirmJoin => 'Confirm Join';

	/// en: 'Subscriptions closed'
	String get subscriptionsClosed => 'Subscriptions closed';

	/// en: 'Already subscribed'
	String get alreadySubscribed => 'Already subscribed';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'You can be the first player to lock this table in.'
	String get youCanBeTheFirstPlayerToLockThisTableIn => 'You can be the first player to lock this table in.';

	/// en: 'These are the current players that will participate.'
	String get theseAreTheCurrentPlayersThatWillParticipate => 'These are the current players that will participate.';

	/// en: 'No players subscribed yet.'
	String get noPlayersSubscribedYet => 'No players subscribed yet.';

	/// en: 'Players in this match'
	String get playersInThisMatch => 'Players in this match';

	/// en: 'Unknown host'
	String get unknownHost => 'Unknown host';

	/// en: 'See table chat'
	String get seeTableChat => 'See table chat';

	/// en: 'New players cannot join at this time.'
	String get newPlayersCannotJoinAtThisTime => 'New players cannot join at this time.';

	/// en: 'The host has closed subscriptions for this table. '
	String get theHostHasClosedSubscriptionsForThisTable => 'The host has closed subscriptions for this table. ';

	/// en: 'Confirm table subscription'
	String get confirmTableSubscription => 'Confirm table subscription';
}

// Path: match.ui_screens_match_table_card_widget
class TranslationsMatchUiScreensMatchTableCardWidgetEn {
	TranslationsMatchUiScreensMatchTableCardWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Subscribed'
	String get subscribed => 'Subscribed';

	/// en: 'Tap card to open chat'
	String get tapCardToOpenChat => 'Tap card to open chat';

	/// en: 'Subscriptions closed'
	String get subscriptionsClosed => 'Subscriptions closed';

	/// en: 'Open full location details'
	String get openFullLocationDetails => 'Open full location details';

	/// en: 'places'
	String get places => 'places';

	/// en: 'place'
	String get place => 'place';

	/// en: 's'
	String get s => 's';

	/// en: 'Joining...'
	String get joining => 'Joining...';

	/// en: 'Closed'
	String get closed => 'Closed';

	/// en: 'Table Full'
	String get tableFull => 'Table Full';

	/// en: 'Join Table'
	String get joinTable => 'Join Table';

	/// en: 'Unknown location'
	String get unknownLocation => 'Unknown location';

	/// en: 'Address unavailable'
	String get addressUnavailable => 'Address unavailable';

	/// en: 'player'
	String get player => 'player';

	/// en: 'players'
	String get players => 'players';

	/// en: '{subscribedPlayersCount} {playersWord} subscribed and {remainingSeats} {placesWord} remaining to close the table.'
	String subscriptionTooltip({required Object subscribedPlayersCount, required Object playersWord, required Object remainingSeats, required Object placesWord}) => '${subscribedPlayersCount} ${playersWord} subscribed and ${remainingSeats} ${placesWord} remaining to close the table.';
}

// Path: match.ui_screens_match_location_header_image_widget
class TranslationsMatchUiScreensMatchLocationHeaderImageWidgetEn {
	TranslationsMatchUiScreensMatchLocationHeaderImageWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Location Details'
	String get locationDetails => 'Location Details';
}

// Path: match.ui_screens_match_create_table_location_no_recent_locations_widget
class TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetEn {
	TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No previous locations yet. Search and select one above.'
	String get noPreviousLocationsYetSearchAndSelectOneAbove => 'No previous locations yet. Search and select one above.';
}

// Path: match.ui_screens_match_chat_screen
class TranslationsMatchUiScreensMatchChatScreenEn {
	TranslationsMatchUiScreensMatchChatScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Choose from Gallery'
	String get chooseFromGallery => 'Choose from Gallery';

	/// en: 'Take Photo'
	String get takePhoto => 'Take Photo';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Choose from Library'
	String get chooseFromLibrary => 'Choose from Library';

	/// en: 'Take Photo'
	String get takePhoto2 => 'Take Photo';

	/// en: 'Send a photo'
	String get sendAPhoto => 'Send a photo';

	/// en: 'Compress'
	String get compress => 'Compress';

	/// en: 'Cancel'
	String get cancel2 => 'Cancel';

	/// en: 'Image is too large'
	String get imageIsTooLarge => 'Image is too large';

	/// en: 'Subscribed'
	String get subscribed => 'Subscribed';

	/// en: 'Unable to resolve your account information.'
	String get unableToResolveYourAccountInformation => 'Unable to resolve your account information.';

	/// en: 'Table info'
	String get tableInfo => 'Table info';

	/// en: 'Played match info'
	String get playedMatchInfo => 'Played match info';

	/// en: 'Edit table'
	String get editTable => 'Edit table';
}

// Path: match.ui_dialogs_match_played_match_summary_dialog
class TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogEn {
	TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Completed Match Report'
	String get completedMatchReport => 'Completed Match Report';

	/// en: 'Winner'
	String get winner => 'Winner';

	/// en: 'Not available'
	String get notAvailable => 'Not available';

	/// en: 'Started: {value}'
	String startedAtLabel({required Object value}) => 'Started: ${value}';

	/// en: 'Duration: {value}'
	String durationLabel({required Object value}) => 'Duration: ${value}';

	/// en: 'Scheduled: {value}'
	String scheduledAtLabel({required Object value}) => 'Scheduled: ${value}';

	/// en: 'Match Proofs'
	String get matchProofs => 'Match Proofs';

	/// en: 'Players'
	String get players => 'Players';

	/// en: 'Domination'
	String get domination => 'Domination';

	/// en: '{value} pts'
	String scoreLabel({required Object value}) => '${value} pts';

	/// en: 'Close'
	String get close => 'Close';

	/// en: '{hours}h {minutes}m'
	String hoursMinutes({required Object hours, required Object minutes}) => '${hours}h ${minutes}m';
}

// Path: match.ui_screens_match_create_table_location_loading_recent_widget
class TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetEn {
	TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Loading previous locations...'
	String get loadingPreviousLocations => 'Loading previous locations...';
}

// Path: register_match.ui_sheets_register_match_wizard_winner_step_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Dominance'
	String get dominance => 'Dominance';

	/// en: 'Total points (30)'
	String get totalPoints30 => 'Total points (30)';

	/// en: 'Dominance means the winner completed a Dominance card objective instead of winning by points.'
	String get dominanceMeansTheWinnerCompletedADominanceCardObjectiveInsteadOfWinningB => 'Dominance means the winner completed a Dominance card objective instead of winning by points.';

	/// en: 'Total points means the winner reached 30 victory points on the score track. '
	String get totalPointsMeansTheWinnerReached30VictoryPointsOnTheScoreTrack => 'Total points means the winner reached 30 victory points on the score track. ';

	/// en: 'How did the winner won?'
	String get howDidTheWinnerWon => 'How did the winner won?';

	/// en: 'Pick the player who won this match.'
	String get pickThePlayerWhoWonThisMatch => 'Pick the player who won this match.';
}

// Path: register_match.ui_sheets_register_match_wizard_timing_step_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Estimated duration'
	String get estimatedDuration => 'Estimated duration';

	/// en: 'Estimated duration'
	String get estimatedDuration2 => 'Estimated duration';

	/// en: 'Set the estimated duration. Adjust in 15-minute steps (max 8 hours).'
	String get setTheEstimatedDurationAdjustIn15MinuteStepsMax8Hours => 'Set the estimated duration. Adjust in 15-minute steps (max 8 hours).';

	/// en: 'Change time'
	String get changeTime => 'Change time';

	/// en: 'Match started at'
	String get matchStartedAt => 'Match started at';

	/// en: 'Set the time the match actually started.'
	String get setTheTimeTheMatchActuallyStarted => 'Set the time the match actually started.';
}

// Path: register_match.ui_sheets_register_match_wizard_participants_step_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Add registered player from platform'
	String get addRegisteredPlayerFromPlatform => 'Add registered player from platform';

	/// en: 'Add anonymous player'
	String get addAnonymousPlayer => 'Add anonymous player';

	/// en: 'Registered player'
	String get registeredPlayer => 'Registered player';

	/// en: 'Anonymous player'
	String get anonymousPlayer => 'Anonymous player';

	/// en: 'Select registered players who were present. You can add anonymous players or search for other registered players.'
	String get selectRegisteredPlayersWhoWerePresentYouCanAddAnonymousPlayersOrSearchFo => 'Select registered players who were present. You can add anonymous players or search for other registered players.';

	/// en: '1) Who actually played?'
	String get value1WhoActuallyPlayed => '1) Who actually played?';
}

// Path: register_match.ui_sheets_register_match_picker_error_section
class TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Retry'
	String get retry => 'Retry';
}

// Path: register_match.ui_sheets_register_match_picker_match_item_card
class TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Not available yet'
	String get notAvailableYet => 'Not available yet';

	/// en: 'Tap to report'
	String get tapToReport => 'Tap to report';
}

// Path: register_match.ui_sheets_register_match_wizard_factions_step_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Select faction'
	String get selectFaction => 'Select faction';

	/// en: 'Faction'
	String get faction => 'Faction';

	/// en: 'Choose the faction used by each player in this match.'
	String get chooseTheFactionUsedByEachPlayerInThisMatch => 'Choose the faction used by each player in this match.';

	/// en: '2) Select factions'
	String get value2SelectFactions => '2) Select factions';
}

// Path: register_match.ui_sheets_register_match_search_registered_player_sheet
class TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tap to add'
	String get tapToAdd => 'Tap to add';

	/// en: 'Already added to this report'
	String get alreadyAddedToThisReport => 'Already added to this report';

	/// en: 'No registered players were found.'
	String get noRegisteredPlayersWereFound => 'No registered players were found.';

	/// en: 'Search by display name'
	String get searchByDisplayName => 'Search by display name';

	/// en: 'Add registered player'
	String get addRegisteredPlayer => 'Add registered player';
}

// Path: register_match.ui_sheets_register_match_wizard_points_step_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '0 to 29'
	String get value0To29 => '0 to 29';

	/// en: 'Points'
	String get points => 'Points';

	/// en: 'Dominance attempt'
	String get dominanceAttempt => 'Dominance attempt';

	/// en: 'Winner by dominance'
	String get winnerByDominance => 'Winner by dominance';

	/// en: 'Winner by points'
	String get winnerByPoints => 'Winner by points';

	/// en: 'Failed dominance'
	String get failedDominance => 'Failed dominance';

	/// en: 'Points'
	String get points2 => 'Points';

	/// en: 'Winner'
	String get winner => 'Winner';

	/// en: 'Failed dominance always counts as no points.'
	String get failedDominanceAlwaysCountsAsNoPoints => 'Failed dominance always counts as no points.';

	/// en: 'For each non-winner, set points or mark failed dominance attempt. '
	String get forEachNonWinnerSetPointsOrMarkFailedDominanceAttempt => 'For each non-winner, set points or mark failed dominance attempt. ';
}

// Path: register_match.ui_sheets_register_match_wizard_bottom_actions_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Submit report'
	String get submitReport => 'Submit report';

	/// en: 'Back'
	String get back => 'Back';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Continue'
	String get continueButton => 'Continue';
}

// Path: register_match.ui_sheets_register_match_picker_empty_section
class TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'You do not have any hosted/subscribed match pending result registration.'
	String get youDoNotHaveAnyHostedSubscribedMatchPendingResultRegistration => 'You do not have any hosted/subscribed match pending result registration.';

	/// en: 'No pending matches'
	String get noPendingMatches => 'No pending matches';
}

// Path: register_match.ui_sheets_register_match_wizard_loading_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Loading match details...'
	String get loadingMatchDetails => 'Loading match details...';
}

// Path: register_match.ui_sheets_register_match_picker_sheet
class TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'You can register this match from 2 hours before its scheduled start. '
	String get youCanRegisterThisMatchFrom2HoursBeforeItsScheduledStart => 'You can register this match from 2 hours before its scheduled start. ';

	/// en: 'Result registration not available yet'
	String get resultRegistrationNotAvailableYet => 'Result registration not available yet';
}

// Path: register_match.ui_sheets_register_match_add_anonymous_player_sheet
class TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tap to add'
	String get tapToAdd => 'Tap to add';

	/// en: 'Already added to this report'
	String get alreadyAddedToThisReport => 'Already added to this report';

	/// en: 'No anonymous players yet. Create one using first and last name.'
	String get noAnonymousPlayersYetCreateOneUsingFirstAndLastName => 'No anonymous players yet. Create one using first and last name.';

	/// en: 'Create and add player'
	String get createAndAddPlayer => 'Create and add player';

	/// en: 'Last name'
	String get lastName => 'Last name';

	/// en: 'First name'
	String get firstName => 'First name';

	/// en: 'Add anonymous player'
	String get addAnonymousPlayer => 'Add anonymous player';
}

// Path: register_match.ui_sheets_register_match_wizard_top_bar_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Register Match Result'
	String get registerMatchResult => 'Register Match Result';
}

// Path: register_match.ui_sheets_register_match_wizard_error_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'Register Match'
	String get registerMatch => 'Register Match';
}

// Path: register_match.ui_sheets_register_match_wizard_sheet
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Gallery'
	String get gallery => 'Gallery';

	/// en: 'Camera'
	String get camera => 'Camera';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Gallery'
	String get gallery2 => 'Gallery';

	/// en: 'Camera'
	String get camera2 => 'Camera';

	/// en: 'Select source'
	String get selectSource => 'Select source';

	/// en: 'Selected image is empty. Choose another image.'
	String get selectedImageIsEmptyChooseAnotherImage => 'Selected image is empty. Choose another image.';

	/// en: 'Invalid image'
	String get invalidImage => 'Invalid image';

	/// en: 'Allow camera and photo permissions in system settings and try again.'
	String get allowCameraAndPhotoPermissionsInSystemSettingsAndTryAgain => 'Allow camera and photo permissions in system settings and try again.';

	/// en: 'Unable to access camera or gallery'
	String get unableToAccessCameraOrGallery => 'Unable to access camera or gallery';

	/// en: 'Ok'
	String get ok => 'Ok';

	/// en: 'Take a selfie with everyone at the table. If possible, include the board in the same photo.'
	String get takeASelfieWithEveryoneAtTheTableIfPossibleIncludeTheBoardInTheSamePhoto => 'Take a selfie with everyone at the table. If possible, include the board in the same photo.';

	/// en: 'Group selfie proof'
	String get groupSelfieProof => 'Group selfie proof';

	/// en: 'Complete all report steps before submitting.'
	String get completeAllReportStepsBeforeSubmitting => 'Complete all report steps before submitting.';

	/// en: 'Incomplete report'
	String get incompleteReport => 'Incomplete report';

	/// en: 'Add the board photo before continuing.'
	String get addTheBoardPhotoBeforeContinuing => 'Add the board photo before continuing.';

	/// en: 'Board photo required'
	String get boardPhotoRequired => 'Board photo required';

	/// en: 'Add the group selfie before continuing.'
	String get addTheGroupSelfieBeforeContinuing => 'Add the group selfie before continuing.';

	/// en: 'Group photo required'
	String get groupPhotoRequired => 'Group photo required';

	/// en: 'Match duration must be at most 8 hours.'
	String get matchDurationMustBeAtMost8Hours => 'Match duration must be at most 8 hours.';

	/// en: 'Invalid duration'
	String get invalidDuration => 'Invalid duration';

	/// en: 'Match duration must be greater than zero.'
	String get matchDurationMustBeGreaterThanZero => 'Match duration must be greater than zero.';

	/// en: 'Invalid duration'
	String get invalidDuration2 => 'Invalid duration';

	/// en: 'Match start time cannot be in the future.'
	String get matchStartTimeCannotBeInTheFuture => 'Match start time cannot be in the future.';

	/// en: 'Invalid match registration'
	String get invalidMatchRegistration => 'Invalid match registration';

	/// en: 'Select when this match started.'
	String get selectWhenThisMatchStarted => 'Select when this match started.';

	/// en: 'Match start missing'
	String get matchStartMissing => 'Match start missing';

	/// en: 'Invalid points'
	String get invalidPoints => 'Invalid points';

	/// en: 'Points missing'
	String get pointsMissing => 'Points missing';

	/// en: 'Select how the winner won before continuing.'
	String get selectHowTheWinnerWonBeforeContinuing => 'Select how the winner won before continuing.';

	/// en: 'Winner method missing'
	String get winnerMethodMissing => 'Winner method missing';

	/// en: 'Select the winner before continuing.'
	String get selectTheWinnerBeforeContinuing => 'Select the winner before continuing.';

	/// en: 'Winner missing'
	String get winnerMissing => 'Winner missing';

	/// en: 'The selected winner is no longer in the participant list.'
	String get theSelectedWinnerIsNoLongerInTheParticipantList => 'The selected winner is no longer in the participant list.';

	/// en: 'Winner missing'
	String get winnerMissing2 => 'Winner missing';

	/// en: 'Select the winner before continuing.'
	String get selectTheWinnerBeforeContinuing2 => 'Select the winner before continuing.';

	/// en: 'Winner missing'
	String get winnerMissing3 => 'Winner missing';

	/// en: 'Invalid faction setup'
	String get invalidFactionSetup => 'Invalid faction setup';

	/// en: 'Faction missing'
	String get factionMissing => 'Faction missing';

	/// en: 'Select at least 2 participants (registered and/or anonymous) to continue.'
	String get selectAtLeast2ParticipantsRegisteredAndOrAnonymousToContinue => 'Select at least 2 participants (registered and/or anonymous) to continue.';

	/// en: 'Not enough players'
	String get notEnoughPlayers => 'Not enough players';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'You kept the default duration of 1 hour. Do you want to continue with it?'
	String get youKeptTheDefaultDurationOf1HourDoYouWantToContinueWithIt => 'You kept the default duration of 1 hour. Do you want to continue with it?';

	/// en: 'Keep default duration?'
	String get keepDefaultDuration => 'Keep default duration?';

	/// en: 'Match start time cannot be in the future.'
	String get matchStartTimeCannotBeInTheFuture2 => 'Match start time cannot be in the future.';

	/// en: 'Invalid match registration'
	String get invalidMatchRegistration2 => 'Invalid match registration';

	/// en: 'Match start time cannot be in the future.'
	String get matchStartTimeCannotBeInTheFuture3 => 'Match start time cannot be in the future.';

	/// en: 'Invalid match registration'
	String get invalidMatchRegistration3 => 'Invalid match registration';

	/// en: 'Unable to load this match report flow.'
	String get unableToLoadThisMatchReportFlow => 'Unable to load this match report flow.';

	/// en: 'Match not found'
	String get matchNotFound => 'Match not found';

	/// en: 'Unable to load this match report flow.'
	String get unableToLoadThisMatchReportFlow2 => 'Unable to load this match report flow.';

	/// en: 'Invalid match'
	String get invalidMatch => 'Invalid match';

	/// en: 'Continue'
	String get continueButton => 'Continue';

	/// en: 'Select a faction for {participantName} before continuing.'
	String selectFactionForParticipantBeforeContinuing({required Object participantName}) => 'Select a faction for ${participantName} before continuing.';

	/// en: '{factionName} was selected more than once. Each faction can only be selected once.'
	String factionWasSelectedMoreThanOnceEachFactionCanOnlyBeSelectedOnce({required Object factionName}) => '${factionName} was selected more than once. Each faction can only be selected once.';
}

// Path: register_match.ui_sheets_register_match_wizard_review_step_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Board photo'
	String get boardPhoto => 'Board photo';

	/// en: 'Group photo'
	String get groupPhoto => 'Group photo';

	/// en: 'Social proof'
	String get socialProof => 'Social proof';

	/// en: 'Ranking'
	String get ranking => 'Ranking';

	/// en: 'Confirm all details before logging this match.'
	String get confirmAllDetailsBeforeLoggingThisMatch => 'Confirm all details before logging this match.';
}

// Path: register_match.ui_sheets_register_match_wizard_review_photo_tile
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Ready'
	String get ready => 'Ready';

	/// en: 'Missing'
	String get missing => 'Missing';
}

// Path: register_match.ui_sheets_register_match_wizard_proof_card_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tap to replace'
	String get tapToReplace => 'Tap to replace';

	/// en: 'Tap to add photo'
	String get tapToAddPhoto => 'Tap to add photo';
}

// Path: register_match.ui_sheets_register_match_picker_header_section
class TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Select a match you participated in. You can register a result from 2 hours before scheduled start.'
	String get selectAMatchYouParticipatedInYouCanRegisterAResultFrom2HoursBeforeSchedu => 'Select a match you participated in. You can register a result from 2 hours before scheduled start.';

	/// en: 'Register Match Result'
	String get registerMatchResult => 'Register Match Result';
}

// Path: register_match.ui_sheets_register_match_wizard_social_proof_step_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Capture the board and score track clearly.'
	String get captureTheBoardAndScoreTrackClearly => 'Capture the board and score track clearly.';

	/// en: 'Board photo'
	String get boardPhoto => 'Board photo';

	/// en: 'Upload a photo of the board with the score track clearly visible.'
	String get uploadAPhotoOfTheBoardWithTheScoreTrackClearlyVisible => 'Upload a photo of the board with the score track clearly visible.';

	/// en: 'Board photo proof'
	String get boardPhotoProof => 'Board photo proof';

	/// en: 'Selfie with all players. Include the board if possible.'
	String get selfieWithAllPlayersIncludeTheBoardIfPossible => 'Selfie with all players. Include the board if possible.';

	/// en: 'Group photo'
	String get groupPhoto => 'Group photo';

	/// en: 'Upload both photos to confirm this match happened in person.'
	String get uploadBothPhotosToConfirmThisMatchHappenedInPerson => 'Upload both photos to confirm this match happened in person.';
}

// Path: shop.ui_screens_shop_screen
class TranslationsShopUiScreensShopScreenEn {
	TranslationsShopUiScreensShopScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'supporter packs linked to community tournaments.'
	String get supporterPacksLinkedToCommunityTournaments => 'supporter packs linked to community tournaments.';

	/// en: 'Planned: themed profile packs, faction cosmetics, and event '
	String get plannedThemedProfilePacksFactionCosmeticsAndEvent => 'Planned: themed profile packs, faction cosmetics, and event ';

	/// en: 'Roadmap placeholder'
	String get roadmapPlaceholder => 'Roadmap placeholder';

	/// en: 'community-driven bundles for ROOT players.'
	String get communityDrivenBundlesForRootPlayers => 'community-driven bundles for ROOT players.';

	/// en: 'This area will host future digital goods, cosmetics, and '
	String get thisAreaWillHostFutureDigitalGoodsCosmeticsAnd => 'This area will host future digital goods, cosmetics, and ';

	/// en: 'Shop feature placeholder'
	String get shopFeaturePlaceholder => 'Shop feature placeholder';
}
