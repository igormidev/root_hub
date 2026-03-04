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
	@override late final _TranslationsActivityPtBr activity = _TranslationsActivityPtBr._(_root);
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
	@override String get rootHub => 'Root Hub';
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

// Path: activity
class _TranslationsActivityPtBr extends TranslationsActivityEn {
	_TranslationsActivityPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsActivityUiScreensActivityScreenPtBr ui_screens_activity_screen = _TranslationsActivityUiScreensActivityScreenPtBr._(_root);
	@override late final _TranslationsActivityUiWidgetsActivitySubscribedScheduleCardPtBr ui_widgets_activity_subscribed_schedule_card = _TranslationsActivityUiWidgetsActivitySubscribedScheduleCardPtBr._(_root);
	@override late final _TranslationsActivityUiWidgetsActivityChatCardPtBr ui_widgets_activity_chat_card = _TranslationsActivityUiWidgetsActivityChatCardPtBr._(_root);
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
	@override late final _TranslationsMatchUiScreensMatchActionableInfoRowWidgetPtBr ui_screens_match_actionable_info_row_widget = _TranslationsMatchUiScreensMatchActionableInfoRowWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchJoinSheetLoadingWidgetPtBr ui_screens_match_join_sheet_loading_widget = _TranslationsMatchUiScreensMatchJoinSheetLoadingWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiSheetsMatchShareSheetPtBr ui_sheets_match_share_sheet = _TranslationsMatchUiSheetsMatchShareSheetPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchLocationHeaderImageWidgetPtBr ui_screens_match_location_header_image_widget = _TranslationsMatchUiScreensMatchLocationHeaderImageWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetPtBr ui_screens_match_create_table_location_no_recent_locations_widget = _TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetPtBr._(_root);
	@override late final _TranslationsMatchUiScreensMatchChatScreenPtBr ui_screens_match_chat_screen = _TranslationsMatchUiScreensMatchChatScreenPtBr._(_root);
	@override late final _TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogPtBr ui_dialogs_match_played_match_summary_dialog = _TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogPtBr._(_root);
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
	@override late final _TranslationsRegisterMatchUiDialogsRegisterMatchCancelMatchDialogPtBr ui_dialogs_register_match_cancel_match_dialog = _TranslationsRegisterMatchUiDialogsRegisterMatchCancelMatchDialogPtBr._(_root);
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
	@override String get pickYourFavoriteRootFactionBeforeEnteringTheHub => 'Escolha sua facção favorita de ROOT antes de entrar no hub.';
	@override String get chooseYourFaction => 'Escolha sua facção';
	@override String get iAlreadyHaveAnAccount => 'Eu já tenho uma conta';
}

// Path: auth.auth_onboarding_profile_screen
class _TranslationsAuthAuthOnboardingProfileScreenPtBr extends TranslationsAuthAuthOnboardingProfileScreenEn {
	_TranslationsAuthAuthOnboardingProfileScreenPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get currentLocationUsesYourPhoneCoordinatesXAndYAndIsRequiredToShowNearbyMat => 'A localização atual usa as coordenadas do seu telefone (x e y) e é necessária para mostrar partidas próximas.';
	@override String get yourDisplayNameIsHowOtherPlayersWillSeeYouInRootHub => 'Seu nome de exibição é como os outros jogadores verão você no Root Hub.';
	@override String get setYourHubIdentity => 'Defina a identidade do seu hub';
	@override String get continueButton => 'Continuar';
	@override String get chooseHowYouAppearAndSetYourLocationToFindNearbyMatches => 'Escolha como você aparece e defina sua localização para encontrar partidas próximas.';
	@override String get howYouWillBeCalled => 'Como você será chamado';
	@override String get thisIsHowOtherPlayersWillSeeYourProfileInRootHub => 'É assim que os outros jogadores verão seu perfil no Root Hub.';
	@override String get enterYourDisplayName => 'Digite seu nome de exibição';
	@override String get currentLocation => 'Localização atual';
	@override String get whereDoYouWantToPlay => 'Onde você quer jogar?';
	@override String get locationIsRequiredToShowNearbyTablesChooseDeviceOrSearch => 'A localização é necessária para mostrar partidas próximas. Escolha a localização do dispositivo ou pesquise um lugar.';
	@override String get chooseTheAreaWhereYouWantToFindNearbyPlayers => 'Escolha a área onde você quer encontrar jogadores e mesas por perto.';
	@override String get useMyCurrentDeviceLocation => 'Usar a localização atual do meu dispositivo';
	@override String get capturingCoordinates => 'Capturando coordenadas...';
	@override String get instantlyUseYourPhonesGpsCoordinates => 'Use instantaneamente as coordenadas GPS do seu telefone.';
	@override String get searchForATableLocation => 'Procure um local';
	@override String get openTheSearchAndSelectAnyPlaceYouPrefer => 'Abra a busca e selecione o local de sua preferência.';
	@override String get yourPlayArea => 'Sua área de jogo';
	@override String get findingCityName => 'Buscando nome da cidade...';
	@override String get selectedArea => 'Área selecionada';
	@override String weWillShowMatchesNear({required Object city}) => 'Vamos mostrar partidas perto de ${city}.';
	@override String get weWillShowMatchesNearTheSelectedArea => 'Vamos mostrar partidas perto da área selecionada.';
	@override String get changeLocation => 'Alterar localização';
	@override String get selectedCoordinates => 'Coordenadas selecionadas';
	@override String get searchAreaRadius => 'Raio da área de pesquisa';
	@override String get howFarShouldWeSearchForNearbyPlayersAroundYou => 'Até onde devemos procurar jogadores próximos ao seu redor?';
	@override String get value25KmIsTheRecommendedStartingPoint => '25 km é o ponto de partida recomendado.';
	@override String get disableVpnOrProxyBeforeCapturingLocationWrongCoordinatesMayHideNearby => 'Desative VPN ou proxy antes de capturar a localização. Coordenadas incorretas podem ocultar partidas próximas.';
	@override String get locationSelectedFromSearch => 'Local selecionado na pesquisa.';
	@override String get enableLocationServicesOnYourPhoneAndTryAgain => 'Ative os serviços de localização no seu telefone e tente novamente.';
	@override String get locationPermissionDeniedLocationIsRequiredToContinue => 'Permissão de localização negada. A localização é necessária para continuar.';
	@override String get locationPermissionIsDeniedForeverEnableItInSystemSettingsToContinue => 'A permissão de localização é negada para sempre. Ative-o nas configurações do sistema para continuar.';
	@override String get locationCapturedSuccessfully => 'Localização capturada com sucesso.';
	@override String get unableToCaptureLocationRightNowLocationIsRequiredToContinue => 'Não é possível capturar a localização no momento. A localização é necessária para continuar.';
	@override String get unableToResolveCityNameRightNow => 'Não foi possível identificar o nome da cidade agora.';
	@override String get searchForLocation => 'Procure por localização';
	@override String get searchAndPickOnePlaceWeWillUseItsCoordinatesForNearbyMatches => 'Pesquise e escolha um lugar. Usaremos suas coordenadas para partidas próximas.';
	@override String get useSelectedLocation => 'Usar local selecionado';
	@override String get selectALocationFromTheListBeforeContinuing => 'Selecione um local na lista antes de continuar.';
	@override String get unableToUseTheSelectedLocationCoordinatesRightNow => 'Não é possível usar as coordenadas do local selecionado no momento.';
	@override String get kilometersUnit => 'quilômetros';
}

// Path: auth.auth_loading_screen
class _TranslationsAuthAuthLoadingScreenPtBr extends TranslationsAuthAuthLoadingScreenEn {
	_TranslationsAuthAuthLoadingScreenPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get rootHub => 'ROOT HUB';
}

// Path: auth.auth_login_screen
class _TranslationsAuthAuthLoginScreenPtBr extends TranslationsAuthAuthLoginScreenEn {
	_TranslationsAuthAuthLoginScreenPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get signInToBrowseSchedulesAndJoinTables => 'Entre para ver partidas marcadas e entrar nas partidas.';
	@override String get findYourNextRootMatch => 'Encontre sua próxima\npartida de ROOT';
	@override String get signInWithEmailTitle => 'Entrar com e-mail';
	@override String get signUpWithEmailTitle => 'Criar conta com e-mail';
	@override String get verifyAccountTitle => 'Verificar conta';
	@override String get verifyAccountMessage => 'Enviamos um e-mail de verificação. Confira seu e-mail e digite o código abaixo.';
	@override String get setAccountPasswordTitle => 'Definir senha da conta';
	@override String get resetPasswordTitle => 'Redefinir senha';
	@override String get requestResetDescription => 'Digite o e-mail da sua conta para receber o código de redefinição.';
	@override String get verifyResetCodeTitle => 'Verificar código de redefinição';
	@override String get verifyResetMessage => 'Digite o código de redefinição enviado para o seu e-mail.';
	@override String get setNewPasswordTitle => 'Definir nova senha';
	@override String get emailLabel => 'E-mail';
	@override String get passwordLabel => 'Senha';
	@override String get newPasswordLabel => 'Nova senha';
	@override String get forgotPasswordButton => 'Esqueceu a senha?';
	@override String get signInButton => 'Entrar';
	@override String get signUpButton => 'Criar conta';
	@override String get continueButton => 'Continuar';
	@override String get verifyButton => 'Verificar';
	@override String get requestResetButton => 'Solicitar redefinição de senha';
	@override String get resetPasswordButton => 'Redefinir senha';
	@override String get dontHaveAnAccount => 'Não tem uma conta?';
	@override String get alreadyHaveAnAccount => 'Já tem uma conta?';
	@override String get signUpLink => 'Criar conta';
	@override String get signInLink => 'Entrar';
	@override String get backToSignIn => 'Voltar para entrar';
	@override String get resendCode => 'Não recebeu? Enviar novo código';
	@override String resendCodeIn({required Object time}) => 'Enviar novo código (${time})';
	@override String get passwordRuleMinLength => 'Pelo menos 8 caracteres';
	@override String get passwordRuleUppercase => 'Contém pelo menos uma letra maiúscula';
	@override String get passwordRuleLowercase => 'Contém pelo menos uma letra minúscula';
	@override String get passwordRuleNumber => 'Contém pelo menos um número';
	@override late final _TranslationsAuthAuthLoginScreenErrorsPtBr errors = _TranslationsAuthAuthLoginScreenErrorsPtBr._(_root);
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
	@override String get shop => 'Loja';
	@override String get match => 'Partidas';
	@override String get activity => 'Atividade';
	@override String get home => 'Home';
	@override String get rootHub => 'ROOT HUB';
	@override String get chooseFromGallery => 'Escolha na Galeria';
	@override String get takePhoto => 'Tirar foto';
	@override String get cancel => 'Cancelar';
	@override String get chooseFromLibrary => 'Escolha na biblioteca';
	@override String get takePhoto2 => 'Tirar foto';
	@override String get changeProfilePhoto => 'Alterar foto do perfil';
	@override String get allowCameraAndPhotoPermissionsInSystemSettingsAndTryAgain => 'Permita permissões de câmera e foto nas configurações do sistema e tente novamente.';
	@override String get unableToAccessCameraOrGallery => 'Não foi possível acessar a câmera ou a galeria';
	@override String get rootPlayer => 'Jogador Root';
	@override String welcomeBack({required Object displayName}) => 'Bem-vindo de volta, ${displayName}';
	@override String get communityDashboardTitle => 'Painel da Comunidade';
	@override String get matchFinderTitle => 'Achar Partidas';
	@override String get activityCenterTitle => 'Central de Atividade';
	@override String get communityDashboardSubtitle => 'Veja o que está acontecendo na comunidade de ROOT.';
	@override String get matchFinderSubtitle => 'Busque partidas perto de você ou marque uma nova com seu grupo local.';
	@override String get activityCenterSubtitle => 'Acompanhe suas mesas ativas e atualizações de chat em um só lugar.';
}

// Path: dashboard.ui_screens_dashboard_faction_editor_screen
class _TranslationsDashboardUiScreensDashboardFactionEditorScreenPtBr extends TranslationsDashboardUiScreensDashboardFactionEditorScreenEn {
	_TranslationsDashboardUiScreensDashboardFactionEditorScreenPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get chooseTheFactionShownInYourProfileAndUsedAsYourDefaultPreference => 'Escolha a facção mostrada em seu perfil e usada como preferência padrão.';
	@override String get changeFavoriteFaction => 'Alterar facção favorita';
	@override String saveFactionButtonLabel({required Object factionName}) => 'Salvar ${factionName}';
}

// Path: dashboard.ui_dialogs_edit_location_dialog
class _TranslationsDashboardUiDialogsEditLocationDialogPtBr extends TranslationsDashboardUiDialogsEditLocationDialogEn {
	_TranslationsDashboardUiDialogsEditLocationDialogPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get save => 'Salvar';
	@override String get cancel => 'Cancelar';
	@override String get updateYourCoordinatesAndTargetSearchRatioForMatchDiscovery => 'Atualize suas coordenadas e o raio de busca para encontrar partidas.';
	@override String get editLocation => 'Editar local';
}

// Path: dashboard.ui_dialogs_edit_display_name_dialog
class _TranslationsDashboardUiDialogsEditDisplayNameDialogPtBr extends TranslationsDashboardUiDialogsEditDisplayNameDialogEn {
	_TranslationsDashboardUiDialogsEditDisplayNameDialogPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get save => 'Salvar';
	@override String get cancel => 'Cancelar';
	@override String get thisIsHowPlayersWillSeeYouAcrossRootHub => 'É assim que os jogadores verão você no Root Hub.';
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
	@override String get yLabel => 'y';
	@override String get ratioLabel => 'raio';
	@override String get theme => 'Tema';
	@override String get themeDescriptionLight => 'O modo claro está ativo';
	@override String get themeDescriptionDark => 'O modo escuro está ativo';
	@override String get lightMode => 'Claro';
	@override String get darkMode => 'Escuro';
	@override String get language => 'Idioma';
	@override String get useDeviceLanguage => 'Usar o idioma do dispositivo';
	@override String get english => 'Inglês';
	@override String get portugueseBrazil => 'Português (Brasil)';
	@override String get spanish => 'Espanhol';
	@override String get french => 'Francês';
	@override String get german => 'Alemão';
}

// Path: activity.ui_screens_activity_screen
class _TranslationsActivityUiScreensActivityScreenPtBr extends TranslationsActivityUiScreensActivityScreenEn {
	_TranslationsActivityUiScreensActivityScreenPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get myScheduledTablesTitle => 'Minhas Mesas Agendadas';
	@override String get tablesYouSubscribedToThatAreStillWithinTheActiveWindow => 'Mesas em que você se inscreveu e que ainda não começaram ou começaram há menos de 6 horas.';
	@override String get noActiveSchedules => 'Nenhuma inscrição ativa';
	@override String get whenYouJoinATableItWillAppearHereAsASwipeableCard => 'Quando você entrar em uma mesa, ela aparecerá aqui em cartões deslizáveis.';
	@override String get activeChatsTitle => 'Chats Ativos';
	@override String get chatsForUpcomingOrRecentlyStartedTablesOrderedByUnreadMessages => 'Chats de mesas futuras ou que começaram recentemente, ordenados por mensagens não lidas.';
	@override String get noActiveChats => 'Nenhum chat ativo';
	@override String get openAnyTableChatAndItWillBeTrackedHereEvenWithoutASubscription => 'Abra qualquer chat de mesa e ele será acompanhado aqui, mesmo sem inscrição.';
	@override String get completedMatchesTitle => 'Chats de Partidas Concluídas';
	@override String get latestEightCompletedOrArchivedMatchChatsYouParticipatedIn => 'Últimos 8 chats de partidas que já aconteceram.';
	@override String get noCompletedChats => 'Nenhum chat concluído ainda';
	@override String get onceMatchesFinishTheirChatsWillStayAvailableHere => 'Quando as partidas terminarem, os chats continuarão disponíveis nesta seção.';
}

// Path: activity.ui_widgets_activity_subscribed_schedule_card
class _TranslationsActivityUiWidgetsActivitySubscribedScheduleCardPtBr extends TranslationsActivityUiWidgetsActivitySubscribedScheduleCardEn {
	_TranslationsActivityUiWidgetsActivitySubscribedScheduleCardPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get unknownLocation => 'Local desconhecido';
	@override String get selected => 'Selecionado';
	@override String get alreadyStarted => 'Já começou';
	@override String get notStartedYet => 'Ainda não começou';
	@override String playersLabel({required Object minPlayers, required Object maxPlayers}) => '${minPlayers}-${maxPlayers} jogadores';
	@override String get openChatHint => 'Toque no card para abrir o chat';
}

// Path: activity.ui_widgets_activity_chat_card
class _TranslationsActivityUiWidgetsActivityChatCardPtBr extends TranslationsActivityUiWidgetsActivityChatCardEn {
	_TranslationsActivityUiWidgetsActivityChatCardPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get ended => 'Encerrada';
	@override String get started => 'Iniciada';
	@override String get upcoming => 'Próxima';
	@override String senderMessage({required Object sender, required Object message}) => '${sender}: ${message}';
	@override String get newMessage => 'Nova mensagem';
	@override String get photoShared => 'Foto compartilhada';
	@override String get systemUpdate => 'Atualização do sistema';
	@override String get noMessagesYet => 'Sem mensagens ainda';
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
	@override String get yourPersonalFactionPerformanceAndMatchProfile => 'Suas estatísticas pessoais de facção com base apenas nas facções que você jogou.';
	@override String get myStats => 'Minhas estatísticas';
	@override String get factionPerformanceFromAllPlayedMatchesInRootHub => 'Desempenho das facções em todas as partidas jogadas no Root Hub.';
	@override String get communityStats => 'Estatísticas da comunidade';
	@override String get noCommunityStatsYet => 'Ainda não há estatísticas da comunidade';
	@override String get communityStatsWillAppearAfterCompletedMatches => 'Assim que os jogadores registrarem partidas concluídas, esta seção será preenchida com tendências das facções.';
	@override String get noPersonalStatsYet => 'Ainda não há estatísticas pessoais';
	@override String get registerYourFirstMatchToStartYourDashboard => 'Jogue e registre sua primeira partida para começar seu painel pessoal.';
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
	@override String get loadingTableDetails => 'Carregando detalhes da partida...';
}

// Path: match.ui_sheets_match_table_info_sheet
class _TranslationsMatchUiSheetsMatchTableInfoSheetPtBr extends TranslationsMatchUiSheetsMatchTableInfoSheetEn {
	_TranslationsMatchUiSheetsMatchTableInfoSheetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get remove => 'Remover';
	@override String get cancel => 'Cancelar';
	@override String get rejoinIfSeatsAreStillAvailable => 'volte se ainda houver vagas disponíveis.';
	@override String removePlayerDescription({required Object playerName, required Object rejoinInstruction}) => '${playerName} será removido da partida e precisará ${rejoinInstruction}';
	@override String removePlayerTitle({required Object playerName}) => 'Remover ${playerName}?';
	@override String get cancel2 => 'Cancelar';
	@override String get selectAPlayerToRemoveFromTheTable => 'Selecione um jogador para remover da partida.';
	@override String get removeAPlayer => 'Remover um jogador';
	@override String get leave => 'Sair';
	@override String get cancel3 => 'Cancelar';
	@override String get playersListYouCanRejoinLaterIfSeatsAreStillAvailable => 'lista de jogadores. Você poderá voltar mais tarde se ainda houver vagas disponíveis.';
	@override String get youWillBeUnsubscribedFromThisMatchAndRemovedFromThe => 'Sua inscrição nesta partida será cancelada e removida do';
	@override String copiedLabel({required Object label}) => '${label} copiado';
	@override String ratingsCount({required Object count}) => '${count} avaliações';
	@override String ratingValue({required Object value}) => 'Nota ${value}';
	@override String get leaveThisTable => 'Sair desta partida?';
	@override String get unableToLoadTableDetails => 'Não foi possível carregar os detalhes da partida.';
	@override String get tableNotFound => 'Partida não encontrada';
}

// Path: match.ui_sheets_match_table_info_content_widget
class _TranslationsMatchUiSheetsMatchTableInfoContentWidgetPtBr extends TranslationsMatchUiSheetsMatchTableInfoContentWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoContentWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get noPlayersHaveJoinedThisTableYet => 'Nenhum jogador se juntou a esta partida ainda.';
	@override String get theseAreTheCurrentPlayersThatWillParticipate => 'Estes são os jogadores atuais que participarão.';
	@override String get noPlayersSubscribedYet => 'Nenhum jogador inscrito ainda.';
	@override String createdAtValue({required Object value}) => 'Criada em: ${value}';
	@override String get playersInThisMatch => 'Jogadores nesta partida';
	@override String playersRange({required Object minPlayers, required Object maxPlayers}) => '${minPlayers}-${maxPlayers} jogadores';
	@override String seatsCount({required Object subscribedPlayersCount, required Object maxPlayers}) => '${subscribedPlayersCount}/${maxPlayers} vagas';
	@override String get unknownHost => 'Anfitrião desconhecido';
	@override String get tableDetails => 'Detalhes da partida';
	@override String statusValue({required Object value}) => 'Status: ${value}';
	@override String get statusScheduled => 'Agendada';
	@override String get statusNotPlayed => 'Não jogada';
	@override String get statusPlayed => 'Jogada';
	@override String get thisMatchWasMarkedAsNotPlayed => 'Esta partida foi marcada como não jogada.';
	@override String reasonValue({required Object value}) => 'Motivo: ${value}';
	@override String markedByValue({required Object value}) => 'Marcado por: ${value}';
	@override String detailsValue({required Object value}) => 'Detalhes: ${value}';
	@override String get reasonNotEnoughPlayers => 'Jogadores insuficientes';
	@override String get reasonHostUnavailable => 'Anfitrião indisponível';
	@override String get reasonNoGameCopyAvailable => 'Sem cópia do jogo disponível';
	@override String get reasonVenueIssue => 'Problema no local';
	@override String get reasonPlayerNoShow => 'Jogador não compareceu';
	@override String get reasonWeatherOrEmergency => 'Clima ou emergência';
	@override String get reasonExpiredWithoutResult => 'Expirada sem resultado após 24 horas';
	@override String get reasonOther => 'Outro';
	@override String get reasonNotProvided => 'Não informado';
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
	@override String dateIsTooFarDescription({required Object maxScheduleDays}) => 'O horário agendado não pode ficar mais de ${maxScheduleDays} dias no futuro.';
	@override String get theScheduledTimeCannotBeMoreThan => 'O horário agendado não pode ser superior';
	@override String get dateIsTooFar => 'A data está muito longe';
	@override String timeIsTooSoonDescription({required Object minScheduleMinutes}) => 'O horário agendado deve ser pelo menos ${minScheduleMinutes} minutos no futuro.';
	@override String get theScheduledTimeMustBeAtLeast => 'O horário agendado deve ser pelo menos';
	@override String get timeIsTooSoon => 'O tempo é muito cedo';
	@override String get youCannotSetTheMaximumBelowThatNumber => 'Você não pode definir o máximo abaixo desse número.';
	@override String tooManyPlayersSubscribedDescription({required Object currentSubscriberCount}) => 'Já existem ${currentSubscriberCount} jogadores inscritos. Você não pode definir o máximo abaixo desse número.';
	@override String get tooManyPlayersSubscribed => 'Muitos jogadores inscritos';
	@override String get withMinimumNotGreaterThanMaximum => 'com mínimo não maior que máximo.';
	@override String get playersRangeMustBeBetween2And6 => 'O intervalo dos jogadores deve estar entre 2 e 6,';
	@override String get invalidPlayersRange => 'Intervalo de jogadores inválido';
	@override String get pleaseAddATitleForYourTable => 'Adicione um título para sua partida.';
	@override String get titleRequired => 'Título obrigatório';
	@override String get unableToLoadTableDetails => 'Não foi possível carregar os detalhes da partida.';
	@override String get tableNotFound => 'Partida não encontrada';
}

// Path: match.ui_sheets_match_table_info_loading_widget
class _TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetPtBr extends TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get loadingTableDetails => 'Carregando detalhes da partida...';
}

// Path: match.ui_sheets_match_edit_table_form_widget
class _TranslationsMatchUiSheetsMatchEditTableFormWidgetPtBr extends TranslationsMatchUiSheetsMatchEditTableFormWidgetEn {
	_TranslationsMatchUiSheetsMatchEditTableFormWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get saveChanges => 'Salvar alterações';
	@override String get saving => 'Salvando...';
	@override String get cancel => 'Cancelar';
	@override String scheduleDescription({required Object maxScheduleDays}) => 'Deve ser pelo menos 10 minutos a partir de agora, até ${maxScheduleDays} dias à frente.';
	@override String get mustBeAtLeast10MinutesFromNowUpTo => 'Deve ser pelo menos 10 minutos a partir de agora, até';
	@override String get schedule => 'Agendar';
	@override String get maximum => 'Máximo';
	@override String get minimum => 'Mínimo';
	@override String playersAlreadySubscribedCount({required Object count}) => '${count} jogador(es) já inscrito(s).';
	@override String get setBetween2And6Players => 'Defina entre 2 e 6 jogadores.';
	@override String get playersRange => 'Faixa de jogadores';
	@override String get exampleWeHaveMarauderExpansion => 'Exemplo: Temos a expansão Marauder.';
	@override String get extraDetailsLikeExpansionsParkingTipsEtc => 'Detalhes extras como expansões, dicas de estacionamento, etc.';
	@override String get descriptionOptional => 'Descrição (opcional)';
	@override String get exampleSaturdayRootAtLanternCaf => 'Exemplo: Sábado de ROOT no Lantern Café';
	@override String get aShortNameSoPlayersCanFindYourTable => 'Um nome curto para que os jogadores possam encontrar sua partida.';
	@override String get tableTitle => 'Título da partida';
	@override String get newPlayersCanStillJoinThisTable => 'Novos jogadores ainda podem entrar nesta partida.';
	@override String get newPlayersCannotJoinThisTable => 'Novos jogadores não podem entrar nesta partida.';
	@override String get closeSubscriptions => 'Fechar inscrições';
	@override String get editDetails => 'Editar detalhes';
	@override String get editTable => 'Editar partida';
}

// Path: match.ui_sheets_match_table_info_bottom_actions_widget
class _TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetPtBr extends TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get removePlayer => 'Remover jogador';
	@override String get removing => 'Removendo...';
	@override String get leaveTable => 'Sair da partida';
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
	@override String get tapALocationToSelectItPreviouslySelectedLocationsAreSavedHereForFasterHo => 'Toque em um local para selecioná-lo. Locais já escolhidos ficam salvos aqui para criar partidas mais rápido.';
	@override String get searchLocationGooglePlaces => 'Local de pesquisa (Google Places)';
	@override String get chooseTableLocation => 'Escolha o local da partida';
	@override String get chooseOneLocationFromTheListBeforeCreatingTheTable => 'Escolha um local da lista antes de criar a partida.';
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
	@override String copiedLabel({required Object label}) => '${label} copiado';
	@override String get invalidUrlFormat => 'Formato de URL inválido.';
	@override String get unableToOpenSharedMatch => 'Não foi possível abrir esta partida compartilhada agora.';
	@override String get unableToShareThisMatch => 'Não foi possível compartilhar esta partida agora.';
	@override String ratingsCount({required Object count}) => '${count} avaliações';
	@override String ratingValue({required Object value}) => 'Nota ${value}';
	@override String shareMessage({required Object location, required Object hour, required Object day, required Object link}) => 'O Root Hub conecta pessoas para jogar ROOT presencialmente em locais públicos. Entre nesta partida em ${location}, às ${hour}, no dia ${day}: ${link}';
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
	@override String get hostTable => 'Marcar Partida';
	@override String get reportResult => 'Registrar jogo';
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
	@override String get onlyTablesThatDidNotStartMoreThan2HoursAgoAreListed => 'Somente as partidas que não foram iniciadas há mais de 2 horas serão listadas.';
	@override String get nearbyMatchTables => 'Partidas próximas';
	@override String get matchFinder => 'Achar Partidas';
	@override String get setProfileLocation => 'Defina a localização do perfil';
	@override String searchAreaKm({required Object ratioKm}) => '${ratioKm} km de raio';
}

// Path: match.ui_screens_match_no_matches_state_widget
class _TranslationsMatchUiScreensMatchNoMatchesStateWidgetPtBr extends TranslationsMatchUiScreensMatchNoMatchesStateWidgetEn {
	_TranslationsMatchUiScreensMatchNoMatchesStateWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get hostTheFirstTable => 'Marque a primeira partida';
	@override String get beTheFirstToStartOneHostANewTableSoNearbyPlayersCanSubscribe => 'Seja o primeiro a começar. Marque uma nova partida para que jogadores próximos possam se inscrever.';
	@override String get noTablesInYourAreaYet => 'Ainda não há partidas na sua região';
}

// Path: match.ui_screens_match_time_status_chip_widget
class _TranslationsMatchUiScreensMatchTimeStatusChipWidgetPtBr extends TranslationsMatchUiScreensMatchTimeStatusChipWidgetEn {
	_TranslationsMatchUiScreensMatchTimeStatusChipWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get remainingTimeUntilTheMatchStarts => 'Tempo restante até o início da partida.';
	@override String get thisMatchAlreadyStartedRecentlyStartedTablesStayVisibleForAShortPeriod => 'Esta partida já começou. As partidas iniciadas recentemente permanecem visíveis por um curto período.';
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
	@override String get noIAmOnlyHostingThisTable => 'Não, estou apenas hospedando esta partida';
	@override String get yesIWillPlayThisMatch => 'Sim, vou jogar esta partida';
	@override String get ifYouAreAVenueBoardGameClubOrOrganizerBringingPlayersTogetherButNotJoini => 'Se você é um local, clube de jogos de tabuleiro ou organizador que reúne jogadores, mas não participa da partida, deixe esta opção desmarcada.';
	@override String get willYouTheHostPlay => 'Você, o anfitrião, vai jogar?';
	@override String get pickTheDayAndStartHourChooseATimeYouCanReliablyShowUp => 'Escolha o dia e a hora de início. Escolha um horário em que você possa aparecer com segurança.';
	@override String get schedule => 'Agendar';
	@override String get maximum => 'Máximo';
	@override String get minimum => 'Mínimo';
	@override String get defaultIs34YouCanSetBetween2And6Players => 'O padrão é 3-4. Você pode definir entre 2 e 6 jogadores.';
	@override String get playersRange => 'Faixa de jogadores';
	@override String get exampleWeHaveMarauderExpansionAndSpareSleeves => 'Exemplo: Temos expansão Marauder e protetores sobressalentes.';
	@override String get addExtraDetailsLikeExpansionsAvailableParkingTipsOrReferencePoints => 'Adicione detalhes extras, como expansões disponíveis, dicas de estacionamento ou pontos de referência.';
	@override String get descriptionOptional => 'Descrição (opcional)';
	@override String get exampleSaturdayRootAtLanternCaf => 'Exemplo: Sábado de ROOT no Lantern Café';
	@override String get thisCanBeAnythingThatHelpsIdentifyTheTableLikeAPlaceNameOrEventStyle => 'Pode ser qualquer coisa que ajude a identificar a partida, como o nome de um local ou o estilo do evento.';
	@override String get tableTitle => 'Título da partida';
	@override String get setTableDetailsFirstOnTheNextScreenYouWillChooseTheLocation => 'Defina os detalhes da partida primeiro. Na próxima tela você escolherá o local.';
	@override String get hostANewTable => 'Marcar nova partida';
	@override String get selectTheStartHourForThisTableBeforeContinuing => 'Selecione a hora de início desta partida antes de continuar.';
	@override String get startHourRequired => 'Hora de início obrigatória';
	@override String get youCannotSelectADayInThePast => 'Você não pode selecionar um dia no passado.';
	@override String get invalidDate => 'Data inválida';
	@override String get selectTheDayForThisTableBeforeContinuing => 'Selecione o dia para esta partida antes de continuar.';
	@override String get dayRequired => 'Dia necessário';
	@override String get addATitleSoPlayersCanQuicklyIdentifyYourTableExampleDowntownCafNight => 'Adicione um título para que os jogadores possam identificar rapidamente sua partida. Exemplo: "Noite do Café no Centro".';
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
	@override String get loadingNearbyTables => 'Carregando partidas próximas...';
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
	@override String createdAtValue({required Object value}) => 'Criada em: ${value}';
	@override String get youCanBeTheFirstPlayerToLockThisTableIn => 'Você pode ser o primeiro jogador a bloquear esta partida.';
	@override String get theseAreTheCurrentPlayersThatWillParticipate => 'Estes são os jogadores atuais que participarão.';
	@override String get noPlayersSubscribedYet => 'Nenhum jogador inscrito ainda.';
	@override String get playersInThisMatch => 'Jogadores nesta partida';
	@override String playersRange({required Object minPlayers, required Object maxPlayers}) => '${minPlayers}-${maxPlayers} jogadores';
	@override String seatsCount({required Object subscribedPlayersCount, required Object maxPlayers}) => '${subscribedPlayersCount}/${maxPlayers} vagas';
	@override String get unknownHost => 'Anfitrião desconhecido';
	@override String get seeTableChat => 'Ver bate-papo à partida';
	@override String get newPlayersCannotJoinAtThisTime => 'Novos jogadores não podem entrar neste momento.';
	@override String get theHostHasClosedSubscriptionsForThisTable => 'O anfitrião fechou as inscrições desta partida.';
	@override String get confirmTableSubscription => 'Confirmar inscrição na partida';
}

// Path: match.ui_screens_match_table_card_widget
class _TranslationsMatchUiScreensMatchTableCardWidgetPtBr extends TranslationsMatchUiScreensMatchTableCardWidgetEn {
	_TranslationsMatchUiScreensMatchTableCardWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get subscribed => 'Inscrito';
	@override String get tapCardToOpenChat => 'Toque no cartão para abrir o bate-papo';
	@override String get shareThisMatch => 'Compartilhar partida';
	@override String get share => 'Compartilhar';
	@override String get showMore => 'Ver mais';
	@override String get subscriptionsClosed => 'Assinaturas encerradas';
	@override String get openFullLocationDetails => 'Abra detalhes completos do local';
	@override String playersRange({required Object minPlayers, required Object maxPlayers}) => '${minPlayers}-${maxPlayers} jogadores';
	@override String playersRangeTooltip({required Object minPlayers, required Object maxPlayers}) => 'Esta partida pode começar com no mínimo ${minPlayers} jogadores e aceita até ${maxPlayers} jogadores.';
	@override String get places => 'vagas';
	@override String get place => 'vaga';
	@override String get s => 'é';
	@override String get joining => 'Entrando...';
	@override String get closed => 'Encerrada';
	@override String get tableFull => 'Partida lotada';
	@override String get joinTable => 'Entrar na Partida';
	@override String get unknownLocation => 'Local não informado';
	@override String get addressUnavailable => 'Endereço indisponível';
	@override String get player => 'jogador';
	@override String get players => 'jogadores';
	@override String subscriptionTooltip({required Object subscribedPlayersCount, required Object playersWord, required Object remainingSeats, required Object placesWord}) => '${subscribedPlayersCount} ${playersWord} inscritos e ${remainingSeats} ${placesWord} restantes para fechar a partida.';
}

// Path: match.ui_screens_match_actionable_info_row_widget
class _TranslationsMatchUiScreensMatchActionableInfoRowWidgetPtBr extends TranslationsMatchUiScreensMatchActionableInfoRowWidgetEn {
	_TranslationsMatchUiScreensMatchActionableInfoRowWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String copyLabel({required Object label}) => 'Copiar ${label}';
	@override String openLabel({required Object label}) => 'Abrir ${label}';
}

// Path: match.ui_screens_match_join_sheet_loading_widget
class _TranslationsMatchUiScreensMatchJoinSheetLoadingWidgetPtBr extends TranslationsMatchUiScreensMatchJoinSheetLoadingWidgetEn {
	_TranslationsMatchUiScreensMatchJoinSheetLoadingWidgetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String loadingTableDetailsForTitle({required Object tableTitle}) => 'Carregando detalhes da partida "${tableTitle}"...';
}

// Path: match.ui_sheets_match_share_sheet
class _TranslationsMatchUiSheetsMatchShareSheetPtBr extends TranslationsMatchUiSheetsMatchShareSheetEn {
	_TranslationsMatchUiSheetsMatchShareSheetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get shareThisMatch => 'Compartilhar esta partida';
	@override String get copyOrShareToInvitePlayers => 'Copie o link ou compartilhe direto para convidar jogadores.';
	@override String get copyLink => 'Copiar link';
	@override String get copied => 'Copiado';
	@override String get orDivider => 'OU';
	@override String get shareInWhatsApp => 'Compartilhar no WhatsApp';
	@override String get shareInMessenger => 'Compartilhar no Messenger';
	@override String get shareInTelegram => 'Compartilhar no Telegram';
	@override String get chooseWhereToShare => 'Escolher onde compartilhar';
	@override String get copyFailed => 'Não foi possível copiar o link.';
	@override String get unableToOpenWhatsApp => 'Não foi possível abrir o WhatsApp agora.';
	@override String get unableToOpenTelegram => 'Não foi possível abrir o Telegram agora.';
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
	@override String imageCompressionPrompt({required Object selectedImageMb, required Object maxAllowedMb}) => 'Esta imagem tem ${selectedImageMb}MB, mas o limite é ${maxAllowedMb}MB. Comprimir automaticamente antes de enviar?';
	@override String get compress => 'Compressa';
	@override String get cancel2 => 'Cancelar';
	@override String get imageIsTooLarge => 'A imagem é muito grande';
	@override String get subscribed => 'Inscrito';
	@override String get unableToResolveYourAccountInformation => 'Não foi possível resolver as informações da sua conta.';
	@override String get noMessagesYet => 'Sem mensagens ainda';
	@override String get typeAMessage => 'Digite uma mensagem';
	@override String get tableInfo => 'Informações da partida';
	@override String get playedMatchInfo => 'Informações da partida finalizada';
	@override String get editTable => 'Editar partida';
}

// Path: match.ui_dialogs_match_played_match_summary_dialog
class _TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogPtBr extends TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogEn {
	_TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get completedMatchReport => 'Relatório da Partida Concluída';
	@override String get winner => 'Vencedor';
	@override String get notAvailable => 'Não disponível';
	@override String startedAtLabel({required Object value}) => 'Início: ${value}';
	@override String durationLabel({required Object value}) => 'Duração: ${value}';
	@override String scheduledAtLabel({required Object value}) => 'Agendada: ${value}';
	@override String get matchProofs => 'Provas da Partida';
	@override String get players => 'Jogadores';
	@override String get domination => 'Dominação';
	@override String scoreLabel({required Object value}) => '${value} pts';
	@override String get close => 'Fechar';
	@override String hoursMinutes({required Object hours, required Object minutes}) => '${hours}h ${minutes}m';
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
	@override String get dominance => 'Dominância';
	@override String get totalPoints30 => 'Total de pontos (30)';
	@override String stepSelectTheWinner({required Object stepNumber}) => '${stepNumber}) Selecione o vencedor';
	@override String get dominanceMeansTheWinnerCompletedADominanceCardObjectiveInsteadOfWinningB => 'Dominância significa que o vencedor completou um objetivo da carta de Dominância em vez de vencer por pontos.';
	@override String get totalPointsMeansTheWinnerReached30VictoryPointsOnTheScoreTrack => 'O total de pontos significa que o vencedor alcançou 30 pontos de vitória na trilha de pontuação.';
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
	@override String stepEstimatedMatchDuration({required Object stepNumber}) => '${stepNumber}) Duração estimada da partida';
	@override String get setTheEstimatedDurationAdjustIn15MinuteStepsMax8Hours => 'Defina a duração estimada. Ajuste em etapas de 15 minutos (máximo de 8 horas).';
	@override String get changeTime => 'Alterar horário';
	@override String stepMatchStartedAt({required Object stepNumber}) => '${stepNumber}) Partida iniciada às';
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
	@override String get cancelMatch => 'Cancelar partida';
	@override String get registerMatchResult => 'Registrar resultado da partida';
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
	@override String noPlayersFoundForQuery({required Object query}) => 'Nenhum jogador encontrado para "${query}".';
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
	@override String get dominanceAttempt => 'Tentativa de dominância';
	@override String get failedNoPoints => 'Falhou (sem pontos)';
	@override String get winnerByDominance => 'Vencedor por dominância';
	@override String get winnerByPoints => 'Vencedor por pontos';
	@override String get failedDominance => 'Dominância falhado';
	@override String stepPointsByPlayer({required Object stepNumber}) => '${stepNumber}) Pontos por jogador';
	@override String get points2 => 'Pontos';
	@override String get noPoints => 'Sem pontos';
	@override String get winner => 'Ganhador';
	@override String get failedDominanceAlwaysCountsAsNoPoints => 'O dominância falhado sempre conta como nenhum ponto.';
	@override String get forEachNonWinnerSetPointsOrMarkFailedDominanceAttempt => 'Para cada não vencedor, defina pontos ou marque uma tentativa de dominância fracassada.';
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
	@override String get noPendingMatches => 'Nenhuma partida pendente';
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
	@override String get youCanRegisterThisMatchFrom2HoursBeforeItsScheduledStart => 'Você pode registrar esta partida 2 horas antes do início programado.';
	@override String get resultRegistrationNotAvailableYet => 'Registro de resultado ainda não disponível';
	@override String tryAgainAfter({required Object dateTimeLabel}) => 'Tente novamente depois de ${dateTimeLabel}.';
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
	@override String get matchNotFound => 'Partida não encontrada';
	@override String get unableToLoadThisMatchReportFlow2 => 'Não foi possível carregar este fluxo de relatório de partida.';
	@override String get invalidMatch => 'Partida inválida';
	@override String get continueButton => 'Continuar';
	@override String participantMustHavePointsBetween0And29({required Object participantName}) => '${participantName} deve ter entre 0 e 29 pontos.';
	@override String enterValidPointsForParticipantOrMarkFailedDominance({required Object participantName}) => 'Insira pontos válidos para ${participantName} ou marque dominância falhada.';
	@override String selectFactionForParticipantBeforeContinuing({required Object participantName}) => 'Selecione uma facção para ${participantName} antes de continuar.';
	@override String factionWasSelectedMoreThanOnceEachFactionCanOnlyBeSelectedOnce({required Object factionName}) => '${factionName} foi selecionada mais de uma vez. Cada facção só pode ser selecionada uma vez.';
}

// Path: register_match.ui_sheets_register_match_wizard_review_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionPtBr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get boardPhoto => 'Foto do quadro';
	@override String estimatedDurationValue({required Object value}) => 'Duração estimada: ${value}';
	@override String get groupPhoto => 'Foto do grupo';
	@override String matchStartedValue({required Object value}) => 'Partida iniciada: ${value}';
	@override String get socialProof => 'Prova social';
	@override String get ranking => 'Classificação';
	@override String stepReviewAndSubmit({required Object stepNumber}) => '${stepNumber}) Revisar e enviar';
	@override String winnerMethodValue({required Object value}) => 'Método de vitória: ${value}';
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
	@override String pendingMatchesCount({required Object count}) => '${count} pendentes';
	@override String get registerMatchResult => 'Registrar Resultado da Partida';
}

// Path: register_match.ui_sheets_register_match_wizard_social_proof_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionPtBr extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get captureTheBoardAndScoreTrackClearly => 'Tire uma foto nítida do tabuleiro e da trilha de pontos.';
	@override String get boardPhoto => 'Foto do quadro';
	@override String get uploadAPhotoOfTheBoardWithTheScoreTrackClearlyVisible => 'Carregue uma foto do tabuleiro com a trilha de pontuação claramente visível.';
	@override String get boardPhotoProof => 'Comprovação com foto do tabuleiro';
	@override String stepSocialProof({required Object stepNumber}) => '${stepNumber}) Prova social';
	@override String get selfieWithAllPlayersIncludeTheBoardIfPossible => 'Selfie com todos os jogadores. Inclua o quadro, se possível.';
	@override String get groupPhoto => 'Foto do grupo';
	@override String get uploadBothPhotosToConfirmThisMatchHappenedInPerson => 'Faça upload de ambas as fotos para confirmar que esta partida aconteceu pessoalmente.';
}

// Path: register_match.ui_dialogs_register_match_cancel_match_dialog
class _TranslationsRegisterMatchUiDialogsRegisterMatchCancelMatchDialogPtBr extends TranslationsRegisterMatchUiDialogsRegisterMatchCancelMatchDialogEn {
	_TranslationsRegisterMatchUiDialogsRegisterMatchCancelMatchDialogPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get cancelMatchTitle => 'Cancelar partida';
	@override String get cancelMatchDescription => 'Marque esta partida agendada como não jogada e compartilhe o motivo com os participantes.';
	@override String get reasonLabel => 'Motivo';
	@override String get optionalReasonDetailsLabel => 'Detalhes opcionais';
	@override String get optionalReasonDetailsHint => 'Compartilhe qualquer contexto para os jogadores.';
	@override String get detailsRequiredForOtherReason => 'Adicione detalhes ao selecionar "Outro".';
	@override String get keepMatch => 'Manter partida';
	@override String get confirmCancelMatch => 'Confirmar cancelamento';
	@override String get reasonNotEnoughPlayers => 'Jogadores insuficientes';
	@override String get reasonHostUnavailable => 'Anfitrião indisponível';
	@override String get reasonNoGameCopyAvailable => 'Sem cópia do jogo disponível';
	@override String get reasonVenueIssue => 'Problema no local';
	@override String get reasonPlayerNoShow => 'Jogador não compareceu';
	@override String get reasonWeatherOrEmergency => 'Clima ou emergência';
	@override String get reasonExpiredWithoutResult => 'Expirada sem resultado após 24 horas';
	@override String get reasonOther => 'Outro';
}

// Path: shop.ui_screens_shop_screen
class _TranslationsShopUiScreensShopScreenPtBr extends TranslationsShopUiScreensShopScreenEn {
	_TranslationsShopUiScreensShopScreenPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get shopHeaderTitle => 'Monte sua coleção de Root';
	@override String get shopHeaderDescription => 'Compre o jogo base e expansões com detalhes localizados da caixa e atalhos rápidos para marketplaces.';
	@override String get whereToBuy => 'Onde comprar';
	@override String buyAt({required Object store}) => 'Comprar na ${store}';
	@override String get invalidStoreUrl => 'Este link de loja é inválido.';
	@override String get unableToOpenStoreUrl => 'Não foi possível abrir este link de loja agora.';
	@override String get closeGallery => 'Fechar galeria';
	@override String get noProductsAvailable => 'Ainda não há produtos disponíveis para este idioma.';
}

// Path: auth.auth_login_screen.errors
class _TranslationsAuthAuthLoginScreenErrorsPtBr extends TranslationsAuthAuthLoginScreenErrorsEn {
	_TranslationsAuthAuthLoginScreenErrorsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get invalidEmail => 'E-mail inválido.';
	@override String get invalidCredentials => 'E-mail ou senha inválidos. Confira os dados e tente novamente.';
	@override String get tooManyLoginAttempts => 'Muitas tentativas de login. Tente novamente mais tarde.';
	@override String get loginFailed => 'Não foi possível entrar agora. Tente novamente.';
	@override String get tooManyRegistrationAttempts => 'Muitas tentativas de cadastro. Tente novamente mais tarde.';
	@override String get verificationCodeExpired => 'O código de verificação expirou. Solicite um novo.';
	@override String get invalidVerificationCode => 'Código de verificação inválido. Confira e tente novamente.';
	@override String get passwordPolicyViolation => 'A senha não atende aos requisitos. Escolha uma senha diferente.';
	@override String get registrationFailed => 'Não foi possível concluir o cadastro agora. Tente novamente mais tarde.';
	@override String get tooManyPasswordResetAttempts => 'Muitas tentativas de redefinição de senha. Tente novamente mais tarde.';
	@override String get passwordResetFailed => 'Não foi possível redefinir a senha agora. Tente novamente mais tarde.';
	@override String get networkUnavailable => 'Sem conexão com o servidor. Verifique sua internet e tente novamente.';
	@override String get unexpected => 'Ocorreu um erro inesperado. Tente novamente.';
}
