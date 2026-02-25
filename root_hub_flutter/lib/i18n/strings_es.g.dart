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
class TranslationsEs extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppEs app = _TranslationsAppEs._(_root);
	@override late final _TranslationsAuthEs auth = _TranslationsAuthEs._(_root);
	@override late final _TranslationsDashboardEs dashboard = _TranslationsDashboardEs._(_root);
	@override late final _TranslationsHomeEs home = _TranslationsHomeEs._(_root);
	@override late final _TranslationsMatchEs match = _TranslationsMatchEs._(_root);
	@override late final _TranslationsRegisterMatchEs register_match = _TranslationsRegisterMatchEs._(_root);
	@override late final _TranslationsShopEs shop = _TranslationsShopEs._(_root);
}

// Path: app
class _TranslationsAppEs extends TranslationsAppEn {
	_TranslationsAppEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Root Hub';
}

// Path: auth
class _TranslationsAuthEs extends TranslationsAuthEn {
	_TranslationsAuthEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsAuthAuthOnboardingScreenEs auth_onboarding_screen = _TranslationsAuthAuthOnboardingScreenEs._(_root);
	@override late final _TranslationsAuthAuthOnboardingProfileScreenEs auth_onboarding_profile_screen = _TranslationsAuthAuthOnboardingProfileScreenEs._(_root);
	@override late final _TranslationsAuthAuthLoadingScreenEs auth_loading_screen = _TranslationsAuthAuthLoadingScreenEs._(_root);
	@override late final _TranslationsAuthAuthLoginScreenEs auth_login_screen = _TranslationsAuthAuthLoginScreenEs._(_root);
	@override late final _TranslationsAuthAuthOnboardingContinueButtonWidgetEs auth_onboarding_continue_button_widget = _TranslationsAuthAuthOnboardingContinueButtonWidgetEs._(_root);
}

// Path: dashboard
class _TranslationsDashboardEs extends TranslationsDashboardEn {
	_TranslationsDashboardEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsDashboardUiScreensDashboardScreenEs ui_screens_dashboard_screen = _TranslationsDashboardUiScreensDashboardScreenEs._(_root);
	@override late final _TranslationsDashboardUiScreensDashboardFactionEditorScreenEs ui_screens_dashboard_faction_editor_screen = _TranslationsDashboardUiScreensDashboardFactionEditorScreenEs._(_root);
	@override late final _TranslationsDashboardUiDialogsEditLocationDialogEs ui_dialogs_edit_location_dialog = _TranslationsDashboardUiDialogsEditLocationDialogEs._(_root);
	@override late final _TranslationsDashboardUiDialogsEditDisplayNameDialogEs ui_dialogs_edit_display_name_dialog = _TranslationsDashboardUiDialogsEditDisplayNameDialogEs._(_root);
	@override late final _TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetEs ui_widgets_dashboard_profile_drawer_widget = _TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetEs._(_root);
}

// Path: home
class _TranslationsHomeEs extends TranslationsHomeEn {
	_TranslationsHomeEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeUiSectionsHomeStatsSectionEs ui_sections_home_stats_section = _TranslationsHomeUiSectionsHomeStatsSectionEs._(_root);
	@override late final _TranslationsHomeUiScreensHomeScreenEs ui_screens_home_screen = _TranslationsHomeUiScreensHomeScreenEs._(_root);
	@override late final _TranslationsHomeUiWidgetsHomeStatsPieChartWidgetEs ui_widgets_home_stats_pie_chart_widget = _TranslationsHomeUiWidgetsHomeStatsPieChartWidgetEs._(_root);
}

// Path: match
class _TranslationsMatchEs extends TranslationsMatchEn {
	_TranslationsMatchEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMatchUiSheetsMatchEditTableErrorWidgetEs ui_sheets_match_edit_table_error_widget = _TranslationsMatchUiSheetsMatchEditTableErrorWidgetEs._(_root);
	@override late final _TranslationsMatchUiSheetsMatchEditTableLoadingWidgetEs ui_sheets_match_edit_table_loading_widget = _TranslationsMatchUiSheetsMatchEditTableLoadingWidgetEs._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoSheetEs ui_sheets_match_table_info_sheet = _TranslationsMatchUiSheetsMatchTableInfoSheetEs._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoContentWidgetEs ui_sheets_match_table_info_content_widget = _TranslationsMatchUiSheetsMatchTableInfoContentWidgetEs._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoErrorWidgetEs ui_sheets_match_table_info_error_widget = _TranslationsMatchUiSheetsMatchTableInfoErrorWidgetEs._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetEs ui_sheets_match_table_info_participant_card_widget = _TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetEs._(_root);
	@override late final _TranslationsMatchUiSheetsMatchEditTableSheetEs ui_sheets_match_edit_table_sheet = _TranslationsMatchUiSheetsMatchEditTableSheetEs._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetEs ui_sheets_match_table_info_loading_widget = _TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetEs._(_root);
	@override late final _TranslationsMatchUiSheetsMatchEditTableFormWidgetEs ui_sheets_match_edit_table_form_widget = _TranslationsMatchUiSheetsMatchEditTableFormWidgetEs._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetEs ui_sheets_match_table_info_bottom_actions_widget = _TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetEs ui_screens_match_create_table_location_loading_search_widget = _TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableLocationScreenEs ui_screens_match_create_table_location_screen = _TranslationsMatchUiScreensMatchCreateTableLocationScreenEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchJoinSheetErrorWidgetEs ui_screens_match_join_sheet_error_widget = _TranslationsMatchUiScreensMatchJoinSheetErrorWidgetEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchScreenEs ui_screens_match_screen = _TranslationsMatchUiScreensMatchScreenEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchLoadingErrorStateWidgetEs ui_screens_match_loading_error_state_widget = _TranslationsMatchUiScreensMatchLoadingErrorStateWidgetEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchNearbyHeaderWidgetEs ui_screens_match_nearby_header_widget = _TranslationsMatchUiScreensMatchNearbyHeaderWidgetEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchNoMatchesStateWidgetEs ui_screens_match_no_matches_state_widget = _TranslationsMatchUiScreensMatchNoMatchesStateWidgetEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchTimeStatusChipWidgetEs ui_screens_match_time_status_chip_widget = _TranslationsMatchUiScreensMatchTimeStatusChipWidgetEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetEs ui_screens_match_create_table_location_no_search_results_widget = _TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableScreenEs ui_screens_match_create_table_screen = _TranslationsMatchUiScreensMatchCreateTableScreenEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetEs ui_screens_match_chat_loading_error_state_widget = _TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchReportAvailableChipWidgetEs ui_screens_match_report_available_chip_widget = _TranslationsMatchUiScreensMatchReportAvailableChipWidgetEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchInitialLoadingStateWidgetEs ui_screens_match_initial_loading_state_widget = _TranslationsMatchUiScreensMatchInitialLoadingStateWidgetEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchParticipantCardWidgetEs ui_screens_match_participant_card_widget = _TranslationsMatchUiScreensMatchParticipantCardWidgetEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchJoinSheetContentWidgetEs ui_screens_match_join_sheet_content_widget = _TranslationsMatchUiScreensMatchJoinSheetContentWidgetEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchTableCardWidgetEs ui_screens_match_table_card_widget = _TranslationsMatchUiScreensMatchTableCardWidgetEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchLocationHeaderImageWidgetEs ui_screens_match_location_header_image_widget = _TranslationsMatchUiScreensMatchLocationHeaderImageWidgetEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetEs ui_screens_match_create_table_location_no_recent_locations_widget = _TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchChatScreenEs ui_screens_match_chat_screen = _TranslationsMatchUiScreensMatchChatScreenEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetEs ui_screens_match_create_table_location_loading_recent_widget = _TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetEs._(_root);
}

// Path: register_match
class _TranslationsRegisterMatchEs extends TranslationsRegisterMatchEn {
	_TranslationsRegisterMatchEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionEs ui_sheets_register_match_wizard_winner_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionEs._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionEs ui_sheets_register_match_wizard_timing_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionEs._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionEs ui_sheets_register_match_wizard_participants_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionEs._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionEs ui_sheets_register_match_picker_error_section = _TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionEs._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardEs ui_sheets_register_match_picker_match_item_card = _TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardEs._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionEs ui_sheets_register_match_wizard_factions_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionEs._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetEs ui_sheets_register_match_search_registered_player_sheet = _TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetEs._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionEs ui_sheets_register_match_wizard_points_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionEs._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionEs ui_sheets_register_match_wizard_bottom_actions_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionEs._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionEs ui_sheets_register_match_picker_empty_section = _TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionEs._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionEs ui_sheets_register_match_wizard_loading_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionEs._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetEs ui_sheets_register_match_picker_sheet = _TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetEs._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetEs ui_sheets_register_match_add_anonymous_player_sheet = _TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetEs._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionEs ui_sheets_register_match_wizard_top_bar_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionEs._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionEs ui_sheets_register_match_wizard_error_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionEs._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetEs ui_sheets_register_match_wizard_sheet = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetEs._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionEs ui_sheets_register_match_wizard_review_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionEs._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileEs ui_sheets_register_match_wizard_review_photo_tile = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileEs._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionEs ui_sheets_register_match_wizard_proof_card_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionEs._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionEs ui_sheets_register_match_picker_header_section = _TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionEs._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionEs ui_sheets_register_match_wizard_social_proof_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionEs._(_root);
}

// Path: shop
class _TranslationsShopEs extends TranslationsShopEn {
	_TranslationsShopEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsShopUiScreensShopScreenEs ui_screens_shop_screen = _TranslationsShopUiScreensShopScreenEs._(_root);
}

// Path: auth.auth_onboarding_screen
class _TranslationsAuthAuthOnboardingScreenEs extends TranslationsAuthAuthOnboardingScreenEn {
	_TranslationsAuthAuthOnboardingScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l58c17 => 'Pick your favorite ROOT faction before entering the hub.';
	@override String get l42c25 => 'Choose Your Faction';
}

// Path: auth.auth_onboarding_profile_screen
class _TranslationsAuthAuthOnboardingProfileScreenEs extends TranslationsAuthAuthOnboardingProfileScreenEn {
	_TranslationsAuthAuthOnboardingProfileScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l289c33 => 'Continue';
	@override String get l206c17 => 'Current location uses your phone coordinates (x and y) and is required to show nearby matches.';
	@override String get l205c17 => 'Your display name is how other players will see you in Root Hub. ';
	@override String get l188c25 => 'Set Your Hub Identity';
}

// Path: auth.auth_loading_screen
class _TranslationsAuthAuthLoadingScreenEs extends TranslationsAuthAuthLoadingScreenEn {
	_TranslationsAuthAuthLoadingScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l32c21 => 'ROOT HUB';
}

// Path: auth.auth_login_screen
class _TranslationsAuthAuthLoginScreenEs extends TranslationsAuthAuthLoginScreenEn {
	_TranslationsAuthAuthLoginScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l195c27 => 'Sign in to browse schedules and join tables.';
	@override String get l178c35 => 'Find Your Next\nROOT Match';
}

// Path: auth.auth_onboarding_continue_button_widget
class _TranslationsAuthAuthOnboardingContinueButtonWidgetEs extends TranslationsAuthAuthOnboardingContinueButtonWidgetEn {
	_TranslationsAuthAuthOnboardingContinueButtonWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l44c15 => 'Continue';
}

// Path: dashboard.ui_screens_dashboard_screen
class _TranslationsDashboardUiScreensDashboardScreenEs extends TranslationsDashboardUiScreensDashboardScreenEn {
	_TranslationsDashboardUiScreensDashboardScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l465c32 => 'Shop';
	@override String get l451c32 => 'Match';
	@override String get l437c32 => 'Home';
	@override String get l317c35 => 'ROOT HUB';
	@override String get l213c35 => 'Choose from Gallery';
	@override String get l206c35 => 'Take Photo';
	@override String get l188c31 => 'Cancel';
	@override String get l180c33 => 'Choose from Library';
	@override String get l174c33 => 'Take Photo';
	@override String get l168c29 => 'Change profile photo';
	@override String get l130c13 => 'Allow camera and photo permissions in system settings and try again.';
	@override String get l128c16 => 'Unable to access camera or gallery';
}

// Path: dashboard.ui_screens_dashboard_faction_editor_screen
class _TranslationsDashboardUiScreensDashboardFactionEditorScreenEs extends TranslationsDashboardUiScreensDashboardFactionEditorScreenEn {
	_TranslationsDashboardUiScreensDashboardFactionEditorScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l125c17 => 'Choose the faction shown in your profile and used as your default preference.';
	@override String get l104c31 => 'Change Favorite Faction';
}

// Path: dashboard.ui_dialogs_edit_location_dialog
class _TranslationsDashboardUiDialogsEditLocationDialogEs extends TranslationsDashboardUiDialogsEditLocationDialogEn {
	_TranslationsDashboardUiDialogsEditLocationDialogEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l247c29 => 'Save';
	@override String get l227c23 => 'Cancel';
	@override String get l192c15 => 'Update your coordinates and target search ratio for match discovery.';
	@override String get l184c15 => 'Edit Location';
}

// Path: dashboard.ui_dialogs_edit_display_name_dialog
class _TranslationsDashboardUiDialogsEditDisplayNameDialogEs extends TranslationsDashboardUiDialogsEditDisplayNameDialogEn {
	_TranslationsDashboardUiDialogsEditDisplayNameDialogEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l122c29 => 'Save';
	@override String get l104c23 => 'Cancel';
	@override String get l81c15 => 'This is how players will see you across Root Hub.';
	@override String get l73c15 => 'Edit Display Name';
}

// Path: dashboard.ui_widgets_dashboard_profile_drawer_widget
class _TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetEs extends TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetEn {
	_TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l314c21 => 'Log out';
	@override String get l267c45 => 'Change Faction';
	@override String get l266c45 => 'Saving...';
	@override String get l218c37 => 'Favorite Faction';
	@override String get l169c30 => 'Location';
	@override String get l160c30 => 'Display Name';
}

// Path: home.ui_sections_home_stats_section
class _TranslationsHomeUiSectionsHomeStatsSectionEs extends TranslationsHomeUiSectionsHomeStatsSectionEn {
	_TranslationsHomeUiSectionsHomeStatsSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l420c16 => 'All factions total';
	@override String get l416c16 => 'All factions avg';
	@override String get l412c16 => 'All factions total';
	@override String get l403c16 => 'All factions avg';
	@override String get l59c20 => 'Absolute number of wins for each faction.';
	@override String get l58c14 => 'Total Wins';
	@override String get l54c20 => 'Average score per faction when points were tracked.';
	@override String get l53c14 => 'Average Points';
	@override String get l49c20 => 'How often each faction appears in completed games.';
	@override String get l48c14 => 'Played Games';
	@override String get l44c20 => 'Who is winning the most often right now.';
	@override String get l43c14 => 'Faction Win Rate';
}

// Path: home.ui_screens_home_screen
class _TranslationsHomeUiScreensHomeScreenEs extends TranslationsHomeUiScreensHomeScreenEn {
	_TranslationsHomeUiScreensHomeScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l92c26 => 'Your personal faction performance and match profile.';
	@override String get l91c20 => 'My Stats';
	@override String get l78c17 => 'Faction performance from all played matches in Root Hub.';
	@override String get l76c20 => 'Community Stats';
	@override String get l57c15 => 'See how the ROOT platform is evolving and compare it with your own progress.';
	@override String get l47c15 => 'Community Dashboard';
}

// Path: home.ui_widgets_home_stats_pie_chart_widget
class _TranslationsHomeUiWidgetsHomeStatsPieChartWidgetEs extends TranslationsHomeUiWidgetsHomeStatsPieChartWidgetEn {
	_TranslationsHomeUiWidgetsHomeStatsPieChartWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l71c15 => 'No values for this metric yet.';
}

// Path: match.ui_sheets_match_edit_table_error_widget
class _TranslationsMatchUiSheetsMatchEditTableErrorWidgetEs extends TranslationsMatchUiSheetsMatchEditTableErrorWidgetEn {
	_TranslationsMatchUiSheetsMatchEditTableErrorWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l44c33 => 'Close';
}

// Path: match.ui_sheets_match_edit_table_loading_widget
class _TranslationsMatchUiSheetsMatchEditTableLoadingWidgetEs extends TranslationsMatchUiSheetsMatchEditTableLoadingWidgetEn {
	_TranslationsMatchUiSheetsMatchEditTableLoadingWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l29c19 => 'Loading table details...';
}

// Path: match.ui_sheets_match_table_info_sheet
class _TranslationsMatchUiSheetsMatchTableInfoSheetEs extends TranslationsMatchUiSheetsMatchTableInfoSheetEn {
	_TranslationsMatchUiSheetsMatchTableInfoSheetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l256c33 => 'Remove';
	@override String get l248c33 => 'Cancel';
	@override String get l243c13 => 'rejoin if seats are still available.';
	@override String get l217c33 => 'Cancel';
	@override String get l199c19 => 'Select a player to remove from the table.';
	@override String get l191c29 => 'Remove a Player';
	@override String get l148c33 => 'Leave';
	@override String get l140c33 => 'Cancel';
	@override String get l135c13 => 'players list. You can rejoin later if seats are still available.';
	@override String get l134c13 => 'You will be unsubscribed from this match and removed from the ';
	@override String get l132c29 => 'Leave this table?';
	@override String get l92c32 => 'Unable to load table details.';
	@override String get l91c26 => 'Table not found';
}

// Path: match.ui_sheets_match_table_info_content_widget
class _TranslationsMatchUiSheetsMatchTableInfoContentWidgetEs extends TranslationsMatchUiSheetsMatchTableInfoContentWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoContentWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l192c23 => 'No players have joined this table yet.';
	@override String get l174c25 => 'These are the current players that will participate.';
	@override String get l173c25 => 'No players subscribed yet.';
	@override String get l165c19 => 'Players in this match';
	@override String get l114c56 => 'Unknown host';
	@override String get l73c19 => 'Table Details';
}

// Path: match.ui_sheets_match_table_info_error_widget
class _TranslationsMatchUiSheetsMatchTableInfoErrorWidgetEs extends TranslationsMatchUiSheetsMatchTableInfoErrorWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoErrorWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l55c37 => 'Retry';
	@override String get l47c37 => 'Close';
}

// Path: match.ui_sheets_match_table_info_participant_card_widget
class _TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetEs extends TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l69c21 => 'Favorite Faction';
}

// Path: match.ui_sheets_match_edit_table_sheet
class _TranslationsMatchUiSheetsMatchEditTableSheetEs extends TranslationsMatchUiSheetsMatchEditTableSheetEn {
	_TranslationsMatchUiSheetsMatchEditTableSheetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l282c13 => 'The scheduled time cannot be more than ';
	@override String get l280c16 => 'Date is too far';
	@override String get l265c13 => 'The scheduled time must be at least ';
	@override String get l263c16 => 'Time is too soon';
	@override String get l240c13 => 'You cannot set the maximum below that number.';
	@override String get l237c16 => 'Too many players subscribed';
	@override String get l229c13 => 'with minimum not greater than maximum.';
	@override String get l228c13 => 'Players range must be between 2 and 6, ';
	@override String get l226c16 => 'Invalid players range';
	@override String get l218c22 => 'Please add a title for your table.';
	@override String get l217c16 => 'Title required';
	@override String get l111c32 => 'Unable to load table details.';
	@override String get l110c26 => 'Table not found';
}

// Path: match.ui_sheets_match_table_info_loading_widget
class _TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetEs extends TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l29c19 => 'Loading table details...';
}

// Path: match.ui_sheets_match_edit_table_form_widget
class _TranslationsMatchUiSheetsMatchEditTableFormWidgetEs extends TranslationsMatchUiSheetsMatchEditTableFormWidgetEn {
	_TranslationsMatchUiSheetsMatchEditTableFormWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l293c58 => 'Save Changes';
	@override String get l293c44 => 'Saving...';
	@override String get l272c39 => 'Cancel';
	@override String get l230c23 => 'Must be at least 10 minutes from now, up to ';
	@override String get l228c26 => 'Schedule';
	@override String get l217c34 => 'Maximum';
	@override String get l204c34 => 'Minimum';
	@override String get l188c25 => 'Set between 2 and 6 players.';
	@override String get l185c26 => 'Players range';
	@override String get l173c31 => 'Example: We have Marauder expansion.';
	@override String get l164c23 => 'Extra details like expansions, parking tips, etc.';
	@override String get l162c26 => 'Description (optional)';
	@override String get l150c31 => 'Example: Saturday ROOT at Lantern Café';
	@override String get l142c32 => 'A short name so players can find your table.';
	@override String get l141c26 => 'Table title';
	@override String get l122c37 => 'New players can still join this table.';
	@override String get l121c37 => 'New players cannot join this table.';
	@override String get l113c31 => 'Close subscriptions';
	@override String get l73c19 => 'Edit Details';
	@override String get l65c19 => 'Edit Table';
}

// Path: match.ui_sheets_match_table_info_bottom_actions_widget
class _TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetEs extends TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l112c54 => 'Remove Player';
	@override String get l112c38 => 'Removing...';
	@override String get l79c56 => 'Leave Table';
	@override String get l79c41 => 'Leaving...';
	@override String get l55c39 => 'Close';
}

// Path: match.ui_screens_match_create_table_location_loading_search_widget
class _TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetEs extends TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l21c13 => 'Searching locations...';
}

// Path: match.ui_screens_match_create_table_location_screen
class _TranslationsMatchUiScreensMatchCreateTableLocationScreenEs extends TranslationsMatchUiScreensMatchCreateTableLocationScreenEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l287c29 => 'Continue';
	@override String get l236c23 => 'Previously selected locations';
	@override String get l203c25 => 'Search results';
	@override String get l160c19 => 'Tap a location to select it. Previously selected locations are saved here for faster hosting.';
	@override String get l148c31 => 'Search location (Google Places)';
	@override String get l122c25 => 'Choose Table Location';
	@override String get l61c13 => 'Choose one location from the list before creating the table.';
	@override String get l59c16 => 'Location required';
}

// Path: match.ui_screens_match_join_sheet_error_widget
class _TranslationsMatchUiScreensMatchJoinSheetErrorWidgetEs extends TranslationsMatchUiScreensMatchJoinSheetErrorWidgetEn {
	_TranslationsMatchUiScreensMatchJoinSheetErrorWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l62c37 => 'Retry';
	@override String get l54c37 => 'Close';
}

// Path: match.ui_screens_match_screen
class _TranslationsMatchUiScreensMatchScreenEs extends TranslationsMatchUiScreensMatchScreenEn {
	_TranslationsMatchUiScreensMatchScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l849c23 => 'Unable to open the dialer right now.';
	@override String get l829c25 => 'Invalid phone number format.';
	@override String get l816c23 => 'Unable to open the link right now.';
	@override String get l800c25 => 'Invalid URL format.';
	@override String get l763c43 => 'Close';
	@override String get l716c33 => 'Manual location notes';
	@override String get l693c38 => 'Phone';
	@override String get l688c34 => 'Phone';
	@override String get l677c38 => 'Website';
	@override String get l672c34 => 'Website';
	@override String get l661c38 => 'Map link';
	@override String get l656c34 => 'Map link';
	@override String get l607c41 => 'Public';
	@override String get l606c41 => 'Private';
	@override String get l564c47 => 'matches played here';
	@override String get l563c47 => 'match played here';
	@override String get l239c15 => 'Host Table';
	@override String get l191c21 => 'Report Result';
}

// Path: match.ui_screens_match_loading_error_state_widget
class _TranslationsMatchUiScreensMatchLoadingErrorStateWidgetEs extends TranslationsMatchUiScreensMatchLoadingErrorStateWidgetEn {
	_TranslationsMatchUiScreensMatchLoadingErrorStateWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l48c31 => 'Try again';
}

// Path: match.ui_screens_match_nearby_header_widget
class _TranslationsMatchUiScreensMatchNearbyHeaderWidgetEs extends TranslationsMatchUiScreensMatchNearbyHeaderWidgetEn {
	_TranslationsMatchUiScreensMatchNearbyHeaderWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l83c13 => 'Only tables that did not start more than 2 hours ago are listed.';
	@override String get l48c19 => 'Nearby Match Tables';
	@override String get l35c19 => 'Match Finder';
}

// Path: match.ui_screens_match_no_matches_state_widget
class _TranslationsMatchUiScreensMatchNoMatchesStateWidgetEs extends TranslationsMatchUiScreensMatchNoMatchesStateWidgetEn {
	_TranslationsMatchUiScreensMatchNoMatchesStateWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l65c31 => 'Host the first table';
	@override String get l54c13 => 'Be the first to start one. Host a new table so nearby players can subscribe.';
	@override String get l47c13 => 'No tables in your area yet';
}

// Path: match.ui_screens_match_time_status_chip_widget
class _TranslationsMatchUiScreensMatchTimeStatusChipWidgetEs extends TranslationsMatchUiScreensMatchTimeStatusChipWidgetEn {
	_TranslationsMatchUiScreensMatchTimeStatusChipWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l27c13 => 'Remaining time until the match starts.';
	@override String get l26c13 => 'This match already started. Recently started tables stay visible for a short period.';
}

// Path: match.ui_screens_match_create_table_location_no_search_results_widget
class _TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetEs extends TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l20c9 => 'No locations found for this query. Try another place name or area.';
}

// Path: match.ui_screens_match_create_table_screen
class _TranslationsMatchUiScreensMatchCreateTableScreenEs extends TranslationsMatchUiScreensMatchCreateTableScreenEn {
	_TranslationsMatchUiScreensMatchCreateTableScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l424c23 => 'Continue';
	@override String get l384c31 => 'No, I am only hosting this table';
	@override String get l383c31 => 'Yes, I will play this match';
	@override String get l365c25 => 'If you are a venue, board game club, or organizer bringing players together but not joining the match, leave this unchecked.';
	@override String get l363c28 => 'Will you, the host, play?';
	@override String get l339c25 => 'Pick the day and start hour. Choose a time you can reliably show up.';
	@override String get l337c28 => 'Schedule';
	@override String get l318c36 => 'Maximum';
	@override String get l297c36 => 'Minimum';
	@override String get l283c25 => 'Default is 3-4. You can set between 2 and 6 players.';
	@override String get l281c28 => 'Players range';
	@override String get l271c27 => 'Example: We have Marauder expansion and spare sleeves.';
	@override String get l261c25 => 'Add extra details like expansions available, parking tips, or reference points.';
	@override String get l259c28 => 'Description (optional)';
	@override String get l249c33 => 'Example: Saturday ROOT at Lantern Café';
	@override String get l241c25 => 'This can be anything that helps identify the table, like a place name or event style.';
	@override String get l239c28 => 'Table title';
	@override String get l229c21 => 'Set table details first. On the next screen you will choose the location.';
	@override String get l217c27 => 'Host a New Table';
	@override String get l155c22 => 'Select the start hour for this table before continuing.';
	@override String get l154c16 => 'Start hour required';
	@override String get l146c22 => 'You cannot select a day in the past.';
	@override String get l145c16 => 'Invalid date';
	@override String get l137c22 => 'Select the day for this table before continuing.';
	@override String get l136c16 => 'Day required';
	@override String get l127c13 => 'Add a title so players can quickly identify your table. Example: "Downtown Café Night".';
	@override String get l125c16 => 'Title required';
	@override String get l92c22 => 'You cannot select a day in the past.';
	@override String get l91c16 => 'Invalid date';
}

// Path: match.ui_screens_match_chat_loading_error_state_widget
class _TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetEs extends TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetEn {
	_TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l52c33 => 'Try again';
}

// Path: match.ui_screens_match_report_available_chip_widget
class _TranslationsMatchUiScreensMatchReportAvailableChipWidgetEs extends TranslationsMatchUiScreensMatchReportAvailableChipWidgetEn {
	_TranslationsMatchUiScreensMatchReportAvailableChipWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l31c15 => 'Report available';
	@override String get l13c16 => 'You can report this match result now.';
}

// Path: match.ui_screens_match_initial_loading_state_widget
class _TranslationsMatchUiScreensMatchInitialLoadingStateWidgetEs extends TranslationsMatchUiScreensMatchInitialLoadingStateWidgetEn {
	_TranslationsMatchUiScreensMatchInitialLoadingStateWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l31c13 => 'Loading nearby tables...';
}

// Path: match.ui_screens_match_participant_card_widget
class _TranslationsMatchUiScreensMatchParticipantCardWidgetEs extends TranslationsMatchUiScreensMatchParticipantCardWidgetEn {
	_TranslationsMatchUiScreensMatchParticipantCardWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l73c21 => 'Favorite Faction';
}

// Path: match.ui_screens_match_join_sheet_content_widget
class _TranslationsMatchUiScreensMatchJoinSheetContentWidgetEs extends TranslationsMatchUiScreensMatchJoinSheetContentWidgetEn {
	_TranslationsMatchUiScreensMatchJoinSheetContentWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l323c29 => 'Confirm Join';
	@override String get l322c29 => 'Subscriptions closed';
	@override String get l320c29 => 'Already subscribed';
	@override String get l303c39 => 'Cancel';
	@override String get l262c23 => 'You can be the first player to lock this table in.';
	@override String get l244c25 => 'These are the current players that will participate.';
	@override String get l243c25 => 'No players subscribed yet.';
	@override String get l235c19 => 'Players in this match';
	@override String get l175c56 => 'Unknown host';
	@override String get l151c39 => 'See table chat';
	@override String get l130c29 => 'New players cannot join at this time.';
	@override String get l129c29 => 'The host has closed subscriptions for this table. ';
	@override String get l81c19 => 'Confirm table subscription';
}

// Path: match.ui_screens_match_table_card_widget
class _TranslationsMatchUiScreensMatchTableCardWidgetEs extends TranslationsMatchUiScreensMatchTableCardWidgetEn {
	_TranslationsMatchUiScreensMatchTableCardWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l362c17 => 'Subscribed';
	@override String get l275c25 => 'Tap card to open chat';
	@override String get l265c25 => 'Subscriptions closed';
	@override String get l235c26 => 'Open full location details';
	@override String get l155c72 => 'places';
	@override String get l155c62 => 'place';
	@override String get l154c89 => 's';
}

// Path: match.ui_screens_match_location_header_image_widget
class _TranslationsMatchUiScreensMatchLocationHeaderImageWidgetEs extends TranslationsMatchUiScreensMatchLocationHeaderImageWidgetEn {
	_TranslationsMatchUiScreensMatchLocationHeaderImageWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l67c19 => 'Location Details';
}

// Path: match.ui_screens_match_create_table_location_no_recent_locations_widget
class _TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetEs extends TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l20c9 => 'No previous locations yet. Search and select one above.';
}

// Path: match.ui_screens_match_chat_screen
class _TranslationsMatchUiScreensMatchChatScreenEs extends TranslationsMatchUiScreensMatchChatScreenEn {
	_TranslationsMatchUiScreensMatchChatScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l513c35 => 'Choose from Gallery';
	@override String get l506c35 => 'Take Photo';
	@override String get l488c31 => 'Cancel';
	@override String get l480c33 => 'Choose from Library';
	@override String get l474c33 => 'Take Photo';
	@override String get l468c29 => 'Send a photo';
	@override String get l407c33 => 'Compress';
	@override String get l403c33 => 'Cancel';
	@override String get l395c29 => 'Image is too large';
	@override String get l273c37 => 'Subscribed';
	@override String get l142c21 => 'Unable to resolve your account information.';
	@override String get l128c22 => 'Table info';
	@override String get l123c24 => 'Edit table';
}

// Path: match.ui_screens_match_create_table_location_loading_recent_widget
class _TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetEs extends TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l21c13 => 'Loading previous locations...';
}

// Path: register_match.ui_sheets_register_match_wizard_winner_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l101c27 => 'Dominance';
	@override String get l96c27 => 'Total points (30)';
	@override String get l82c11 => 'Dominance means the winner completed a Dominance card objective instead of winning by points.';
	@override String get l81c11 => 'Total points means the winner reached 30 victory points on the score track. ';
	@override String get l74c11 => 'How did the winner won?';
	@override String get l36c11 => 'Pick the player who won this match.';
}

// Path: register_match.ui_sheets_register_match_wizard_timing_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l134c17 => 'Estimated duration';
	@override String get l112c11 => 'Estimated duration';
	@override String get l103c11 => 'Set the estimated duration. Adjust in 15-minute steps (max 8 hours).';
	@override String get l90c33 => 'Change time';
	@override String get l57c11 => 'Match started at';
	@override String get l48c11 => 'Set the time the match actually started.';
}

// Path: register_match.ui_sheets_register_match_wizard_participants_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l97c31 => 'Add registered player from platform';
	@override String get l88c31 => 'Add anonymous player';
	@override String get l63c23 => 'Registered player';
	@override String get l62c23 => 'Anonymous player';
	@override String get l33c11 => 'Select registered players who were present. You can add anonymous players or search for other registered players.';
	@override String get l26c11 => '1) Who actually played?';
}

// Path: register_match.ui_sheets_register_match_picker_error_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l51c35 => 'Retry';
}

// Path: register_match.ui_sheets_register_match_picker_match_item_card
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardEs extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l140c56 => 'Not available yet';
	@override String get l140c38 => 'Tap to report';
}

// Path: register_match.ui_sheets_register_match_wizard_factions_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l71c38 => 'Select faction';
	@override String get l68c34 => 'Faction';
	@override String get l35c11 => 'Choose the faction used by each player in this match.';
	@override String get l28c11 => '2) Select factions';
}

// Path: register_match.ui_sheets_register_match_search_registered_player_sheet
class _TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetEs extends TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l181c37 => 'Tap to add';
	@override String get l180c37 => 'Already added to this report';
	@override String get l157c35 => 'No registered players were found.';
	@override String get l113c32 => 'Search by display name';
	@override String get l98c19 => 'Add registered player';
}

// Path: register_match.ui_sheets_register_match_wizard_points_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l152c35 => '0 to 29';
	@override String get l151c36 => 'Points';
	@override String get l139c30 => 'Dominance attempt';
	@override String get l133c30 => 'Winner by dominance';
	@override String get l127c30 => 'Winner by points';
	@override String get l108c39 => 'Failed dominance';
	@override String get l103c39 => 'Points';
	@override String get l87c29 => 'Winner';
	@override String get l40c11 => 'Failed dominance always counts as no points.';
	@override String get l39c11 => 'For each non-winner, set points or mark failed dominance attempt. ';
}

// Path: register_match.ui_sheets_register_match_wizard_bottom_actions_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l61c59 => 'Continue';
	@override String get l61c41 => 'Submit report';
	@override String get l40c54 => 'Back';
	@override String get l40c43 => 'Cancel';
}

// Path: register_match.ui_sheets_register_match_picker_empty_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l34c17 => 'You do not have any hosted/subscribed match pending result registration.';
	@override String get l27c17 => 'No pending matches';
}

// Path: register_match.ui_sheets_register_match_wizard_loading_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l24c13 => 'Loading match details...';
}

// Path: register_match.ui_sheets_register_match_picker_sheet
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetEs extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l107c13 => 'You can register this match from 2 hours before its scheduled start. ';
	@override String get l105c16 => 'Result registration not available yet';
}

// Path: register_match.ui_sheets_register_match_add_anonymous_player_sheet
class _TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetEs extends TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l232c37 => 'Tap to add';
	@override String get l231c37 => 'Already added to this report';
	@override String get l205c29 => 'No anonymous players yet. Create one using first and last name.';
	@override String get l178c42 => 'Create and add player';
	@override String get l158c36 => 'Last name';
	@override String get l149c36 => 'First name';
	@override String get l132c19 => 'Add anonymous player';
}

// Path: register_match.ui_sheets_register_match_wizard_top_bar_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l42c19 => 'Register Match Result';
}

// Path: register_match.ui_sheets_register_match_wizard_error_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l54c33 => 'Close';
	@override String get l27c17 => 'Register Match';
}

// Path: register_match.ui_sheets_register_match_wizard_sheet
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l1069c35 => 'Gallery';
	@override String get l1062c35 => 'Camera';
	@override String get l1045c33 => 'Cancel';
	@override String get l1037c35 => 'Gallery';
	@override String get l1031c35 => 'Camera';
	@override String get l1025c31 => 'Select source';
	@override String get l996c22 => 'Selected image is empty. Choose another image.';
	@override String get l995c16 => 'Invalid image';
	@override String get l978c13 => 'Allow camera and photo permissions in system settings and try again.';
	@override String get l976c16 => 'Unable to access camera or gallery';
	@override String get l947c35 => 'Ok';
	@override String get l942c15 => 'Take a selfie with everyone at the table. If possible, include the board in the same photo.';
	@override String get l940c31 => 'Group selfie proof';
	@override String get l786c22 => 'Complete all report steps before submitting.';
	@override String get l785c16 => 'Incomplete report';
	@override String get l752c26 => 'Add the board photo before continuing.';
	@override String get l751c20 => 'Board photo required';
	@override String get l746c26 => 'Add the group selfie before continuing.';
	@override String get l745c20 => 'Group photo required';
	@override String get l738c26 => 'Match duration must be at most 8 hours.';
	@override String get l737c20 => 'Invalid duration';
	@override String get l732c26 => 'Match duration must be greater than zero.';
	@override String get l731c20 => 'Invalid duration';
	@override String get l726c26 => 'Match start time cannot be in the future.';
	@override String get l725c20 => 'Invalid match registration';
	@override String get l720c26 => 'Select when this match started.';
	@override String get l719c20 => 'Match start missing';
	@override String get l706c24 => 'Invalid points';
	@override String get l698c24 => 'Points missing';
	@override String get l677c26 => 'Select how the winner won before continuing.';
	@override String get l676c20 => 'Winner method missing';
	@override String get l671c26 => 'Select the winner before continuing.';
	@override String get l670c20 => 'Winner missing';
	@override String get l661c17 => 'The selected winner is no longer in the participant list.';
	@override String get l659c20 => 'Winner missing';
	@override String get l650c26 => 'Select the winner before continuing.';
	@override String get l649c20 => 'Winner missing';
	@override String get l638c22 => 'Invalid faction setup';
	@override String get l626c22 => 'Faction missing';
	@override String get l617c17 => 'Select at least 2 participants (registered and/or anonymous) to continue.';
	@override String get l615c20 => 'Not enough players';
	@override String get l592c35 => 'Continue';
	@override String get l588c35 => 'Edit';
	@override String get l583c15 => 'You kept the default duration of 1 hour. Do you want to continue with it?';
	@override String get l581c31 => 'Keep default duration?';
	@override String get l505c22 => 'Match start time cannot be in the future.';
	@override String get l504c16 => 'Invalid match registration';
	@override String get l470c22 => 'Match start time cannot be in the future.';
	@override String get l469c16 => 'Invalid match registration';
	@override String get l141c32 => 'Unable to load this match report flow.';
	@override String get l140c26 => 'Match not found';
	@override String get l87c24 => 'Unable to load this match report flow.';
	@override String get l86c18 => 'Invalid match';
}

// Path: register_match.ui_sheets_register_match_wizard_review_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l166c18 => 'Board photo';
	@override String get l161c18 => 'Group photo';
	@override String get l154c11 => 'Social proof';
	@override String get l92c11 => 'Ranking';
	@override String get l42c11 => 'Confirm all details before logging this match.';
}

// Path: register_match.ui_sheets_register_match_wizard_review_photo_tile
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l66c45 => 'Ready';
	@override String get l66c33 => 'Missing';
}

// Path: register_match.ui_sheets_register_match_wizard_proof_card_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l79c60 => 'Tap to replace';
	@override String get l79c39 => 'Tap to add photo';
}

// Path: register_match.ui_sheets_register_match_picker_header_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l62c13 => 'Select a match you participated in. You can register a result from 2 hours before scheduled start.';
	@override String get l35c19 => 'Register Match Result';
}

// Path: register_match.ui_sheets_register_match_wizard_social_proof_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l67c21 => 'Capture the board and score track clearly.';
	@override String get l66c18 => 'Board photo';
	@override String get l57c11 => 'Upload a photo of the board with the score track clearly visible.';
	@override String get l50c11 => 'Board photo proof';
	@override String get l44c21 => 'Selfie with all players. Include the board if possible.';
	@override String get l43c18 => 'Group photo';
	@override String get l34c11 => 'Upload both photos to confirm this match happened in person.';
}

// Path: shop.ui_screens_shop_screen
class _TranslationsShopUiScreensShopScreenEs extends TranslationsShopUiScreensShopScreenEn {
	_TranslationsShopUiScreensShopScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get l77c17 => 'supporter packs linked to community tournaments.';
	@override String get l76c17 => 'Planned: themed profile packs, faction cosmetics, and event ';
	@override String get l69c17 => 'Roadmap placeholder';
	@override String get l48c17 => 'community-driven bundles for ROOT players.';
	@override String get l47c17 => 'This area will host future digital goods, cosmetics, and ';
	@override String get l40c17 => 'Shop feature placeholder';
}
