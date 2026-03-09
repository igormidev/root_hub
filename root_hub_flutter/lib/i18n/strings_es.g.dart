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
	@override late final _TranslationsActivityEs activity = _TranslationsActivityEs._(_root);
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
	@override String get rootHub => 'Root Hub';
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

// Path: activity
class _TranslationsActivityEs extends TranslationsActivityEn {
	_TranslationsActivityEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsActivityUiScreensActivityScreenEs ui_screens_activity_screen = _TranslationsActivityUiScreensActivityScreenEs._(_root);
	@override late final _TranslationsActivityUiScreensChatScreenEs ui_screens_chat_screen = _TranslationsActivityUiScreensChatScreenEs._(_root);
	@override late final _TranslationsActivityUiWidgetsActivitySubscribedScheduleCardEs ui_widgets_activity_subscribed_schedule_card = _TranslationsActivityUiWidgetsActivitySubscribedScheduleCardEs._(_root);
	@override late final _TranslationsActivityUiWidgetsActivityChatCardEs ui_widgets_activity_chat_card = _TranslationsActivityUiWidgetsActivityChatCardEs._(_root);
	@override late final _TranslationsActivityUiWidgetsChatMatchListTileWidgetEs ui_widgets_chat_match_list_tile_widget = _TranslationsActivityUiWidgetsChatMatchListTileWidgetEs._(_root);
}

// Path: home
class _TranslationsHomeEs extends TranslationsHomeEn {
	_TranslationsHomeEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeUiSectionsHomeStatsSectionEs ui_sections_home_stats_section = _TranslationsHomeUiSectionsHomeStatsSectionEs._(_root);
	@override late final _TranslationsHomeUiScreensHomeScreenEs ui_screens_home_screen = _TranslationsHomeUiScreensHomeScreenEs._(_root);
	@override late final _TranslationsHomeUiSectionsHomeCommunityToolsSectionEs ui_sections_home_community_tools_section = _TranslationsHomeUiSectionsHomeCommunityToolsSectionEs._(_root);
	@override late final _TranslationsHomeUiScreensRootReachCalculatorScreenEs ui_screens_root_reach_calculator_screen = _TranslationsHomeUiScreensRootReachCalculatorScreenEs._(_root);
	@override late final _TranslationsHomeUiScreensAdvancedSetupQuickguideScreenEs ui_screens_advanced_setup_quickguide_screen = _TranslationsHomeUiScreensAdvancedSetupQuickguideScreenEs._(_root);
	@override late final _TranslationsHomeUiSheetsAdvancedSetupFactionDetailsSheetEs ui_sheets_advanced_setup_faction_details_sheet = _TranslationsHomeUiSheetsAdvancedSetupFactionDetailsSheetEs._(_root);
	@override late final _TranslationsHomeUiScreensSetupOrderScreenEs ui_screens_setup_order_screen = _TranslationsHomeUiScreensSetupOrderScreenEs._(_root);
	@override late final _TranslationsHomeUiScreensRecommendedCompositionsScreenEs ui_screens_recommended_compositions_screen = _TranslationsHomeUiScreensRecommendedCompositionsScreenEs._(_root);
	@override late final _TranslationsHomeUiWidgetsHomeStatsPieChartWidgetEs ui_widgets_home_stats_pie_chart_widget = _TranslationsHomeUiWidgetsHomeStatsPieChartWidgetEs._(_root);
	@override late final _TranslationsHomeUiContentRootCommunityToolsContentEs ui_content_root_community_tools_content = _TranslationsHomeUiContentRootCommunityToolsContentEs._(_root);
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
	@override late final _TranslationsMatchUiScreensMatchActionableInfoRowWidgetEs ui_screens_match_actionable_info_row_widget = _TranslationsMatchUiScreensMatchActionableInfoRowWidgetEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchJoinSheetLoadingWidgetEs ui_screens_match_join_sheet_loading_widget = _TranslationsMatchUiScreensMatchJoinSheetLoadingWidgetEs._(_root);
	@override late final _TranslationsMatchUiSheetsMatchShareSheetEs ui_sheets_match_share_sheet = _TranslationsMatchUiSheetsMatchShareSheetEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchLocationHeaderImageWidgetEs ui_screens_match_location_header_image_widget = _TranslationsMatchUiScreensMatchLocationHeaderImageWidgetEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetEs ui_screens_match_create_table_location_no_recent_locations_widget = _TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetEs._(_root);
	@override late final _TranslationsMatchUiScreensMatchChatScreenEs ui_screens_match_chat_screen = _TranslationsMatchUiScreensMatchChatScreenEs._(_root);
	@override late final _TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogEs ui_dialogs_match_played_match_summary_dialog = _TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogEs._(_root);
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
	@override late final _TranslationsRegisterMatchUiStatesRegisterMatchProviderEs ui_states_register_match_provider = _TranslationsRegisterMatchUiStatesRegisterMatchProviderEs._(_root);
	@override late final _TranslationsRegisterMatchUiDialogsRegisterMatchCancelMatchDialogEs ui_dialogs_register_match_cancel_match_dialog = _TranslationsRegisterMatchUiDialogsRegisterMatchCancelMatchDialogEs._(_root);
	@override late final _TranslationsRegisterMatchUiDialogsRegisterMatchSuccessDialogEs ui_dialogs_register_match_success_dialog = _TranslationsRegisterMatchUiDialogsRegisterMatchSuccessDialogEs._(_root);
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
	@override String get pickYourFavoriteRootFactionBeforeEnteringTheHub => 'Elige tu facción favorita de ROOT antes de entrar al hub.';
	@override String get chooseYourFaction => 'Elige tu facción';
	@override String get iAlreadyHaveAnAccount => 'ya tengo una cuenta';
}

// Path: auth.auth_onboarding_profile_screen
class _TranslationsAuthAuthOnboardingProfileScreenEs extends TranslationsAuthAuthOnboardingProfileScreenEn {
	_TranslationsAuthAuthOnboardingProfileScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get currentLocationUsesYourPhoneCoordinatesXAndYAndIsRequiredToShowNearbyMat => 'La ubicación actual usa las coordenadas de tu teléfono (x e y) y es necesaria para mostrar partidas cercanas.';
	@override String get yourDisplayNameIsHowOtherPlayersWillSeeYouInRootHub => 'Tu nombre visible es como otros jugadores te verán en Root Hub.';
	@override String get setYourHubIdentity => 'Configure su identidad central';
	@override String get continueButton => 'Continuar';
	@override String get chooseHowYouAppearAndSetYourLocationToFindNearbyMatches => 'Elige cómo apareces y configura tu ubicación para encontrar partidas cercanas.';
	@override String get howYouWillBeCalled => 'como te llamaran';
	@override String get thisIsHowOtherPlayersWillSeeYourProfileInRootHub => 'Así verán otros jugadores tu perfil en Root Hub.';
	@override String get enterYourDisplayName => 'Ingrese su nombre para mostrar';
	@override String get currentLocation => 'Ubicación actual';
	@override String get whereDoYouWantToPlay => '¿Dónde quieres jugar?';
	@override String get locationIsRequiredToShowNearbyTablesChooseDeviceOrSearch => 'La ubicación es necesaria para mostrar partidas cercanas. Elige la ubicación del dispositivo o busca un lugar.';
	@override String get chooseTheAreaWhereYouWantToFindNearbyPlayers => 'Elige el área donde quieres encontrar jugadores y mesas cercanas.';
	@override String get useMyCurrentDeviceLocation => 'Usar la ubicación actual de mi dispositivo';
	@override String get capturingCoordinates => 'Capturando coordenadas...';
	@override String get instantlyUseYourPhonesGpsCoordinates => 'Utilice instantáneamente las coordenadas GPS de su teléfono.';
	@override String get searchForATableLocation => 'Buscar una ubicación';
	@override String get openTheSearchAndSelectAnyPlaceYouPrefer => 'Abre la búsqueda y selecciona el lugar que prefieras.';
	@override String get yourPlayArea => 'Tu zona de juego';
	@override String get findingCityName => 'Buscando nombre de la ciudad...';
	@override String get selectedArea => 'Zona seleccionada';
	@override String weWillShowMatchesNear({required Object city}) => 'Mostraremos partidas cerca de ${city}.';
	@override String get weWillShowMatchesNearTheSelectedArea => 'Mostraremos partidas cerca de tu zona seleccionada.';
	@override String get changeLocation => 'Cambiar ubicación';
	@override String get selectedCoordinates => 'Coordenadas seleccionadas';
	@override String get searchAreaRadius => 'Radio del área de búsqueda';
	@override String get howFarShouldWeSearchForNearbyPlayersAroundYou => '¿Hasta dónde debemos buscar jugadores cercanos a tu alrededor?';
	@override String get value25KmIsTheRecommendedStartingPoint => '25 km es el punto de partida recomendado.';
	@override String get disableVpnOrProxyBeforeCapturingLocationWrongCoordinatesMayHideNearby => 'Desactiva VPN o proxy antes de capturar la ubicación. Coordenadas incorrectas pueden ocultar partidas cercanas.';
	@override String get locationSelectedFromSearch => 'Ubicación seleccionada de la búsqueda.';
	@override String get enableLocationServicesOnYourPhoneAndTryAgain => 'Habilite los servicios de ubicación en su teléfono e inténtelo nuevamente.';
	@override String get locationPermissionDeniedLocationIsRequiredToContinue => 'Permiso de ubicación denegado. Se requiere ubicación para continuar.';
	@override String get locationPermissionIsDeniedForeverEnableItInSystemSettingsToContinue => 'El permiso de ubicación se deniega para siempre. Habilítelo en la configuración del sistema para continuar.';
	@override String get locationCapturedSuccessfully => 'Ubicación capturada con éxito.';
	@override String get unableToCaptureLocationRightNowLocationIsRequiredToContinue => 'No se puede capturar la ubicación en este momento. Se requiere ubicación para continuar.';
	@override String get unableToResolveCityNameRightNow => 'No se pudo resolver el nombre de la ciudad en este momento.';
	@override String get searchForLocation => 'Buscar ubicación';
	@override String get searchAndPickOnePlaceWeWillUseItsCoordinatesForNearbyMatches => 'Busca y elige un lugar. Usaremos sus coordenadas para partidos cercanos.';
	@override String get useSelectedLocation => 'Usar ubicación seleccionada';
	@override String get selectALocationFromTheListBeforeContinuing => 'Seleccione una ubicación de la lista antes de continuar.';
	@override String get unableToUseTheSelectedLocationCoordinatesRightNow => 'No se pueden utilizar las coordenadas de ubicación seleccionadas en este momento.';
	@override String get kilometersUnit => 'kilómetros';
}

// Path: auth.auth_loading_screen
class _TranslationsAuthAuthLoadingScreenEs extends TranslationsAuthAuthLoadingScreenEn {
	_TranslationsAuthAuthLoadingScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get rootHub => 'ROOT HUB';
}

// Path: auth.auth_login_screen
class _TranslationsAuthAuthLoginScreenEs extends TranslationsAuthAuthLoginScreenEn {
	_TranslationsAuthAuthLoginScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get signInToBrowseSchedulesAndJoinTables => 'Inicia sesión para ver horarios y unirte a partidas.';
	@override String get findYourNextRootMatch => 'Encuentra tu próxima\npartida de ROOT';
	@override String get signInWithEmailTitle => 'Iniciar sesión con correo';
	@override String get signUpWithEmailTitle => 'Crear cuenta con correo';
	@override String get verifyAccountTitle => 'Verificar cuenta';
	@override String get verifyAccountMessage => 'Se envió un correo de verificación. Revisa tu correo e ingresa el código abajo.';
	@override String get setAccountPasswordTitle => 'Definir contraseña de la cuenta';
	@override String get resetPasswordTitle => 'Restablecer contraseña';
	@override String get requestResetDescription => 'Ingresa el correo de tu cuenta para recibir un código de restablecimiento.';
	@override String get verifyResetCodeTitle => 'Verificar código de restablecimiento';
	@override String get verifyResetMessage => 'Ingresa el código de restablecimiento enviado a tu correo.';
	@override String get setNewPasswordTitle => 'Definir nueva contraseña';
	@override String get emailLabel => 'Correo';
	@override String get passwordLabel => 'Contraseña';
	@override String get newPasswordLabel => 'Nueva contraseña';
	@override String get forgotPasswordButton => '¿Olvidaste tu contraseña?';
	@override String get signInButton => 'Iniciar sesión';
	@override String get signUpButton => 'Crear cuenta';
	@override String get continueButton => 'Continuar';
	@override String get verifyButton => 'Verificar';
	@override String get requestResetButton => 'Solicitar restablecimiento';
	@override String get resetPasswordButton => 'Restablecer contraseña';
	@override String get dontHaveAnAccount => '¿No tienes cuenta?';
	@override String get alreadyHaveAnAccount => '¿Ya tienes cuenta?';
	@override String get signUpLink => 'Crear cuenta';
	@override String get signInLink => 'Iniciar sesión';
	@override String get backToSignIn => 'Volver a iniciar sesión';
	@override String get resendCode => '¿No lo recibiste? Enviar un nuevo código';
	@override String resendCodeIn({required Object time}) => 'Enviar un nuevo código (${time})';
	@override String get passwordRuleMinLength => 'Al menos 8 caracteres';
	@override String get passwordRuleUppercase => 'Contiene al menos una letra mayúscula';
	@override String get passwordRuleLowercase => 'Contiene al menos una letra minúscula';
	@override String get passwordRuleNumber => 'Contiene al menos un número';
	@override late final _TranslationsAuthAuthLoginScreenErrorsEs errors = _TranslationsAuthAuthLoginScreenErrorsEs._(_root);
}

// Path: auth.auth_onboarding_continue_button_widget
class _TranslationsAuthAuthOnboardingContinueButtonWidgetEs extends TranslationsAuthAuthOnboardingContinueButtonWidgetEn {
	_TranslationsAuthAuthOnboardingContinueButtonWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get continueButton => 'Continuar';
}

// Path: dashboard.ui_screens_dashboard_screen
class _TranslationsDashboardUiScreensDashboardScreenEs extends TranslationsDashboardUiScreensDashboardScreenEn {
	_TranslationsDashboardUiScreensDashboardScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get shop => 'Tienda';
	@override String get match => 'Partidas';
	@override String get schedules => 'Agendas';
	@override String get chat => 'Chat';
	@override String get activity => 'Actividad';
	@override String get home => 'Inicio';
	@override String get rootHub => 'ROOT HUB';
	@override String get chooseFromGallery => 'Elige de la galería';
	@override String get takePhoto => 'tomar foto';
	@override String get cancel => 'Cancelar';
	@override String get chooseFromLibrary => 'Elija de la biblioteca';
	@override String get takePhoto2 => 'tomar foto';
	@override String get changeProfilePhoto => 'Cambiar foto de perfil';
	@override String get allowCameraAndPhotoPermissionsInSystemSettingsAndTryAgain => 'Permita permisos de cámara y fotografías en la configuración del sistema e inténtelo nuevamente.';
	@override String get unableToAccessCameraOrGallery => 'No se puede acceder a la cámara o galería';
	@override String get rootPlayer => 'Jugador Root';
	@override String welcomeBack({required Object displayName}) => 'Bienvenido de nuevo, ${displayName}';
	@override String get communityDashboardTitle => 'Panel de la Comunidad';
	@override String get matchFinderTitle => 'Buscar Partidas';
	@override String get activityCenterTitle => 'Centro de Actividad';
	@override String get communityDashboardSubtitle => 'Mira qué está pasando en la comunidad de ROOT.';
	@override String get matchFinderSubtitle => 'Busca partidas cercanas o crea una nueva con tu grupo local.';
	@override String get activityCenterSubtitle => 'Sigue tus mesas activas y las novedades de chat en un solo lugar.';
}

// Path: dashboard.ui_screens_dashboard_faction_editor_screen
class _TranslationsDashboardUiScreensDashboardFactionEditorScreenEs extends TranslationsDashboardUiScreensDashboardFactionEditorScreenEn {
	_TranslationsDashboardUiScreensDashboardFactionEditorScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get chooseTheFactionShownInYourProfileAndUsedAsYourDefaultPreference => 'Elija la facción que se muestra en su perfil y se utiliza como su preferencia predeterminada.';
	@override String get changeFavoriteFaction => 'Cambiar facción favorita';
	@override String saveFactionButtonLabel({required Object factionName}) => 'Guardar ${factionName}';
}

// Path: dashboard.ui_dialogs_edit_location_dialog
class _TranslationsDashboardUiDialogsEditLocationDialogEs extends TranslationsDashboardUiDialogsEditLocationDialogEn {
	_TranslationsDashboardUiDialogsEditLocationDialogEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get save => 'Ahorrar';
	@override String get cancel => 'Cancelar';
	@override String get updateYourCoordinatesAndTargetSearchRatioForMatchDiscovery => 'Actualiza tus coordenadas y tu radio de búsqueda para encontrar partidas.';
	@override String get editLocation => 'Editar ubicación';
}

// Path: dashboard.ui_dialogs_edit_display_name_dialog
class _TranslationsDashboardUiDialogsEditDisplayNameDialogEs extends TranslationsDashboardUiDialogsEditDisplayNameDialogEn {
	_TranslationsDashboardUiDialogsEditDisplayNameDialogEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get save => 'Ahorrar';
	@override String get cancel => 'Cancelar';
	@override String get thisIsHowPlayersWillSeeYouAcrossRootHub => 'Así te verán los jugadores en Root Hub.';
	@override String get editDisplayName => 'Editar nombre para mostrar';
}

// Path: dashboard.ui_widgets_dashboard_profile_drawer_widget
class _TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetEs extends TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetEn {
	_TranslationsDashboardUiWidgetsDashboardProfileDrawerWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get logOut => 'Finalizar la sesión';
	@override String get changeFaction => 'Cambiar facción';
	@override String get saving => 'Ahorro...';
	@override String get favoriteFaction => 'Facción favorita';
	@override String get location => 'Ubicación';
	@override String get displayName => 'Nombre para mostrar';
	@override String get edit => 'Editar';
	@override String get change => 'Cambiar';
	@override String get noLocationConfigured => 'Ninguna ubicación configurada';
	@override String get xLabel => 'incógnita';
	@override String get yLabel => 'y';
	@override String get ratioLabel => 'radio';
	@override String get theme => 'Tema';
	@override String get themeDescriptionLight => 'El modo claro está activo';
	@override String get themeDescriptionDark => 'El modo oscuro está activo';
	@override String get lightMode => 'Claro';
	@override String get darkMode => 'Oscuro';
	@override String get language => 'Idioma';
	@override String get useDeviceLanguage => 'Usar el idioma del dispositivo';
	@override String get english => 'Inglés';
	@override String get portugueseBrazil => 'Portugués (Brasil)';
	@override String get spanish => 'Español';
	@override String get french => 'Francés';
	@override String get german => 'Alemán';
}

// Path: activity.ui_screens_activity_screen
class _TranslationsActivityUiScreensActivityScreenEs extends TranslationsActivityUiScreensActivityScreenEn {
	_TranslationsActivityUiScreensActivityScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get myScheduledTablesTitle => 'Mis Mesas Programadas';
	@override String get tablesYouSubscribedToThatAreStillWithinTheActiveWindow => 'Mesas a las que te suscribiste y que no han comenzado o comenzaron hace menos de 6 horas.';
	@override String get noActiveSchedules => 'Sin suscripciones activas';
	@override String get whenYouJoinATableItWillAppearHereAsASwipeableCard => 'Cuando te unas a una mesa, aparecerá aquí como una tarjeta deslizable.';
	@override String get activeChatsTitle => 'Chats Activos';
	@override String get chatsForUpcomingOrRecentlyStartedTablesOrderedByUnreadMessages => 'Chats de mesas próximas o recién iniciadas, ordenados primero por mensajes no leídos.';
	@override String get noActiveChats => 'No hay chats activos';
	@override String get openAnyTableChatAndItWillBeTrackedHereEvenWithoutASubscription => 'Abre cualquier chat de mesa y se rastreará aquí, incluso sin suscripción.';
	@override String get completedMatchesTitle => 'Chats de Partidas Finalizadas';
	@override String get latestEightCompletedOrArchivedMatchChatsYouParticipatedIn => 'Los últimos 8 chats de partidas que ya sucedieron.';
	@override String get noCompletedChats => 'Aún no hay chats finalizados';
	@override String get onceMatchesFinishTheirChatsWillStayAvailableHere => 'Cuando las partidas terminen, sus chats seguirán disponibles en esta sección.';
}

// Path: activity.ui_screens_chat_screen
class _TranslationsActivityUiScreensChatScreenEs extends TranslationsActivityUiScreensChatScreenEn {
	_TranslationsActivityUiScreensChatScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get searchChats => 'Buscar chats';
	@override String get allFilter => 'Todos';
	@override String get unreadFilter => 'No leídos';
	@override String get noChatsTitle => 'Todavía no hay chats';
	@override String get noChatsDescription => 'Abre o únete a un chat de mesa y aparecerá aquí.';
	@override String get noSearchResultsTitle => 'No se encontraron chats';
	@override String get noSearchResultsDescription => 'Prueba otra búsqueda o limpia los filtros.';
}

// Path: activity.ui_widgets_activity_subscribed_schedule_card
class _TranslationsActivityUiWidgetsActivitySubscribedScheduleCardEs extends TranslationsActivityUiWidgetsActivitySubscribedScheduleCardEn {
	_TranslationsActivityUiWidgetsActivitySubscribedScheduleCardEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get unknownLocation => 'Ubicación desconocida';
	@override String get selected => 'Seleccionado';
	@override String get alreadyStarted => 'Ya comenzó';
	@override String get notStartedYet => 'Aún no comenzó';
	@override String playersLabel({required Object minPlayers, required Object maxPlayers}) => '${minPlayers}-${maxPlayers} jugadores';
	@override String get openChatHint => 'Toca la tarjeta para abrir el chat';
}

// Path: activity.ui_widgets_activity_chat_card
class _TranslationsActivityUiWidgetsActivityChatCardEs extends TranslationsActivityUiWidgetsActivityChatCardEn {
	_TranslationsActivityUiWidgetsActivityChatCardEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get ended => 'Finalizada';
	@override String get started => 'Iniciada';
	@override String get upcoming => 'Próxima';
	@override String senderMessage({required Object sender, required Object message}) => '${sender}: ${message}';
	@override String get newMessage => 'Nuevo mensaje';
	@override String get photoShared => 'Foto compartida';
	@override String get systemUpdate => 'Actualización del sistema';
	@override String get noMessagesYet => 'Sin mensajes aún';
}

// Path: activity.ui_widgets_chat_match_list_tile_widget
class _TranslationsActivityUiWidgetsChatMatchListTileWidgetEs extends TranslationsActivityUiWidgetsChatMatchListTileWidgetEn {
	_TranslationsActivityUiWidgetsChatMatchListTileWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get voiceMessage => 'Mensaje de voz';
}

// Path: home.ui_sections_home_stats_section
class _TranslationsHomeUiSectionsHomeStatsSectionEs extends TranslationsHomeUiSectionsHomeStatsSectionEn {
	_TranslationsHomeUiSectionsHomeStatsSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get allFactionsTotal => 'Todas las facciones en total';
	@override String get allFactionsAvg => 'Promedio de todas las facciones';
	@override String get allFactionsTotal2 => 'Todas las facciones en total';
	@override String get allFactionsAvg2 => 'Promedio de todas las facciones';
	@override String get absoluteNumberOfWinsForEachFaction => 'Número absoluto de victorias para cada facción.';
	@override String get totalWins => 'Victorias totales';
	@override String get averageScorePerFactionWhenPointsWereTracked => 'Puntuación promedio por facción cuando se realizaron el seguimiento de los puntos.';
	@override String get averagePoints => 'Puntos promedio';
	@override String get howOftenEachFactionAppearsInCompletedGames => 'Con qué frecuencia aparece cada facción en los juegos completados.';
	@override String get playedGames => 'Juegos jugados';
	@override String get whoIsWinningTheMostOftenRightNow => '¿Quién está ganando con más frecuencia en este momento?';
	@override String get factionWinRate => 'Tasa de victorias de facción';
}

// Path: home.ui_screens_home_screen
class _TranslationsHomeUiScreensHomeScreenEs extends TranslationsHomeUiScreensHomeScreenEn {
	_TranslationsHomeUiScreensHomeScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get yourPersonalFactionPerformanceAndMatchProfile => 'Tus estadísticas personales de facción basadas solo en las facciones que has jugado.';
	@override String get myStats => 'Mis estadísticas';
	@override String get factionPerformanceFromAllPlayedMatchesInRootHub => 'Rendimiento de facciones en todas las partidas jugadas en Root Hub.';
	@override String get communityStats => 'Estadísticas de la comunidad';
	@override String get noCommunityStatsYet => 'Aún no hay estadísticas de la comunidad';
	@override String get communityStatsWillAppearAfterCompletedMatches => 'En cuanto los jugadores registren partidas completadas, esta sección se llenará con tendencias de facciones.';
	@override String get noPersonalStatsYet => 'Aún no hay estadísticas personales';
	@override String get registerYourFirstMatchToStartYourDashboard => 'Juega y registra tu primera partida para comenzar tu panel personal.';
}

// Path: home.ui_sections_home_community_tools_section
class _TranslationsHomeUiSectionsHomeCommunityToolsSectionEs extends TranslationsHomeUiSectionsHomeCommunityToolsSectionEn {
	_TranslationsHomeUiSectionsHomeCommunityToolsSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Herramientas de la Comunidad';
	@override String get description => 'Referencias útiles de ROOT para preparar la mesa, planear facciones y agilizar la organización de la partida.';
	@override String get comingSoon => 'Pronto';
	@override String get rootTag => 'ROOT';
	@override String get reachCalculatorTitle => 'Calculadora de Alcance';
	@override String get advancedSetupQuickguideTitle => 'Preparación\nAvanzada';
	@override String get setupOrderTitle => 'Orden de Preparación';
	@override String get recommendedFactionsToPlayTitle => 'Sugerencias de partidas equilibradas';
}

// Path: home.ui_screens_root_reach_calculator_screen
class _TranslationsHomeUiScreensRootReachCalculatorScreenEs extends TranslationsHomeUiScreensRootReachCalculatorScreenEn {
	_TranslationsHomeUiScreensRootReachCalculatorScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Calculadora de Alcance';
	@override String get description => 'Construye una alineación y comprueba si la mesa tiene alcance suficiente para una partida equilibrada.';
	@override String get targetReached => 'Objetivo\nasegurado';
	@override String needMoreReach({required Object remainingReach}) => 'Faltan ${remainingReach}\nde alcance';
	@override String get tapOnceToPickTapTwiceToBanTapAgainToReset => 'Toca una vez para elegir, dos para vetar y otra vez para reiniciar.';
	@override String get picked => 'Elegidas';
	@override String get banned => 'Vetadas';
	@override String get unavailable => 'No disponibles';
	@override String get players => 'Cantidad de jugadores';
	@override String requiredReach({required Object reach}) => 'Alcance requerido: ${reach}+';
}

// Path: home.ui_screens_advanced_setup_quickguide_screen
class _TranslationsHomeUiScreensAdvancedSetupQuickguideScreenEs extends TranslationsHomeUiScreensAdvancedSetupQuickguideScreenEn {
	_TranslationsHomeUiScreensAdvancedSetupQuickguideScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Preparación Avanzada';
	@override String get referenceTitle => 'Referencia de Preparación Avanzada';
	@override String get description => 'Esta referencia sigue el modelo público de 10 facciones usado hasta Marauder.';
	@override String get generalFlow => 'Flujo general';
	@override String get chooseAFaction => 'Elige una facción';
	@override String get chooseAFactionDescription => 'Toca cualquier facción para abrir los detalles de preparación en una hoja de referencia rápida.';
}

// Path: home.ui_sheets_advanced_setup_faction_details_sheet
class _TranslationsHomeUiSheetsAdvancedSetupFactionDetailsSheetEs extends TranslationsHomeUiSheetsAdvancedSetupFactionDetailsSheetEn {
	_TranslationsHomeUiSheetsAdvancedSetupFactionDetailsSheetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get originalEnglish => 'Inglés original';
}

// Path: home.ui_screens_setup_order_screen
class _TranslationsHomeUiScreensSetupOrderScreenEs extends TranslationsHomeUiScreensSetupOrderScreenEn {
	_TranslationsHomeUiScreensSetupOrderScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Orden de Preparación';
	@override String get description => 'La preparación estándar sigue una prioridad fija de facciones. Esta página es un recordatorio rápido de ese orden.';
	@override String get secondVagabondTitle => 'Regla del segundo Vagabundo';
}

// Path: home.ui_screens_recommended_compositions_screen
class _TranslationsHomeUiScreensRecommendedCompositionsScreenEs extends TranslationsHomeUiScreensRecommendedCompositionsScreenEn {
	_TranslationsHomeUiScreensRecommendedCompositionsScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sugerencias equilibradas';
	@override String get description => 'Elige tus cajas y la cantidad de jugadores para ver composiciones equilibradas para la mesa.';
	@override String get ownedBoxesTitle => '1. ¿Qué cajas tienes?';
	@override String get ownedBoxesDescription => 'Selecciona las cajas que has comprado.';
	@override String get playerCountTitle => '2. ¿Cuántos jugadores?';
	@override String get playerCountDescription => 'Elige el tamaño de la mesa para esta partida.';
	@override String get resultsTitle => 'Composiciones compatibles';
	@override String get resultsDescription => 'Estas composiciones encajan con las cajas que tienes y con la cantidad de jugadores elegida.';
	@override late final _TranslationsHomeUiScreensRecommendedCompositionsScreenBoxNamesEs boxNames = _TranslationsHomeUiScreensRecommendedCompositionsScreenBoxNamesEs._(_root);
}

// Path: home.ui_widgets_home_stats_pie_chart_widget
class _TranslationsHomeUiWidgetsHomeStatsPieChartWidgetEs extends TranslationsHomeUiWidgetsHomeStatsPieChartWidgetEn {
	_TranslationsHomeUiWidgetsHomeStatsPieChartWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get noValuesForThisMetricYet => 'Aún no hay valores para esta métrica.';
}

// Path: home.ui_content_root_community_tools_content
class _TranslationsHomeUiContentRootCommunityToolsContentEs extends TranslationsHomeUiContentRootCommunityToolsContentEn {
	_TranslationsHomeUiContentRootCommunityToolsContentEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get vagabondSecondSuffix => 'II';
	@override String get advancedSetupOverviewBody => '<h>Flujo general<h>\n1. Elige y prepara el mapa.\n2. Elige el mazo.\n3. Prepara los bots, si se usan.\n4. Aleatoriza el orden de asiento y el primer jugador.\n5. Prepara los hitos, si se usan.\n6. Prepara los esbirros, si se usan.\n7. Roba 5 cartas por jugador.\n8. Prepara las facciones usando la Preparación Estándar o las cartas de Preparación Avanzada.\n9. Coloca todos los marcadores de puntuación en 0.\n10. Cada jugador se queda con 3 de las 5 cartas y devuelve las otras 2 al mazo compartido.\n\n<h>Lógica del draft<h>\n1. Baraja todas las cartas de preparación militantes y coloca una boca arriba en el centro.\n2. Baraja las cartas militantes restantes junto con todas las cartas insurgentes.\n3. Reparte una carta de preparación por jugador a la reserva. Habrá una carta más que jugadores.\n4. En partidas de 2 jugadores, retira las cartas insurgentes antes de repartir, a menos que estés usando deliberadamente la excepción de los esbirros aventureros.\n5. Si la última carta repartida es insurgente, queda bloqueada y no puede elegirse hasta que al menos una facción militante haya sido elegida.\n6. Si aparece una carta de preparación del Vagabundo, revela también una carta aleatoria de personaje del Vagabundo junto a ella.\n7. Empezando por el último jugador en el orden de turno y avanzando en sentido antihorario, cada jugador elige una carta de preparación y resuelve inmediatamente la preparación de esa facción.\n8. El alcance no se usa en la Preparación Avanzada, aunque las cartas de preparación todavía pueden mostrar valores de alcance.';
	@override String get setupOrderSecondVagabondBody => '- Cuando haya un segundo Vagabundo en la partida, insértalo inmediatamente después del primer Vagabundo.\n- En partidas con dos Vagabundos, la Ley actual dice explícitamente que, en la Preparación Estándar, se determina al azar cuál Vagabundo se prepara primero.';
	@override late final _TranslationsHomeUiContentRootCommunityToolsContentAdvancedSetupFactionGuideBodiesEs advancedSetupFactionGuideBodies = _TranslationsHomeUiContentRootCommunityToolsContentAdvancedSetupFactionGuideBodiesEs._(_root);
}

// Path: match.ui_sheets_match_edit_table_error_widget
class _TranslationsMatchUiSheetsMatchEditTableErrorWidgetEs extends TranslationsMatchUiSheetsMatchEditTableErrorWidgetEn {
	_TranslationsMatchUiSheetsMatchEditTableErrorWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get close => 'Cerca';
}

// Path: match.ui_sheets_match_edit_table_loading_widget
class _TranslationsMatchUiSheetsMatchEditTableLoadingWidgetEs extends TranslationsMatchUiSheetsMatchEditTableLoadingWidgetEn {
	_TranslationsMatchUiSheetsMatchEditTableLoadingWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get loadingTableDetails => 'Cargando detalles de la partida...';
}

// Path: match.ui_sheets_match_table_info_sheet
class _TranslationsMatchUiSheetsMatchTableInfoSheetEs extends TranslationsMatchUiSheetsMatchTableInfoSheetEn {
	_TranslationsMatchUiSheetsMatchTableInfoSheetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get remove => 'Eliminar';
	@override String get cancel => 'Cancelar';
	@override String get rejoinIfSeatsAreStillAvailable => 'Vuelva a unirse si aún hay asientos disponibles.';
	@override String removePlayerDescription({required Object playerName, required Object rejoinInstruction}) => '${playerName} será eliminado de la mesa y tendrá que ${rejoinInstruction}';
	@override String removePlayerTitle({required Object playerName}) => '¿Eliminar a ${playerName}?';
	@override String get cancel2 => 'Cancelar';
	@override String get selectAPlayerToRemoveFromTheTable => 'Selecciona un jugador para eliminarlo de la partida.';
	@override String get removeAPlayer => 'Eliminar un jugador';
	@override String get leave => 'Dejar';
	@override String get cancel3 => 'Cancelar';
	@override String get playersListYouCanRejoinLaterIfSeatsAreStillAvailable => 'lista de jugadores. Puedes volver a unirte más tarde si aún hay asientos disponibles.';
	@override String get youWillBeUnsubscribedFromThisMatchAndRemovedFromThe => 'Se cancelará tu suscripción a este partida y se te eliminará del';
	@override String copiedLabel({required Object label}) => '${label} copiado';
	@override String ratingsCount({required Object count}) => '${count} reseñas';
	@override String ratingValue({required Object value}) => 'Valoración ${value}';
	@override String get leaveThisTable => '¿Dejar esta partida?';
	@override String get unableToLoadTableDetails => 'No se pueden cargar los detalles de la partida.';
	@override String get tableNotFound => 'Partida no encontrada';
}

// Path: match.ui_sheets_match_table_info_content_widget
class _TranslationsMatchUiSheetsMatchTableInfoContentWidgetEs extends TranslationsMatchUiSheetsMatchTableInfoContentWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoContentWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get noPlayersHaveJoinedThisTableYet => 'Ningún jugador se ha unido a esta partida todavía.';
	@override String get theseAreTheCurrentPlayersThatWillParticipate => 'Estos son los jugadores actuales que participarán.';
	@override String get noPlayersSubscribedYet => 'Ningún jugador se ha suscrito todavía.';
	@override String createdAtValue({required Object value}) => 'Creada el: ${value}';
	@override String get playersInThisMatch => 'Jugadores en este partida';
	@override String playersRange({required Object minPlayers, required Object maxPlayers}) => '${minPlayers}-${maxPlayers} jugadores';
	@override String seatsCount({required Object subscribedPlayersCount, required Object maxPlayers}) => '${subscribedPlayersCount}/${maxPlayers} plazas';
	@override String get unknownHost => 'Anfitrión desconocido';
	@override String get tableDetails => 'Detalles de la partida';
	@override String statusValue({required Object value}) => 'Estado: ${value}';
	@override String get statusScheduled => 'Programado';
	@override String get statusNotPlayed => 'No jugado';
	@override String get statusPlayed => 'Jugado';
	@override String get thisMatchWasMarkedAsNotPlayed => 'Este partido se marcó como no jugado.';
	@override String reasonValue({required Object value}) => 'Motivo: ${value}';
	@override String markedByValue({required Object value}) => 'Marcado por: ${value}';
	@override String detailsValue({required Object value}) => 'Detalles: ${value}';
	@override String get reasonNotEnoughPlayers => 'No hay suficientes jugadores';
	@override String get reasonHostUnavailable => 'Anfitrión no disponible';
	@override String get reasonNoGameCopyAvailable => 'No hay copia del juego disponible';
	@override String get reasonVenueIssue => 'Problema del local';
	@override String get reasonPlayerNoShow => 'Jugador ausente';
	@override String get reasonWeatherOrEmergency => 'Clima o emergencia';
	@override String get reasonExpiredWithoutResult => 'Expiró sin resultado después de 24 horas';
	@override String get reasonOther => 'Otro';
	@override String get reasonNotProvided => 'No especificado';
}

// Path: match.ui_sheets_match_table_info_error_widget
class _TranslationsMatchUiSheetsMatchTableInfoErrorWidgetEs extends TranslationsMatchUiSheetsMatchTableInfoErrorWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoErrorWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get retry => 'Rever';
	@override String get close => 'Cerca';
}

// Path: match.ui_sheets_match_table_info_participant_card_widget
class _TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetEs extends TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoParticipantCardWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get favoriteFaction => 'Facción favorita';
}

// Path: match.ui_sheets_match_edit_table_sheet
class _TranslationsMatchUiSheetsMatchEditTableSheetEs extends TranslationsMatchUiSheetsMatchEditTableSheetEn {
	_TranslationsMatchUiSheetsMatchEditTableSheetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String dateIsTooFarDescription({required Object maxScheduleDays}) => 'La hora programada no puede estar a más de ${maxScheduleDays} días en el futuro.';
	@override String get theScheduledTimeCannotBeMoreThan => 'El tiempo programado no puede ser mayor que';
	@override String get dateIsTooFar => 'La fecha está demasiado lejos';
	@override String timeIsTooSoonDescription({required Object minScheduleMinutes}) => 'La hora programada debe ser al menos ${minScheduleMinutes} minutos en el futuro.';
	@override String get theScheduledTimeMustBeAtLeast => 'El horario programado debe ser al menos';
	@override String get timeIsTooSoon => 'El tiempo es demasiado pronto';
	@override String get youCannotSetTheMaximumBelowThatNumber => 'No puede establecer el máximo por debajo de ese número.';
	@override String tooManyPlayersSubscribedDescription({required Object currentSubscriberCount}) => 'Ya hay ${currentSubscriberCount} jugadores suscritos. No puedes establecer el máximo por debajo de ese número.';
	@override String get tooManyPlayersSubscribed => 'Demasiados jugadores suscritos';
	@override String get withMinimumNotGreaterThanMaximum => 'con mínimo no mayor que máximo.';
	@override String get playersRangeMustBeBetween2And6 => 'El rango de jugadores debe estar entre 2 y 6,';
	@override String get invalidPlayersRange => 'Rango de jugadores no válidos';
	@override String get pleaseAddATitleForYourTable => 'Por favor agregue un título para su partida.';
	@override String get titleRequired => 'Título requerido';
	@override String get unableToLoadTableDetails => 'No se pueden cargar los detalles de la partida.';
	@override String get tableNotFound => 'Partida no encontrada';
	@override String get selectGameDay => 'Selecciona el día de la partida';
	@override String get selectStartHour => 'Selecciona la hora de inicio';
}

// Path: match.ui_sheets_match_table_info_loading_widget
class _TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetEs extends TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoLoadingWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get loadingTableDetails => 'Cargando detalles de la partida...';
}

// Path: match.ui_sheets_match_edit_table_form_widget
class _TranslationsMatchUiSheetsMatchEditTableFormWidgetEs extends TranslationsMatchUiSheetsMatchEditTableFormWidgetEn {
	_TranslationsMatchUiSheetsMatchEditTableFormWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get saveChanges => 'Guardar cambios';
	@override String get saving => 'Ahorro...';
	@override String get cancel => 'Cancelar';
	@override String scheduleDescription({required Object maxScheduleDays}) => 'Debe ser al menos 10 minutos desde ahora y hasta ${maxScheduleDays} días por delante.';
	@override String get mustBeAtLeast10MinutesFromNowUpTo => 'Deben pasar al menos 10 minutos a partir de ahora, hasta';
	@override String get schedule => 'Cronograma';
	@override String get maximum => 'Máximo';
	@override String get minimum => 'Mínimo';
	@override String playersAlreadySubscribedCount({required Object count}) => '${count} jugador(es) ya suscrito(s).';
	@override String get setBetween2And6Players => 'Ambientado entre 2 y 6 jugadores.';
	@override String get playersRange => 'Rango de jugadores';
	@override String get exampleWeHaveMarauderExpansion => 'Ejemplo: Tenemos la expansión Merodeador.';
	@override String get extraDetailsLikeExpansionsParkingTipsEtc => 'Detalles extra como ampliaciones, consejos de aparcamiento, etc.';
	@override String get descriptionOptional => 'Descripción (opcional)';
	@override String get exampleSaturdayRootAtLanternCaf => 'Ejemplo: ROOT de sábado en Lantern Café';
	@override String get aShortNameSoPlayersCanFindYourTable => 'Un nombre corto para que los jugadores puedan encontrar tu partida.';
	@override String get tableTitle => 'Título de la partida';
	@override String get newPlayersCanStillJoinThisTable => 'Aún pueden unirse nuevos jugadores a esta partida.';
	@override String get newPlayersCannotJoinThisTable => 'Los nuevos jugadores no pueden unirse a esta partida.';
	@override String get closeSubscriptions => 'Cerrar suscripciones';
	@override String get editDetails => 'Editar detalles';
	@override String get editTable => 'Editar partida';
}

// Path: match.ui_sheets_match_table_info_bottom_actions_widget
class _TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetEs extends TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetEn {
	_TranslationsMatchUiSheetsMatchTableInfoBottomActionsWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get removePlayer => 'Eliminar jugador';
	@override String get removing => 'Eliminando...';
	@override String get leaveTable => 'Dejar la partida';
	@override String get leaving => 'Partida...';
	@override String get close => 'Cerca';
}

// Path: match.ui_screens_match_create_table_location_loading_search_widget
class _TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetEs extends TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationLoadingSearchWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get searchingLocations => 'Buscando ubicaciones...';
}

// Path: match.ui_screens_match_create_table_location_screen
class _TranslationsMatchUiScreensMatchCreateTableLocationScreenEs extends TranslationsMatchUiScreensMatchCreateTableLocationScreenEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get previouslySelectedLocations => 'Ubicaciones previamente seleccionadas';
	@override String get searchResults => 'Resultados de la búsqueda';
	@override String get tapALocationToSelectItPreviouslySelectedLocationsAreSavedHereForFasterHo => 'Toca una ubicación para seleccionarla. Las ubicaciones previamente seleccionadas se guardan aquí para un alojamiento más rápido.';
	@override String get searchLocationGooglePlaces => 'Ubicación de búsqueda (Google Places)';
	@override String get chooseTableLocation => 'Elija la ubicación de la partida';
	@override String get chooseOneLocationFromTheListBeforeCreatingTheTable => 'Elija una ubicación de la lista antes de crear la partida.';
	@override String get locationRequired => 'Ubicación requerida';
	@override String get continueButton => 'Continuar';
}

// Path: match.ui_screens_match_join_sheet_error_widget
class _TranslationsMatchUiScreensMatchJoinSheetErrorWidgetEs extends TranslationsMatchUiScreensMatchJoinSheetErrorWidgetEn {
	_TranslationsMatchUiScreensMatchJoinSheetErrorWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get retry => 'Rever';
	@override String get close => 'Cerca';
}

// Path: match.ui_screens_match_screen
class _TranslationsMatchUiScreensMatchScreenEs extends TranslationsMatchUiScreensMatchScreenEn {
	_TranslationsMatchUiScreensMatchScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get unableToOpenTheDialerRightNow => 'No se puede abrir el marcador en este momento.';
	@override String get invalidPhoneNumberFormat => 'Formato de número de teléfono no válido.';
	@override String get unableToOpenTheLinkRightNow => 'No se puede abrir el enlace en este momento.';
	@override String copiedLabel({required Object label}) => '${label} copiado';
	@override String get invalidUrlFormat => 'Formato de URL no válido.';
	@override String get unableToOpenSharedMatch => 'No se puede abrir esta partida compartida ahora.';
	@override String get unableToShareThisMatch => 'No se puede compartir esta partida ahora.';
	@override String ratingsCount({required Object count}) => '${count} reseñas';
	@override String ratingValue({required Object value}) => 'Valoración ${value}';
	@override String shareMessage({required Object location, required Object hour, required Object day, required Object link}) => 'Root Hub conecta personas para jugar ROOT en persona en lugares públicos. Únete a esta partida en ${location}, a las ${hour}, el día ${day}: ${link}';
	@override String get close => 'Cerca';
	@override String get manualLocationNotes => 'Notas de ubicación manuales';
	@override String get phone => 'Teléfono';
	@override String get phone2 => 'Teléfono';
	@override String get website => 'Sitio web';
	@override String get website2 => 'Sitio web';
	@override String get mapLink => 'Enlace al mapa';
	@override String get mapLink2 => 'Enlace al mapa';
	@override String get public => 'Público';
	@override String get private => 'Privado';
	@override String get matchesPlayedHere => 'partidas jugados aquí';
	@override String get matchPlayedHere => 'partida jugado aquí';
	@override String get hostTable => 'Crear partida';
	@override String get reportResult => 'Registrar juego';
}

// Path: match.ui_screens_match_loading_error_state_widget
class _TranslationsMatchUiScreensMatchLoadingErrorStateWidgetEs extends TranslationsMatchUiScreensMatchLoadingErrorStateWidgetEn {
	_TranslationsMatchUiScreensMatchLoadingErrorStateWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get tryAgain => 'Intentar otra vez';
}

// Path: match.ui_screens_match_nearby_header_widget
class _TranslationsMatchUiScreensMatchNearbyHeaderWidgetEs extends TranslationsMatchUiScreensMatchNearbyHeaderWidgetEn {
	_TranslationsMatchUiScreensMatchNearbyHeaderWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get onlyTablesThatDidNotStartMoreThan2HoursAgoAreListed => 'Sólo se enumeran las partidas que no comenzaron hace más de 2 horas.';
	@override String get nearbyMatchTables => 'Partidas cercanas';
	@override String get matchFinder => 'Buscar Partidas';
	@override String get setProfileLocation => 'Configura la ubicación del perfil';
	@override String searchAreaKm({required Object ratioKm}) => '${ratioKm} km de radio';
}

// Path: match.ui_screens_match_no_matches_state_widget
class _TranslationsMatchUiScreensMatchNoMatchesStateWidgetEs extends TranslationsMatchUiScreensMatchNoMatchesStateWidgetEn {
	_TranslationsMatchUiScreensMatchNoMatchesStateWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get hostTheFirstTable => 'Anfitrión de la primera partida.';
	@override String get beTheFirstToStartOneHostANewTableSoNearbyPlayersCanSubscribe => 'Sé el primero en empezar uno. Organice una nueva partida para que los jugadores cercanos puedan suscribirse.';
	@override String get noTablesInYourAreaYet => 'Aún no hay partidas en tu zona';
}

// Path: match.ui_screens_match_time_status_chip_widget
class _TranslationsMatchUiScreensMatchTimeStatusChipWidgetEs extends TranslationsMatchUiScreensMatchTimeStatusChipWidgetEn {
	_TranslationsMatchUiScreensMatchTimeStatusChipWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get remainingTimeUntilTheMatchStarts => 'Tiempo restante hasta que comience el partida.';
	@override String get thisMatchAlreadyStartedRecentlyStartedTablesStayVisibleForAShortPeriod => 'Este partida ya empezó. Las partidas iniciadas recientemente permanecen visibles durante un breve período.';
}

// Path: match.ui_screens_match_create_table_location_no_search_results_widget
class _TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetEs extends TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationNoSearchResultsWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get noLocationsFoundForThisQueryTryAnotherPlaceNameOrArea => 'No se encontraron ubicaciones para esta consulta. Pruebe con otro nombre de lugar o área.';
}

// Path: match.ui_screens_match_create_table_screen
class _TranslationsMatchUiScreensMatchCreateTableScreenEs extends TranslationsMatchUiScreensMatchCreateTableScreenEn {
	_TranslationsMatchUiScreensMatchCreateTableScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get noIAmOnlyHostingThisTable => 'No, solo soy el anfitrión de esta partida.';
	@override String get yesIWillPlayThisMatch => 'Sí, jugaré este partida.';
	@override String get ifYouAreAVenueBoardGameClubOrOrganizerBringingPlayersTogetherButNotJoini => 'Si eres un lugar, un club de juegos de partida o un organizador que reúne a los jugadores pero no se une al partida, deja esta opción sin marcar.';
	@override String get willYouTheHostPlay => '¿Jugarás tú, el anfitrión?';
	@override String get pickTheDayAndStartHourChooseATimeYouCanReliablyShowUp => 'Elija el día y la hora de inicio. Elija un horario en el que pueda presentarse de manera confiable.';
	@override String get schedule => 'Cronograma';
	@override String get maximum => 'Máximo';
	@override String get minimum => 'Mínimo';
	@override String get defaultIs34YouCanSetBetween2And6Players => 'El valor predeterminado es 3-4. Puedes configurar entre 2 y 6 jugadores.';
	@override String get playersRange => 'Rango de jugadores';
	@override String get exampleWeHaveMarauderExpansionAndSpareSleeves => 'Ejemplo: Disponemos de expansión Marauder y fundas de repuesto.';
	@override String get addExtraDetailsLikeExpansionsAvailableParkingTipsOrReferencePoints => 'Agregue detalles adicionales como expansiones disponibles, consejos de estacionamiento o puntos de referencia.';
	@override String get descriptionOptional => 'Descripción (opcional)';
	@override String get exampleSaturdayRootAtLanternCaf => 'Ejemplo: ROOT de sábado en Lantern Café';
	@override String get thisCanBeAnythingThatHelpsIdentifyTheTableLikeAPlaceNameOrEventStyle => 'Puede ser cualquier cosa que ayude a identificar la partida, como el nombre de un lugar o el estilo del evento.';
	@override String get tableTitle => 'Título de la partida';
	@override String get setTableDetailsFirstOnTheNextScreenYouWillChooseTheLocation => 'Primero establezca los detalles de la partida. En la siguiente pantalla elegirás la ubicación.';
	@override String get hostANewTable => 'Crear una nueva partida';
	@override String get selectTheStartHourForThisTableBeforeContinuing => 'Seleccione la hora de inicio de esta partida antes de continuar.';
	@override String get startHourRequired => 'Hora de inicio requerida';
	@override String get youCannotSelectADayInThePast => 'No puedes seleccionar un día en el pasado.';
	@override String get invalidDate => 'Fecha no válida';
	@override String get selectTheDayForThisTableBeforeContinuing => 'Seleccione el día de esta partida antes de continuar.';
	@override String get dayRequired => 'Día requerido';
	@override String get addATitleSoPlayersCanQuicklyIdentifyYourTableExampleDowntownCafNight => 'Añade un título para que los jugadores puedan identificar rápidamente tu partida. Ejemplo: "Noche de café en el centro".';
	@override String get titleRequired => 'Título requerido';
	@override String get youCannotSelectADayInThePast2 => 'No puedes seleccionar un día en el pasado.';
	@override String get invalidDate2 => 'Fecha no válida';
	@override String get selectGameDay => 'Selecciona el día de la partida';
	@override String get selectStartHour => 'Selecciona la hora de inicio';
	@override String get selectDay => 'Seleccionar día';
	@override String get selectHour => 'Seleccionar hora';
	@override String get continueButton => 'Continuar';
}

// Path: match.ui_screens_match_chat_loading_error_state_widget
class _TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetEs extends TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetEn {
	_TranslationsMatchUiScreensMatchChatLoadingErrorStateWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get tryAgain => 'Intentar otra vez';
}

// Path: match.ui_screens_match_report_available_chip_widget
class _TranslationsMatchUiScreensMatchReportAvailableChipWidgetEs extends TranslationsMatchUiScreensMatchReportAvailableChipWidgetEn {
	_TranslationsMatchUiScreensMatchReportAvailableChipWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get reportAvailable => 'Informe disponible';
	@override String get youCanReportThisMatchResultNow => 'Puedes informar el resultado de este partida ahora.';
}

// Path: match.ui_screens_match_initial_loading_state_widget
class _TranslationsMatchUiScreensMatchInitialLoadingStateWidgetEs extends TranslationsMatchUiScreensMatchInitialLoadingStateWidgetEn {
	_TranslationsMatchUiScreensMatchInitialLoadingStateWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get loadingNearbyTables => 'Cargando partidas cercanas...';
}

// Path: match.ui_screens_match_participant_card_widget
class _TranslationsMatchUiScreensMatchParticipantCardWidgetEs extends TranslationsMatchUiScreensMatchParticipantCardWidgetEn {
	_TranslationsMatchUiScreensMatchParticipantCardWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get favoriteFaction => 'Facción favorita';
}

// Path: match.ui_screens_match_join_sheet_content_widget
class _TranslationsMatchUiScreensMatchJoinSheetContentWidgetEs extends TranslationsMatchUiScreensMatchJoinSheetContentWidgetEn {
	_TranslationsMatchUiScreensMatchJoinSheetContentWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get confirmJoin => 'Confirmar unirse';
	@override String get subscriptionsClosed => 'Suscripciones cerradas';
	@override String get alreadySubscribed => 'Ya suscrito';
	@override String get cancel => 'Cancelar';
	@override String createdAtValue({required Object value}) => 'Creada el: ${value}';
	@override String get youCanBeTheFirstPlayerToLockThisTableIn => 'Puedes ser el primer jugador en bloquear esta partida.';
	@override String get theseAreTheCurrentPlayersThatWillParticipate => 'Estos son los jugadores actuales que participarán.';
	@override String get noPlayersSubscribedYet => 'Ningún jugador se ha suscrito todavía.';
	@override String get playersInThisMatch => 'Jugadores en este partida';
	@override String playersRange({required Object minPlayers, required Object maxPlayers}) => '${minPlayers}-${maxPlayers} jugadores';
	@override String seatsCount({required Object subscribedPlayersCount, required Object maxPlayers}) => '${subscribedPlayersCount}/${maxPlayers} plazas';
	@override String get unknownHost => 'Anfitrión desconocido';
	@override String get seeTableChat => 'Ver partida de chat';
	@override String get newPlayersCannotJoinAtThisTime => 'En este momento no se pueden unir nuevos jugadores.';
	@override String get theHostHasClosedSubscriptionsForThisTable => 'El anfitrión ha cerrado las suscripciones para esta partida.';
	@override String get confirmTableSubscription => 'Confirmar suscripción a la partida';
}

// Path: match.ui_screens_match_table_card_widget
class _TranslationsMatchUiScreensMatchTableCardWidgetEs extends TranslationsMatchUiScreensMatchTableCardWidgetEn {
	_TranslationsMatchUiScreensMatchTableCardWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get subscribed => 'suscrito';
	@override String get tapCardToOpenChat => 'Toca la tarjeta para abrir el chat';
	@override String get shareThisMatch => 'Compartir partida';
	@override String get share => 'Compartir';
	@override String get showMore => 'Ver más';
	@override String get subscriptionsClosed => 'Suscripciones cerradas';
	@override String get openFullLocationDetails => 'Abrir detalles completos de la ubicación';
	@override String playersRange({required Object minPlayers, required Object maxPlayers}) => '${minPlayers}-${maxPlayers} jugadores';
	@override String playersRangeTooltip({required Object minPlayers, required Object maxPlayers}) => 'Esta mesa puede empezar con un mínimo de ${minPlayers} jugadores y acepta hasta ${maxPlayers} jugadores.';
	@override String get places => 'plazas';
	@override String get place => 'plaza';
	@override String get s => 's';
	@override String get joining => 'Uniéndote...';
	@override String get closed => 'Cerrada';
	@override String get tableFull => 'Partida llena';
	@override String get joinTable => 'Unirse a la partida';
	@override String get unknownLocation => 'Ubicación no informada';
	@override String get addressUnavailable => 'Dirección no disponible';
	@override String get player => 'jugador';
	@override String get players => 'jugadores';
	@override String subscriptionTooltip({required Object subscribedPlayersCount, required Object playersWord, required Object remainingSeats, required Object placesWord}) => '${subscribedPlayersCount} ${playersWord} suscritos y ${remainingSeats} ${placesWord} restantes para cerrar la partida.';
}

// Path: match.ui_screens_match_actionable_info_row_widget
class _TranslationsMatchUiScreensMatchActionableInfoRowWidgetEs extends TranslationsMatchUiScreensMatchActionableInfoRowWidgetEn {
	_TranslationsMatchUiScreensMatchActionableInfoRowWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String copyLabel({required Object label}) => 'Copiar ${label}';
	@override String openLabel({required Object label}) => 'Abrir ${label}';
}

// Path: match.ui_screens_match_join_sheet_loading_widget
class _TranslationsMatchUiScreensMatchJoinSheetLoadingWidgetEs extends TranslationsMatchUiScreensMatchJoinSheetLoadingWidgetEn {
	_TranslationsMatchUiScreensMatchJoinSheetLoadingWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String loadingTableDetailsForTitle({required Object tableTitle}) => 'Cargando detalles de la mesa "${tableTitle}"...';
}

// Path: match.ui_sheets_match_share_sheet
class _TranslationsMatchUiSheetsMatchShareSheetEs extends TranslationsMatchUiSheetsMatchShareSheetEn {
	_TranslationsMatchUiSheetsMatchShareSheetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get shareThisMatch => 'Compartir esta partida';
	@override String get copyOrShareToInvitePlayers => 'Copia el enlace o compártelo para invitar jugadores.';
	@override String get copyLink => 'Copiar enlace';
	@override String get copied => 'Copiado';
	@override String get orDivider => 'O';
	@override String get shareInWhatsApp => 'Compartir en WhatsApp';
	@override String get shareInMessenger => 'Compartir en Messenger';
	@override String get shareInTelegram => 'Compartir en Telegram';
	@override String get chooseWhereToShare => 'Elegir dónde compartir';
	@override String get copyFailed => 'No se pudo copiar el enlace.';
	@override String get unableToOpenWhatsApp => 'No se pudo abrir WhatsApp ahora.';
	@override String get unableToOpenTelegram => 'No se pudo abrir Telegram ahora.';
}

// Path: match.ui_screens_match_location_header_image_widget
class _TranslationsMatchUiScreensMatchLocationHeaderImageWidgetEs extends TranslationsMatchUiScreensMatchLocationHeaderImageWidgetEn {
	_TranslationsMatchUiScreensMatchLocationHeaderImageWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get locationDetails => 'Detalles de la ubicación';
}

// Path: match.ui_screens_match_create_table_location_no_recent_locations_widget
class _TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetEs extends TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationNoRecentLocationsWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get noPreviousLocationsYetSearchAndSelectOneAbove => 'Aún no hay ubicaciones anteriores. Busque y seleccione uno arriba.';
}

// Path: match.ui_screens_match_chat_screen
class _TranslationsMatchUiScreensMatchChatScreenEs extends TranslationsMatchUiScreensMatchChatScreenEn {
	_TranslationsMatchUiScreensMatchChatScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get chooseFromGallery => 'Elige de la galería';
	@override String get takePhoto => 'tomar foto';
	@override String get cancel => 'Cancelar';
	@override String get chooseFromLibrary => 'Elija de la biblioteca';
	@override String get takePhoto2 => 'tomar foto';
	@override String get sendAPhoto => 'enviar una foto';
	@override String get confirmPhoto => 'Confirmar foto';
	@override String get addAMessageOptional => 'Agregar un mensaje (opcional)';
	@override String get sendPhoto => 'Enviar foto';
	@override String imageCompressionPrompt({required Object selectedImageMb, required Object maxAllowedMb}) => 'Esta imagen tiene ${selectedImageMb}MB, pero el límite es ${maxAllowedMb}MB. ¿Comprimirla automáticamente antes de enviar?';
	@override String get compress => 'Comprimir';
	@override String get cancel2 => 'Cancelar';
	@override String get imageIsTooLarge => 'La imagen es demasiado grande.';
	@override String get subscribed => 'suscrito';
	@override String get unableToResolveYourAccountInformation => 'No se puede resolver la información de su cuenta.';
	@override String get noMessagesYet => 'Aún no hay mensajes';
	@override String get voiceMessage => 'Mensaje de voz';
	@override String matchTitleFallback({required Object scheduledMatchId}) => 'Partida #${scheduledMatchId}';
	@override String get typeAMessage => 'Escribe un mensaje';
	@override String get tableInfo => 'Información de la partida';
	@override String get playedMatchInfo => 'Información de partida finalizada';
	@override String get editTable => 'Editar partida';
}

// Path: match.ui_dialogs_match_played_match_summary_dialog
class _TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogEs extends TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogEn {
	_TranslationsMatchUiDialogsMatchPlayedMatchSummaryDialogEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get completedMatchReport => 'Reporte de Partida Finalizada';
	@override String get winner => 'Ganador';
	@override String get notAvailable => 'No disponible';
	@override String startedAtLabel({required Object value}) => 'Inicio: ${value}';
	@override String durationLabel({required Object value}) => 'Duración: ${value}';
	@override String scheduledAtLabel({required Object value}) => 'Programada: ${value}';
	@override String get matchProofs => 'Pruebas de la Partida';
	@override String get players => 'Jugadores';
	@override String get domination => 'Dominación';
	@override String scoreLabel({required Object value}) => '${value} pts';
	@override String get close => 'Cerrar';
	@override String hoursMinutes({required Object hours, required Object minutes}) => '${hours}h ${minutes}m';
}

// Path: match.ui_screens_match_create_table_location_loading_recent_widget
class _TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetEs extends TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetEn {
	_TranslationsMatchUiScreensMatchCreateTableLocationLoadingRecentWidgetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get loadingPreviousLocations => 'Cargando ubicaciones anteriores...';
}

// Path: register_match.ui_sheets_register_match_wizard_winner_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardWinnerStepSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get dominance => 'Dominio';
	@override String get dominanceCoalition => 'Dominio (coalición)';
	@override String get totalPoints30 => 'Puntos totales (30)';
	@override String stepSelectTheWinner({required Object stepNumber}) => '${stepNumber}) Selecciona al ganador';
	@override String get dominanceMeansTheWinnerCompletedADominanceCardObjectiveInsteadOfWinningB => 'Dominio significa que el ganador completó un objetivo de la tarjeta Dominio en lugar de ganar por puntos.';
	@override String get totalPointsMeansTheWinnerReached30VictoryPointsOnTheScoreTrack => 'El total de puntos significa que el ganador alcanzó 30 puntos de victoria en el marcador.';
	@override String get howDidTheWinnerWon => '¿Cómo ganó el ganador?';
	@override String get pickThePlayerWhoWonThisMatch => 'Elige el jugador que ganó este partido.';
	@override String get vagabondCoalitionWin => 'Victoria en coalición con Vagabundo';
	@override String get ifWinnerWonByDominanceSelectOneVagabondToWinToo => 'Si el ganador venció por dominio con coalición, selecciona un Vagabundo que también ganó.';
	@override String get selectingVagabondForcesDominance => 'Seleccionar un Vagabundo aquí obliga a usar dominio como método de victoria.';
}

// Path: register_match.ui_sheets_register_match_wizard_timing_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardTimingStepSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get estimatedDuration => 'Duración estimada';
	@override String get estimatedDuration2 => 'Duración estimada';
	@override String stepEstimatedMatchDuration({required Object stepNumber}) => '${stepNumber}) Duración estimada de la partida';
	@override String get setTheEstimatedDurationAdjustIn15MinuteStepsMax8Hours => 'Establezca la duración estimada. Ajuste en pasos de 15 minutos (máximo 8 horas).';
	@override String get changeTime => 'Cambiar hora';
	@override String stepMatchStartedAt({required Object stepNumber}) => '${stepNumber}) La partida empezó a las';
	@override String get matchStartedAt => 'El partido empezó a las';
	@override String get setTheTimeTheMatchActuallyStarted => 'Establece la hora a la que realmente comenzó el partido.';
}

// Path: register_match.ui_sheets_register_match_wizard_participants_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardParticipantsStepSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get addRegisteredPlayerFromPlatform => 'Agregar jugador registrado desde la plataforma';
	@override String get addAnonymousPlayer => 'Agregar jugador anónimo';
	@override String get registeredPlayer => 'Jugador registrado';
	@override String get anonymousPlayer => 'Jugador anónimo';
	@override String get selectRegisteredPlayersWhoWerePresentYouCanAddAnonymousPlayersOrSearchFo => 'Seleccionar jugadores registrados que estuvieron presentes. Puedes agregar jugadores anónimos o buscar otros jugadores registrados.';
	@override String get value1WhoActuallyPlayed => '1) ¿Quién jugó realmente?';
}

// Path: register_match.ui_sheets_register_match_picker_error_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerErrorSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get retry => 'Rever';
}

// Path: register_match.ui_sheets_register_match_picker_match_item_card
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardEs extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerMatchItemCardEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get notAvailableYet => 'Aún no disponible';
	@override String get tapToReport => 'Toca para informar';
	@override String get cancelMatch => 'Cancelar partida';
	@override String get registerMatchResult => 'Registrar resultado de la partida';
}

// Path: register_match.ui_sheets_register_match_wizard_factions_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardFactionsStepSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get selectFaction => 'Seleccionar facción';
	@override String get faction => 'Facción';
	@override String get chooseTheFactionUsedByEachPlayerInThisMatch => 'Elige la facción utilizada por cada jugador en esta partida.';
	@override String get value2SelectFactions => '2) Seleccionar facciones';
	@override String get firstVagabond => 'Primer Vagabundo';
	@override String get secondVagabond => 'Segundo Vagabundo';
}

// Path: register_match.ui_sheets_register_match_search_registered_player_sheet
class _TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetEs extends TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchSearchRegisteredPlayerSheetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get tapToAdd => 'Toca para agregar';
	@override String get alreadyAddedToThisReport => 'Ya agregado a este informe';
	@override String noPlayersFoundForQuery({required Object query}) => 'No se encontraron jugadores para "${query}".';
	@override String get noRegisteredPlayersWereFound => 'No se encontraron jugadores registrados.';
	@override String get searchByDisplayName => 'Buscar por nombre para mostrar';
	@override String get addRegisteredPlayer => 'Agregar jugador registrado';
}

// Path: register_match.ui_sheets_register_match_wizard_points_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardPointsStepSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get value0To29 => '0 a 29';
	@override String get points => 'Agujas';
	@override String get dominanceAttempt => 'intento de dominancia';
	@override String get failedNoPoints => 'Falló (sin puntos)';
	@override String get winnerByDominance => 'Ganador por dominio';
	@override String get winnerByPoints => 'Ganador por puntos';
	@override String get failedDominance => 'Dominio fallido';
	@override String stepPointsByPlayer({required Object stepNumber}) => '${stepNumber}) Puntos por jugador';
	@override String get points2 => 'Agujas';
	@override String get noPoints => 'Sin puntos';
	@override String get winner => 'Ganador';
	@override String get failedDominanceAlwaysCountsAsNoPoints => 'El dominio fallido siempre no cuenta como puntos.';
	@override String get forEachNonWinnerSetPointsOrMarkFailedDominanceAttempt => 'Por cada no ganador, establezca puntos o marque el intento fallido de dominio.';
}

// Path: register_match.ui_sheets_register_match_wizard_bottom_actions_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardBottomActionsSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get submitReport => 'Enviar informe';
	@override String get back => 'Atrás';
	@override String get cancel => 'Cancelar';
	@override String get continueButton => 'Continuar';
}

// Path: register_match.ui_sheets_register_match_picker_empty_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerEmptySectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get youDoNotHaveAnyHostedSubscribedMatchPendingResultRegistration => 'No tienes ningún partido alojado/suscrito pendiente de registro de resultados.';
	@override String get noPendingMatches => 'No hay partidos pendientes';
}

// Path: register_match.ui_sheets_register_match_wizard_loading_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardLoadingSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get loadingMatchDetails => 'Cargando detalles del partido...';
}

// Path: register_match.ui_sheets_register_match_picker_sheet
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetEs extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerSheetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get youCanRegisterThisMatchFrom2HoursBeforeItsScheduledStart => 'Puedes registrar este partido desde 2 horas antes de su inicio programado.';
	@override String get resultRegistrationNotAvailableYet => 'Registro de resultados aún no disponible';
	@override String tryAgainAfter({required Object dateTimeLabel}) => 'Vuelve a intentarlo después de ${dateTimeLabel}.';
}

// Path: register_match.ui_sheets_register_match_add_anonymous_player_sheet
class _TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetEs extends TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchAddAnonymousPlayerSheetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get tapToAdd => 'Toca para agregar';
	@override String get alreadyAddedToThisReport => 'Ya agregado a este informe';
	@override String get noAnonymousPlayersYetCreateOneUsingFirstAndLastName => 'Aún no hay jugadores anónimos. Crea uno usando nombre y apellido.';
	@override String get createAndAddPlayer => 'Crear y agregar jugador';
	@override String get lastName => 'Apellido';
	@override String get firstName => 'Nombre de pila';
	@override String get addAnonymousPlayer => 'Agregar jugador anónimo';
}

// Path: register_match.ui_sheets_register_match_wizard_top_bar_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardTopBarSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get registerMatchResult => 'Registrar resultado del partido';
}

// Path: register_match.ui_sheets_register_match_wizard_error_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardErrorSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get close => 'Cerca';
	@override String get registerMatch => 'Registrar partido';
}

// Path: register_match.ui_sheets_register_match_wizard_sheet
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardSheetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get gallery => 'Galería';
	@override String get camera => 'Cámara';
	@override String get cancel => 'Cancelar';
	@override String get gallery2 => 'Galería';
	@override String get camera2 => 'Cámara';
	@override String get selectSource => 'Seleccionar fuente';
	@override String get selectedImageIsEmptyChooseAnotherImage => 'La imagen seleccionada está vacía. Elige otra imagen.';
	@override String get invalidImage => 'Imagen no válida';
	@override String get allowCameraAndPhotoPermissionsInSystemSettingsAndTryAgain => 'Permita permisos de cámara y fotografías en la configuración del sistema e inténtelo nuevamente.';
	@override String get unableToAccessCameraOrGallery => 'No se puede acceder a la cámara o galería';
	@override String get ok => 'De acuerdo';
	@override String get takeASelfieWithEveryoneAtTheTableIfPossibleIncludeTheBoardInTheSamePhoto => 'Tómate un selfie con todos en la mesa. Si es posible, incluye el tablero en la misma foto.';
	@override String get groupSelfieProof => 'A prueba de selfies grupales';
	@override String get completeAllReportStepsBeforeSubmitting => 'Complete todos los pasos del informe antes de enviarlo.';
	@override String get incompleteReport => 'Informe incompleto';
	@override String get addTheBoardPhotoBeforeContinuing => 'Añade la foto del tablero antes de continuar.';
	@override String get boardPhotoRequired => 'Se requiere foto del tablero';
	@override String get addTheGroupSelfieBeforeContinuing => 'Agrega la selfie grupal antes de continuar.';
	@override String get groupPhotoRequired => 'Se requiere foto de grupo';
	@override String get matchDurationMustBeAtMost8Hours => 'La duración del partido debe ser como máximo de 8 horas.';
	@override String get invalidDuration => 'Duración no válida';
	@override String get matchDurationMustBeGreaterThanZero => 'La duración del partido debe ser mayor que cero.';
	@override String get invalidDuration2 => 'Duración no válida';
	@override String get matchStartTimeCannotBeInTheFuture => 'La hora de inicio del partido no puede ser en el futuro.';
	@override String get invalidMatchRegistration => 'Registro de partido no válido';
	@override String get selectWhenThisMatchStarted => 'Selecciona cuándo comenzó este partido.';
	@override String get matchStartMissing => 'Falta el inicio del partido';
	@override String get invalidPoints => 'Puntos no válidos';
	@override String get pointsMissing => 'Faltan puntos';
	@override String get selectHowTheWinnerWonBeforeContinuing => 'Seleccione cómo ganó el ganador antes de continuar.';
	@override String get winnerMethodMissing => 'Falta el método ganador';
	@override String get selectTheWinnerBeforeContinuing => 'Selecciona el ganador antes de continuar.';
	@override String get winnerMissing => 'falta el ganador';
	@override String get theSelectedWinnerIsNoLongerInTheParticipantList => 'El ganador seleccionado ya no se encuentra en la lista de participantes.';
	@override String get winnerMissing2 => 'falta el ganador';
	@override String get selectTheWinnerBeforeContinuing2 => 'Selecciona el ganador antes de continuar.';
	@override String get winnerMissing3 => 'falta el ganador';
	@override String get invalidFactionSetup => 'Configuración de facción no válida';
	@override String get factionMissing => 'Falta facción';
	@override String get selectAtLeast2ParticipantsRegisteredAndOrAnonymousToContinue => 'Seleccione al menos 2 participantes (registrados y/o anónimos) para continuar.';
	@override String get notEnoughPlayers => 'No hay suficientes jugadores';
	@override String get edit => 'Editar';
	@override String get youKeptTheDefaultDurationOf1HourDoYouWantToContinueWithIt => 'Mantuviste la duración predeterminada de 1 hora. ¿Quieres continuar con ello?';
	@override String get keepDefaultDuration => '¿Mantener la duración predeterminada?';
	@override String get matchStartTimeCannotBeInTheFuture2 => 'La hora de inicio del partido no puede ser en el futuro.';
	@override String get invalidMatchRegistration2 => 'Registro de partido no válido';
	@override String get matchStartTimeCannotBeInTheFuture3 => 'La hora de inicio del partido no puede ser en el futuro.';
	@override String get invalidMatchRegistration3 => 'Registro de partido no válido';
	@override String get whenDidTheMatchStart => '¿Cuándo empezó la partida?';
	@override String get selectStartTime => 'Selecciona la hora de inicio';
	@override String get unableToLoadThisMatchReportFlow => 'No se puede cargar este flujo de informe de partido.';
	@override String get matchNotFound => 'Partida no encontrada';
	@override String get unableToLoadThisMatchReportFlow2 => 'No se puede cargar este flujo de informe de partido.';
	@override String get invalidMatch => 'Partida inválida';
	@override String get continueButton => 'Continuar';
	@override String participantMustHavePointsBetween0And29({required Object participantName}) => '${participantName} debe tener puntos entre 0 y 29.';
	@override String enterValidPointsForParticipantOrMarkFailedDominance({required Object participantName}) => 'Ingresa puntos válidos para ${participantName} o marca dominancia fallida.';
	@override String selectFactionForParticipantBeforeContinuing({required Object participantName}) => 'Selecciona una facción para ${participantName} antes de continuar.';
	@override String factionWasSelectedMoreThanOnceEachFactionCanOnlyBeSelectedOnce({required Object factionName}) => '${factionName} se seleccionó más de una vez. Cada facción solo se puede seleccionar una vez.';
	@override String onlyVagabondCanBeSelectedMoreThanOnce({required Object factionName}) => '${factionName} no puede repetirse. Solo Vagabundo puede seleccionarse más de una vez.';
	@override String get youCanSelectAtMostTwoVagabonds => 'Puedes seleccionar como máximo dos Vagabundos.';
	@override String get coalitionWinnerMustBeInTheParticipantList => 'El ganador por coalición seleccionado ya no está en la lista de participantes.';
	@override String get coalitionWinnerMustBeDifferentFromTheMainWinner => 'El ganador por coalición debe ser un participante diferente del ganador principal.';
	@override String get coalitionWinnerMustBeAVagabond => 'Solo un Vagabundo puede ser seleccionado como ganador por coalición.';
	@override String get coalitionWinRequiresDominance => 'La victoria por coalición requiere dominio como método de victoria.';
}

// Path: register_match.ui_sheets_register_match_wizard_review_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewStepSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get boardPhoto => 'Foto del tablero';
	@override String estimatedDurationValue({required Object value}) => 'Duración estimada: ${value}';
	@override String get groupPhoto => 'Foto de grupo';
	@override String matchStartedValue({required Object value}) => 'Partida iniciada: ${value}';
	@override String get socialProof => 'prueba social';
	@override String get ranking => 'Categoría';
	@override String stepReviewAndSubmit({required Object stepNumber}) => '${stepNumber}) Revisar y enviar';
	@override String winnerMethodValue({required Object value}) => 'Método de victoria: ${value}';
	@override String get confirmAllDetailsBeforeLoggingThisMatch => 'Confirma todos los detalles antes de iniciar sesión en este partido.';
}

// Path: register_match.ui_sheets_register_match_wizard_review_photo_tile
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardReviewPhotoTileEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get ready => 'Listo';
	@override String get missing => 'Desaparecido';
}

// Path: register_match.ui_sheets_register_match_wizard_proof_card_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardProofCardSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get tapToReplace => 'Toca para reemplazar';
	@override String get tapToAddPhoto => 'Toca para agregar una foto';
}

// Path: register_match.ui_sheets_register_match_picker_header_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchPickerHeaderSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get selectAMatchYouParticipatedInYouCanRegisterAResultFrom2HoursBeforeSchedu => 'Selecciona un partido en el que participaste. Puedes registrar un resultado desde 2 horas antes del inicio programado.';
	@override String pendingMatchesCount({required Object count}) => '${count} pendientes';
	@override String get registerMatchResult => 'Registrar resultado del partido';
}

// Path: register_match.ui_sheets_register_match_wizard_social_proof_step_section
class _TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionEs extends TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionEn {
	_TranslationsRegisterMatchUiSheetsRegisterMatchWizardSocialProofStepSectionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get captureTheBoardAndScoreTrackClearly => 'Capture el tablero y puntúe la pista con claridad.';
	@override String get boardPhoto => 'Foto del tablero';
	@override String get uploadAPhotoOfTheBoardWithTheScoreTrackClearlyVisible => 'Sube una foto del tablero con el marcador de puntuación claramente visible.';
	@override String get boardPhotoProof => 'Prueba fotográfica de tablero';
	@override String stepSocialProof({required Object stepNumber}) => '${stepNumber}) Prueba social';
	@override String get selfieWithAllPlayersIncludeTheBoardIfPossible => 'Selfie con todos los jugadores. Incluya el tablero si es posible.';
	@override String get groupPhoto => 'Foto de grupo';
	@override String get uploadBothPhotosToConfirmThisMatchHappenedInPerson => 'Sube ambas fotos para confirmar que esta partida ocurrió en persona.';
}

// Path: register_match.ui_states_register_match_provider
class _TranslationsRegisterMatchUiStatesRegisterMatchProviderEs extends TranslationsRegisterMatchUiStatesRegisterMatchProviderEn {
	_TranslationsRegisterMatchUiStatesRegisterMatchProviderEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get invalidMatchTitle => 'Partida inválida';
	@override String get invalidMatchDescription => 'La partida seleccionada no es válida.';
	@override String get unableToPrepareGroupPhotoTitle => 'No se pudo preparar la foto grupal';
	@override String get unableToPrepareGroupPhotoDescription => 'La foto grupal seleccionada no pudo prepararse para la subida.';
	@override String get unableToPrepareBoardPhotoTitle => 'No se pudo preparar la foto del tablero';
	@override String get unableToPrepareBoardPhotoDescription => 'La foto del tablero seleccionada no pudo prepararse para la subida.';
	@override String get unableToUploadProofImageTitle => 'No se pudo subir la imagen de prueba';
	@override String get unableToUploadProofImageReadDescription => 'No se pudo leer la imagen seleccionada para la subida.';
	@override String get unableToUploadProofImageNetworkDescription => 'La subida de la imagen falló antes de llegar al almacenamiento.';
	@override String get unableToUploadProofImageStorageDescription => 'El proveedor de almacenamiento rechazó la imagen seleccionada.';
}

// Path: register_match.ui_dialogs_register_match_cancel_match_dialog
class _TranslationsRegisterMatchUiDialogsRegisterMatchCancelMatchDialogEs extends TranslationsRegisterMatchUiDialogsRegisterMatchCancelMatchDialogEn {
	_TranslationsRegisterMatchUiDialogsRegisterMatchCancelMatchDialogEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get cancelMatchTitle => 'Cancelar partida';
	@override String get cancelMatchDescription => 'Marca esta partida programada como no jugada y comparte el motivo con los participantes.';
	@override String get reasonLabel => 'Motivo';
	@override String get optionalReasonDetailsLabel => 'Detalles opcionales';
	@override String get optionalReasonDetailsHint => 'Comparte cualquier contexto para los jugadores.';
	@override String get detailsRequiredForOtherReason => 'Agrega detalles al seleccionar "Otro".';
	@override String get keepMatch => 'Mantener partida';
	@override String get confirmCancelMatch => 'Confirmar cancelación';
	@override String get reasonNotEnoughPlayers => 'No hay suficientes jugadores';
	@override String get reasonHostUnavailable => 'Anfitrión no disponible';
	@override String get reasonNoGameCopyAvailable => 'No hay copia del juego disponible';
	@override String get reasonVenueIssue => 'Problema del local';
	@override String get reasonPlayerNoShow => 'Jugador ausente';
	@override String get reasonWeatherOrEmergency => 'Clima o emergencia';
	@override String get reasonExpiredWithoutResult => 'Expiró sin resultado después de 24 horas';
	@override String get reasonOther => 'Otro';
}

// Path: register_match.ui_dialogs_register_match_success_dialog
class _TranslationsRegisterMatchUiDialogsRegisterMatchSuccessDialogEs extends TranslationsRegisterMatchUiDialogsRegisterMatchSuccessDialogEn {
	_TranslationsRegisterMatchUiDialogsRegisterMatchSuccessDialogEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Partida registrada con éxito';
	@override String get description => 'El ganador, las facciones y las fotos de prueba se guardaron correctamente.';
	@override String get details => 'Todos en esta mesa ahora pueden encontrar la partida completada en su historial.';
	@override String get close => 'Cerrar';
}

// Path: shop.ui_screens_shop_screen
class _TranslationsShopUiScreensShopScreenEs extends TranslationsShopUiScreensShopScreenEn {
	_TranslationsShopUiScreensShopScreenEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get shopHeaderTitle => 'Arma tu colección de Root';
	@override String get shopHeaderDescription => 'Compra el juego base y las expansiones con detalles localizados de la caja y accesos rápidos a marketplaces.';
	@override String get whereToBuy => 'Dónde comprar';
	@override String buyAt({required Object store}) => 'Comprar en ${store}';
	@override String get invalidStoreUrl => 'Este enlace de tienda no es válido.';
	@override String get unableToOpenStoreUrl => 'No se pudo abrir este enlace de tienda ahora.';
	@override String get closeGallery => 'Cerrar galería';
	@override String get noProductsAvailable => 'Aún no hay productos disponibles para este idioma.';
}

// Path: auth.auth_login_screen.errors
class _TranslationsAuthAuthLoginScreenErrorsEs extends TranslationsAuthAuthLoginScreenErrorsEn {
	_TranslationsAuthAuthLoginScreenErrorsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get invalidEmail => 'Correo inválido.';
	@override String get invalidCredentials => 'Correo o contraseña inválidos. Verifica tus datos e inténtalo de nuevo.';
	@override String get tooManyLoginAttempts => 'Demasiados intentos de inicio de sesión. Inténtalo más tarde.';
	@override String get loginFailed => 'Ocurrió un error al iniciar sesión. Inténtalo de nuevo.';
	@override String get tooManyRegistrationAttempts => 'Demasiados intentos de registro. Inténtalo más tarde.';
	@override String get verificationCodeExpired => 'El código de verificación venció. Solicita uno nuevo.';
	@override String get invalidVerificationCode => 'Código de verificación inválido. Verifícalo e inténtalo de nuevo.';
	@override String get passwordPolicyViolation => 'La contraseña no cumple los requisitos. Elige una contraseña diferente.';
	@override String get registrationFailed => 'Ocurrió un error durante el registro. Inténtalo más tarde.';
	@override String get tooManyPasswordResetAttempts => 'Demasiados intentos de restablecimiento de contraseña. Inténtalo más tarde.';
	@override String get passwordResetFailed => 'Ocurrió un error al restablecer la contraseña. Inténtalo más tarde.';
	@override String get networkUnavailable => 'No se pudo conectar con el servidor. Revisa tu conexión e inténtalo de nuevo.';
	@override String get unexpected => 'Ocurrió un error inesperado. Inténtalo de nuevo.';
}

// Path: home.ui_screens_recommended_compositions_screen.boxNames
class _TranslationsHomeUiScreensRecommendedCompositionsScreenBoxNamesEs extends TranslationsHomeUiScreensRecommendedCompositionsScreenBoxNamesEn {
	_TranslationsHomeUiScreensRecommendedCompositionsScreenBoxNamesEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get baseGame => 'Juego Base';
	@override String get riverfolkExpansion => 'Expansión Riverfolk';
	@override String get underworldExpansion => 'Expansión Underworld';
	@override String get marauderExpansion => 'Expansión Marauder';
}

// Path: home.ui_content_root_community_tools_content.advancedSetupFactionGuideBodies
class _TranslationsHomeUiContentRootCommunityToolsContentAdvancedSetupFactionGuideBodiesEs extends TranslationsHomeUiContentRootCommunityToolsContentAdvancedSetupFactionGuideBodiesEn {
	_TranslationsHomeUiContentRootCommunityToolsContentAdvancedSetupFactionGuideBodiesEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get marquiseDeCat => '<h>Clase de la facción<h>\n*Militante*\n\n<h>Reglas del territorio inicial<h>\n- Usa 3 territorios iniciales.\n- Usa tres territorios iniciales, cada uno adyacente al menos a otro territorio inicial.\n- No hace falta tocar el borde del mapa.\n\n<h>Pasos de preparación<h>\n- Elige tres claros iniciales que formen una cadena conectada\n- Coloca 2 guerreros en cada territorio inicial\n- Coloca 1 guerrero en cada otro claro\n- Coloca la fortaleza en un territorio inicial, prefiriendo uno que no sea adyacente a un territorio inicial enemigo\n- Coloca 1 serrería, 1 taller y 1 reclutador en el mapa, cada uno en un territorio inicial diferente\n- Completa las pistas de edificios, dejando vacía solo la casilla más a la izquierda de cada pista';
	@override String get eyrieDynasties => '<h>Clase de la facción<h>\n*Militante*\n\n<h>Reglas del territorio inicial<h>\n- Usa 1 territorio inicial.\n- Un territorio inicial debe tocar el borde del mapa.\n- Intenta mantener al menos 2 claros entre este territorio inicial y cualquier territorio inicial enemigo.\n\n<h>Pasos de preparación<h>\n- Elige un territorio inicial en el borde del mapa\n- Si es posible, ese territorio inicial debe tener al menos dos claros entre él y los territorios iniciales enemigos\n- Coloca 6 guerreros y 1 nido en ese territorio inicial\n- Elige cualquier líder y colócalo en el espacio de líder\n- Deja a los demás líderes boca arriba cerca\n- Coloca los 2 visires leales según el líder elegido\n- Completa la pista de nidos, dejando vacía solo la casilla más a la izquierda';
	@override String get woodlandAlliance => '<h>Clase de la facción<h>\n*Insurgente*\n\n<h>Reglas del territorio inicial<h>\n- No usa territorios iniciales.\n\n<h>Pasos de preparación<h>\n- Roba 3 cartas a la pila de simpatizantes\n- Llena la pista de simpatía con todos los marcadores de simpatía\n- Coloca las 3 bases en los espacios de base correspondientes del tablero de facción';
	@override String get vagabond => '<h>Clase de la facción<h>\n*Insurgente*\n\n<h>Reglas del territorio inicial<h>\n- No usa territorios iniciales.\n- Empieza en cualquier bosque.\n\n<h>Pasos de preparación<h>\n- Coloca la peana en cualquier bosque\n- Baraja el mazo de misiones y revela 3 misiones cerca\n- Coloca aleatoriamente los 4 objetos de ruina bajo las ruinas, a menos que otra facción ya haya gestionado los objetos de ruina en esta preparación\n- Coloca la carta de personaje asignada en el espacio de personaje\n- Toma los objetos iniciales indicados para ese personaje y colócalos en la bolsa / pistas correspondientes\n- Después de la preparación, coloca los marcadores de relación de las facciones no Vagabundo en juego en indiferente\n\n<h>Notas especiales<h>\n<i>- En el AdSet público de la era Marauder, revelar una carta de preparación del Vagabundo también revela una carta aleatoria de personaje del Vagabundo<i>\n<i>- En el Apéndice A vivo posterior a Marauder, el soporte futuro debe permitir una o dos cartas de preparación del Vagabundo en la reserva del draft<i>';
	@override String get theLizardCult => '<h>Clase de la facción<h>\n*Insurgente*\n\n<h>Reglas del territorio inicial<h>\n- Usa 1 territorio inicial.\n- Prefiere un territorio inicial que no sea adyacente a un territorio inicial enemigo.\n\n<h>Pasos de preparación<h>\n- Elige un territorio inicial que no sea adyacente a un territorio inicial enemigo, si es posible\n- Coloca 4 guerreros y 1 jardín correspondiente en ese territorio inicial\n- Distribuye 3 guerreros más entre los claros adyacentes de la forma más uniforme posible\n- Coloca 2 guerreros en la caja de acólitos\n- Completa las pistas de jardines, dejando vacía la casilla más a la izquierda del tipo de jardín ya colocado en el mapa\n- Coloca el marcador de proscrito en su lado de proscrito';
	@override String get riverfolkCompany => '<h>Clase de la facción<h>\n*Insurgente*\n\n<h>Reglas del territorio inicial<h>\n- No usa territorios iniciales.\n- Coloca a los guerreros iniciales solo en claros con río.\n\n<h>Pasos de preparación<h>\n- Coloca 4 guerreros entre cualesquiera claros con río\n- Coloca 3 guerreros en la caja de pagos\n- Completa las pistas de puestos comerciales con los puestos comerciales correspondientes\n- Coloca los 3 marcadores de servicio en la pista de servicios y fija el precio de cada servicio';
	@override String get undergroundDuchy => '<h>Clase de la facción<h>\n*Militante*\n\n<h>Reglas del territorio inicial<h>\n- Usa 1 territorio inicial.\n- Prefiere un territorio inicial que no sea adyacente a un territorio inicial enemigo.\n\n<h>Pasos de preparación<h>\n- Elige un territorio inicial que no sea adyacente a un territorio inicial enemigo, si es posible\n- Coloca 2 guerreros y 1 túnel en ese territorio inicial\n- Distribuye 5 guerreros más entre los claros adyacentes de la forma más uniforme posible\n- Coloca el tablero de la Madriguera junto al mapa\n- Completa ambas pistas de edificios con ciudadelas y mercados\n- Coloca a los 9 ministros boca arriba en la pila de ministros no influenciados\n- Coloca las 9 coronas en los espacios de puntos de victoria mostrados en el tablero de facción';
	@override String get corvidConspiracy => '<h>Clase de la facción<h>\n*Insurgente*\n\n<h>Reglas del territorio inicial<h>\n- Usa 1 territorio inicial.\n\n<h>Pasos de preparación<h>\n- Elige un claro inicial\n- Coloca allí 1 guerrero y 1 ficha de complot boca abajo a tu elección\n- Coloca 1 guerrero en un claro de cada palo, contando la colocación del territorio inicial, para un total de 4 guerreros\n\n<h>Nota de localización<h>\n<i>- La etiqueta francesa de arriba es la mejor coincidencia pública encontrada en referencias comunitarias / leyes traducidas, pero aun así debe comprobarse contra un componente oficial en francés antes de publicar un texto exacto en la interfaz<i>';
	@override String get lordOfTheHundreds => '<h>Clase de la facción<h>\n*Militante*\n\n<h>Reglas del territorio inicial<h>\n- Usa 1 territorio inicial.\n- Un territorio inicial debe tocar el borde del mapa.\n- Intenta mantener al menos 2 claros entre este territorio inicial y cualquier territorio inicial enemigo.\n\n<h>Pasos de preparación<h>\n- Elige un territorio inicial en el borde del mapa\n- Si es posible, ese territorio inicial debe tener al menos dos claros entre él y los territorios iniciales enemigos\n- Coloca al señor de la guerra, 4 guerreros y la fortaleza en ese territorio inicial\n- Coloca la carta de humor obstinado en el espacio de humor\n- Coloca aleatoriamente los 4 objetos de ruina bajo las ruinas, a menos que otra facción ya haya gestionado los objetos de ruina en esta preparación';
	@override String get keepersInIron => '<h>Clase de la facción<h>\n*Militante*\n\n<h>Reglas del territorio inicial<h>\n- Usa 2 territorios iniciales.\n- Los territorios iniciales deben ser adyacentes entre sí.\n- Un territorio inicial debe tocar el borde del mapa.\n- Intenta mantener al menos 2 claros entre este territorio inicial y cualquier territorio inicial enemigo.\n\n<h>Pasos de preparación<h>\n- Baraja todas las reliquias boca abajo y coloca primero una reliquia aleatoria en cada bosque\n- Elige 2 claros iniciales adyacentes en el borde del mapa\n- Si es posible, esos territorios iniciales deben tener al menos dos claros entre ellos y los territorios iniciales enemigos\n- Coloca 4 guerreros en cada territorio inicial\n- Distribuye cualquier reliquia restante de la forma más uniforme posible entre bosques que no sean adyacentes a tus territorios iniciales\n- Coloca un guardián fiel en cada espacio de columna del séquito\n\n<h>Nota de localización<h>\n<i>- La etiqueta francesa de arriba sigue el uso actual del mercado francés, pero aun así merece una verificación manual con el conjunto de componentes localizado antes de publicar un texto exacto en la interfaz<i>';
}
