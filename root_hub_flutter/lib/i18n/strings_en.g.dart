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
	String get title => 'Root Hub';
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
	String get l58c17 => 'Pick your favorite ROOT faction before entering the hub.';

	/// en: 'Choose Your Faction'
	String get l42c25 => 'Choose Your Faction';
}

// Path: auth.auth_onboarding_profile_screen
class TranslationsAuthAuthOnboardingProfileScreenEn {
	TranslationsAuthAuthOnboardingProfileScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Continue'
	String get l289c33 => 'Continue';

	/// en: 'Current location uses your phone coordinates (x and y) and is required to show nearby matches.'
	String get l206c17 => 'Current location uses your phone coordinates (x and y) and is required to show nearby matches.';

	/// en: 'Your display name is how other players will see you in Root Hub. '
	String get l205c17 => 'Your display name is how other players will see you in Root Hub. ';

	/// en: 'Set Your Hub Identity'
	String get l188c25 => 'Set Your Hub Identity';
}

// Path: auth.auth_loading_screen
class TranslationsAuthAuthLoadingScreenEn {
	TranslationsAuthAuthLoadingScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'ROOT HUB'
	String get l32c21 => 'ROOT HUB';
}

// Path: auth.auth_login_screen
class TranslationsAuthAuthLoginScreenEn {
	TranslationsAuthAuthLoginScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Sign in to browse schedules and join tables.'
	String get l195c27 => 'Sign in to browse schedules and join tables.';

	/// en: 'Find Your Next ROOT Match'
	String get l178c35 => 'Find Your Next\nROOT Match';
}

// Path: auth.auth_onboarding_continue_button_widget
class TranslationsAuthAuthOnboardingContinueButtonWidgetEn {
	TranslationsAuthAuthOnboardingContinueButtonWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Continue'
	String get l44c15 => 'Continue';
}

// Path: dashboard.ui_screens_dashboard_screen
class TranslationsDashboardUiScreensDashboardScreenEn {
	TranslationsDashboardUiScreensDashboardScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Shop'
	String get l465c32 => 'Shop';

	/// en: 'Match'
	String get l451c32 => 'Match';

	/// en: 'Home'
	String get l437c32 => 'Home';

	/// en: 'ROOT HUB'
	String get l317c35 => 'ROOT HUB';

	/// en: 'Choose from Gallery'
	String get l213c35 => 'Choose from Gallery';

	/// en: 'Take Photo'
	String get l206c35 => 'Take Photo';

	/// en: 'Cancel'
	String get l188c31 => 'Cancel';

	/// en: 'Choose from Library'
	String get l180c33 => 'Choose from Library';

	/// en: 'Take Photo'
	String get l174c33 => 'Take Photo';

	/// en: 'Change profile photo'
	String get l168c29 => 'Change profile photo';

	/// en: 'Allow camera and photo permissions in system settings and try again.'
	String get l130c13 => 'Allow camera and photo permissions in system settings and try again.';

	/// en: 'Unable to access camera or gallery'
	String get l128c16 => 'Unable to access camera or gallery';
}

// Path: dashboard.ui_screens_dashboard_faction_editor_screen
class TranslationsDashboardUiScreensDashboardFactionEditorScreenEn {
	TranslationsDashboardUiScreensDashboardFactionEditorScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Choose the faction shown in your profile and used as your default preference.'
	String get l125c17 => 'Choose the faction shown in your profile and used as your default preference.';

	/// en: 'Change Favorite Faction'
	String get l104c31 => 'Change Favorite Faction';
}

// Path: dashboard.ui_dialogs_edit_location_dialog
class TranslationsDashboardUiDialogsEditLocationDialogEn {
	TranslationsDashboardUiDialogsEditLocationDialogEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Save'
	String get l247c29 => 'Save';

	/// en: 'Cancel'
	String get l227c23 => 'Cancel';

	/// en: 'Update your coordinates and target search ratio for match discovery.'
	String get l192c15 => 'Update your coordinates and target search ratio for match discovery.';

	/// en: 'Edit Location'
	String get l184c15 => 'Edit Location';
}

// Path: dashboard.ui_dialogs_edit_display_name_dialog
class TranslationsDashboardUiDialogsEditDisplayNameDialogEn {
	TranslationsDashboardUiDialogsEditDisplayNameDialogEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Save'
	String get l122c29 => 'Save';

	/// en: 'Cancel'
	String get l104c23 => 'Cancel';

	/// en: 'This is how players will see you across Root Hub.'
	String get l81c15 => 'This is how players will see you across Root Hub.';

	/// en: 'Edit Display Name'
	String get l73c15 => 'Edit Display Name';
}

// Path: dashboard.ui_widgets_dashboard_profile_drawer_widget
class TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetEn {
	TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Log out'
	String get l314c21 => 'Log out';

	/// en: 'Change Faction'
	String get l267c45 => 'Change Faction';

	/// en: 'Saving...'
	String get l266c45 => 'Saving...';

	/// en: 'Favorite Faction'
	String get l218c37 => 'Favorite Faction';

	/// en: 'Location'
	String get l169c30 => 'Location';

	/// en: 'Display Name'
	String get l160c30 => 'Display Name';
}

// Path: home.ui_sections_home_stats_section
class TranslationsHomeUiSectionsHomeStatsSectionEn {
	TranslationsHomeUiSectionsHomeStatsSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'All factions total'
	String get l420c16 => 'All factions total';

	/// en: 'All factions avg'
	String get l416c16 => 'All factions avg';

	/// en: 'All factions total'
	String get l412c16 => 'All factions total';

	/// en: 'All factions avg'
	String get l403c16 => 'All factions avg';

	/// en: 'Absolute number of wins for each faction.'
	String get l59c20 => 'Absolute number of wins for each faction.';

	/// en: 'Total Wins'
	String get l58c14 => 'Total Wins';

	/// en: 'Average score per faction when points were tracked.'
	String get l54c20 => 'Average score per faction when points were tracked.';

	/// en: 'Average Points'
	String get l53c14 => 'Average Points';

	/// en: 'How often each faction appears in completed games.'
	String get l49c20 => 'How often each faction appears in completed games.';

	/// en: 'Played Games'
	String get l48c14 => 'Played Games';

	/// en: 'Who is winning the most often right now.'
	String get l44c20 => 'Who is winning the most often right now.';

	/// en: 'Faction Win Rate'
	String get l43c14 => 'Faction Win Rate';
}

// Path: home.ui_screens_home_screen
class TranslationsHomeUiScreensHomeScreenEn {
	TranslationsHomeUiScreensHomeScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Your personal faction performance and match profile.'
	String get l92c26 => 'Your personal faction performance and match profile.';

	/// en: 'My Stats'
	String get l91c20 => 'My Stats';

	/// en: 'Faction performance from all played matches in Root Hub.'
	String get l78c17 => 'Faction performance from all played matches in Root Hub.';

	/// en: 'Community Stats'
	String get l76c20 => 'Community Stats';

	/// en: 'See how the ROOT platform is evolving and compare it with your own progress.'
	String get l57c15 => 'See how the ROOT platform is evolving and compare it with your own progress.';

	/// en: 'Community Dashboard'
	String get l47c15 => 'Community Dashboard';
}

// Path: home.ui_widgets_home_stats_pie_chart_widget
class TranslationsHomeUiWidgetsHomeStatsPieChartWidgetEn {
	TranslationsHomeUiWidgetsHomeStatsPieChartWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No values for this metric yet.'
	String get l71c15 => 'No values for this metric yet.';
}

// Path: match.ui_sheets_match_edit_table_error_widget
class TranslationsMatchUiSheetsMatchEditTableErrorWidgetEn {
	TranslationsMatchUiSheetsMatchEditTableErrorWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Close'
	String get l44c33 => 'Close';
}

// Path: match.ui_sheets_match_edit_table_loading_widget
class TranslationsMatchUiSheetsMatchEditTableLoadingWidgetEn {
	TranslationsMatchUiSheetsMatchEditTableLoadingWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Loading table details...'
	String get l29c19 => 'Loading table details...';
}

// Path: match.ui_sheets_match_table_info_sheet
class TranslationsMatchUiSheetsMatchTableInfoSheetEn {
	TranslationsMatchUiSheetsMatchTableInfoSheetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Remove'
	String get l256c33 => 'Remove';

	/// en: 'Cancel'
	String get l248c33 => 'Cancel';

	/// en: 'rejoin if seats are still available.'
	String get l243c13 => 'rejoin if seats are still available.';

	/// en: 'Cancel'
	String get l217c33 => 'Cancel';

	/// en: 'Select a player to remove from the table.'
	String get l199c19 => 'Select a player to remove from the table.';

	/// en: 'Remove a Player'
	String get l191c29 => 'Remove a Player';

	/// en: 'Leave'
	String get l148c33 => 'Leave';

	/// en: 'Cancel'
	String get l140c33 => 'Cancel';

	/// en: 'players list. You can rejoin later if seats are still available.'
	String get l135c13 => 'players list. You can rejoin later if seats are still available.';

	/// en: 'You will be unsubscribed from this match and removed from the '
	String get l134c13 => 'You will be unsubscribed from this match and removed from the ';

	/// en: 'Leave this table?'
	String get l132c29 => 'Leave this table?';

	/// en: 'Unable to load table details.'
	String get l92c32 => 'Unable to load table details.';

	/// en: 'Table not found'
	String get l91c26 => 'Table not found';
}

// Path: match.ui_sheets_match_table_info_content_widget
class TranslationsMatchUiSheetsMatchTableInfoContentWidgetEn {
	TranslationsMatchUiSheetsMatchTableInfoContentWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No players have joined this table yet.'
	String get l192c23 => 'No players have joined this table yet.';

	/// en: 'These are the current players that will participate.'
	String get l174c25 => 'These are the current players that will participate.';

	/// en: 'No players subscribed yet.'
	String get l173c25 => 'No players subscribed yet.';

	/// en: 'Players in this match'
	String get l165c19 => 'Players in this match';

	/// en: 'Unknown host'
	String get l114c56 => 'Unknown host';

	/// en: 'Table Details'
	String get l73c19 => 'Table Details';
}

// Path: match.ui_sheets_match_table_info_error_widget
class TranslationsMatchUiSheetsMatchTableInfoErrorWidgetEn {
	TranslationsMatchUiSheetsMatchTableInfoErrorWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Retry'
	String get l55c37 => 'Retry';

	/// en: 'Close'
	String get l47c37 => 'Close';
}

// Path: match.ui_sheets_match_table_info_participant_card_widget
class TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetEn {
	TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Favorite Faction'
	String get l69c21 => 'Favorite Faction';
}

// Path: match.ui_sheets_match_edit_table_sheet
class TranslationsMatchUiSheetsMatchEditTableSheetEn {
	TranslationsMatchUiSheetsMatchEditTableSheetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'The scheduled time cannot be more than '
	String get l282c13 => 'The scheduled time cannot be more than ';

	/// en: 'Date is too far'
	String get l280c16 => 'Date is too far';

	/// en: 'The scheduled time must be at least '
	String get l265c13 => 'The scheduled time must be at least ';

	/// en: 'Time is too soon'
	String get l263c16 => 'Time is too soon';

	/// en: 'You cannot set the maximum below that number.'
	String get l240c13 => 'You cannot set the maximum below that number.';

	/// en: 'Too many players subscribed'
	String get l237c16 => 'Too many players subscribed';

	/// en: 'with minimum not greater than maximum.'
	String get l229c13 => 'with minimum not greater than maximum.';

	/// en: 'Players range must be between 2 and 6, '
	String get l228c13 => 'Players range must be between 2 and 6, ';

	/// en: 'Invalid players range'
	String get l226c16 => 'Invalid players range';

	/// en: 'Please add a title for your table.'
	String get l218c22 => 'Please add a title for your table.';

	/// en: 'Title required'
	String get l217c16 => 'Title required';

	/// en: 'Unable to load table details.'
	String get l111c32 => 'Unable to load table details.';

	/// en: 'Table not found'
	String get l110c26 => 'Table not found';
}

// Path: match.ui_sheets_match_table_info_loading_widget
class TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetEn {
	TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Loading table details...'
	String get l29c19 => 'Loading table details...';
}

// Path: match.ui_sheets_match_edit_table_form_widget
class TranslationsMatchUiSheetsMatchEditTableFormWidgetEn {
	TranslationsMatchUiSheetsMatchEditTableFormWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Save Changes'
	String get l293c58 => 'Save Changes';

	/// en: 'Saving...'
	String get l293c44 => 'Saving...';

	/// en: 'Cancel'
	String get l272c39 => 'Cancel';

	/// en: 'Must be at least 10 minutes from now, up to '
	String get l230c23 => 'Must be at least 10 minutes from now, up to ';

	/// en: 'Schedule'
	String get l228c26 => 'Schedule';

	/// en: 'Maximum'
	String get l217c34 => 'Maximum';

	/// en: 'Minimum'
	String get l204c34 => 'Minimum';

	/// en: 'Set between 2 and 6 players.'
	String get l188c25 => 'Set between 2 and 6 players.';

	/// en: 'Players range'
	String get l185c26 => 'Players range';

	/// en: 'Example: We have Marauder expansion.'
	String get l173c31 => 'Example: We have Marauder expansion.';

	/// en: 'Extra details like expansions, parking tips, etc.'
	String get l164c23 => 'Extra details like expansions, parking tips, etc.';

	/// en: 'Description (optional)'
	String get l162c26 => 'Description (optional)';

	/// en: 'Example: Saturday ROOT at Lantern Café'
	String get l150c31 => 'Example: Saturday ROOT at Lantern Café';

	/// en: 'A short name so players can find your table.'
	String get l142c32 => 'A short name so players can find your table.';

	/// en: 'Table title'
	String get l141c26 => 'Table title';

	/// en: 'New players can still join this table.'
	String get l122c37 => 'New players can still join this table.';

	/// en: 'New players cannot join this table.'
	String get l121c37 => 'New players cannot join this table.';

	/// en: 'Close subscriptions'
	String get l113c31 => 'Close subscriptions';

	/// en: 'Edit Details'
	String get l73c19 => 'Edit Details';

	/// en: 'Edit Table'
	String get l65c19 => 'Edit Table';
}

// Path: match.ui_sheets_match_table_info_bottom_actions_widget
class TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetEn {
	TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Remove Player'
	String get l112c54 => 'Remove Player';

	/// en: 'Removing...'
	String get l112c38 => 'Removing...';

	/// en: 'Leave Table'
	String get l79c56 => 'Leave Table';

	/// en: 'Leaving...'
	String get l79c41 => 'Leaving...';

	/// en: 'Close'
	String get l55c39 => 'Close';
}

// Path: match.ui_screens_match_create_table_location_loading_search_widget
class TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetEn {
	TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Searching locations...'
	String get l21c13 => 'Searching locations...';
}

// Path: match.ui_screens_match_create_table_location_screen
class TranslationsMatchUiScreensMatchCreateTableLocationScreenEn {
	TranslationsMatchUiScreensMatchCreateTableLocationScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Continue'
	String get l287c29 => 'Continue';

	/// en: 'Previously selected locations'
	String get l236c23 => 'Previously selected locations';

	/// en: 'Search results'
	String get l203c25 => 'Search results';

	/// en: 'Tap a location to select it. Previously selected locations are saved here for faster hosting.'
	String get l160c19 => 'Tap a location to select it. Previously selected locations are saved here for faster hosting.';

	/// en: 'Search location (Google Places)'
	String get l148c31 => 'Search location (Google Places)';

	/// en: 'Choose Table Location'
	String get l122c25 => 'Choose Table Location';

	/// en: 'Choose one location from the list before creating the table.'
	String get l61c13 => 'Choose one location from the list before creating the table.';

	/// en: 'Location required'
	String get l59c16 => 'Location required';
}

// Path: match.ui_screens_match_join_sheet_error_widget
class TranslationsMatchUiScreensMatchJoinSheetErrorWidgetEn {
	TranslationsMatchUiScreensMatchJoinSheetErrorWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Retry'
	String get l62c37 => 'Retry';

	/// en: 'Close'
	String get l54c37 => 'Close';
}

// Path: match.ui_screens_match_screen
class TranslationsMatchUiScreensMatchScreenEn {
	TranslationsMatchUiScreensMatchScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unable to open the dialer right now.'
	String get l849c23 => 'Unable to open the dialer right now.';

	/// en: 'Invalid phone number format.'
	String get l829c25 => 'Invalid phone number format.';

	/// en: 'Unable to open the link right now.'
	String get l816c23 => 'Unable to open the link right now.';

	/// en: 'Invalid URL format.'
	String get l800c25 => 'Invalid URL format.';

	/// en: 'Close'
	String get l763c43 => 'Close';

	/// en: 'Manual location notes'
	String get l716c33 => 'Manual location notes';

	/// en: 'Phone'
	String get l693c38 => 'Phone';

	/// en: 'Phone'
	String get l688c34 => 'Phone';

	/// en: 'Website'
	String get l677c38 => 'Website';

	/// en: 'Website'
	String get l672c34 => 'Website';

	/// en: 'Map link'
	String get l661c38 => 'Map link';

	/// en: 'Map link'
	String get l656c34 => 'Map link';

	/// en: 'Public'
	String get l607c41 => 'Public';

	/// en: 'Private'
	String get l606c41 => 'Private';

	/// en: 'matches played here'
	String get l564c47 => 'matches played here';

	/// en: 'match played here'
	String get l563c47 => 'match played here';

	/// en: 'Host Table'
	String get l239c15 => 'Host Table';

	/// en: 'Report Result'
	String get l191c21 => 'Report Result';
}

// Path: match.ui_screens_match_loading_error_state_widget
class TranslationsMatchUiScreensMatchLoadingErrorStateWidgetEn {
	TranslationsMatchUiScreensMatchLoadingErrorStateWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Try again'
	String get l48c31 => 'Try again';
}

// Path: match.ui_screens_match_nearby_header_widget
class TranslationsMatchUiScreensMatchNearbyHeaderWidgetEn {
	TranslationsMatchUiScreensMatchNearbyHeaderWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Only tables that did not start more than 2 hours ago are listed.'
	String get l83c13 => 'Only tables that did not start more than 2 hours ago are listed.';

	/// en: 'Nearby Match Tables'
	String get l48c19 => 'Nearby Match Tables';

	/// en: 'Match Finder'
	String get l35c19 => 'Match Finder';
}

// Path: match.ui_screens_match_no_matches_state_widget
class TranslationsMatchUiScreensMatchNoMatchesStateWidgetEn {
	TranslationsMatchUiScreensMatchNoMatchesStateWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Host the first table'
	String get l65c31 => 'Host the first table';

	/// en: 'Be the first to start one. Host a new table so nearby players can subscribe.'
	String get l54c13 => 'Be the first to start one. Host a new table so nearby players can subscribe.';

	/// en: 'No tables in your area yet'
	String get l47c13 => 'No tables in your area yet';
}

// Path: match.ui_screens_match_time_status_chip_widget
class TranslationsMatchUiScreensMatchTimeStatusChipWidgetEn {
	TranslationsMatchUiScreensMatchTimeStatusChipWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Remaining time until the match starts.'
	String get l27c13 => 'Remaining time until the match starts.';

	/// en: 'This match already started. Recently started tables stay visible for a short period.'
	String get l26c13 => 'This match already started. Recently started tables stay visible for a short period.';
}

// Path: match.ui_screens_match_create_table_location_no_search_results_widget
class TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetEn {
	TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No locations found for this query. Try another place name or area.'
	String get l20c9 => 'No locations found for this query. Try another place name or area.';
}

// Path: match.ui_screens_match_create_table_screen
class TranslationsMatchUiScreensMatchCreateTableScreenEn {
	TranslationsMatchUiScreensMatchCreateTableScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Continue'
	String get l424c23 => 'Continue';

	/// en: 'No, I am only hosting this table'
	String get l384c31 => 'No, I am only hosting this table';

	/// en: 'Yes, I will play this match'
	String get l383c31 => 'Yes, I will play this match';

	/// en: 'If you are a venue, board game club, or organizer bringing players together but not joining the match, leave this unchecked.'
	String get l365c25 => 'If you are a venue, board game club, or organizer bringing players together but not joining the match, leave this unchecked.';

	/// en: 'Will you, the host, play?'
	String get l363c28 => 'Will you, the host, play?';

	/// en: 'Pick the day and start hour. Choose a time you can reliably show up.'
	String get l339c25 => 'Pick the day and start hour. Choose a time you can reliably show up.';

	/// en: 'Schedule'
	String get l337c28 => 'Schedule';

	/// en: 'Maximum'
	String get l318c36 => 'Maximum';

	/// en: 'Minimum'
	String get l297c36 => 'Minimum';

	/// en: 'Default is 3-4. You can set between 2 and 6 players.'
	String get l283c25 => 'Default is 3-4. You can set between 2 and 6 players.';

	/// en: 'Players range'
	String get l281c28 => 'Players range';

	/// en: 'Example: We have Marauder expansion and spare sleeves.'
	String get l271c27 => 'Example: We have Marauder expansion and spare sleeves.';

	/// en: 'Add extra details like expansions available, parking tips, or reference points.'
	String get l261c25 => 'Add extra details like expansions available, parking tips, or reference points.';

	/// en: 'Description (optional)'
	String get l259c28 => 'Description (optional)';

	/// en: 'Example: Saturday ROOT at Lantern Café'
	String get l249c33 => 'Example: Saturday ROOT at Lantern Café';

	/// en: 'This can be anything that helps identify the table, like a place name or event style.'
	String get l241c25 => 'This can be anything that helps identify the table, like a place name or event style.';

	/// en: 'Table title'
	String get l239c28 => 'Table title';

	/// en: 'Set table details first. On the next screen you will choose the location.'
	String get l229c21 => 'Set table details first. On the next screen you will choose the location.';

	/// en: 'Host a New Table'
	String get l217c27 => 'Host a New Table';

	/// en: 'Select the start hour for this table before continuing.'
	String get l155c22 => 'Select the start hour for this table before continuing.';

	/// en: 'Start hour required'
	String get l154c16 => 'Start hour required';

	/// en: 'You cannot select a day in the past.'
	String get l146c22 => 'You cannot select a day in the past.';

	/// en: 'Invalid date'
	String get l145c16 => 'Invalid date';

	/// en: 'Select the day for this table before continuing.'
	String get l137c22 => 'Select the day for this table before continuing.';

	/// en: 'Day required'
	String get l136c16 => 'Day required';

	/// en: 'Add a title so players can quickly identify your table. Example: "Downtown Café Night".'
	String get l127c13 => 'Add a title so players can quickly identify your table. Example: "Downtown Café Night".';

	/// en: 'Title required'
	String get l125c16 => 'Title required';

	/// en: 'You cannot select a day in the past.'
	String get l92c22 => 'You cannot select a day in the past.';

	/// en: 'Invalid date'
	String get l91c16 => 'Invalid date';
}

// Path: match.ui_screens_match_chat_loading_error_state_widget
class TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetEn {
	TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Try again'
	String get l52c33 => 'Try again';
}

// Path: match.ui_screens_match_report_available_chip_widget
class TranslationsMatchUiScreensMatchReportAvailableChipWidgetEn {
	TranslationsMatchUiScreensMatchReportAvailableChipWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Report available'
	String get l31c15 => 'Report available';

	/// en: 'You can report this match result now.'
	String get l13c16 => 'You can report this match result now.';
}

// Path: match.ui_screens_match_initial_loading_state_widget
class TranslationsMatchUiScreensMatchInitialLoadingStateWidgetEn {
	TranslationsMatchUiScreensMatchInitialLoadingStateWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Loading nearby tables...'
	String get l31c13 => 'Loading nearby tables...';
}

// Path: match.ui_screens_match_participant_card_widget
class TranslationsMatchUiScreensMatchParticipantCardWidgetEn {
	TranslationsMatchUiScreensMatchParticipantCardWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Favorite Faction'
	String get l73c21 => 'Favorite Faction';
}

// Path: match.ui_screens_match_join_sheet_content_widget
class TranslationsMatchUiScreensMatchJoinSheetContentWidgetEn {
	TranslationsMatchUiScreensMatchJoinSheetContentWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Confirm Join'
	String get l323c29 => 'Confirm Join';

	/// en: 'Subscriptions closed'
	String get l322c29 => 'Subscriptions closed';

	/// en: 'Already subscribed'
	String get l320c29 => 'Already subscribed';

	/// en: 'Cancel'
	String get l303c39 => 'Cancel';

	/// en: 'You can be the first player to lock this table in.'
	String get l262c23 => 'You can be the first player to lock this table in.';

	/// en: 'These are the current players that will participate.'
	String get l244c25 => 'These are the current players that will participate.';

	/// en: 'No players subscribed yet.'
	String get l243c25 => 'No players subscribed yet.';

	/// en: 'Players in this match'
	String get l235c19 => 'Players in this match';

	/// en: 'Unknown host'
	String get l175c56 => 'Unknown host';

	/// en: 'See table chat'
	String get l151c39 => 'See table chat';

	/// en: 'New players cannot join at this time.'
	String get l130c29 => 'New players cannot join at this time.';

	/// en: 'The host has closed subscriptions for this table. '
	String get l129c29 => 'The host has closed subscriptions for this table. ';

	/// en: 'Confirm table subscription'
	String get l81c19 => 'Confirm table subscription';
}

// Path: match.ui_screens_match_table_card_widget
class TranslationsMatchUiScreensMatchTableCardWidgetEn {
	TranslationsMatchUiScreensMatchTableCardWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Subscribed'
	String get l362c17 => 'Subscribed';

	/// en: 'Tap card to open chat'
	String get l275c25 => 'Tap card to open chat';

	/// en: 'Subscriptions closed'
	String get l265c25 => 'Subscriptions closed';

	/// en: 'Open full location details'
	String get l235c26 => 'Open full location details';

	/// en: 'places'
	String get l155c72 => 'places';

	/// en: 'place'
	String get l155c62 => 'place';

	/// en: 's'
	String get l154c89 => 's';
}

// Path: match.ui_screens_match_location_header_image_widget
class TranslationsMatchUiScreensMatchLocationHeaderImageWidgetEn {
	TranslationsMatchUiScreensMatchLocationHeaderImageWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Location Details'
	String get l67c19 => 'Location Details';
}

// Path: match.ui_screens_match_create_table_location_no_recent_locations_widget
class TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetEn {
	TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No previous locations yet. Search and select one above.'
	String get l20c9 => 'No previous locations yet. Search and select one above.';
}

// Path: match.ui_screens_match_chat_screen
class TranslationsMatchUiScreensMatchChatScreenEn {
	TranslationsMatchUiScreensMatchChatScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Choose from Gallery'
	String get l513c35 => 'Choose from Gallery';

	/// en: 'Take Photo'
	String get l506c35 => 'Take Photo';

	/// en: 'Cancel'
	String get l488c31 => 'Cancel';

	/// en: 'Choose from Library'
	String get l480c33 => 'Choose from Library';

	/// en: 'Take Photo'
	String get l474c33 => 'Take Photo';

	/// en: 'Send a photo'
	String get l468c29 => 'Send a photo';

	/// en: 'Compress'
	String get l407c33 => 'Compress';

	/// en: 'Cancel'
	String get l403c33 => 'Cancel';

	/// en: 'Image is too large'
	String get l395c29 => 'Image is too large';

	/// en: 'Subscribed'
	String get l273c37 => 'Subscribed';

	/// en: 'Unable to resolve your account information.'
	String get l142c21 => 'Unable to resolve your account information.';

	/// en: 'Table info'
	String get l128c22 => 'Table info';

	/// en: 'Edit table'
	String get l123c24 => 'Edit table';
}

// Path: match.ui_screens_match_create_table_location_loading_recent_widget
class TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetEn {
	TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Loading previous locations...'
	String get l21c13 => 'Loading previous locations...';
}

// Path: register_match.ui_sheets_register_match_wizard_winner_step_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Dominance'
	String get l101c27 => 'Dominance';

	/// en: 'Total points (30)'
	String get l96c27 => 'Total points (30)';

	/// en: 'Dominance means the winner completed a Dominance card objective instead of winning by points.'
	String get l82c11 => 'Dominance means the winner completed a Dominance card objective instead of winning by points.';

	/// en: 'Total points means the winner reached 30 victory points on the score track. '
	String get l81c11 => 'Total points means the winner reached 30 victory points on the score track. ';

	/// en: 'How did the winner won?'
	String get l74c11 => 'How did the winner won?';

	/// en: 'Pick the player who won this match.'
	String get l36c11 => 'Pick the player who won this match.';
}

// Path: register_match.ui_sheets_register_match_wizard_timing_step_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Estimated duration'
	String get l134c17 => 'Estimated duration';

	/// en: 'Estimated duration'
	String get l112c11 => 'Estimated duration';

	/// en: 'Set the estimated duration. Adjust in 15-minute steps (max 8 hours).'
	String get l103c11 => 'Set the estimated duration. Adjust in 15-minute steps (max 8 hours).';

	/// en: 'Change time'
	String get l90c33 => 'Change time';

	/// en: 'Match started at'
	String get l57c11 => 'Match started at';

	/// en: 'Set the time the match actually started.'
	String get l48c11 => 'Set the time the match actually started.';
}

// Path: register_match.ui_sheets_register_match_wizard_participants_step_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Add registered player from platform'
	String get l97c31 => 'Add registered player from platform';

	/// en: 'Add anonymous player'
	String get l88c31 => 'Add anonymous player';

	/// en: 'Registered player'
	String get l63c23 => 'Registered player';

	/// en: 'Anonymous player'
	String get l62c23 => 'Anonymous player';

	/// en: 'Select registered players who were present. You can add anonymous players or search for other registered players.'
	String get l33c11 => 'Select registered players who were present. You can add anonymous players or search for other registered players.';

	/// en: '1) Who actually played?'
	String get l26c11 => '1) Who actually played?';
}

// Path: register_match.ui_sheets_register_match_picker_error_section
class TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Retry'
	String get l51c35 => 'Retry';
}

// Path: register_match.ui_sheets_register_match_picker_match_item_card
class TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Not available yet'
	String get l140c56 => 'Not available yet';

	/// en: 'Tap to report'
	String get l140c38 => 'Tap to report';
}

// Path: register_match.ui_sheets_register_match_wizard_factions_step_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Select faction'
	String get l71c38 => 'Select faction';

	/// en: 'Faction'
	String get l68c34 => 'Faction';

	/// en: 'Choose the faction used by each player in this match.'
	String get l35c11 => 'Choose the faction used by each player in this match.';

	/// en: '2) Select factions'
	String get l28c11 => '2) Select factions';
}

// Path: register_match.ui_sheets_register_match_search_registered_player_sheet
class TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tap to add'
	String get l181c37 => 'Tap to add';

	/// en: 'Already added to this report'
	String get l180c37 => 'Already added to this report';

	/// en: 'No registered players were found.'
	String get l157c35 => 'No registered players were found.';

	/// en: 'Search by display name'
	String get l113c32 => 'Search by display name';

	/// en: 'Add registered player'
	String get l98c19 => 'Add registered player';
}

// Path: register_match.ui_sheets_register_match_wizard_points_step_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '0 to 29'
	String get l152c35 => '0 to 29';

	/// en: 'Points'
	String get l151c36 => 'Points';

	/// en: 'Dominance attempt'
	String get l139c30 => 'Dominance attempt';

	/// en: 'Winner by dominance'
	String get l133c30 => 'Winner by dominance';

	/// en: 'Winner by points'
	String get l127c30 => 'Winner by points';

	/// en: 'Failed dominance'
	String get l108c39 => 'Failed dominance';

	/// en: 'Points'
	String get l103c39 => 'Points';

	/// en: 'Winner'
	String get l87c29 => 'Winner';

	/// en: 'Failed dominance always counts as no points.'
	String get l40c11 => 'Failed dominance always counts as no points.';

	/// en: 'For each non-winner, set points or mark failed dominance attempt. '
	String get l39c11 => 'For each non-winner, set points or mark failed dominance attempt. ';
}

// Path: register_match.ui_sheets_register_match_wizard_bottom_actions_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Continue'
	String get l61c59 => 'Continue';

	/// en: 'Submit report'
	String get l61c41 => 'Submit report';

	/// en: 'Back'
	String get l40c54 => 'Back';

	/// en: 'Cancel'
	String get l40c43 => 'Cancel';
}

// Path: register_match.ui_sheets_register_match_picker_empty_section
class TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'You do not have any hosted/subscribed match pending result registration.'
	String get l34c17 => 'You do not have any hosted/subscribed match pending result registration.';

	/// en: 'No pending matches'
	String get l27c17 => 'No pending matches';
}

// Path: register_match.ui_sheets_register_match_wizard_loading_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Loading match details...'
	String get l24c13 => 'Loading match details...';
}

// Path: register_match.ui_sheets_register_match_picker_sheet
class TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'You can register this match from 2 hours before its scheduled start. '
	String get l107c13 => 'You can register this match from 2 hours before its scheduled start. ';

	/// en: 'Result registration not available yet'
	String get l105c16 => 'Result registration not available yet';
}

// Path: register_match.ui_sheets_register_match_add_anonymous_player_sheet
class TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tap to add'
	String get l232c37 => 'Tap to add';

	/// en: 'Already added to this report'
	String get l231c37 => 'Already added to this report';

	/// en: 'No anonymous players yet. Create one using first and last name.'
	String get l205c29 => 'No anonymous players yet. Create one using first and last name.';

	/// en: 'Create and add player'
	String get l178c42 => 'Create and add player';

	/// en: 'Last name'
	String get l158c36 => 'Last name';

	/// en: 'First name'
	String get l149c36 => 'First name';

	/// en: 'Add anonymous player'
	String get l132c19 => 'Add anonymous player';
}

// Path: register_match.ui_sheets_register_match_wizard_top_bar_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Register Match Result'
	String get l42c19 => 'Register Match Result';
}

// Path: register_match.ui_sheets_register_match_wizard_error_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Close'
	String get l54c33 => 'Close';

	/// en: 'Register Match'
	String get l27c17 => 'Register Match';
}

// Path: register_match.ui_sheets_register_match_wizard_sheet
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Gallery'
	String get l1069c35 => 'Gallery';

	/// en: 'Camera'
	String get l1062c35 => 'Camera';

	/// en: 'Cancel'
	String get l1045c33 => 'Cancel';

	/// en: 'Gallery'
	String get l1037c35 => 'Gallery';

	/// en: 'Camera'
	String get l1031c35 => 'Camera';

	/// en: 'Select source'
	String get l1025c31 => 'Select source';

	/// en: 'Selected image is empty. Choose another image.'
	String get l996c22 => 'Selected image is empty. Choose another image.';

	/// en: 'Invalid image'
	String get l995c16 => 'Invalid image';

	/// en: 'Allow camera and photo permissions in system settings and try again.'
	String get l978c13 => 'Allow camera and photo permissions in system settings and try again.';

	/// en: 'Unable to access camera or gallery'
	String get l976c16 => 'Unable to access camera or gallery';

	/// en: 'Ok'
	String get l947c35 => 'Ok';

	/// en: 'Take a selfie with everyone at the table. If possible, include the board in the same photo.'
	String get l942c15 => 'Take a selfie with everyone at the table. If possible, include the board in the same photo.';

	/// en: 'Group selfie proof'
	String get l940c31 => 'Group selfie proof';

	/// en: 'Complete all report steps before submitting.'
	String get l786c22 => 'Complete all report steps before submitting.';

	/// en: 'Incomplete report'
	String get l785c16 => 'Incomplete report';

	/// en: 'Add the board photo before continuing.'
	String get l752c26 => 'Add the board photo before continuing.';

	/// en: 'Board photo required'
	String get l751c20 => 'Board photo required';

	/// en: 'Add the group selfie before continuing.'
	String get l746c26 => 'Add the group selfie before continuing.';

	/// en: 'Group photo required'
	String get l745c20 => 'Group photo required';

	/// en: 'Match duration must be at most 8 hours.'
	String get l738c26 => 'Match duration must be at most 8 hours.';

	/// en: 'Invalid duration'
	String get l737c20 => 'Invalid duration';

	/// en: 'Match duration must be greater than zero.'
	String get l732c26 => 'Match duration must be greater than zero.';

	/// en: 'Invalid duration'
	String get l731c20 => 'Invalid duration';

	/// en: 'Match start time cannot be in the future.'
	String get l726c26 => 'Match start time cannot be in the future.';

	/// en: 'Invalid match registration'
	String get l725c20 => 'Invalid match registration';

	/// en: 'Select when this match started.'
	String get l720c26 => 'Select when this match started.';

	/// en: 'Match start missing'
	String get l719c20 => 'Match start missing';

	/// en: 'Invalid points'
	String get l706c24 => 'Invalid points';

	/// en: 'Points missing'
	String get l698c24 => 'Points missing';

	/// en: 'Select how the winner won before continuing.'
	String get l677c26 => 'Select how the winner won before continuing.';

	/// en: 'Winner method missing'
	String get l676c20 => 'Winner method missing';

	/// en: 'Select the winner before continuing.'
	String get l671c26 => 'Select the winner before continuing.';

	/// en: 'Winner missing'
	String get l670c20 => 'Winner missing';

	/// en: 'The selected winner is no longer in the participant list.'
	String get l661c17 => 'The selected winner is no longer in the participant list.';

	/// en: 'Winner missing'
	String get l659c20 => 'Winner missing';

	/// en: 'Select the winner before continuing.'
	String get l650c26 => 'Select the winner before continuing.';

	/// en: 'Winner missing'
	String get l649c20 => 'Winner missing';

	/// en: 'Invalid faction setup'
	String get l638c22 => 'Invalid faction setup';

	/// en: 'Faction missing'
	String get l626c22 => 'Faction missing';

	/// en: 'Select at least 2 participants (registered and/or anonymous) to continue.'
	String get l617c17 => 'Select at least 2 participants (registered and/or anonymous) to continue.';

	/// en: 'Not enough players'
	String get l615c20 => 'Not enough players';

	/// en: 'Continue'
	String get l592c35 => 'Continue';

	/// en: 'Edit'
	String get l588c35 => 'Edit';

	/// en: 'You kept the default duration of 1 hour. Do you want to continue with it?'
	String get l583c15 => 'You kept the default duration of 1 hour. Do you want to continue with it?';

	/// en: 'Keep default duration?'
	String get l581c31 => 'Keep default duration?';

	/// en: 'Match start time cannot be in the future.'
	String get l505c22 => 'Match start time cannot be in the future.';

	/// en: 'Invalid match registration'
	String get l504c16 => 'Invalid match registration';

	/// en: 'Match start time cannot be in the future.'
	String get l470c22 => 'Match start time cannot be in the future.';

	/// en: 'Invalid match registration'
	String get l469c16 => 'Invalid match registration';

	/// en: 'Unable to load this match report flow.'
	String get l141c32 => 'Unable to load this match report flow.';

	/// en: 'Match not found'
	String get l140c26 => 'Match not found';

	/// en: 'Unable to load this match report flow.'
	String get l87c24 => 'Unable to load this match report flow.';

	/// en: 'Invalid match'
	String get l86c18 => 'Invalid match';
}

// Path: register_match.ui_sheets_register_match_wizard_review_step_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Board photo'
	String get l166c18 => 'Board photo';

	/// en: 'Group photo'
	String get l161c18 => 'Group photo';

	/// en: 'Social proof'
	String get l154c11 => 'Social proof';

	/// en: 'Ranking'
	String get l92c11 => 'Ranking';

	/// en: 'Confirm all details before logging this match.'
	String get l42c11 => 'Confirm all details before logging this match.';
}

// Path: register_match.ui_sheets_register_match_wizard_review_photo_tile
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Ready'
	String get l66c45 => 'Ready';

	/// en: 'Missing'
	String get l66c33 => 'Missing';
}

// Path: register_match.ui_sheets_register_match_wizard_proof_card_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tap to replace'
	String get l79c60 => 'Tap to replace';

	/// en: 'Tap to add photo'
	String get l79c39 => 'Tap to add photo';
}

// Path: register_match.ui_sheets_register_match_picker_header_section
class TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Select a match you participated in. You can register a result from 2 hours before scheduled start.'
	String get l62c13 => 'Select a match you participated in. You can register a result from 2 hours before scheduled start.';

	/// en: 'Register Match Result'
	String get l35c19 => 'Register Match Result';
}

// Path: register_match.ui_sheets_register_match_wizard_social_proof_step_section
class TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionEn {
	TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Capture the board and score track clearly.'
	String get l67c21 => 'Capture the board and score track clearly.';

	/// en: 'Board photo'
	String get l66c18 => 'Board photo';

	/// en: 'Upload a photo of the board with the score track clearly visible.'
	String get l57c11 => 'Upload a photo of the board with the score track clearly visible.';

	/// en: 'Board photo proof'
	String get l50c11 => 'Board photo proof';

	/// en: 'Selfie with all players. Include the board if possible.'
	String get l44c21 => 'Selfie with all players. Include the board if possible.';

	/// en: 'Group photo'
	String get l43c18 => 'Group photo';

	/// en: 'Upload both photos to confirm this match happened in person.'
	String get l34c11 => 'Upload both photos to confirm this match happened in person.';
}

// Path: shop.ui_screens_shop_screen
class TranslationsShopUiScreensShopScreenEn {
	TranslationsShopUiScreensShopScreenEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'supporter packs linked to community tournaments.'
	String get l77c17 => 'supporter packs linked to community tournaments.';

	/// en: 'Planned: themed profile packs, faction cosmetics, and event '
	String get l76c17 => 'Planned: themed profile packs, faction cosmetics, and event ';

	/// en: 'Roadmap placeholder'
	String get l69c17 => 'Roadmap placeholder';

	/// en: 'community-driven bundles for ROOT players.'
	String get l48c17 => 'community-driven bundles for ROOT players.';

	/// en: 'This area will host future digital goods, cosmetics, and '
	String get l47c17 => 'This area will host future digital goods, cosmetics, and ';

	/// en: 'Shop feature placeholder'
	String get l40c17 => 'Shop feature placeholder';
}
