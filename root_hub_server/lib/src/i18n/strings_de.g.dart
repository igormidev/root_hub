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
	@override late final _TranslationsEndpointErrorTitlesDe endpointErrorTitles = _TranslationsEndpointErrorTitlesDe._(_root);
	@override late final _TranslationsErrorsDe errors = _TranslationsErrorsDe._(_root);
	@override late final _TranslationsFallbackDe fallback = _TranslationsFallbackDe._(_root);
	@override late final _TranslationsSystemMessagesDe systemMessages = _TranslationsSystemMessagesDe._(_root);
	@override late final _TranslationsPushNotificationsDe pushNotifications = _TranslationsPushNotificationsDe._(_root);
	@override late final _TranslationsLabelsDe labels = _TranslationsLabelsDe._(_root);
}

// Path: endpointErrorTitles
class _TranslationsEndpointErrorTitlesDe extends TranslationsEndpointErrorTitlesEn {
	_TranslationsEndpointErrorTitlesDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get invalidRequest => 'Invalid request';
	@override String get notFound => 'Resource not found';
	@override String get accessDenied => 'Access denied';
	@override String get configuration => 'Configuration error';
	@override String get endpointUnavailable => 'Endpoint unavailable';
	@override String get unexpected => 'Unexpected error';
}

// Path: errors
class _TranslationsErrorsDe extends TranslationsErrorsEn {
	_TranslationsErrorsDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

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
	@override String get accountDeletionEmailInvalid => 'Please enter a valid email address.';
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
	@override String get messageMustIncludeTextOrImage => 'Message must include text content or an image.';
	@override String get imageBytesCannotBeEmpty => 'Image bytes cannot be empty.';
	@override String get imageTooLargeSixMb => 'Image is too large. Please send an image smaller than 3 MB.';
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
	@override String get uploadThingPrepareUploadFailed => 'UploadThing failed to prepare image upload. Please try again.';
	@override String get uploadThingInvalidUploadPreparationFormat => 'UploadThing returned an invalid upload preparation format.';
	@override String get uploadThingMissingKeyOrUrl => 'UploadThing response is missing key or upload URL.';
	@override String get uploadThingRejectedImageBytes => 'UploadThing rejected the uploaded image bytes.';
	@override String get uploadThingAppInfoLookupFailed => 'UploadThing app info lookup failed.';
	@override String get uploadThingInvalidAppInfoFormat => 'UploadThing returned an invalid app info format.';
	@override String get uploadThingAppIdMissing => 'UploadThing app id is missing in app info response.';
	@override String get onlyHostOrSubscribedCanCancelMatch => 'Nur der Host oder abonnierte Spieler können dieses Spiel als nicht gespielt markieren.';
	@override String get cancellationDetailsRequiredForOtherReason => 'Bitte gib eine Begründung an, wenn du „sonstiges“ auswählst.';
	@override String get onlyScheduledMatchesCanReceiveSubscriptions => 'Nur geplante Spiele können neue Anmeldungen erhalten.';
	@override String get onlyScheduledMatchesCanBeEdited => 'Nur geplante Spiele können bearbeitet werden.';
	@override String get onlyScheduledMatchesCanManagePlayers => 'Nur geplante Spiele können Spieleranmeldungen verwalten.';
	@override String get scheduledMatchAlreadyMarkedAsNotPlayed => 'Dieses geplante Spiel ist bereits als nicht gespielt markiert.';
}

// Path: fallback
class _TranslationsFallbackDe extends TranslationsFallbackEn {
	_TranslationsFallbackDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

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
	@override String get unableToRegisterAccountDeletionRequest => 'Unable to register the account deletion request right now. Please try again later.';
	@override String get unableToResolveLocationDetails => 'Unable to resolve location details right now. Please try again later.';
	@override String get unableToSyncPushNotifications => 'Unable to sync push notifications for this device right now.';
	@override String get unableToDisablePushNotifications => 'Unable to disable push notifications for this device right now.';
	@override String get unableToLoadAnonymousPlayers => 'Unable to load anonymous players right now. Please try again.';
	@override String get unableToLoadUnreadChatCount => 'Unable to load unread chat count right now. Please try again.';
	@override String get unableToLoadPlayedMatchSummary => 'Unable to load played match summary right now. Please try again.';
	@override String get unableToLoadChatMessages => 'Unable to load chat messages right now. Please try again.';
	@override String get unableToLoadMatchActivity => 'Unable to load match activity right now. Please try again.';
	@override String get unableToSendMessage => 'Unable to send the message right now. Please try again.';
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
	@override String get unableToUploadImage => 'Unable to upload image right now. Please try again.';
	@override String get unexpected => 'Unable to process this request right now. Please try again later.';
	@override String get unableToCancelScheduledMatch => 'Dieses geplante Spiel konnte derzeit nicht als nicht gespielt markiert werden. Bitte versuche es erneut.';
}

// Path: systemMessages
class _TranslationsSystemMessagesDe extends TranslationsSystemMessagesEn {
	_TranslationsSystemMessagesDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String joinedTheTable({required Object displayName}) => '${displayName} joined the table';
	@override String leftTheTable({required Object displayName}) => '${displayName} left the table';
	@override String removedPlayerFromTable({required Object hostDisplayName, required Object targetDisplayName}) => '${hostDisplayName} removed ${targetDisplayName} from the table';
}

// Path: pushNotifications
class _TranslationsPushNotificationsDe extends TranslationsPushNotificationsEn {
	_TranslationsPushNotificationsDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsPushNotificationsCommonDe common = _TranslationsPushNotificationsCommonDe._(_root);
	@override late final _TranslationsPushNotificationsMatchChatDe matchChat = _TranslationsPushNotificationsMatchChatDe._(_root);
	@override late final _TranslationsPushNotificationsNearbyMatchDe nearbyMatch = _TranslationsPushNotificationsNearbyMatchDe._(_root);
}

// Path: labels
class _TranslationsLabelsDe extends TranslationsLabelsEn {
	_TranslationsLabelsDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get firstName => 'First name';
	@override String get image => 'Image';
	@override String get lastName => 'Last name';
	@override String get groupPhoto => 'Group photo';
	@override String get boardPhoto => 'Board photo';
	@override String get matchDescription => 'Description';
}

// Path: pushNotifications.common
class _TranslationsPushNotificationsCommonDe extends TranslationsPushNotificationsCommonEn {
	_TranslationsPushNotificationsCommonDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get genericSender => 'Ein Spieler';
}

// Path: pushNotifications.matchChat
class _TranslationsPushNotificationsMatchChatDe extends TranslationsPushNotificationsMatchChatEn {
	_TranslationsPushNotificationsMatchChatDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get newMessageInMatchChatTitle => 'Neue Nachricht im Tisch-Chat';
	@override String newMessageInMatchTitle({required Object matchTitle}) => 'Neue Nachricht in ${matchTitle}';
	@override String senderMessagePreview({required Object senderDisplayName, required Object messagePreview}) => '${senderDisplayName}: ${messagePreview}';
	@override String senderSentImage({required Object senderDisplayName}) => '${senderDisplayName} hat ein Bild gesendet';
	@override String senderSentMessage({required Object senderDisplayName}) => '${senderDisplayName} hat eine neue Nachricht gesendet';
}

// Path: pushNotifications.nearbyMatch
class _TranslationsPushNotificationsNearbyMatchDe extends TranslationsPushNotificationsNearbyMatchEn {
	_TranslationsPushNotificationsNearbyMatchDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get newTableNearYouTitle => 'Neuer Tisch in deiner Nähe';
	@override String tableScheduledAtLocation({required Object matchTitle, required Object locationName}) => '${matchTitle} bei ${locationName}';
	@override String tableScheduledNearby({required Object matchTitle}) => '${matchTitle} wurde gerade in deiner Nähe geplant';
	@override String newTableScheduledNearLocation({required Object locationName}) => 'Ein neuer Tisch wurde in der Nähe von ${locationName} geplant';
	@override String get newTableScheduledInSearchArea => 'Ein neuer Tisch wurde in deinem Suchbereich geplant';
}
