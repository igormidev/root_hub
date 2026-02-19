/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i3;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i4;
import 'api/community/models/comments_pagination.dart' as _i5;
import 'api/community/models/post_pagination.dart' as _i6;
import 'api/match_making/models/location_pagination.dart' as _i7;
import 'entities/community/post.dart' as _i8;
import 'entities/community/post_comment.dart' as _i9;
import 'entities/core/country.dart' as _i10;
import 'entities/core/faction.dart' as _i11;
import 'entities/core/language.dart' as _i12;
import 'entities/core/match_podium.dart' as _i13;
import 'entities/core/player_data.dart' as _i14;
import 'entities/match/match_in_person_proof.dart' as _i15;
import 'entities/match/played_match.dart' as _i16;
import 'entities/match/player_in_match.dart' as _i17;
import 'entities/match_making/chat/match_chat_history.dart' as _i18;
import 'entities/match_making/chat/match_chat_message.dart' as _i19;
import 'entities/match_making/google_place_location.dart' as _i20;
import 'entities/match_making/location.dart' as _i21;
import 'entities/match_making/manual_input_location.dart' as _i22;
import 'entities/match_making/match_schedule.dart' as _i23;
import 'entities/match_making/match_subscription.dart' as _i24;
import 'entities/others/pagination_metadata.dart' as _i25;
import 'package:root_hub_server/src/generated/entities/match_making/location.dart'
    as _i26;
import 'package:root_hub_server/src/generated/entities/match_making/match_subscription.dart'
    as _i27;
export 'api/community/models/comments_pagination.dart';
export 'api/community/models/post_pagination.dart';
export 'api/match_making/models/location_pagination.dart';
export 'entities/community/post.dart';
export 'entities/community/post_comment.dart';
export 'entities/core/country.dart';
export 'entities/core/faction.dart';
export 'entities/core/language.dart';
export 'entities/core/match_podium.dart';
export 'entities/core/player_data.dart';
export 'entities/match/match_in_person_proof.dart';
export 'entities/match/played_match.dart';
export 'entities/match/player_in_match.dart';
export 'entities/match_making/chat/match_chat_history.dart';
export 'entities/match_making/chat/match_chat_message.dart';
export 'entities/match_making/google_place_location.dart';
export 'entities/match_making/location.dart';
export 'entities/match_making/manual_input_location.dart';
export 'entities/match_making/match_schedule.dart';
export 'entities/match_making/match_subscription.dart';
export 'entities/others/pagination_metadata.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'google_place_locations',
      dartName: 'GooglePlaceLocation',
      schema: 'public',
      module: 'root_hub',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'google_place_locations_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'providerPlaceId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'formattedAddress',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'shortFormattedAddress',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'lat',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'lng',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'url',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'websiteUri',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'phoneNumber',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'types',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'primaryType',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'rating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'userRatingCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'priceLevel',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'primaryPhotoName',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'timezone',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'isPublicPlace',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'notes',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'google_place_locations_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'provider_place_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'providerPlaceId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'locations',
      dartName: 'Location',
      schema: 'public',
      module: 'root_hub',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'locations_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'googlePlaceLocationId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'manualInputLocationId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'locations_fk_0',
          columns: ['googlePlaceLocationId'],
          referenceTable: 'google_place_locations',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'locations_fk_1',
          columns: ['manualInputLocationId'],
          referenceTable: 'manual_input_locations',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'locations_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'location_google_place_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'googlePlaceLocationId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'location_manual_input_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'manualInputLocationId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'manual_input_locations',
      dartName: 'ManualInputLocation',
      schema: 'public',
      module: 'root_hub',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'manual_input_locations_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'cityName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'country',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:Country',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'manual_input_locations_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'match_in_person_proof',
      dartName: 'MatchInPersonProof',
      schema: 'public',
      module: 'root_hub',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'match_in_person_proof_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'matchId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'groupPhotoUrl',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'boardPhotoUrl',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'match_in_person_proof_fk_0',
          columns: ['matchId'],
          referenceTable: 'played_match',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'match_in_person_proof_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'match_in_person_proof_match_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'matchId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'match_schedule_pairing_attempt',
      dartName: 'MatchSchedulePairingAttempt',
      schema: 'public',
      module: 'root_hub',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'match_schedule_pairing_attempt_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'aditionalLocationInfo',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'minAmountOfPlayers',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:MatchPodium',
        ),
        _i2.ColumnDefinition(
          name: 'maxAmountOfPlayers',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:MatchPodium',
        ),
        _i2.ColumnDefinition(
          name: 'attemptedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'locationId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'playerDataId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'match_schedule_pairing_attempt_fk_0',
          columns: ['locationId'],
          referenceTable: 'locations',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'match_schedule_pairing_attempt_fk_1',
          columns: ['playerDataId'],
          referenceTable: 'player_data',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'match_schedule_pairing_attempt_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'location_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'locationId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'player_data_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'playerDataId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'match_subscriptions',
      dartName: 'MatchSubscription',
      schema: 'public',
      module: 'root_hub',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'match_subscriptions_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'subscribedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'matchSchedulePairingAttemptId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'playerDataId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'match_subscriptions_fk_0',
          columns: ['matchSchedulePairingAttemptId'],
          referenceTable: 'match_schedule_pairing_attempt',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'match_subscriptions_fk_1',
          columns: ['playerDataId'],
          referenceTable: 'player_data',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'match_subscriptions_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'match_schedule_pairing_attempt_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'matchSchedulePairingAttemptId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'subscription_player_data_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'playerDataId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'played_match',
      dartName: 'PlayedMatch',
      schema: 'public',
      module: 'root_hub',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'played_match_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'matchStartedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'matchDuration',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'Duration?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'played_match_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'player_data',
      dartName: 'PlayerData',
      schema: 'public',
      module: 'root_hub',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'player_data_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'authUserId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'currentCountry',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'protocol:Country?',
        ),
        _i2.ColumnDefinition(
          name: 'nationality',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'protocol:Country?',
        ),
        _i2.ColumnDefinition(
          name: 'favoriteFaction',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:Faction',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'player_data_fk_0',
          columns: ['authUserId'],
          referenceTable: 'serverpod_auth_core_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'player_data_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'auth_user_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'authUserId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'player_in_match',
      dartName: 'PlayerInMatch',
      schema: 'public',
      module: 'root_hub',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'player_in_match_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'playerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'matchId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'player_in_match_fk_0',
          columns: ['playerId'],
          referenceTable: 'player_data',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'player_in_match_fk_1',
          columns: ['matchId'],
          referenceTable: 'played_match',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'player_in_match_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'player_match_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'playerId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'matchId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'post',
      dartName: 'Post',
      schema: 'public',
      module: 'root_hub',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'post_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'content',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'likesCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'language',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:Language',
        ),
        _i2.ColumnDefinition(
          name: 'attachedMatchId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'authorId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'post_fk_0',
          columns: ['attachedMatchId'],
          referenceTable: 'played_match',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'post_fk_1',
          columns: ['authorId'],
          referenceTable: 'player_data',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'post_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'post_comment',
      dartName: 'PostComment',
      schema: 'public',
      module: 'root_hub',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'post_comment_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'content',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'language',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:Language',
        ),
        _i2.ColumnDefinition(
          name: 'postId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'ownerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'post_comment_fk_0',
          columns: ['postId'],
          referenceTable: 'post',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'post_comment_fk_1',
          columns: ['ownerId'],
          referenceTable: 'player_data',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'post_comment_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i4.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i5.CommentsPagination) {
      return _i5.CommentsPagination.fromJson(data) as T;
    }
    if (t == _i6.PostPagination) {
      return _i6.PostPagination.fromJson(data) as T;
    }
    if (t == _i7.LocationPagination) {
      return _i7.LocationPagination.fromJson(data) as T;
    }
    if (t == _i8.Post) {
      return _i8.Post.fromJson(data) as T;
    }
    if (t == _i9.PostComment) {
      return _i9.PostComment.fromJson(data) as T;
    }
    if (t == _i10.Country) {
      return _i10.Country.fromJson(data) as T;
    }
    if (t == _i11.Faction) {
      return _i11.Faction.fromJson(data) as T;
    }
    if (t == _i12.Language) {
      return _i12.Language.fromJson(data) as T;
    }
    if (t == _i13.MatchPodium) {
      return _i13.MatchPodium.fromJson(data) as T;
    }
    if (t == _i14.PlayerData) {
      return _i14.PlayerData.fromJson(data) as T;
    }
    if (t == _i15.MatchInPersonProof) {
      return _i15.MatchInPersonProof.fromJson(data) as T;
    }
    if (t == _i16.PlayedMatch) {
      return _i16.PlayedMatch.fromJson(data) as T;
    }
    if (t == _i17.PlayerInMatch) {
      return _i17.PlayerInMatch.fromJson(data) as T;
    }
    if (t == _i18.MatchChatHistory) {
      return _i18.MatchChatHistory.fromJson(data) as T;
    }
    if (t == _i19.MatchChatMessage) {
      return _i19.MatchChatMessage.fromJson(data) as T;
    }
    if (t == _i20.GooglePlaceLocation) {
      return _i20.GooglePlaceLocation.fromJson(data) as T;
    }
    if (t == _i21.Location) {
      return _i21.Location.fromJson(data) as T;
    }
    if (t == _i22.ManualInputLocation) {
      return _i22.ManualInputLocation.fromJson(data) as T;
    }
    if (t == _i23.MatchSchedulePairingAttempt) {
      return _i23.MatchSchedulePairingAttempt.fromJson(data) as T;
    }
    if (t == _i24.MatchSubscription) {
      return _i24.MatchSubscription.fromJson(data) as T;
    }
    if (t == _i25.PaginationMetadata) {
      return _i25.PaginationMetadata.fromJson(data) as T;
    }
    if (t == _i1.getType<_i5.CommentsPagination?>()) {
      return (data != null ? _i5.CommentsPagination.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.PostPagination?>()) {
      return (data != null ? _i6.PostPagination.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.LocationPagination?>()) {
      return (data != null ? _i7.LocationPagination.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Post?>()) {
      return (data != null ? _i8.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.PostComment?>()) {
      return (data != null ? _i9.PostComment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Country?>()) {
      return (data != null ? _i10.Country.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Faction?>()) {
      return (data != null ? _i11.Faction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Language?>()) {
      return (data != null ? _i12.Language.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.MatchPodium?>()) {
      return (data != null ? _i13.MatchPodium.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.PlayerData?>()) {
      return (data != null ? _i14.PlayerData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.MatchInPersonProof?>()) {
      return (data != null ? _i15.MatchInPersonProof.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i16.PlayedMatch?>()) {
      return (data != null ? _i16.PlayedMatch.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.PlayerInMatch?>()) {
      return (data != null ? _i17.PlayerInMatch.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.MatchChatHistory?>()) {
      return (data != null ? _i18.MatchChatHistory.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.MatchChatMessage?>()) {
      return (data != null ? _i19.MatchChatMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.GooglePlaceLocation?>()) {
      return (data != null ? _i20.GooglePlaceLocation.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i21.Location?>()) {
      return (data != null ? _i21.Location.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.ManualInputLocation?>()) {
      return (data != null ? _i22.ManualInputLocation.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i23.MatchSchedulePairingAttempt?>()) {
      return (data != null
              ? _i23.MatchSchedulePairingAttempt.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i24.MatchSubscription?>()) {
      return (data != null ? _i24.MatchSubscription.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.PaginationMetadata?>()) {
      return (data != null ? _i25.PaginationMetadata.fromJson(data) : null)
          as T;
    }
    if (t == List<_i9.PostComment>) {
      return (data as List).map((e) => deserialize<_i9.PostComment>(e)).toList()
          as T;
    }
    if (t == List<_i8.Post>) {
      return (data as List).map((e) => deserialize<_i8.Post>(e)).toList() as T;
    }
    if (t == List<_i21.Location>) {
      return (data as List).map((e) => deserialize<_i21.Location>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i9.PostComment>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i9.PostComment>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i17.PlayerInMatch>) {
      return (data as List)
              .map((e) => deserialize<_i17.PlayerInMatch>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i17.PlayerInMatch>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i17.PlayerInMatch>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == _i1.getType<List<_i8.Post>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i8.Post>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i23.MatchSchedulePairingAttempt>) {
      return (data as List)
              .map((e) => deserialize<_i23.MatchSchedulePairingAttempt>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i23.MatchSchedulePairingAttempt>?>()) {
      return (data != null
              ? (data as List)
                    .map(
                      (e) => deserialize<_i23.MatchSchedulePairingAttempt>(e),
                    )
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i24.MatchSubscription>) {
      return (data as List)
              .map((e) => deserialize<_i24.MatchSubscription>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i24.MatchSubscription>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i24.MatchSubscription>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<String>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i26.Location>) {
      return (data as List).map((e) => deserialize<_i26.Location>(e)).toList()
          as T;
    }
    if (t == List<_i27.MatchSubscription>) {
      return (data as List)
              .map((e) => deserialize<_i27.MatchSubscription>(e))
              .toList()
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i5.CommentsPagination => 'CommentsPagination',
      _i6.PostPagination => 'PostPagination',
      _i7.LocationPagination => 'LocationPagination',
      _i8.Post => 'Post',
      _i9.PostComment => 'PostComment',
      _i10.Country => 'Country',
      _i11.Faction => 'Faction',
      _i12.Language => 'Language',
      _i13.MatchPodium => 'MatchPodium',
      _i14.PlayerData => 'PlayerData',
      _i15.MatchInPersonProof => 'MatchInPersonProof',
      _i16.PlayedMatch => 'PlayedMatch',
      _i17.PlayerInMatch => 'PlayerInMatch',
      _i18.MatchChatHistory => 'MatchChatHistory',
      _i19.MatchChatMessage => 'MatchChatMessage',
      _i20.GooglePlaceLocation => 'GooglePlaceLocation',
      _i21.Location => 'Location',
      _i22.ManualInputLocation => 'ManualInputLocation',
      _i23.MatchSchedulePairingAttempt => 'MatchSchedulePairingAttempt',
      _i24.MatchSubscription => 'MatchSubscription',
      _i25.PaginationMetadata => 'PaginationMetadata',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('root_hub.', '');
    }

    switch (data) {
      case _i5.CommentsPagination():
        return 'CommentsPagination';
      case _i6.PostPagination():
        return 'PostPagination';
      case _i7.LocationPagination():
        return 'LocationPagination';
      case _i8.Post():
        return 'Post';
      case _i9.PostComment():
        return 'PostComment';
      case _i10.Country():
        return 'Country';
      case _i11.Faction():
        return 'Faction';
      case _i12.Language():
        return 'Language';
      case _i13.MatchPodium():
        return 'MatchPodium';
      case _i14.PlayerData():
        return 'PlayerData';
      case _i15.MatchInPersonProof():
        return 'MatchInPersonProof';
      case _i16.PlayedMatch():
        return 'PlayedMatch';
      case _i17.PlayerInMatch():
        return 'PlayerInMatch';
      case _i18.MatchChatHistory():
        return 'MatchChatHistory';
      case _i19.MatchChatMessage():
        return 'MatchChatMessage';
      case _i20.GooglePlaceLocation():
        return 'GooglePlaceLocation';
      case _i21.Location():
        return 'Location';
      case _i22.ManualInputLocation():
        return 'ManualInputLocation';
      case _i23.MatchSchedulePairingAttempt():
        return 'MatchSchedulePairingAttempt';
      case _i24.MatchSubscription():
        return 'MatchSubscription';
      case _i25.PaginationMetadata():
        return 'PaginationMetadata';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i4.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'CommentsPagination') {
      return deserialize<_i5.CommentsPagination>(data['data']);
    }
    if (dataClassName == 'PostPagination') {
      return deserialize<_i6.PostPagination>(data['data']);
    }
    if (dataClassName == 'LocationPagination') {
      return deserialize<_i7.LocationPagination>(data['data']);
    }
    if (dataClassName == 'Post') {
      return deserialize<_i8.Post>(data['data']);
    }
    if (dataClassName == 'PostComment') {
      return deserialize<_i9.PostComment>(data['data']);
    }
    if (dataClassName == 'Country') {
      return deserialize<_i10.Country>(data['data']);
    }
    if (dataClassName == 'Faction') {
      return deserialize<_i11.Faction>(data['data']);
    }
    if (dataClassName == 'Language') {
      return deserialize<_i12.Language>(data['data']);
    }
    if (dataClassName == 'MatchPodium') {
      return deserialize<_i13.MatchPodium>(data['data']);
    }
    if (dataClassName == 'PlayerData') {
      return deserialize<_i14.PlayerData>(data['data']);
    }
    if (dataClassName == 'MatchInPersonProof') {
      return deserialize<_i15.MatchInPersonProof>(data['data']);
    }
    if (dataClassName == 'PlayedMatch') {
      return deserialize<_i16.PlayedMatch>(data['data']);
    }
    if (dataClassName == 'PlayerInMatch') {
      return deserialize<_i17.PlayerInMatch>(data['data']);
    }
    if (dataClassName == 'MatchChatHistory') {
      return deserialize<_i18.MatchChatHistory>(data['data']);
    }
    if (dataClassName == 'MatchChatMessage') {
      return deserialize<_i19.MatchChatMessage>(data['data']);
    }
    if (dataClassName == 'GooglePlaceLocation') {
      return deserialize<_i20.GooglePlaceLocation>(data['data']);
    }
    if (dataClassName == 'Location') {
      return deserialize<_i21.Location>(data['data']);
    }
    if (dataClassName == 'ManualInputLocation') {
      return deserialize<_i22.ManualInputLocation>(data['data']);
    }
    if (dataClassName == 'MatchSchedulePairingAttempt') {
      return deserialize<_i23.MatchSchedulePairingAttempt>(data['data']);
    }
    if (dataClassName == 'MatchSubscription') {
      return deserialize<_i24.MatchSubscription>(data['data']);
    }
    if (dataClassName == 'PaginationMetadata') {
      return deserialize<_i25.PaginationMetadata>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i4.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i4.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i8.Post:
        return _i8.Post.t;
      case _i9.PostComment:
        return _i9.PostComment.t;
      case _i14.PlayerData:
        return _i14.PlayerData.t;
      case _i15.MatchInPersonProof:
        return _i15.MatchInPersonProof.t;
      case _i16.PlayedMatch:
        return _i16.PlayedMatch.t;
      case _i17.PlayerInMatch:
        return _i17.PlayerInMatch.t;
      case _i20.GooglePlaceLocation:
        return _i20.GooglePlaceLocation.t;
      case _i21.Location:
        return _i21.Location.t;
      case _i22.ManualInputLocation:
        return _i22.ManualInputLocation.t;
      case _i23.MatchSchedulePairingAttempt:
        return _i23.MatchSchedulePairingAttempt.t;
      case _i24.MatchSubscription:
        return _i24.MatchSubscription.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'root_hub';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i3.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i4.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
