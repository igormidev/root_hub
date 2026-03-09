///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

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
	@override late final _TranslationsEndpointErrorTitlesPtBr endpointErrorTitles = _TranslationsEndpointErrorTitlesPtBr._(_root);
	@override late final _TranslationsErrorsPtBr errors = _TranslationsErrorsPtBr._(_root);
	@override late final _TranslationsFallbackPtBr fallback = _TranslationsFallbackPtBr._(_root);
	@override late final _TranslationsSystemMessagesPtBr systemMessages = _TranslationsSystemMessagesPtBr._(_root);
	@override late final _TranslationsPushNotificationsPtBr pushNotifications = _TranslationsPushNotificationsPtBr._(_root);
	@override late final _TranslationsLabelsPtBr labels = _TranslationsLabelsPtBr._(_root);
}

// Path: endpointErrorTitles
class _TranslationsEndpointErrorTitlesPtBr extends TranslationsEndpointErrorTitlesEn {
	_TranslationsEndpointErrorTitlesPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get invalidRequest => 'Invalid request';
	@override String get notFound => 'Resource not found';
	@override String get accessDenied => 'Access denied';
	@override String get configuration => 'Configuration error';
	@override String get endpointUnavailable => 'Endpoint unavailable';
	@override String get unexpected => 'Unexpected error';
}

// Path: errors
class _TranslationsErrorsPtBr extends TranslationsErrorsEn {
	_TranslationsErrorsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get authenticatedUserMissingTitle => 'Authenticated user missing';
	@override String get playerProfileAlreadyExistsTitle => 'Player profile already exists';
	@override String get playerProfileMissingTitle => 'Player profile missing';
	@override String get postNotFoundTitle => 'Post not found';
	@override String get matchNotFoundTitle => 'Match not found';
	@override String get scheduledMatchNotFoundTitle => 'Scheduled match not found';
	@override String get locationNotFoundTitle => 'Location not found';
	@override String get chatNotFoundTitle => 'Chat not found';
	@override String get tableNotFoundTitle => 'Table not found';
	@override String get playerNotFoundTitle => 'Player not found';
	@override String get playerNotSubscribedTitle => 'Player not subscribed';
	@override String get subscriptionsClosedTitle => 'Subscriptions closed';
	@override String get tableIsFullTitle => 'Table is full';
	@override String get subscriptionAlreadyExistsTitle => 'Subscription already exists';
	@override String get notSubscribedTitle => 'Not subscribed';
	@override String get invalidAnonymousPlayerTitle => 'Invalid anonymous player';
	@override String get invalidMatchRegistrationTitle => 'Invalid match registration';
	@override String get registrationNotAllowedTitle => 'Registration not allowed';
	@override String get locationProviderErrorTitle => 'Location provider error';
	@override String get accountDeletionEmailInvalid => 'Digite um endereco de e-mail valido.';
	@override String get tooManyPlayersTitle => 'Too many players';
	@override String get displayNameCannotBeEmpty => 'Display name cannot be empty.';
	@override String get locationRatioMustBeGreaterThanZero => 'Location ratio must be greater than zero.';
	@override String get authenticatedUserNotFound => 'Authenticated user was not found.';
	@override String get authenticatedUserAlreadyHasProfile => 'Authenticated user already has a player profile.';
	@override String get playerProfileNotFoundForAuthenticatedUser => 'Player profile not found for authenticated user.';
	@override String get authenticatedUserProfileNotFound => 'Authenticated user profile was not found.';
	@override String get noProfileFieldsProvided => 'No profile fields were provided for update.';
	@override String get pageMustBeAtLeastOne => 'Page must be greater than or equal to 1.';
	@override String postWithIdNotFound({required Object postId}) => 'Post with id ${postId} not found.';
	@override String matchWithIdNotFound({required Object matchId}) => 'Match with id ${matchId} not found.';
	@override String get scheduledMatchIdMustBeGreaterThanZero => 'Scheduled match id must be greater than zero.';
	@override String scheduledMatchWithIdNotFound({required Object scheduledMatchId}) => 'Scheduled match with id ${scheduledMatchId} was not found.';
	@override String get messageIdMustBeGreaterThanZero => 'Message id must be greater than zero.';
	@override String messageWithIdNotFound({required Object messageId}) => 'Message with id ${messageId} was not found.';
	@override String get reactionEmojiCannotBeEmpty => 'Reaction emoji cannot be empty.';
	@override String get onlyOwnMessagesCanBeDeleted => 'You can only delete messages that you sent.';
	@override String get systemMessagesCannotBeDeleted => 'System messages cannot be deleted.';
	@override String get scheduledPairingAttemptNotFound => 'Scheduled pairing attempt not found.';
	@override String locationWithIdNotFound({required Object locationId}) => 'Location with id ${locationId} was not found.';
	@override String get locationNotFound => 'Location not found.';
	@override String get pushTokenCannotBeEmpty => 'Push token cannot be empty.';
	@override String get pushTokenTooLong => 'Push token is too long.';
	@override String get queryMustNotBeEmpty => 'Query must not be empty.';
	@override String get currentLocationRequiredToFetchNearby => 'Current location is required to fetch nearby match schedules.';
	@override String get titleCannotBeEmpty => 'Title cannot be empty.';
	@override String get playersRangeMustStayBetweenTwoAndSix => 'Players range must stay between 2 and 6, with min not greater than max.';
	@override String scheduledTimeMustBeAtLeastMinutesInTheFuture({required Object minutes}) => 'The scheduled time must be at least ${minutes} minutes in the future.';
	@override String scheduledTimeCannotBeMoreThanDaysInTheFuture({required Object days}) => 'The scheduled time cannot be more than ${days} days in the future.';
	@override String get onlyHostCanEditTable => 'Only the host of the table can edit its details.';
	@override String tooManyPlayersSubscribed({required Object currentSubscriberCount}) => 'There are already ${currentSubscriberCount} players subscribed. You cannot set the maximum below that number.';
	@override String get onlyHostCanRemovePlayers => 'Only the host of the table can remove players.';
	@override String get youCannotRemoveYourself => 'You cannot remove yourself. Use leave table instead.';
	@override String get playerToRemoveWasNotFound => 'The player to remove was not found.';
	@override String get playerIsNotSubscribedToTable => 'This player is not subscribed to the table.';
	@override String get youAreNotSubscribedToThisMatch => 'You are not subscribed to this match.';
	@override String get alreadySubscribedToThisMatch => 'Already subscribed to this match.';
	@override String get hostClosedSubscriptions => 'The host has closed subscriptions for this table. No new players can join at this time.';
	@override String tableReachedMaximumPlayers({required Object maxPlayers}) => 'This table has reached its maximum of ${maxPlayers} players.';
	@override String get playerDataIdMustBeGreaterThanZero => 'Player data id must be greater than zero.';
	@override String get chatHistoryAndPlayerMustBePersisted => 'Chat history and player must be persisted.';
	@override String get messageMustIncludeTextOrImage => 'A mensagem deve incluir texto, uma imagem ou audio.';
	@override String get imageBytesCannotBeEmpty => 'Image bytes cannot be empty.';
	@override String get audioBytesCannotBeEmpty => 'Os bytes do audio nao podem estar vazios.';
	@override String get messageCannotIncludeImageAndAudio => 'A mensagem nao pode incluir imagem e audio ao mesmo tempo.';
	@override String get imageTooLargeSixMb => 'Image is too large. Please send an image smaller than 3 MB.';
	@override String get audioTooLarge => 'O audio esta muito grande. Envie um audio menor que 12 MB.';
	@override String chatHistoryForScheduledMatchNotFound({required Object scheduledMatchId}) => 'Chat history for scheduled match ${scheduledMatchId} was not found.';
	@override String get selectedTableWasNotFound => 'The selected table was not found.';
	@override String get unknownPlayer => 'Unknown player';
	@override String get unknownLocation => 'Unknown location';
	@override String get getMyPlayedMatchesNotImplemented => 'Get my played matches endpoint is not implemented yet.';
	@override String firstNameCannotBeEmpty({required Object label}) => '${label} cannot be empty.';
	@override String nameMustHaveAtLeastCharacters({required Object label, required Object minLength}) => '${label} must have at least ${minLength} characters.';
	@override String nameCannotExceedCharacters({required Object label, required Object maxLength}) => '${label} cannot exceed ${maxLength} characters.';
	@override String get matchEstimatedDurationMustBeGreaterThanZero => 'Match estimated duration must be greater than zero.';
	@override String get scheduledMatchAlreadyHasResult => 'This scheduled match already has a registered result.';
	@override String get providedLocationDoesNotMatchScheduledPairing => 'Provided location does not match the scheduled pairing attempt location.';
	@override String get atLeastTwoPlayersRequiredToRegister => 'At least 2 players are required to register a match.';
	@override String get rootMatchesMustHaveBetweenTwoAndSixPlayers => 'Root matches must have between 2 and 6 players.';
	@override String get atLeastOneWinnerRequired => 'A match must have at least one winner.';
	@override String winnerCountMustBeOneOrTwo({required Object winnerCount}) => 'A match must have one or two winners, but ${winnerCount} winners were provided.';
	@override String get exactlyOneWinnerRequiredNoneProvided => 'A match must have exactly one winner, but none was provided.';
	@override String exactlyOneWinnerRequiredCountProvided({required Object winnerCount}) => 'A match must have exactly one winner, but ${winnerCount} winners were provided.';
	@override String get eachPlayerMustProvideExactlyOneIdentifier => 'Each player must provide exactly one identifier: anonymousPlayerId or playerDataId.';
	@override String duplicatePlayerDataId({required Object playerDataId}) => 'Duplicate playerDataId found in players list: ${playerDataId}.';
	@override String duplicateAnonymousPlayerId({required Object anonymousPlayerId}) => 'Duplicate anonymousPlayerId found in players list: ${anonymousPlayerId}.';
	@override String get scoreMustBeBetweenZeroAndThirty => 'scoreInMatch must be between 0 and 30 when provided.';
	@override String onlyVagabondCanRepeatFaction({required Object factionName}) => 'Faction ${factionName} is duplicated. Only Vagabond can be repeated.';
	@override String get atMostTwoVagabondsAllowed => 'A match can include at most two Vagabonds.';
	@override String get coalitionRequiresExactlyOneVagabondWinner => 'When two winners are provided, exactly one of them must be Vagabond.';
	@override String get coalitionWinnersMustUseDominance => 'When two winners are provided, both winners must have scoreInMatch=null (dominance).';
	@override String factionDuplicated({required Object factionName}) => 'Faction ${factionName} is duplicated. Each faction can be used by only one player.';
	@override String get winnerScoreValidation => 'Winner must have (didWin=true and scoreInMatch=30) or (didWin=true and scoreInMatch=null).';
	@override String get onlyWinnerCanHaveThirtyPoints => 'Only the winner can have scoreInMatch equal to 30.';
	@override String playerDataIdNotFoundForId({required Object playerDataId}) => 'playerDataId not found for id: ${playerDataId}.';
	@override String anonymousPlayerIdNotFoundForId({required Object anonymousPlayerId}) => 'anonymousPlayerId not found for id: ${anonymousPlayerId}.';
	@override String playerDataIdNotFoundForIds({required Object missingIds}) => 'playerDataId not found for ids: ${missingIds}.';
	@override String anonymousPlayerIdNotFoundForIds({required Object missingIds}) => 'anonymousPlayerId not found for ids: ${missingIds}.';
	@override String anonymousPlayersOwnershipInvalid({required Object invalidIds}) => 'Anonymous players can only be used by the player that created them. Invalid ids: ${invalidIds}.';
	@override String get registerResultOnlyTwoHoursBefore => 'You can only register this result from 2 hours before the scheduled start time.';
	@override String get matchStartCannotBeEarlierThanTwoHoursBefore => 'Match start time cannot be earlier than 2 hours before the scheduled start time.';
	@override String get matchStartCannotBeInFuture => 'Match start time cannot be in the future.';
	@override String get onlyHostOrSubscribedCanRegister => 'Only host or subscribed players can register this match result.';
	@override String imageRequired({required Object imageDescription}) => '${imageDescription} is required.';
	@override String imageTooLargeWithDescription({required Object imageDescription}) => '${imageDescription} is too large. Please upload an image smaller than 3 MB.';
	@override String imageContentTypeMustBeImage({required Object imageDescription}) => '${imageDescription} content type must be an image.';
	@override String imageUploadKeyInvalid({required Object imageDescription}) => '${imageDescription} upload reference is invalid.';
	@override String get latitudeMustBeBetween => 'Latitude (x) must be between -90 and 90.';
	@override String get longitudeMustBeBetween => 'Longitude (y) must be between -180 and 180.';
	@override String get failedToResolveCityFromCoordinates => 'Failed to resolve city from coordinates.';
	@override String failedToResolveCityFromCoordinatesWithProviderError({required Object providerError}) => 'Failed to resolve city from coordinates: ${providerError}';
	@override String geocodingRequestFailedWithHttp({required Object statusCode}) => 'Geocoding request failed with HTTP ${statusCode}.';
	@override String get geocodingResponseFormatInvalid => 'Geocoding response format is invalid.';
	@override String get googleMapsApiKeyNotConfigured => 'Google Maps API key is not configured. Set `googleMapsApiKey` in config/passwords.yaml or `GOOGLE_MAPS_API_KEY`.';
	@override String placesPageOutOfRange({required Object page, required Object query}) => 'Page ${page} is out of range for query "${query}".';
	@override String googlePlacesRequestFailedWithHttp({required Object statusCode}) => 'Google Places API request failed with HTTP ${statusCode}.';
	@override String failedToFetchMatchLocations({required Object requestedPage, required Object message}) => 'Failed to fetch match locations (page ${requestedPage}): ${message}';
	@override String get uploadThingApiKeyNotConfigured => 'UploadThing API key is not configured. Set `uploadThingApiKey` or `uploadThingToken` in config/passwords.yaml.';
	@override String get uploadThingPrepareUploadFailed => 'O UploadThing nao conseguiu preparar o envio do arquivo. Tente novamente.';
	@override String get uploadThingInvalidUploadPreparationFormat => 'UploadThing returned an invalid upload preparation format.';
	@override String get uploadThingMissingKeyOrUrl => 'UploadThing response is missing key or upload URL.';
	@override String get uploadThingRejectedImageBytes => 'O UploadThing rejeitou os bytes do arquivo enviado.';
	@override String get uploadThingAppInfoLookupFailed => 'UploadThing app info lookup failed.';
	@override String get uploadThingInvalidAppInfoFormat => 'UploadThing returned an invalid app info format.';
	@override String get uploadThingAppIdMissing => 'UploadThing app id is missing in app info response.';
	@override String get onlyHostOrSubscribedCanCancelMatch => 'Apenas o anfitrião ou jogadores inscritos podem marcar esta partida como não jogada.';
	@override String get cancellationDetailsRequiredForOtherReason => 'Adicione uma descrição do motivo ao selecionar "outro".';
	@override String get onlyScheduledMatchesCanReceiveSubscriptions => 'Apenas partidas agendadas podem receber novas inscrições.';
	@override String get onlyScheduledMatchesCanBeEdited => 'Apenas partidas agendadas podem ser editadas.';
	@override String get onlyScheduledMatchesCanManagePlayers => 'Apenas partidas agendadas podem gerenciar inscrições de jogadores.';
	@override String get scheduledMatchAlreadyMarkedAsNotPlayed => 'Esta partida agendada já está marcada como não jogada.';
}

// Path: fallback
class _TranslationsFallbackPtBr extends TranslationsFallbackEn {
	_TranslationsFallbackPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get unableToLoadYourStats => 'Unable to load your stats right now. Please try again.';
	@override String get unableToLoadPlatformStats => 'Unable to load platform stats right now. Please try again.';
	@override String get unableToLoadPosts => 'Unable to load posts right now. Please try again.';
	@override String get unableToCreatePost => 'Unable to create the post right now. Please try again.';
	@override String get unableToCreateComment => 'Unable to create the comment right now. Please try again.';
	@override String get unableToLoadComments => 'Unable to load comments right now. Please try again.';
	@override String get unableToCreateAccount => 'Unable to create account right now. Please try again.';
	@override String get unableToLoadAccountInfo => 'Unable to load account info right now. Please try again.';
	@override String get unableToUpdateAccountInfo => 'Unable to update account info right now. Please try again.';
	@override String get unableToRegisterAccountDeletionRequest => 'Nao foi possivel registrar a solicitacao de exclusao da conta agora. Tente novamente mais tarde.';
	@override String get unableToResolveLocationDetails => 'Unable to resolve location details right now. Please try again later.';
	@override String get unableToSyncPushNotifications => 'Unable to sync push notifications for this device right now.';
	@override String get unableToDisablePushNotifications => 'Unable to disable push notifications for this device right now.';
	@override String get unableToLoadAnonymousPlayers => 'Unable to load anonymous players right now. Please try again.';
	@override String get unableToLoadUnreadChatCount => 'Unable to load unread chat count right now. Please try again.';
	@override String get unableToLoadPlayedMatchSummary => 'Unable to load played match summary right now. Please try again.';
	@override String get unableToLoadChatMessages => 'Unable to load chat messages right now. Please try again.';
	@override String get unableToLoadMatchActivity => 'Unable to load match activity right now. Please try again.';
	@override String get unableToSendMessage => 'Unable to send the message right now. Please try again.';
	@override String get unableToDeleteChatMessage => 'Unable to delete the message right now. Please try again.';
	@override String get unableToUpdateChatReaction => 'Unable to update the chat reaction right now. Please try again.';
	@override String get unableToUpdateChatTypingStatus => 'Unable to update the typing status right now. Please try again.';
	@override String get unableToLoadScheduledMatchDetails => 'Unable to load scheduled match details right now. Please try again.';
	@override String get unableToLoadNearbyMatchSchedules => 'Unable to load nearby match schedules right now. Please try again.';
	@override String get unableToCreateMatchSchedule => 'Unable to create a match schedule right now. Please try again.';
	@override String get unableToCreateAnonymousPlayer => 'Unable to create an anonymous player right now. Please try again.';
	@override String get unableToUnsubscribeFromMatch => 'Unable to unsubscribe from this match right now. Please try again.';
	@override String get unableToLoadSubscribedMatches => 'Unable to load subscribed matches right now. Please try again.';
	@override String get unableToSubscribeToMatch => 'Unable to subscribe to this match right now. Please try again.';
	@override String get unableToUpdateTable => 'Unable to update this table right now. Please try again.';
	@override String get unableToFetchLocations => 'Unable to fetch locations right now. Please try again later.';
	@override String get unableToRemovePlayer => 'Unable to remove this player right now. Please try again.';
	@override String get unableToLoadPlayedMatches => 'Unable to load your played matches right now. Please try again.';
	@override String get unableToRegisterMatchResult => 'Unable to register this match result right now. Please try again.';
	@override String get unableToLoadPendingMatchReports => 'Unable to load pending match reports right now. Please try again.';
	@override String get unableToSearchRegisteredPlayers => 'Unable to search registered players right now. Please try again.';
	@override String get unableToUploadImage => 'Nao foi possivel enviar a midia agora. Tente novamente.';
	@override String get unexpected => 'Unable to process this request right now. Please try again later.';
	@override String get unableToCancelScheduledMatch => 'Não foi possível marcar esta partida agendada como não jogada agora. Tente novamente.';
}

// Path: systemMessages
class _TranslationsSystemMessagesPtBr extends TranslationsSystemMessagesEn {
	_TranslationsSystemMessagesPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String joinedTheTable({required Object displayName}) => '${displayName} joined the table';
	@override String leftTheTable({required Object displayName}) => '${displayName} left the table';
	@override String removedPlayerFromTable({required Object hostDisplayName, required Object targetDisplayName}) => '${hostDisplayName} removed ${targetDisplayName} from the table';
}

// Path: pushNotifications
class _TranslationsPushNotificationsPtBr extends TranslationsPushNotificationsEn {
	_TranslationsPushNotificationsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsPushNotificationsCommonPtBr common = _TranslationsPushNotificationsCommonPtBr._(_root);
	@override late final _TranslationsPushNotificationsMatchChatPtBr matchChat = _TranslationsPushNotificationsMatchChatPtBr._(_root);
	@override late final _TranslationsPushNotificationsNearbyMatchPtBr nearbyMatch = _TranslationsPushNotificationsNearbyMatchPtBr._(_root);
}

// Path: labels
class _TranslationsLabelsPtBr extends TranslationsLabelsEn {
	_TranslationsLabelsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get firstName => 'First name';
	@override String get image => 'Image';
	@override String get lastName => 'Last name';
	@override String get groupPhoto => 'Group photo';
	@override String get boardPhoto => 'Board photo';
	@override String get matchDescription => 'Description';
}

// Path: pushNotifications.common
class _TranslationsPushNotificationsCommonPtBr extends TranslationsPushNotificationsCommonEn {
	_TranslationsPushNotificationsCommonPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get genericSender => 'Um jogador';
}

// Path: pushNotifications.matchChat
class _TranslationsPushNotificationsMatchChatPtBr extends TranslationsPushNotificationsMatchChatEn {
	_TranslationsPushNotificationsMatchChatPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get newMessageInMatchChatTitle => 'Nova mensagem no chat da mesa';
	@override String newMessageInMatchTitle({required Object matchTitle}) => 'Nova mensagem em ${matchTitle}';
	@override String senderMessagePreview({required Object senderDisplayName, required Object messagePreview}) => '${senderDisplayName}: ${messagePreview}';
	@override String senderSentImage({required Object senderDisplayName}) => '${senderDisplayName} enviou uma imagem';
	@override String senderSentVoiceMessage({required Object senderDisplayName}) => '${senderDisplayName} enviou uma mensagem de voz';
	@override String senderSentMessage({required Object senderDisplayName}) => '${senderDisplayName} enviou uma nova mensagem';
}

// Path: pushNotifications.nearbyMatch
class _TranslationsPushNotificationsNearbyMatchPtBr extends TranslationsPushNotificationsNearbyMatchEn {
	_TranslationsPushNotificationsNearbyMatchPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get newTableNearYouTitle => 'Nova mesa perto de você';
	@override String tableScheduledAtLocation({required Object matchTitle, required Object locationName}) => '${matchTitle} em ${locationName}';
	@override String tableScheduledNearby({required Object matchTitle}) => '${matchTitle} acabou de ser marcada perto de você';
	@override String newTableScheduledNearLocation({required Object locationName}) => 'Uma nova mesa foi marcada perto de ${locationName}';
	@override String get newTableScheduledInSearchArea => 'Uma nova mesa foi marcada na sua área de busca';
}
