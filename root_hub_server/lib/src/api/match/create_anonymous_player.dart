import 'package:root_hub_server/src/core/root_hub_endpoint_error.dart';
import 'package:root_hub_server/src/core/server_translations.dart';
import 'package:root_hub_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CreateAnonymousPlayer extends Endpoint {
  static const _minNameLength = 3;
  static const _maxNameLength = 50;

  @override
  bool get requireLogin => true;

  Future<AnonymousPlayer> v1(
    Session session, {
    required ServerSupportedTranslation language,
    required String firstName,
    required String lastName,
  }) async {
    final t = ServerTranslations.of(language);

    return guardRootHubEndpointErrors(
      () async {
        final normalizedFirstName = _normalizeNamePart(firstName);
        final normalizedLastName = _normalizeNamePart(lastName);
        _validateNamePart(
          language: language,
          namePart: normalizedFirstName,
          label: t.labels.firstName,
        );
        _validateNamePart(
          language: language,
          namePart: normalizedLastName,
          label: t.labels.lastName,
        );

        final authenticatedPlayerData = await _getAuthenticatedPlayerData(
          session,
          language: language,
        );

        final existingAnonymousPlayer = await AnonymousPlayer.db.findFirstRow(
          session,
          where: (t) =>
              t.createdByPlayerId.equals(authenticatedPlayerData.id!) &
              t.firstName.equals(normalizedFirstName) &
              t.lastName.equals(normalizedLastName),
          orderBy: (t) => t.id,
          orderDescending: true,
        );

        if (existingAnonymousPlayer != null) {
          return existingAnonymousPlayer;
        }

        final anonymousPlayer = await AnonymousPlayer.db.insertRow(
          session,
          AnonymousPlayer(
            firstName: normalizedFirstName,
            lastName: normalizedLastName,
            createdByPlayerId: authenticatedPlayerData.id!,
          ),
        );

        await AnonymousPlayer.db.attachRow.createdByPlayer(
          session,
          anonymousPlayer,
          authenticatedPlayerData,
        );

        return anonymousPlayer;
      },
      language: language,
      fallbackDescription: t.fallback.unableToCreateAnonymousPlayer,
    );
  }

  Future<PlayerData> _getAuthenticatedPlayerData(
    Session session, {
    required ServerSupportedTranslation language,
  }) async {
    final t = ServerTranslations.of(language);

    final userIdentifier = session.authenticated!.userIdentifier;
    final authUserId = UuidValue.fromString(userIdentifier);

    final playerData = await PlayerData.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(authUserId),
    );

    if (playerData == null) {
      throw RootHubEndpointError.notFound(
        language: language,
        title: t.errors.playerProfileMissingTitle,
        description: t.errors.playerProfileNotFoundForAuthenticatedUser,
      );
    }

    return playerData;
  }

  void _validateNamePart({
    required ServerSupportedTranslation language,
    required String namePart,
    required String label,
  }) {
    final t = ServerTranslations.of(language);

    if (namePart.isEmpty) {
      throw RootHubEndpointError.invalidRequest(
        language: language,
        title: t.errors.invalidAnonymousPlayerTitle,
        description: t.errors.firstNameCannotBeEmpty(label: label),
      );
    }

    if (namePart.length < _minNameLength) {
      throw RootHubEndpointError.invalidRequest(
        language: language,
        title: t.errors.invalidAnonymousPlayerTitle,
        description: t.errors.nameMustHaveAtLeastCharacters(
          label: label,
          minLength: _minNameLength,
        ),
      );
    }

    if (namePart.length > _maxNameLength) {
      throw RootHubEndpointError.invalidRequest(
        language: language,
        title: t.errors.invalidAnonymousPlayerTitle,
        description: t.errors.nameCannotExceedCharacters(
          label: label,
          maxLength: _maxNameLength,
        ),
      );
    }
  }

  String _normalizeNamePart(String value) {
    return value.trim().replaceAll(RegExp(r'\s+'), ' ');
  }
}
