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
	late final TranslationsEndpointErrorTitlesEn endpointErrorTitles = TranslationsEndpointErrorTitlesEn.internal(_root);
	late final TranslationsErrorsEn errors = TranslationsErrorsEn.internal(_root);
	late final TranslationsFallbackEn fallback = TranslationsFallbackEn.internal(_root);
	late final TranslationsSystemMessagesEn systemMessages = TranslationsSystemMessagesEn.internal(_root);
	late final TranslationsPushNotificationsEn pushNotifications = TranslationsPushNotificationsEn.internal(_root);
	late final TranslationsLabelsEn labels = TranslationsLabelsEn.internal(_root);
}

// Path: endpointErrorTitles
class TranslationsEndpointErrorTitlesEn {
	TranslationsEndpointErrorTitlesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Invalid request'
	String get invalidRequest => 'Invalid request';

	/// en: 'Resource not found'
	String get notFound => 'Resource not found';

	/// en: 'Access denied'
	String get accessDenied => 'Access denied';

	/// en: 'Configuration error'
	String get configuration => 'Configuration error';

	/// en: 'Endpoint unavailable'
	String get endpointUnavailable => 'Endpoint unavailable';

	/// en: 'Unexpected error'
	String get unexpected => 'Unexpected error';
}

// Path: errors
class TranslationsErrorsEn {
	TranslationsErrorsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Authenticated user missing'
	String get authenticatedUserMissingTitle => 'Authenticated user missing';

	/// en: 'Player profile already exists'
	String get playerProfileAlreadyExistsTitle => 'Player profile already exists';

	/// en: 'Player profile missing'
	String get playerProfileMissingTitle => 'Player profile missing';

	/// en: 'Post not found'
	String get postNotFoundTitle => 'Post not found';

	/// en: 'Match not found'
	String get matchNotFoundTitle => 'Match not found';

	/// en: 'Scheduled match not found'
	String get scheduledMatchNotFoundTitle => 'Scheduled match not found';

	/// en: 'Location not found'
	String get locationNotFoundTitle => 'Location not found';

	/// en: 'Chat not found'
	String get chatNotFoundTitle => 'Chat not found';

	/// en: 'Table not found'
	String get tableNotFoundTitle => 'Table not found';

	/// en: 'Player not found'
	String get playerNotFoundTitle => 'Player not found';

	/// en: 'Player not subscribed'
	String get playerNotSubscribedTitle => 'Player not subscribed';

	/// en: 'Subscriptions closed'
	String get subscriptionsClosedTitle => 'Subscriptions closed';

	/// en: 'Table is full'
	String get tableIsFullTitle => 'Table is full';

	/// en: 'Subscription already exists'
	String get subscriptionAlreadyExistsTitle => 'Subscription already exists';

	/// en: 'Not subscribed'
	String get notSubscribedTitle => 'Not subscribed';

	/// en: 'Invalid anonymous player'
	String get invalidAnonymousPlayerTitle => 'Invalid anonymous player';

	/// en: 'Invalid match registration'
	String get invalidMatchRegistrationTitle => 'Invalid match registration';

	/// en: 'Registration not allowed'
	String get registrationNotAllowedTitle => 'Registration not allowed';

	/// en: 'Location provider error'
	String get locationProviderErrorTitle => 'Location provider error';

	/// en: 'Please enter a valid email address.'
	String get accountDeletionEmailInvalid => 'Please enter a valid email address.';

	/// en: 'Too many players'
	String get tooManyPlayersTitle => 'Too many players';

	/// en: 'Display name cannot be empty.'
	String get displayNameCannotBeEmpty => 'Display name cannot be empty.';

	/// en: 'Location ratio must be greater than zero.'
	String get locationRatioMustBeGreaterThanZero => 'Location ratio must be greater than zero.';

	/// en: 'Authenticated user was not found.'
	String get authenticatedUserNotFound => 'Authenticated user was not found.';

	/// en: 'Authenticated user already has a player profile.'
	String get authenticatedUserAlreadyHasProfile => 'Authenticated user already has a player profile.';

	/// en: 'Player profile not found for authenticated user.'
	String get playerProfileNotFoundForAuthenticatedUser => 'Player profile not found for authenticated user.';

	/// en: 'Authenticated user profile was not found.'
	String get authenticatedUserProfileNotFound => 'Authenticated user profile was not found.';

	/// en: 'No profile fields were provided for update.'
	String get noProfileFieldsProvided => 'No profile fields were provided for update.';

	/// en: 'Page must be greater than or equal to 1.'
	String get pageMustBeAtLeastOne => 'Page must be greater than or equal to 1.';

	/// en: 'Post with id {postId} not found.'
	String postWithIdNotFound({required Object postId}) => 'Post with id ${postId} not found.';

	/// en: 'Match with id {matchId} not found.'
	String matchWithIdNotFound({required Object matchId}) => 'Match with id ${matchId} not found.';

	/// en: 'Scheduled match id must be greater than zero.'
	String get scheduledMatchIdMustBeGreaterThanZero => 'Scheduled match id must be greater than zero.';

	/// en: 'Scheduled match with id {scheduledMatchId} was not found.'
	String scheduledMatchWithIdNotFound({required Object scheduledMatchId}) => 'Scheduled match with id ${scheduledMatchId} was not found.';

	/// en: 'Message id must be greater than zero.'
	String get messageIdMustBeGreaterThanZero => 'Message id must be greater than zero.';

	/// en: 'Message with id {messageId} was not found.'
	String messageWithIdNotFound({required Object messageId}) => 'Message with id ${messageId} was not found.';

	/// en: 'Reaction emoji cannot be empty.'
	String get reactionEmojiCannotBeEmpty => 'Reaction emoji cannot be empty.';

	/// en: 'You can only delete messages that you sent.'
	String get onlyOwnMessagesCanBeDeleted => 'You can only delete messages that you sent.';

	/// en: 'System messages cannot be deleted.'
	String get systemMessagesCannotBeDeleted => 'System messages cannot be deleted.';

	/// en: 'Scheduled pairing attempt not found.'
	String get scheduledPairingAttemptNotFound => 'Scheduled pairing attempt not found.';

	/// en: 'Location with id {locationId} was not found.'
	String locationWithIdNotFound({required Object locationId}) => 'Location with id ${locationId} was not found.';

	/// en: 'Location not found.'
	String get locationNotFound => 'Location not found.';

	/// en: 'Push token cannot be empty.'
	String get pushTokenCannotBeEmpty => 'Push token cannot be empty.';

	/// en: 'Push token is too long.'
	String get pushTokenTooLong => 'Push token is too long.';

	/// en: 'Query must not be empty.'
	String get queryMustNotBeEmpty => 'Query must not be empty.';

	/// en: 'Current location is required to fetch nearby match schedules.'
	String get currentLocationRequiredToFetchNearby => 'Current location is required to fetch nearby match schedules.';

	/// en: 'Title cannot be empty.'
	String get titleCannotBeEmpty => 'Title cannot be empty.';

	/// en: 'Players range must stay between 2 and 6, with min not greater than max.'
	String get playersRangeMustStayBetweenTwoAndSix => 'Players range must stay between 2 and 6, with min not greater than max.';

	/// en: 'The scheduled time must be at least {minutes} minutes in the future.'
	String scheduledTimeMustBeAtLeastMinutesInTheFuture({required Object minutes}) => 'The scheduled time must be at least ${minutes} minutes in the future.';

	/// en: 'The scheduled time cannot be more than {days} days in the future.'
	String scheduledTimeCannotBeMoreThanDaysInTheFuture({required Object days}) => 'The scheduled time cannot be more than ${days} days in the future.';

	/// en: 'Only the host of the table can edit its details.'
	String get onlyHostCanEditTable => 'Only the host of the table can edit its details.';

	/// en: 'There are already {currentSubscriberCount} players subscribed. You cannot set the maximum below that number.'
	String tooManyPlayersSubscribed({required Object currentSubscriberCount}) => 'There are already ${currentSubscriberCount} players subscribed. You cannot set the maximum below that number.';

	/// en: 'Only the host of the table can remove players.'
	String get onlyHostCanRemovePlayers => 'Only the host of the table can remove players.';

	/// en: 'You cannot remove yourself. Use leave table instead.'
	String get youCannotRemoveYourself => 'You cannot remove yourself. Use leave table instead.';

	/// en: 'The player to remove was not found.'
	String get playerToRemoveWasNotFound => 'The player to remove was not found.';

	/// en: 'This player is not subscribed to the table.'
	String get playerIsNotSubscribedToTable => 'This player is not subscribed to the table.';

	/// en: 'You are not subscribed to this match.'
	String get youAreNotSubscribedToThisMatch => 'You are not subscribed to this match.';

	/// en: 'Already subscribed to this match.'
	String get alreadySubscribedToThisMatch => 'Already subscribed to this match.';

	/// en: 'The host has closed subscriptions for this table. No new players can join at this time.'
	String get hostClosedSubscriptions => 'The host has closed subscriptions for this table. No new players can join at this time.';

	/// en: 'This table has reached its maximum of {maxPlayers} players.'
	String tableReachedMaximumPlayers({required Object maxPlayers}) => 'This table has reached its maximum of ${maxPlayers} players.';

	/// en: 'Player data id must be greater than zero.'
	String get playerDataIdMustBeGreaterThanZero => 'Player data id must be greater than zero.';

	/// en: 'Chat history and player must be persisted.'
	String get chatHistoryAndPlayerMustBePersisted => 'Chat history and player must be persisted.';

	/// en: 'Message must include text content, an image, or audio.'
	String get messageMustIncludeTextOrImage => 'Message must include text content, an image, or audio.';

	/// en: 'Image bytes cannot be empty.'
	String get imageBytesCannotBeEmpty => 'Image bytes cannot be empty.';

	/// en: 'Audio bytes cannot be empty.'
	String get audioBytesCannotBeEmpty => 'Audio bytes cannot be empty.';

	/// en: 'Message cannot include both an image and audio.'
	String get messageCannotIncludeImageAndAudio => 'Message cannot include both an image and audio.';

	/// en: 'Image is too large. Please send an image smaller than 3 MB.'
	String get imageTooLargeSixMb => 'Image is too large. Please send an image smaller than 3 MB.';

	/// en: 'Audio is too large. Please send audio smaller than 12 MB.'
	String get audioTooLarge => 'Audio is too large. Please send audio smaller than 12 MB.';

	/// en: 'Chat history for scheduled match {scheduledMatchId} was not found.'
	String chatHistoryForScheduledMatchNotFound({required Object scheduledMatchId}) => 'Chat history for scheduled match ${scheduledMatchId} was not found.';

	/// en: 'The selected table was not found.'
	String get selectedTableWasNotFound => 'The selected table was not found.';

	/// en: 'Unknown player'
	String get unknownPlayer => 'Unknown player';

	/// en: 'Unknown location'
	String get unknownLocation => 'Unknown location';

	/// en: 'Get my played matches endpoint is not implemented yet.'
	String get getMyPlayedMatchesNotImplemented => 'Get my played matches endpoint is not implemented yet.';

	/// en: '{label} cannot be empty.'
	String firstNameCannotBeEmpty({required Object label}) => '${label} cannot be empty.';

	/// en: '{label} must have at least {minLength} characters.'
	String nameMustHaveAtLeastCharacters({required Object label, required Object minLength}) => '${label} must have at least ${minLength} characters.';

	/// en: '{label} cannot exceed {maxLength} characters.'
	String nameCannotExceedCharacters({required Object label, required Object maxLength}) => '${label} cannot exceed ${maxLength} characters.';

	/// en: 'Match estimated duration must be greater than zero.'
	String get matchEstimatedDurationMustBeGreaterThanZero => 'Match estimated duration must be greater than zero.';

	/// en: 'This scheduled match already has a registered result.'
	String get scheduledMatchAlreadyHasResult => 'This scheduled match already has a registered result.';

	/// en: 'This scheduled match is already marked as not played.'
	String get scheduledMatchAlreadyMarkedAsNotPlayed => 'This scheduled match is already marked as not played.';

	/// en: 'Provided location does not match the scheduled pairing attempt location.'
	String get providedLocationDoesNotMatchScheduledPairing => 'Provided location does not match the scheduled pairing attempt location.';

	/// en: 'At least 2 players are required to register a match.'
	String get atLeastTwoPlayersRequiredToRegister => 'At least 2 players are required to register a match.';

	/// en: 'Root matches must have between 2 and 6 players.'
	String get rootMatchesMustHaveBetweenTwoAndSixPlayers => 'Root matches must have between 2 and 6 players.';

	/// en: 'A match must have at least one winner.'
	String get atLeastOneWinnerRequired => 'A match must have at least one winner.';

	/// en: 'A match must have one or two winners, but {winnerCount} winners were provided.'
	String winnerCountMustBeOneOrTwo({required Object winnerCount}) => 'A match must have one or two winners, but ${winnerCount} winners were provided.';

	/// en: 'A match must have exactly one winner, but none was provided.'
	String get exactlyOneWinnerRequiredNoneProvided => 'A match must have exactly one winner, but none was provided.';

	/// en: 'A match must have exactly one winner, but {winnerCount} winners were provided.'
	String exactlyOneWinnerRequiredCountProvided({required Object winnerCount}) => 'A match must have exactly one winner, but ${winnerCount} winners were provided.';

	/// en: 'Each player must provide exactly one identifier: anonymousPlayerId or playerDataId.'
	String get eachPlayerMustProvideExactlyOneIdentifier => 'Each player must provide exactly one identifier: anonymousPlayerId or playerDataId.';

	/// en: 'Duplicate playerDataId found in players list: {playerDataId}.'
	String duplicatePlayerDataId({required Object playerDataId}) => 'Duplicate playerDataId found in players list: ${playerDataId}.';

	/// en: 'Duplicate anonymousPlayerId found in players list: {anonymousPlayerId}.'
	String duplicateAnonymousPlayerId({required Object anonymousPlayerId}) => 'Duplicate anonymousPlayerId found in players list: ${anonymousPlayerId}.';

	/// en: 'scoreInMatch must be between 0 and 30 when provided.'
	String get scoreMustBeBetweenZeroAndThirty => 'scoreInMatch must be between 0 and 30 when provided.';

	/// en: 'Faction {factionName} is duplicated. Only Vagabond can be repeated.'
	String onlyVagabondCanRepeatFaction({required Object factionName}) => 'Faction ${factionName} is duplicated. Only Vagabond can be repeated.';

	/// en: 'A match can include at most two Vagabonds.'
	String get atMostTwoVagabondsAllowed => 'A match can include at most two Vagabonds.';

	/// en: 'When two winners are provided, exactly one of them must be Vagabond.'
	String get coalitionRequiresExactlyOneVagabondWinner => 'When two winners are provided, exactly one of them must be Vagabond.';

	/// en: 'When two winners are provided, both winners must have scoreInMatch=null (dominance).'
	String get coalitionWinnersMustUseDominance => 'When two winners are provided, both winners must have scoreInMatch=null (dominance).';

	/// en: 'Faction {factionName} is duplicated. Each faction can be used by only one player.'
	String factionDuplicated({required Object factionName}) => 'Faction ${factionName} is duplicated. Each faction can be used by only one player.';

	/// en: 'Winner must have (didWin=true and scoreInMatch=30) or (didWin=true and scoreInMatch=null).'
	String get winnerScoreValidation => 'Winner must have (didWin=true and scoreInMatch=30) or (didWin=true and scoreInMatch=null).';

	/// en: 'Only the winner can have scoreInMatch equal to 30.'
	String get onlyWinnerCanHaveThirtyPoints => 'Only the winner can have scoreInMatch equal to 30.';

	/// en: 'playerDataId not found for id: {playerDataId}.'
	String playerDataIdNotFoundForId({required Object playerDataId}) => 'playerDataId not found for id: ${playerDataId}.';

	/// en: 'anonymousPlayerId not found for id: {anonymousPlayerId}.'
	String anonymousPlayerIdNotFoundForId({required Object anonymousPlayerId}) => 'anonymousPlayerId not found for id: ${anonymousPlayerId}.';

	/// en: 'playerDataId not found for ids: {missingIds}.'
	String playerDataIdNotFoundForIds({required Object missingIds}) => 'playerDataId not found for ids: ${missingIds}.';

	/// en: 'anonymousPlayerId not found for ids: {missingIds}.'
	String anonymousPlayerIdNotFoundForIds({required Object missingIds}) => 'anonymousPlayerId not found for ids: ${missingIds}.';

	/// en: 'Anonymous players can only be used by the player that created them. Invalid ids: {invalidIds}.'
	String anonymousPlayersOwnershipInvalid({required Object invalidIds}) => 'Anonymous players can only be used by the player that created them. Invalid ids: ${invalidIds}.';

	/// en: 'You can only register this result from 2 hours before the scheduled start time.'
	String get registerResultOnlyTwoHoursBefore => 'You can only register this result from 2 hours before the scheduled start time.';

	/// en: 'Match start time cannot be earlier than 2 hours before the scheduled start time.'
	String get matchStartCannotBeEarlierThanTwoHoursBefore => 'Match start time cannot be earlier than 2 hours before the scheduled start time.';

	/// en: 'Match start time cannot be in the future.'
	String get matchStartCannotBeInFuture => 'Match start time cannot be in the future.';

	/// en: 'Only host or subscribed players can register this match result.'
	String get onlyHostOrSubscribedCanRegister => 'Only host or subscribed players can register this match result.';

	/// en: 'Only host or subscribed players can mark this match as not played.'
	String get onlyHostOrSubscribedCanCancelMatch => 'Only host or subscribed players can mark this match as not played.';

	/// en: 'Please provide a reason description when selecting "other".'
	String get cancellationDetailsRequiredForOtherReason => 'Please provide a reason description when selecting "other".';

	/// en: 'Only scheduled matches can receive new subscriptions.'
	String get onlyScheduledMatchesCanReceiveSubscriptions => 'Only scheduled matches can receive new subscriptions.';

	/// en: 'Only scheduled matches can be edited.'
	String get onlyScheduledMatchesCanBeEdited => 'Only scheduled matches can be edited.';

	/// en: 'Only scheduled matches can manage player subscriptions.'
	String get onlyScheduledMatchesCanManagePlayers => 'Only scheduled matches can manage player subscriptions.';

	/// en: '{imageDescription} is required.'
	String imageRequired({required Object imageDescription}) => '${imageDescription} is required.';

	/// en: '{imageDescription} is too large. Please upload an image smaller than 3 MB.'
	String imageTooLargeWithDescription({required Object imageDescription}) => '${imageDescription} is too large. Please upload an image smaller than 3 MB.';

	/// en: '{imageDescription} content type must be an image.'
	String imageContentTypeMustBeImage({required Object imageDescription}) => '${imageDescription} content type must be an image.';

	/// en: '{imageDescription} upload reference is invalid.'
	String imageUploadKeyInvalid({required Object imageDescription}) => '${imageDescription} upload reference is invalid.';

	/// en: 'Latitude (x) must be between -90 and 90.'
	String get latitudeMustBeBetween => 'Latitude (x) must be between -90 and 90.';

	/// en: 'Longitude (y) must be between -180 and 180.'
	String get longitudeMustBeBetween => 'Longitude (y) must be between -180 and 180.';

	/// en: 'Failed to resolve city from coordinates.'
	String get failedToResolveCityFromCoordinates => 'Failed to resolve city from coordinates.';

	/// en: 'Failed to resolve city from coordinates: {providerError}'
	String failedToResolveCityFromCoordinatesWithProviderError({required Object providerError}) => 'Failed to resolve city from coordinates: ${providerError}';

	/// en: 'Geocoding request failed with HTTP {statusCode}.'
	String geocodingRequestFailedWithHttp({required Object statusCode}) => 'Geocoding request failed with HTTP ${statusCode}.';

	/// en: 'Geocoding response format is invalid.'
	String get geocodingResponseFormatInvalid => 'Geocoding response format is invalid.';

	/// en: 'Google Maps API key is not configured. Set `googleMapsApiKey` in config/passwords.yaml or `GOOGLE_MAPS_API_KEY`.'
	String get googleMapsApiKeyNotConfigured => 'Google Maps API key is not configured. Set `googleMapsApiKey` in config/passwords.yaml or `GOOGLE_MAPS_API_KEY`.';

	/// en: 'Page {page} is out of range for query "{query}".'
	String placesPageOutOfRange({required Object page, required Object query}) => 'Page ${page} is out of range for query "${query}".';

	/// en: 'Google Places API request failed with HTTP {statusCode}.'
	String googlePlacesRequestFailedWithHttp({required Object statusCode}) => 'Google Places API request failed with HTTP ${statusCode}.';

	/// en: 'Failed to fetch match locations (page {requestedPage}): {message}'
	String failedToFetchMatchLocations({required Object requestedPage, required Object message}) => 'Failed to fetch match locations (page ${requestedPage}): ${message}';

	/// en: 'UploadThing API key is not configured. Set `uploadThingApiKey` or `uploadThingToken` in config/passwords.yaml.'
	String get uploadThingApiKeyNotConfigured => 'UploadThing API key is not configured. Set `uploadThingApiKey` or `uploadThingToken` in config/passwords.yaml.';

	/// en: 'UploadThing failed to prepare file upload. Please try again.'
	String get uploadThingPrepareUploadFailed => 'UploadThing failed to prepare file upload. Please try again.';

	/// en: 'UploadThing returned an invalid upload preparation format.'
	String get uploadThingInvalidUploadPreparationFormat => 'UploadThing returned an invalid upload preparation format.';

	/// en: 'UploadThing response is missing key or upload URL.'
	String get uploadThingMissingKeyOrUrl => 'UploadThing response is missing key or upload URL.';

	/// en: 'UploadThing rejected the uploaded file bytes.'
	String get uploadThingRejectedImageBytes => 'UploadThing rejected the uploaded file bytes.';

	/// en: 'UploadThing app info lookup failed.'
	String get uploadThingAppInfoLookupFailed => 'UploadThing app info lookup failed.';

	/// en: 'UploadThing returned an invalid app info format.'
	String get uploadThingInvalidAppInfoFormat => 'UploadThing returned an invalid app info format.';

	/// en: 'UploadThing app id is missing in app info response.'
	String get uploadThingAppIdMissing => 'UploadThing app id is missing in app info response.';
}

// Path: fallback
class TranslationsFallbackEn {
	TranslationsFallbackEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unable to load your stats right now. Please try again.'
	String get unableToLoadYourStats => 'Unable to load your stats right now. Please try again.';

	/// en: 'Unable to load platform stats right now. Please try again.'
	String get unableToLoadPlatformStats => 'Unable to load platform stats right now. Please try again.';

	/// en: 'Unable to load posts right now. Please try again.'
	String get unableToLoadPosts => 'Unable to load posts right now. Please try again.';

	/// en: 'Unable to create the post right now. Please try again.'
	String get unableToCreatePost => 'Unable to create the post right now. Please try again.';

	/// en: 'Unable to create the comment right now. Please try again.'
	String get unableToCreateComment => 'Unable to create the comment right now. Please try again.';

	/// en: 'Unable to load comments right now. Please try again.'
	String get unableToLoadComments => 'Unable to load comments right now. Please try again.';

	/// en: 'Unable to create account right now. Please try again.'
	String get unableToCreateAccount => 'Unable to create account right now. Please try again.';

	/// en: 'Unable to load account info right now. Please try again.'
	String get unableToLoadAccountInfo => 'Unable to load account info right now. Please try again.';

	/// en: 'Unable to update account info right now. Please try again.'
	String get unableToUpdateAccountInfo => 'Unable to update account info right now. Please try again.';

	/// en: 'Unable to register the account deletion request right now. Please try again later.'
	String get unableToRegisterAccountDeletionRequest => 'Unable to register the account deletion request right now. Please try again later.';

	/// en: 'Unable to resolve location details right now. Please try again later.'
	String get unableToResolveLocationDetails => 'Unable to resolve location details right now. Please try again later.';

	/// en: 'Unable to sync push notifications for this device right now.'
	String get unableToSyncPushNotifications => 'Unable to sync push notifications for this device right now.';

	/// en: 'Unable to disable push notifications for this device right now.'
	String get unableToDisablePushNotifications => 'Unable to disable push notifications for this device right now.';

	/// en: 'Unable to load anonymous players right now. Please try again.'
	String get unableToLoadAnonymousPlayers => 'Unable to load anonymous players right now. Please try again.';

	/// en: 'Unable to load unread chat count right now. Please try again.'
	String get unableToLoadUnreadChatCount => 'Unable to load unread chat count right now. Please try again.';

	/// en: 'Unable to load played match summary right now. Please try again.'
	String get unableToLoadPlayedMatchSummary => 'Unable to load played match summary right now. Please try again.';

	/// en: 'Unable to load chat messages right now. Please try again.'
	String get unableToLoadChatMessages => 'Unable to load chat messages right now. Please try again.';

	/// en: 'Unable to load match activity right now. Please try again.'
	String get unableToLoadMatchActivity => 'Unable to load match activity right now. Please try again.';

	/// en: 'Unable to send the message right now. Please try again.'
	String get unableToSendMessage => 'Unable to send the message right now. Please try again.';

	/// en: 'Unable to delete the message right now. Please try again.'
	String get unableToDeleteChatMessage => 'Unable to delete the message right now. Please try again.';

	/// en: 'Unable to update the chat reaction right now. Please try again.'
	String get unableToUpdateChatReaction => 'Unable to update the chat reaction right now. Please try again.';

	/// en: 'Unable to update the typing status right now. Please try again.'
	String get unableToUpdateChatTypingStatus => 'Unable to update the typing status right now. Please try again.';

	/// en: 'Unable to load scheduled match details right now. Please try again.'
	String get unableToLoadScheduledMatchDetails => 'Unable to load scheduled match details right now. Please try again.';

	/// en: 'Unable to load nearby match schedules right now. Please try again.'
	String get unableToLoadNearbyMatchSchedules => 'Unable to load nearby match schedules right now. Please try again.';

	/// en: 'Unable to create a match schedule right now. Please try again.'
	String get unableToCreateMatchSchedule => 'Unable to create a match schedule right now. Please try again.';

	/// en: 'Unable to create an anonymous player right now. Please try again.'
	String get unableToCreateAnonymousPlayer => 'Unable to create an anonymous player right now. Please try again.';

	/// en: 'Unable to unsubscribe from this match right now. Please try again.'
	String get unableToUnsubscribeFromMatch => 'Unable to unsubscribe from this match right now. Please try again.';

	/// en: 'Unable to load subscribed matches right now. Please try again.'
	String get unableToLoadSubscribedMatches => 'Unable to load subscribed matches right now. Please try again.';

	/// en: 'Unable to subscribe to this match right now. Please try again.'
	String get unableToSubscribeToMatch => 'Unable to subscribe to this match right now. Please try again.';

	/// en: 'Unable to update this table right now. Please try again.'
	String get unableToUpdateTable => 'Unable to update this table right now. Please try again.';

	/// en: 'Unable to fetch locations right now. Please try again later.'
	String get unableToFetchLocations => 'Unable to fetch locations right now. Please try again later.';

	/// en: 'Unable to remove this player right now. Please try again.'
	String get unableToRemovePlayer => 'Unable to remove this player right now. Please try again.';

	/// en: 'Unable to load your played matches right now. Please try again.'
	String get unableToLoadPlayedMatches => 'Unable to load your played matches right now. Please try again.';

	/// en: 'Unable to register this match result right now. Please try again.'
	String get unableToRegisterMatchResult => 'Unable to register this match result right now. Please try again.';

	/// en: 'Unable to mark this scheduled match as not played right now. Please try again.'
	String get unableToCancelScheduledMatch => 'Unable to mark this scheduled match as not played right now. Please try again.';

	/// en: 'Unable to load pending match reports right now. Please try again.'
	String get unableToLoadPendingMatchReports => 'Unable to load pending match reports right now. Please try again.';

	/// en: 'Unable to search registered players right now. Please try again.'
	String get unableToSearchRegisteredPlayers => 'Unable to search registered players right now. Please try again.';

	/// en: 'Unable to upload media right now. Please try again.'
	String get unableToUploadImage => 'Unable to upload media right now. Please try again.';

	/// en: 'Unable to process this request right now. Please try again later.'
	String get unexpected => 'Unable to process this request right now. Please try again later.';
}

// Path: systemMessages
class TranslationsSystemMessagesEn {
	TranslationsSystemMessagesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '{displayName} joined the table'
	String joinedTheTable({required Object displayName}) => '${displayName} joined the table';

	/// en: '{displayName} left the table'
	String leftTheTable({required Object displayName}) => '${displayName} left the table';

	/// en: '{hostDisplayName} removed {targetDisplayName} from the table'
	String removedPlayerFromTable({required Object hostDisplayName, required Object targetDisplayName}) => '${hostDisplayName} removed ${targetDisplayName} from the table';
}

// Path: pushNotifications
class TranslationsPushNotificationsEn {
	TranslationsPushNotificationsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsPushNotificationsCommonEn common = TranslationsPushNotificationsCommonEn.internal(_root);
	late final TranslationsPushNotificationsMatchChatEn matchChat = TranslationsPushNotificationsMatchChatEn.internal(_root);
	late final TranslationsPushNotificationsNearbyMatchEn nearbyMatch = TranslationsPushNotificationsNearbyMatchEn.internal(_root);
}

// Path: labels
class TranslationsLabelsEn {
	TranslationsLabelsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'First name'
	String get firstName => 'First name';

	/// en: 'Image'
	String get image => 'Image';

	/// en: 'Last name'
	String get lastName => 'Last name';

	/// en: 'Group photo'
	String get groupPhoto => 'Group photo';

	/// en: 'Board photo'
	String get boardPhoto => 'Board photo';

	/// en: 'Description'
	String get matchDescription => 'Description';
}

// Path: pushNotifications.common
class TranslationsPushNotificationsCommonEn {
	TranslationsPushNotificationsCommonEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'A player'
	String get genericSender => 'A player';
}

// Path: pushNotifications.matchChat
class TranslationsPushNotificationsMatchChatEn {
	TranslationsPushNotificationsMatchChatEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'New message in match chat'
	String get newMessageInMatchChatTitle => 'New message in match chat';

	/// en: 'New message in {matchTitle}'
	String newMessageInMatchTitle({required Object matchTitle}) => 'New message in ${matchTitle}';

	/// en: '{senderDisplayName}: {messagePreview}'
	String senderMessagePreview({required Object senderDisplayName, required Object messagePreview}) => '${senderDisplayName}: ${messagePreview}';

	/// en: '{senderDisplayName} sent an image'
	String senderSentImage({required Object senderDisplayName}) => '${senderDisplayName} sent an image';

	/// en: '{senderDisplayName} sent a voice message'
	String senderSentVoiceMessage({required Object senderDisplayName}) => '${senderDisplayName} sent a voice message';

	/// en: '{senderDisplayName} sent a new message'
	String senderSentMessage({required Object senderDisplayName}) => '${senderDisplayName} sent a new message';
}

// Path: pushNotifications.nearbyMatch
class TranslationsPushNotificationsNearbyMatchEn {
	TranslationsPushNotificationsNearbyMatchEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'New table near you'
	String get newTableNearYouTitle => 'New table near you';

	/// en: '{matchTitle} at {locationName}'
	String tableScheduledAtLocation({required Object matchTitle, required Object locationName}) => '${matchTitle} at ${locationName}';

	/// en: '{matchTitle} was just scheduled nearby'
	String tableScheduledNearby({required Object matchTitle}) => '${matchTitle} was just scheduled nearby';

	/// en: 'A new table was scheduled near {locationName}'
	String newTableScheduledNearLocation({required Object locationName}) => 'A new table was scheduled near ${locationName}';

	/// en: 'A new table was scheduled in your search area'
	String get newTableScheduledInSearchArea => 'A new table was scheduled in your search area';
}
