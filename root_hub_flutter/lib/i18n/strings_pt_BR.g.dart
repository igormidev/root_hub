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
class TranslationsPtBr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsPtBr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ptBr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <pt-BR>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsPtBr _root = this; // ignore: unused_field

	@override 
	TranslationsPtBr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPtBr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppPtBr app = _TranslationsAppPtBr._(_root);
	@override late final _TranslationsAuthPtBr auth = _TranslationsAuthPtBr._(_root);
	@override late final _TranslationsDashboardPtBr dashboard = _TranslationsDashboardPtBr._(_root);
	@override late final _TranslationsHomePtBr home = _TranslationsHomePtBr._(_root);
	@override late final _TranslationsMatchPtBr match = _TranslationsMatchPtBr._(_root);
	@override late final _TranslationsRegisterMatchPtBr register_match = _TranslationsRegisterMatchPtBr._(_root);
	@override late final _TranslationsShopPtBr shop = _TranslationsShopPtBr._(_root);
}

// Path: app
class _TranslationsAppPtBr extends TranslationsAppEn {
	_TranslationsAppPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get rootHub => '__TERMO_0__';
}

// Path: auth
class _TranslationsAuthPtBr extends TranslationsAuthEn {
	_TranslationsAuthPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsAuthAuthOnboardingScreenPtBr auth_onboarding_screen = _TranslationsAuthAuthOnboardingScreenPtBr._(_root);
	@override late final _TranslationsAuthAuthOnboardingProfileScreenPtBr auth_onboarding_profile_screen = _TranslationsAuthAuthOnboardingProfileScreenPtBr._(_root);
	@override late final _TranslationsAuthAuthLoadingScreenPtBr auth_loading_screen = _TranslationsAuthAuthLoadingScreenPtBr._(_root);
	@override late final _TranslationsAuthAuthLoginScreenPtBr auth_login_screen = _TranslationsAuthAuthLoginScreenPtBr._(_root);
	@override late final _TranslationsAuthAuthOnboardingContinueButtonWidgetPtBr auth_onboarding_continue_button_widget = _TranslationsAuthAuthOnboardingContinueButtonWidgetPtBr._(_root);
}

// Path: dashboard
class _TranslationsDashboardPtBr extends TranslationsDashboardEn {
	_TranslationsDashboardPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsDashboardUiScreensDashboardScreenPtBr ui_screens_dashboard_screen = _TranslationsDashboardUiScreensDashboardScreenPtBr._(_root);
	@override late final _TranslationsDashboardUiScreensDashboardFactionEditorScreenPtBr ui_screens_dashboard_faction_editor_screen = _TranslationsDashboardUiScreensDashboardFactionEditorScreenPtBr._(_root);
	@override late final _TranslationsDashboardUiDialogsEditLocationDialogPtBr ui_dialogs_edit_location_dialog = _TranslationsDashboardUiDialogsEditLocationDialogPtBr._(_root);
	@override late final _TranslationsDashboardUiDialogsEditDisplayNameDialogPtBr ui_dialogs_edit_display_name_dialog = _TranslationsDashboardUiDialogsEditDisplayNameDialogPtBr._(_root);
	@override late final _TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetPtBr ui_widgets_dashboard_profile_drawer_widget = _TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetPtBr._(_root);
}

// Path: home
class _TranslationsHomePtBr extends TranslationsHomeEn {
	_TranslationsHomePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeUiSectionsHomeStatsSectionPtBr ui_sections_home_stats_section = _TranslationsHomeUiSectionsHomeStatsSectionPtBr._(_root);
	@override late final _TranslationsHomeUiScreensHomeScreenPtBr ui_screens_home_screen = _TranslationsHomeUiScreensHomeScreenPtBr._(_root);
	@override late final _TranslationsHomeUiWidgetsHomeStatsPieChartWidgetPtBr ui_widgets_home_stats_pie_chart_widget = _TranslationsHomeUiWidgetsHomeStatsPieChartWidgetPtBr._(_root);
}

// Path: match
class _TranslationsMatchPtBr extends TranslationsMatchEn {
	_TranslationsMatchPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMatchUiSheetsMatchEditTableErrorWidgetPtBr ui_sheets_match_edit_table_error_widget = _TranslationsMatchUiSheetsMatchEditTableErrorWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiSheetsMatchEditTableLoadingWidgetPtBr ui_sheets_match_edit_table_loading_widget = _TranslationsMatchUiSheetsMatchEditTableLoadingWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoSheetPtBr ui_sheets_match_table_info_sheet = _TranslationsMatchUiSheetsMatchTableInfoSheetPtBr._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoContentWidgetPtBr ui_sheets_match_table_info_content_widget = _TranslationsMatchUiSheetsMatchTableInfoContentWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoErrorWidgetPtBr ui_sheets_match_table_info_error_widget = _TranslationsMatchUiSheetsMatchTableInfoErrorWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetPtBr ui_sheets_match_table_info_participant_card_widget = _TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiSheetsMatchEditTableSheetPtBr ui_sheets_match_edit_table_sheet = _TranslationsMatchUiSheetsMatchEditTableSheetPtBr._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetPtBr ui_sheets_match_table_info_loading_widget = _TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiSheetsMatchEditTableFormWidgetPtBr ui_sheets_match_edit_table_form_widget = _TranslationsMatchUiSheetsMatchEditTableFormWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetPtBr ui_sheets_match_table_info_bottom_actions_widget = _TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetPtBr ui_screens_match_create_table_location_loading_search_widget = _TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableLocationScreenPtBr ui_screens_match_create_table_location_screen = _TranslationsMatchUiScreensMatchCreateTableLocationScreenPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchJoinSheetErrorWidgetPtBr ui_screens_match_join_sheet_error_widget = _TranslationsMatchUiScreensMatchJoinSheetErrorWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchScreenPtBr ui_screens_match_screen = _TranslationsMatchUiScreensMatchScreenPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchLoadingErrorStateWidgetPtBr ui_screens_match_loading_error_state_widget = _TranslationsMatchUiScreensMatchLoadingErrorStateWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchNearbyHeaderWidgetPtBr ui_screens_match_nearby_header_widget = _TranslationsMatchUiScreensMatchNearbyHeaderWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchNoMatchesStateWidgetPtBr ui_screens_match_no_matches_state_widget = _TranslationsMatchUiScreensMatchNoMatchesStateWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchTimeStatusChipWidgetPtBr ui_screens_match_time_status_chip_widget = _TranslationsMatchUiScreensMatchTimeStatusChipWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetPtBr ui_screens_match_create_table_location_no_search_results_widget = _TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableScreenPtBr ui_screens_match_create_table_screen = _TranslationsMatchUiScreensMatchCreateTableScreenPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetPtBr ui_screens_match_chat_loading_error_state_widget = _TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchReportAvailableChipWidgetPtBr ui_screens_match_report_available_chip_widget = _TranslationsMatchUiScreensMatchReportAvailableChipWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchInitialLoadingStateWidgetPtBr ui_screens_match_initial_loading_state_widget = _TranslationsMatchUiScreensMatchInitialLoadingStateWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchParticipantCardWidgetPtBr ui_screens_match_participant_card_widget = _TranslationsMatchUiScreensMatchParticipantCardWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchJoinSheetContentWidgetPtBr ui_screens_match_join_sheet_content_widget = _TranslationsMatchUiScreensMatchJoinSheetContentWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchTableCardWidgetPtBr ui_screens_match_table_card_widget = _TranslationsMatchUiScreensMatchTableCardWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchLocationHeaderImageWidgetPtBr ui_screens_match_location_header_image_widget = _TranslationsMatchUiScreensMatchLocationHeaderImageWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetPtBr ui_screens_match_create_table_location_no_recent_locations_widget = _TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchChatScreenPtBr ui_screens_match_chat_screen = _TranslationsMatchUiScreensMatchChatScreenPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetPtBr ui_screens_match_create_table_location_loading_recent_widget = _TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetPtBr._(_root);
}

// Path: register_match
class _TranslationsRegisterMatchPtBr extends TranslationsRegisterMatchEn {
	_TranslationsRegisterMatchPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionPtBr ui_sheets_register_match_wizard_winner_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionPtBr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionPtBr ui_sheets_register_match_wizard_timing_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionPtBr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionPtBr ui_sheets_register_match_wizard_participants_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionPtBr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionPtBr ui_sheets_register_match_picker_error_section = _TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionPtBr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardPtBr ui_sheets_register_match_picker_match_item_card = _TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardPtBr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionPtBr ui_sheets_register_match_wizard_factions_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionPtBr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetPtBr ui_sheets_register_match_search_registered_player_sheet = _TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetPtBr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionPtBr ui_sheets_register_match_wizard_points_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionPtBr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionPtBr ui_sheets_register_match_wizard_bottom_actions_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionPtBr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionPtBr ui_sheets_register_match_picker_empty_section = _TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionPtBr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionPtBr ui_sheets_register_match_wizard_loading_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionPtBr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetPtBr ui_sheets_register_match_picker_sheet = _TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetPtBr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetPtBr ui_sheets_register_match_add_anonymous_player_sheet = _TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetPtBr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionPtBr ui_sheets_register_match_wizard_top_bar_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionPtBr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionPtBr ui_sheets_register_match_wizard_error_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionPtBr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetPtBr ui_sheets_register_match_wizard_sheet = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetPtBr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionPtBr ui_sheets_register_match_wizard_review_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionPtBr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTilePtBr ui_sheets_register_match_wizard_review_photo_tile = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTilePtBr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionPtBr ui_sheets_register_match_wizard_proof_card_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionPtBr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionPtBr ui_sheets_register_match_picker_header_section = _TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionPtBr._(_root);
	@override late final _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionPtBr ui_sheets_register_match_wizard_social_proof_step_section = _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionPtBr._(_root);
}

// Path: shop
class _TranslationsShopPtBr extends TranslationsShopEn {
	_TranslationsShopPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsShopUiScreensShopScreenPtBr ui_screens_shop_screen = _TranslationsShopUiScreensShopScreenPtBr._(_root);
}

// Path: auth.auth_onboarding_screen
class _TranslationsAuthAuthOnboardingScreenPtBr extends TranslationsAuthAuthOnboardingScreenEn {
	_TranslationsAuthAuthOnboardingScreenPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get pickYourFavoriteRootFactionBeforeEnteringTheHub => 'Escolha sua facção ROOT favorita antes de entrar no hub.';
	@override String get chooseYourFaction => 'Escolha sua facção';
}

// Path: auth.auth_onboarding_profile_screen
class _TranslationsAuthAuthOnboardingProfileScreenPtBr extends TranslationsAuthAuthOnboardingProfileScreenEn {
	_TranslationsAuthAuthOnboardingProfileScreenPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get currentLocationUsesYourPhoneCoordinatesXAndYAndIsRequiredToShowNearbyMat => 'A localização atual usa as coordenadas do seu telefone (x e y) e é necessária para mostrar correspondências próximas.';
	@override String get yourDisplayNameIsHowOtherPlayersWillSeeYouInRootHub => 'Seu nome de exibição é como os outros jogadores verão você em Root Hub. ';
	@override String get setYourHubIdentity => 'Defina a identidade do seu hub';
	@override String get continueButton => 'Continuar';
}

// Path: auth.auth_loading_screen
class _TranslationsAuthAuthLoadingScreenPtBr extends TranslationsAuthAuthLoadingScreenEn {
	_TranslationsAuthAuthLoadingScreenPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get rootHub => '__TERMO_1__';
}

// Path: auth.auth_login_screen
class _TranslationsAuthAuthLoginScreenPtBr extends TranslationsAuthAuthLoginScreenEn {
	_TranslationsAuthAuthLoginScreenPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get signInToBrowseSchedulesAndJoinTables => 'Faça login para navegar pelas programações e ingressar nas mesas.';
	@override String get findYourNextRootMatch => 'Encontre sua próxima correspondência\nROOT';
}

// Path: auth.auth_onboarding_continue_button_widget
class _TranslationsAuthAuthOnboardingContinueButtonWidgetPtBr extends TranslationsAuthAuthOnboardingContinueButtonWidgetEn {
	_TranslationsAuthAuthOnboardingContinueButtonWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get continueButton => 'Continuar';
}

// Path: dashboard.ui_screens_dashboard_screen
class _TranslationsDashboardUiScreensDashboardScreenPtBr extends TranslationsDashboardUiScreensDashboardScreenEn {
	_TranslationsDashboardUiScreensDashboardScreenPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get shop => 'Comprar';
	@override String get match => 'Corresponder';
	@override String get home => 'Lar';
	@override String get rootHub => '__TERMO_1__';
	@override String get chooseFromGallery => 'Escolha na Galeria';
	@override String get takePhoto => 'Tirar foto';
	@override String get cancel => 'Cancelar';
	@override String get chooseFromLibrary => 'Escolha na biblioteca';
	@override String get takePhoto2 => 'Tirar foto';
	@override String get changeProfilePhoto => 'Alterar foto do perfil';
	@override String get allowCameraAndPhotoPermissionsInSystemSettingsAndTryAgain => 'Permita permissões de câmera e foto nas configurações do sistema e tente novamente.';
	@override String get unableToAccessCameraOrGallery => 'Não foi possível acessar a câmera ou a galeria';
}

// Path: dashboard.ui_screens_dashboard_faction_editor_screen
class _TranslationsDashboardUiScreensDashboardFactionEditorScreenPtBr extends TranslationsDashboardUiScreensDashboardFactionEditorScreenEn {
	_TranslationsDashboardUiScreensDashboardFactionEditorScreenPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get chooseTheFactionShownInYourProfileAndUsedAsYourDefaultPreference => 'Escolha a facção mostrada em seu perfil e usada como preferência padrão.';
	@override String get changeFavoriteFaction => 'Alterar facção favorita';
}

// Path: dashboard.ui_dialogs_edit_location_dialog
class _TranslationsDashboardUiDialogsEditLocationDialogPtBr extends TranslationsDashboardUiDialogsEditLocationDialogEn {
	_TranslationsDashboardUiDialogsEditLocationDialogPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get save => 'Salvar';
	@override String get cancel => 'Cancelar';
	@override String get updateYourCoordinatesAndTargetSearchRatioForMatchDiscovery => 'Atualize suas coordenadas e proporção de pesquisa de alvo para descoberta de correspondência.';
	@override String get editLocation => 'Editar local';
}

// Path: dashboard.ui_dialogs_edit_display_name_dialog
class _TranslationsDashboardUiDialogsEditDisplayNameDialogPtBr extends TranslationsDashboardUiDialogsEditDisplayNameDialogEn {
	_TranslationsDashboardUiDialogsEditDisplayNameDialogPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get save => 'Salvar';
	@override String get cancel => 'Cancelar';
	@override String get thisIsHowPlayersWillSeeYouAcrossRootHub => 'É assim que os jogadores verão você em Root Hub.';
	@override String get editDisplayName => 'Editar nome de exibição';
}

// Path: dashboard.ui_widgets_dashboard_profile_drawer_widget
class _TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetPtBr extends TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetEn {
	_TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get logOut => 'Sair';
	@override String get changeFaction => 'Mudar facção';
	@override String get saving => 'Salvando...';
	@override String get favoriteFaction => 'Facção Favorita';
	@override String get location => 'Localização';
	@override String get displayName => 'Nome de exibição';
	@override String get edit => 'Editar';
	@override String get change => 'Mudar';
	@override String get noLocationConfigured => 'Nenhum local configurado';
	@override String get xLabel => 'x';
	@override String get yLabel => 'sim';
	@override String get ratioLabel => 'razão';
	@override String get language => 'Linguagem';
	@override String get useDeviceLanguage => 'Usar o idioma do dispositivo';
	@override String get english => 'Inglês';
	@override String get portugueseBrazil => 'Português (Brasil)';
	@override String get spanish => 'Espanhol';
	@override String get french => 'Francês';
	@override String get german => 'Alemão';
}

// Path: home.ui_sections_home_stats_section
class _TranslationsHomeUiSectionsHomeStatsSectionPtBr extends TranslationsHomeUiSectionsHomeStatsSectionEn {
	_TranslationsHomeUiSectionsHomeStatsSectionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get allFactionsTotal => 'Todas as facções totalizam';
	@override String get allFactionsAvg => 'Média de todas as facções';
	@override String get allFactionsTotal2 => 'Todas as facções totalizam';
	@override String get allFactionsAvg2 => 'Média de todas as facções';
	@override String get absoluteNumberOfWinsForEachFaction => 'Número absoluto de vitórias para cada facção.';
	@override String get totalWins => 'Total de vitórias';
	@override String get averageScorePerFactionWhenPointsWereTracked => 'Pontuação média por facção quando os pontos foram rastreados.';
	@override String get averagePoints => 'Média de Pontos';
	@override String get howOftenEachFactionAppearsInCompletedGames => 'Com que frequência cada facção aparece em jogos concluídos.';
	@override String get playedGames => 'Jogos jogados';
	@override String get whoIsWinningTheMostOftenRightNow => 'Quem está ganhando com mais frequência agora.';
	@override String get factionWinRate => 'Taxa de vitórias da facção';
}

// Path: home.ui_screens_home_screen
class _TranslationsHomeUiScreensHomeScreenPtBr extends TranslationsHomeUiScreensHomeScreenEn {
	_TranslationsHomeUiScreensHomeScreenPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get yourPersonalFactionPerformanceAndMatchProfile => 'Seu desempenho pessoal na facção e perfil de partida.';
	@override String get myStats => 'Minhas estatísticas';
	@override String get factionPerformanceFromAllPlayedMatchesInRootHub => 'Desempenho da facção em todas as partidas disputadas em Root Hub.';
	@override String get communityStats => 'Estatísticas da comunidade';
	@override String get seeHowTheRootPlatformIsEvolvingAndCompareItWithYourOwnProgress => 'Veja como a plataforma ROOT está evoluindo e compare com o seu próprio progresso.';
	@override String get communityDashboard => 'Painel da comunidade';
}

// Path: home.ui_widgets_home_stats_pie_chart_widget
class _TranslationsHomeUiWidgetsHomeStatsPieChartWidgetPtBr extends TranslationsHomeUiWidgetsHomeStatsPieChartWidgetEn {
	_TranslationsHomeUiWidgetsHomeStatsPieChartWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get noValuesForThisMetricYet => 'Ainda não há valores para esta métrica.';
}

// Path: match.ui_sheets_match_edit_table_error_widget
class _TranslationsMatchUiSheetsMatchEditTableErrorWidgetPtBr extends TranslationsMatchUiSheetsMatchEditTableErrorWidgetEn {
	_TranslationsMatchUiSheetsMatchEditTableErrorWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get close => 'Fechar';
}

// Path: match.ui_sheets_match_edit_table_loading_widget
class _TranslationsMatchUiSheetsMatchEditTableLoadingWidgetPtBr extends TranslationsMatchUiSheetsMatchEditTableLoadingWidgetEn {
	_TranslationsMatchUiSheetsMatchEditTableLoadingWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get loadingTableDetails => 'Carregando detalhes da tabela...';
}

// Path: match.ui_sheets_match_table_info_sheet
class _TranslationsMatchUiSheetsMatchTableInfoSheetPtBr extends TranslationsMatchUiSheetsMatchTableInfoSheetEn {
	_TranslationsMatchUiSheetsMatchTableInfoSheetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get remove => 'Remover';
	@override String get cancel => 'Cancelar';
	@override String get rejoinIfSeatsAreStillAvailable => 'volte se ainda houver vagas disponíveis.';
	@override String get cancel2 => 'Cancelar';
	@override String get selectAPlayerToRemoveFromTheTable => 'Selecione um jogador para remover da mesa.';
	@override String get removeAPlayer => 'Remover um jogador';
	@override String get leave => 'Deixar';
	@override String get cancel3 => 'Cancelar';
	@override String get playersListYouCanRejoinLaterIfSeatsAreStillAvailable => 'lista de jogadores. Você poderá voltar mais tarde se ainda houver vagas disponíveis.';
	@override String get youWillBeUnsubscribedFromThisMatchAndRemovedFromThe => 'Sua inscrição nesta partida será cancelada e removida do ';
	@override String get leaveThisTable => 'Sair desta mesa?';
	@override String get unableToLoadTableDetails => 'Não foi possível carregar os detalhes da tabela.';
	@override String get tableNotFound => 'Tabela não encontrada';
}

// Path: match.ui_sheets_match_table_info_content_widget
class _TranslationsMatchUiSheetsMatchTableInfoContentWidgetPtBr extends TranslationsMatchUiSheetsMatchTableInfoContentWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoContentWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get noPlayersHaveJoinedThisTableYet => 'Nenhum jogador se juntou a esta mesa ainda.';
	@override String get theseAreTheCurrentPlayersThatWillParticipate => 'Estes são os jogadores atuais que participarão.';
	@override String get noPlayersSubscribedYet => 'Nenhum jogador inscrito ainda.';
	@override String get playersInThisMatch => 'Jogadores nesta partida';
	@override String get unknownHost => 'Anfitrião desconhecido';
	@override String get tableDetails => 'Detalhes da tabela';
}

// Path: match.ui_sheets_match_table_info_error_widget
class _TranslationsMatchUiSheetsMatchTableInfoErrorWidgetPtBr extends TranslationsMatchUiSheetsMatchTableInfoErrorWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoErrorWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get retry => 'Tentar novamente';
	@override String get close => 'Fechar';
}

// Path: match.ui_sheets_match_table_info_participant_card_widget
class _TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetPtBr extends TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get favoriteFaction => 'Facção Favorita';
}

// Path: match.ui_sheets_match_edit_table_sheet
class _TranslationsMatchUiSheetsMatchEditTableSheetPtBr extends TranslationsMatchUiSheetsMatchEditTableSheetEn {
	_TranslationsMatchUiSheetsMatchEditTableSheetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get theScheduledTimeCannotBeMoreThan => 'O horário agendado não pode ser superior ';
	@override String get dateIsTooFar => 'A data está muito longe';
	@override String get theScheduledTimeMustBeAtLeast => 'O horário agendado deve ser pelo menos ';
	@override String get timeIsTooSoon => 'O tempo é muito cedo';
	@override String get youCannotSetTheMaximumBelowThatNumber => 'Você não pode definir o máximo abaixo desse número.';
	@override String get tooManyPlayersSubscribed => 'Muitos jogadores inscritos';
	@override String get withMinimumNotGreaterThanMaximum => 'com mínimo não maior que máximo.';
	@override String get playersRangeMustBeBetween2And6 => 'O intervalo dos jogadores deve estar entre 2 e 6, ';
	@override String get invalidPlayersRange => 'Intervalo de jogadores inválido';
	@override String get pleaseAddATitleForYourTable => 'Adicione um título para sua tabela.';
	@override String get titleRequired => 'Título obrigatório';
	@override String get unableToLoadTableDetails => 'Não foi possível carregar os detalhes da tabela.';
	@override String get tableNotFound => 'Tabela não encontrada';
}

// Path: match.ui_sheets_match_table_info_loading_widget
class _TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetPtBr extends TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get loadingTableDetails => 'Carregando detalhes da tabela...';
}

// Path: match.ui_sheets_match_edit_table_form_widget
class _TranslationsMatchUiSheetsMatchEditTableFormWidgetPtBr extends TranslationsMatchUiSheetsMatchEditTableFormWidgetEn {
	_TranslationsMatchUiSheetsMatchEditTableFormWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get saveChanges => 'Salvar alterações';
	@override String get saving => 'Salvando...';
	@override String get cancel => 'Cancelar';
	@override String get mustBeAtLeast10MinutesFromNowUpTo => 'Deve ser pelo menos 10 minutos a partir de agora, até ';
	@override String get schedule => 'Agendar';
	@override String get maximum => 'Máximo';
	@override String get minimum => 'Mínimo';
	@override String get setBetween2And6Players => 'Defina entre 2 e 6 jogadores.';
	@override String get playersRange => 'Gama de jogadores';
	@override String get exampleWeHaveMarauderExpansion => 'Exemplo: Temos a expansão Marauder.';
	@override String get extraDetailsLikeExpansionsParkingTipsEtc => 'Detalhes extras como expansões, dicas de estacionamento, etc.';
	@override String get descriptionOptional => 'Descrição (opcional)';
	@override String get exampleSaturdayRootAtLanternCaf => 'Exemplo: sábado ROOT no Lantern Café';
	@override String get aShortNameSoPlayersCanFindYourTable => 'Um nome curto para que os jogadores possam encontrar sua mesa.';
	@override String get tableTitle => 'Título da tabela';
	@override String get newPlayersCanStillJoinThisTable => 'Novos jogadores ainda podem entrar nesta mesa.';
	@override String get newPlayersCannotJoinThisTable => 'Novos jogadores não podem entrar nesta mesa.';
	@override String get closeSubscriptions => 'Fechar assinaturas';
	@override String get editDetails => 'Editar detalhes';
	@override String get editTable => 'Editar tabela';
}

// Path: match.ui_sheets_match_table_info_bottom_actions_widget
class _TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetPtBr extends TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get removePlayer => 'Remover jogador';
	@override String get removing => 'Removendo...';
	@override String get leaveTable => 'Sair da mesa';
	@override String get leaving => 'Saindo...';
	@override String get close => 'Fechar';
}

// Path: match.ui_screens_match_create_table_location_loading_search_widget
class _TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetPtBr extends TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get searchingLocations => 'Pesquisando locais...';
}

// Path: match.ui_screens_match_create_table_location_screen
class _TranslationsMatchUiScreensMatchCreateTableLocationScreenPtBr extends TranslationsMatchUiScreensMatchCreateTableLocationScreenEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationScreenPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get previouslySelectedLocations => 'Locais previamente selecionados';
	@override String get searchResults => 'Resultados da pesquisa';
	@override String get tapALocationToSelectItPreviouslySelectedLocationsAreSavedHereForFasterHo => 'Toque em um local para selecioná-lo. Os locais previamente selecionados são salvos aqui para uma hospedagem mais rápida.';
	@override String get searchLocationGooglePlaces => 'Local de pesquisa (Google Places)';
	@override String get chooseTableLocation => 'Escolha o local da mesa';
	@override String get chooseOneLocationFromTheListBeforeCreatingTheTable => 'Escolha um local da lista antes de criar a tabela.';
	@override String get locationRequired => 'Local obrigatório';
	@override String get continueButton => 'Continuar';
}

// Path: match.ui_screens_match_join_sheet_error_widget
class _TranslationsMatchUiScreensMatchJoinSheetErrorWidgetPtBr extends TranslationsMatchUiScreensMatchJoinSheetErrorWidgetEn {
	_TranslationsMatchUiScreensMatchJoinSheetErrorWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get retry => 'Tentar novamente';
	@override String get close => 'Fechar';
}

// Path: match.ui_screens_match_screen
class _TranslationsMatchUiScreensMatchScreenPtBr extends TranslationsMatchUiScreensMatchScreenEn {
	_TranslationsMatchUiScreensMatchScreenPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get unableToOpenTheDialerRightNow => 'Não é possível abrir o discador no momento.';
	@override String get invalidPhoneNumberFormat => 'Formato de número de telefone inválido.';
	@override String get unableToOpenTheLinkRightNow => 'Não é possível abrir o link no momento.';
	@override String get invalidUrlFormat => 'Formato de URL inválido.';
	@override String get close => 'Fechar';
	@override String get manualLocationNotes => 'Notas de localização manuais';
	@override String get phone => 'Telefone';
	@override String get phone2 => 'Telefone';
	@override String get website => 'Site';
	@override String get website2 => 'Site';
	@override String get mapLink => 'Link do mapa';
	@override String get mapLink2 => 'Link do mapa';
	@override String get public => 'Público';
	@override String get private => 'Privado';
	@override String get matchesPlayedHere => 'partidas disputadas aqui';
	@override String get matchPlayedHere => 'partida disputada aqui';
	@override String get hostTable => 'Tabela hospedeira';
	@override String get reportResult => 'Resultado do relatório';
}

// Path: match.ui_screens_match_loading_error_state_widget
class _TranslationsMatchUiScreensMatchLoadingErrorStateWidgetPtBr extends TranslationsMatchUiScreensMatchLoadingErrorStateWidgetEn {
	_TranslationsMatchUiScreensMatchLoadingErrorStateWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get tryAgain => 'Tente novamente';
}

// Path: match.ui_screens_match_nearby_header_widget
class _TranslationsMatchUiScreensMatchNearbyHeaderWidgetPtBr extends TranslationsMatchUiScreensMatchNearbyHeaderWidgetEn {
	_TranslationsMatchUiScreensMatchNearbyHeaderWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get onlyTablesThatDidNotStartMoreThan2HoursAgoAreListed => 'Somente as tabelas que não foram iniciadas há mais de 2 horas serão listadas.';
	@override String get nearbyMatchTables => 'Tabelas de correspondência próximas';
	@override String get matchFinder => 'Localizador de correspondência';
}

// Path: match.ui_screens_match_no_matches_state_widget
class _TranslationsMatchUiScreensMatchNoMatchesStateWidgetPtBr extends TranslationsMatchUiScreensMatchNoMatchesStateWidgetEn {
	_TranslationsMatchUiScreensMatchNoMatchesStateWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get hostTheFirstTable => 'Hospede a primeira mesa';
	@override String get beTheFirstToStartOneHostANewTableSoNearbyPlayersCanSubscribe => 'Seja o primeiro a iniciar um. Hospede uma nova mesa para que jogadores próximos possam se inscrever.';
	@override String get noTablesInYourAreaYet => 'Ainda não há mesas na sua área';
}

// Path: match.ui_screens_match_time_status_chip_widget
class _TranslationsMatchUiScreensMatchTimeStatusChipWidgetPtBr extends TranslationsMatchUiScreensMatchTimeStatusChipWidgetEn {
	_TranslationsMatchUiScreensMatchTimeStatusChipWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get remainingTimeUntilTheMatchStarts => 'Tempo restante até o início da partida.';
	@override String get thisMatchAlreadyStartedRecentlyStartedTablesStayVisibleForAShortPeriod => 'Esta partida já começou. As tabelas iniciadas recentemente permanecem visíveis por um curto período.';
}

// Path: match.ui_screens_match_create_table_location_no_search_results_widget
class _TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetPtBr extends TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get noLocationsFoundForThisQueryTryAnotherPlaceNameOrArea => 'Nenhum local encontrado para esta consulta. Experimente outro nome de lugar ou área.';
}

// Path: match.ui_screens_match_create_table_screen
class _TranslationsMatchUiScreensMatchCreateTableScreenPtBr extends TranslationsMatchUiScreensMatchCreateTableScreenEn {
	_TranslationsMatchUiScreensMatchCreateTableScreenPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get noIAmOnlyHostingThisTable => 'Não, estou apenas hospedando esta mesa';
	@override String get yesIWillPlayThisMatch => 'Sim, vou jogar esta partida';
	@override String get ifYouAreAVenueBoardGameClubOrOrganizerBringingPlayersTogetherButNotJoini => 'Se você é um local, clube de jogos de tabuleiro ou organizador que reúne jogadores, mas não participa da partida, deixe esta opção desmarcada.';
	@override String get willYouTheHostPlay => 'Você, o anfitrião, vai jogar?';
	@override String get pickTheDayAndStartHourChooseATimeYouCanReliablyShowUp => 'Escolha o dia e a hora de início. Escolha um horário em que você possa aparecer com segurança.';
	@override String get schedule => 'Agendar';
	@override String get maximum => 'Máximo';
	@override String get minimum => 'Mínimo';
	@override String get defaultIs34YouCanSetBetween2And6Players => 'O padrão é 3-4. Você pode definir entre 2 e 6 jogadores.';
	@override String get playersRange => 'Gama de jogadores';
	@override String get exampleWeHaveMarauderExpansionAndSpareSleeves => 'Exemplo: Temos expansão Marauder e mangas sobressalentes.';
	@override String get addExtraDetailsLikeExpansionsAvailableParkingTipsOrReferencePoints => 'Adicione detalhes extras, como expansões disponíveis, dicas de estacionamento ou pontos de referência.';
	@override String get descriptionOptional => 'Descrição (opcional)';
	@override String get exampleSaturdayRootAtLanternCaf => 'Exemplo: sábado ROOT no Lantern Café';
	@override String get thisCanBeAnythingThatHelpsIdentifyTheTableLikeAPlaceNameOrEventStyle => 'Pode ser qualquer coisa que ajude a identificar a mesa, como o nome de um local ou o estilo do evento.';
	@override String get tableTitle => 'Título da tabela';
	@override String get setTableDetailsFirstOnTheNextScreenYouWillChooseTheLocation => 'Defina os detalhes da tabela primeiro. Na próxima tela você escolherá o local.';
	@override String get hostANewTable => 'Hospede uma nova mesa';
	@override String get selectTheStartHourForThisTableBeforeContinuing => 'Selecione a hora de início desta tabela antes de continuar.';
	@override String get startHourRequired => 'Hora de início obrigatória';
	@override String get youCannotSelectADayInThePast => 'Você não pode selecionar um dia no passado.';
	@override String get invalidDate => 'Data inválida';
	@override String get selectTheDayForThisTableBeforeContinuing => 'Selecione o dia para esta tabela antes de continuar.';
	@override String get dayRequired => 'Dia necessário';
	@override String get addATitleSoPlayersCanQuicklyIdentifyYourTableExampleDowntownCafNight => 'Adicione um título para que os jogadores possam identificar rapidamente sua mesa. Exemplo: "Noite do Café no Centro".';
	@override String get titleRequired => 'Título obrigatório';
	@override String get youCannotSelectADayInThePast2 => 'Você não pode selecionar um dia no passado.';
	@override String get invalidDate2 => 'Data inválida';
	@override String get continueButton => 'Continuar';
}

// Path: match.ui_screens_match_chat_loading_error_state_widget
class _TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetPtBr extends TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetEn {
	_TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get tryAgain => 'Tente novamente';
}

// Path: match.ui_screens_match_report_available_chip_widget
class _TranslationsMatchUiScreensMatchReportAvailableChipWidgetPtBr extends TranslationsMatchUiScreensMatchReportAvailableChipWidgetEn {
	_TranslationsMatchUiScreensMatchReportAvailableChipWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get reportAvailable => 'Relatório disponível';
	@override String get youCanReportThisMatchResultNow => 'Você pode relatar o resultado desta partida agora.';
}

// Path: match.ui_screens_match_initial_loading_state_widget
class _TranslationsMatchUiScreensMatchInitialLoadingStateWidgetPtBr extends TranslationsMatchUiScreensMatchInitialLoadingStateWidgetEn {
	_TranslationsMatchUiScreensMatchInitialLoadingStateWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get loadingNearbyTables => 'Carregando mesas próximas...';
}

// Path: match.ui_screens_match_participant_card_widget
class _TranslationsMatchUiScreensMatchParticipantCardWidgetPtBr extends TranslationsMatchUiScreensMatchParticipantCardWidgetEn {
	_TranslationsMatchUiScreensMatchParticipantCardWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get favoriteFaction => 'Facção Favorita';
}

// Path: match.ui_screens_match_join_sheet_content_widget
class _TranslationsMatchUiScreensMatchJoinSheetContentWidgetPtBr extends TranslationsMatchUiScreensMatchJoinSheetContentWidgetEn {
	_TranslationsMatchUiScreensMatchJoinSheetContentWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get confirmJoin => 'Confirmar adesão';
	@override String get subscriptionsClosed => 'Assinaturas encerradas';
	@override String get alreadySubscribed => 'Já inscrito';
	@override String get cancel => 'Cancelar';
	@override String get youCanBeTheFirstPlayerToLockThisTableIn => 'Você pode ser o primeiro jogador a bloquear esta mesa.';
	@override String get theseAreTheCurrentPlayersThatWillParticipate => 'Estes são os jogadores atuais que participarão.';
	@override String get noPlayersSubscribedYet => 'Nenhum jogador inscrito ainda.';
	@override String get playersInThisMatch => 'Jogadores nesta partida';
	@override String get unknownHost => 'Anfitrião desconhecido';
	@override String get seeTableChat => 'Ver bate-papo à mesa';
	@override String get newPlayersCannotJoinAtThisTime => 'Novos jogadores não podem entrar neste momento.';
	@override String get theHostHasClosedSubscriptionsForThisTable => 'O host encerrou assinaturas para esta tabela. ';
	@override String get confirmTableSubscription => 'Confirmar assinatura da mesa';
}

// Path: match.ui_screens_match_table_card_widget
class _TranslationsMatchUiScreensMatchTableCardWidgetPtBr extends TranslationsMatchUiScreensMatchTableCardWidgetEn {
	_TranslationsMatchUiScreensMatchTableCardWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get subscribed => 'Inscrito';
	@override String get tapCardToOpenChat => 'Toque no cartão para abrir o bate-papo';
	@override String get subscriptionsClosed => 'Assinaturas encerradas';
	@override String get openFullLocationDetails => 'Abra detalhes completos do local';
	@override String get places => 'lugares';
	@override String get place => 'lugar';
	@override String get s => 'é';
}

// Path: match.ui_screens_match_location_header_image_widget
class _TranslationsMatchUiScreensMatchLocationHeaderImageWidgetPtBr extends TranslationsMatchUiScreensMatchLocationHeaderImageWidgetEn {
	_TranslationsMatchUiScreensMatchLocationHeaderImageWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get locationDetails => 'Detalhes do local';
}

// Path: match.ui_screens_match_create_table_location_no_recent_locations_widget
class _TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetPtBr extends TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get noPreviousLocationsYetSearchAndSelectOneAbove => 'Ainda não há locais anteriores. Pesquise e selecione um acima.';
}

// Path: match.ui_screens_match_chat_screen
class _TranslationsMatchUiScreensMatchChatScreenPtBr extends TranslationsMatchUiScreensMatchChatScreenEn {
	_TranslationsMatchUiScreensMatchChatScreenPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get chooseFromGallery => 'Escolha na Galeria';
	@override String get takePhoto => 'Tirar foto';
	@override String get cancel => 'Cancelar';
	@override String get chooseFromLibrary => 'Escolha na biblioteca';
	@override String get takePhoto2 => 'Tirar foto';
	@override String get sendAPhoto => 'Envie uma foto';
	@override String get compress => 'Compressa';
	@override String get cancel2 => 'Cancelar';
	@override String get imageIsTooLarge => 'A imagem é muito grande';
	@override String get subscribed => 'Inscrito';
	@override String get unableToResolveYourAccountInformation => 'Não foi possível resolver as informações da sua conta.';
	@override String get tableInfo => 'Informações da tabela';
	@override String get editTable => 'Editar tabela';
}

// Path: match.ui_screens_match_create_table_location_loading_recent_widget
class _TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetPtBr extends TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get loadingPreviousLocations => 'Carregando locais anteriores...';
}

// Path: register_match.ui_sheets_register_match_wizard_winner_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionPtBr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get dominance => 'Domínio';
	@override String get totalPoints30 => 'Total de pontos (30)';
	@override String get dominanceMeansTheWinnerCompletedADominanceCardObjectiveInsteadOfWinningB => 'Dominância significa que o vencedor completou um objetivo da carta de Dominância em vez de vencer por pontos.';
	@override String get totalPointsMeansTheWinnerReached30VictoryPointsOnTheScoreTrack => 'O total de pontos significa que o vencedor alcançou 30 pontos de vitória na trilha de pontuação. ';
	@override String get howDidTheWinnerWon => 'Como o vencedor venceu?';
	@override String get pickThePlayerWhoWonThisMatch => 'Escolha o jogador que venceu esta partida.';
}

// Path: register_match.ui_sheets_register_match_wizard_timing_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionPtBr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get estimatedDuration => 'Duração estimada';
	@override String get estimatedDuration2 => 'Duração estimada';
	@override String get setTheEstimatedDurationAdjustIn15MinuteStepsMax8Hours => 'Defina a duração estimada. Ajuste em etapas de 15 minutos (máximo de 8 horas).';
	@override String get changeTime => 'Alterar horário';
	@override String get matchStartedAt => 'A partida começou às';
	@override String get setTheTimeTheMatchActuallyStarted => 'Defina a hora em que a partida realmente começou.';
}

// Path: register_match.ui_sheets_register_match_wizard_participants_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionPtBr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get addRegisteredPlayerFromPlatform => 'Adicionar jogador registrado da plataforma';
	@override String get addAnonymousPlayer => 'Adicionar jogador anônimo';
	@override String get registeredPlayer => 'Jogador registrado';
	@override String get anonymousPlayer => 'Jogador anônimo';
	@override String get selectRegisteredPlayersWhoWerePresentYouCanAddAnonymousPlayersOrSearchFo => 'Selecione os jogadores registrados que estiveram presentes. Você pode adicionar jogadores anônimos ou procurar outros jogadores registrados.';
	@override String get value1WhoActuallyPlayed => '1) Quem realmente jogou?';
}

// Path: register_match.ui_sheets_register_match_picker_error_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionPtBr extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get retry => 'Tentar novamente';
}

// Path: register_match.ui_sheets_register_match_picker_match_item_card
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardPtBr extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get notAvailableYet => 'Ainda não disponível';
	@override String get tapToReport => 'Toque para denunciar';
}

// Path: register_match.ui_sheets_register_match_wizard_factions_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionPtBr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get selectFaction => 'Selecione a facção';
	@override String get faction => 'Facção';
	@override String get chooseTheFactionUsedByEachPlayerInThisMatch => 'Escolha a facção usada por cada jogador nesta partida.';
	@override String get value2SelectFactions => '2) Selecione facções';
}

// Path: register_match.ui_sheets_register_match_search_registered_player_sheet
class _TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetPtBr extends TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get tapToAdd => 'Toque para adicionar';
	@override String get alreadyAddedToThisReport => 'Já adicionado a este relatório';
	@override String get noRegisteredPlayersWereFound => 'Nenhum jogador registrado foi encontrado.';
	@override String get searchByDisplayName => 'Pesquisar por nome de exibição';
	@override String get addRegisteredPlayer => 'Adicionar jogador registrado';
}

// Path: register_match.ui_sheets_register_match_wizard_points_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionPtBr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get value0To29 => '0 a 29';
	@override String get points => 'Pontos';
	@override String get dominanceAttempt => 'Tentativa de domínio';
	@override String get winnerByDominance => 'Vencedor por domínio';
	@override String get winnerByPoints => 'Vencedor por pontos';
	@override String get failedDominance => 'Domínio falhado';
	@override String get points2 => 'Pontos';
	@override String get winner => 'Ganhador';
	@override String get failedDominanceAlwaysCountsAsNoPoints => 'O domínio falhado sempre conta como nenhum ponto.';
	@override String get forEachNonWinnerSetPointsOrMarkFailedDominanceAttempt => 'Para cada não vencedor, defina pontos ou marque uma tentativa de domínio fracassada. ';
}

// Path: register_match.ui_sheets_register_match_wizard_bottom_actions_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionPtBr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get submitReport => 'Enviar relatório';
	@override String get back => 'Voltar';
	@override String get cancel => 'Cancelar';
	@override String get continueButton => 'Continuar';
}

// Path: register_match.ui_sheets_register_match_picker_empty_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionPtBr extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get youDoNotHaveAnyHostedSubscribedMatchPendingResultRegistration => 'Você não tem nenhuma partida hospedada/inscrita com registro de resultado pendente.';
	@override String get noPendingMatches => 'Nenhuma correspondência pendente';
}

// Path: register_match.ui_sheets_register_match_wizard_loading_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionPtBr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get loadingMatchDetails => 'Carregando detalhes da partida...';
}

// Path: register_match.ui_sheets_register_match_picker_sheet
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetPtBr extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get youCanRegisterThisMatchFrom2HoursBeforeItsScheduledStart => 'Você pode registrar esta partida 2 horas antes do início programado. ';
	@override String get resultRegistrationNotAvailableYet => 'Cadastro de resultados ainda não disponível';
}

// Path: register_match.ui_sheets_register_match_add_anonymous_player_sheet
class _TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetPtBr extends TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get tapToAdd => 'Toque para adicionar';
	@override String get alreadyAddedToThisReport => 'Já adicionado a este relatório';
	@override String get noAnonymousPlayersYetCreateOneUsingFirstAndLastName => 'Nenhum jogador anônimo ainda. Crie um usando nome e sobrenome.';
	@override String get createAndAddPlayer => 'Criar e adicionar jogador';
	@override String get lastName => 'Sobrenome';
	@override String get firstName => 'Primeiro nome';
	@override String get addAnonymousPlayer => 'Adicionar jogador anônimo';
}

// Path: register_match.ui_sheets_register_match_wizard_top_bar_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionPtBr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get registerMatchResult => 'Registrar Resultado da Partida';
}

// Path: register_match.ui_sheets_register_match_wizard_error_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionPtBr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get close => 'Fechar';
	@override String get registerMatch => 'Registrar partida';
}

// Path: register_match.ui_sheets_register_match_wizard_sheet
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetPtBr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get gallery => 'Galeria';
	@override String get camera => 'Câmera';
	@override String get cancel => 'Cancelar';
	@override String get gallery2 => 'Galeria';
	@override String get camera2 => 'Câmera';
	@override String get selectSource => 'Selecione a fonte';
	@override String get selectedImageIsEmptyChooseAnotherImage => 'A imagem selecionada está vazia. Escolha outra imagem.';
	@override String get invalidImage => 'Imagem inválida';
	@override String get allowCameraAndPhotoPermissionsInSystemSettingsAndTryAgain => 'Permita permissões de câmera e foto nas configurações do sistema e tente novamente.';
	@override String get unableToAccessCameraOrGallery => 'Não foi possível acessar a câmera ou a galeria';
	@override String get ok => 'OK';
	@override String get takeASelfieWithEveryoneAtTheTableIfPossibleIncludeTheBoardInTheSamePhoto => 'Tire uma selfie com todos na mesa. Se possível, inclua o quadro na mesma foto.';
	@override String get groupSelfieProof => 'Prova de selfie em grupo';
	@override String get completeAllReportStepsBeforeSubmitting => 'Conclua todas as etapas do relatório antes de enviá-lo.';
	@override String get incompleteReport => 'Relatório incompleto';
	@override String get addTheBoardPhotoBeforeContinuing => 'Adicione a foto do quadro antes de continuar.';
	@override String get boardPhotoRequired => 'Foto do quadro necessária';
	@override String get addTheGroupSelfieBeforeContinuing => 'Adicione a selfie do grupo antes de continuar.';
	@override String get groupPhotoRequired => 'Foto do grupo obrigatória';
	@override String get matchDurationMustBeAtMost8Hours => 'A duração da partida deve ser de no máximo 8 horas.';
	@override String get invalidDuration => 'Duração inválida';
	@override String get matchDurationMustBeGreaterThanZero => 'A duração da partida deve ser maior que zero.';
	@override String get invalidDuration2 => 'Duração inválida';
	@override String get matchStartTimeCannotBeInTheFuture => 'O horário de início da partida não pode ser no futuro.';
	@override String get invalidMatchRegistration => 'Registro de partida inválido';
	@override String get selectWhenThisMatchStarted => 'Selecione quando esta partida começou.';
	@override String get matchStartMissing => 'Partida começa faltando';
	@override String get invalidPoints => 'Pontos inválidos';
	@override String get pointsMissing => 'Faltam pontos';
	@override String get selectHowTheWinnerWonBeforeContinuing => 'Selecione como o vencedor ganhou antes de continuar.';
	@override String get winnerMethodMissing => 'Método vencedor ausente';
	@override String get selectTheWinnerBeforeContinuing => 'Selecione o vencedor antes de continuar.';
	@override String get winnerMissing => 'Vencedor ausente';
	@override String get theSelectedWinnerIsNoLongerInTheParticipantList => 'O vencedor selecionado não está mais na lista de participantes.';
	@override String get winnerMissing2 => 'Vencedor ausente';
	@override String get selectTheWinnerBeforeContinuing2 => 'Selecione o vencedor antes de continuar.';
	@override String get winnerMissing3 => 'Vencedor ausente';
	@override String get invalidFactionSetup => 'Configuração de facção inválida';
	@override String get factionMissing => 'Facção desaparecida';
	@override String get selectAtLeast2ParticipantsRegisteredAndOrAnonymousToContinue => 'Selecione pelo menos 2 participantes (registrados e/ou anônimos) para continuar.';
	@override String get notEnoughPlayers => 'Não há jogadores suficientes';
	@override String get edit => 'Editar';
	@override String get youKeptTheDefaultDurationOf1HourDoYouWantToContinueWithIt => 'Você manteve a duração padrão de 1 hora. Você quer continuar com isso?';
	@override String get keepDefaultDuration => 'Manter a duração padrão?';
	@override String get matchStartTimeCannotBeInTheFuture2 => 'O horário de início da partida não pode ser no futuro.';
	@override String get invalidMatchRegistration2 => 'Registro de partida inválido';
	@override String get matchStartTimeCannotBeInTheFuture3 => 'O horário de início da partida não pode ser no futuro.';
	@override String get invalidMatchRegistration3 => 'Registro de partida inválido';
	@override String get unableToLoadThisMatchReportFlow => 'Não foi possível carregar este fluxo de relatório de partida.';
	@override String get matchNotFound => 'Correspondência não encontrada';
	@override String get unableToLoadThisMatchReportFlow2 => 'Não foi possível carregar este fluxo de relatório de partida.';
	@override String get invalidMatch => 'Correspondência inválida';
	@override String get continueButton => 'Continuar';
}

// Path: register_match.ui_sheets_register_match_wizard_review_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionPtBr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get boardPhoto => 'Foto do quadro';
	@override String get groupPhoto => 'Foto do grupo';
	@override String get socialProof => 'Prova social';
	@override String get ranking => 'Classificação';
	@override String get confirmAllDetailsBeforeLoggingThisMatch => 'Confirme todos os detalhes antes de registrar esta partida.';
}

// Path: register_match.ui_sheets_register_match_wizard_review_photo_tile
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTilePtBr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTilePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get ready => 'Preparar';
	@override String get missing => 'Ausente';
}

// Path: register_match.ui_sheets_register_match_wizard_proof_card_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionPtBr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get tapToReplace => 'Toque para substituir';
	@override String get tapToAddPhoto => 'Toque para adicionar foto';
}

// Path: register_match.ui_sheets_register_match_picker_header_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionPtBr extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get selectAMatchYouParticipatedInYouCanRegisterAResultFrom2HoursBeforeSchedu => 'Selecione uma partida da qual você participou. Você pode registrar o resultado 2 horas antes do início programado.';
	@override String get registerMatchResult => 'Registrar Resultado da Partida';
}

// Path: register_match.ui_sheets_register_match_wizard_social_proof_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionPtBr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get captureTheBoardAndScoreTrackClearly => 'Capture o tabuleiro e marque a pontuação com clareza.';
	@override String get boardPhoto => 'Foto do quadro';
	@override String get uploadAPhotoOfTheBoardWithTheScoreTrackClearlyVisible => 'Carregue uma foto do tabuleiro com a trilha de pontuação claramente visível.';
	@override String get boardPhotoProof => 'Prova fotográfica do quadro';
	@override String get selfieWithAllPlayersIncludeTheBoardIfPossible => 'Selfie com todos os jogadores. Inclua o quadro, se possível.';
	@override String get groupPhoto => 'Foto do grupo';
	@override String get uploadBothPhotosToConfirmThisMatchHappenedInPerson => 'Faça upload de ambas as fotos para confirmar que esta partida aconteceu pessoalmente.';
}

// Path: shop.ui_screens_shop_screen
class _TranslationsShopUiScreensShopScreenPtBr extends TranslationsShopUiScreensShopScreenEn {
	_TranslationsShopUiScreensShopScreenPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get supporterPacksLinkedToCommunityTournaments => 'pacotes de torcedor vinculados a torneios comunitários.';
	@override String get plannedThemedProfilePacksFactionCosmeticsAndEvent => 'Planejado: pacotes de perfis temáticos, cosméticos de facção e evento ';
	@override String get roadmapPlaceholder => 'Espaço reservado para roteiro';
	@override String get communityDrivenBundlesForRootPlayers => 'pacotes orientados pela comunidade para ROOT jogadores.';
	@override String get thisAreaWillHostFutureDigitalGoodsCosmeticsAnd => 'Esta área abrigará futuros produtos digitais, cosméticos e ';
	@override String get shopFeaturePlaceholder => 'Espaço reservado para recurso de loja';
}
