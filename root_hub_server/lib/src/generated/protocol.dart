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
import 'entities/community/post.dart' as _i7;
import 'entities/community/post_comment.dart' as _i8;
import 'entities/core/country.dart' as _i9;
import 'entities/core/faction.dart' as _i10;
import 'entities/core/language.dart' as _i11;
import 'entities/core/match_podium.dart' as _i12;
import 'entities/core/player_data.dart' as _i13;
import 'entities/match/match_in_person_proof.dart' as _i14;
import 'entities/match/played_match.dart' as _i15;
import 'entities/match/player_in_match.dart' as _i16;
import 'entities/match_making/location.dart' as _i17;
import 'entities/match_making/match_schedule.dart' as _i18;
import 'entities/match_making/match_subscription.dart' as _i19;
import 'entities/others/pagination_metadata.dart' as _i20;
import 'package:root_hub_server/src/generated/entities/match_making/match_subscription.dart'
    as _i21;
export 'api/community/models/comments_pagination.dart';
export 'api/community/models/post_pagination.dart';
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
export 'entities/match_making/location.dart';
export 'entities/match_making/match_schedule.dart';
export 'entities/match_making/match_subscription.dart';
export 'entities/others/pagination_metadata.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
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
          name: 'aditionalInfo',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'guidelinesDescription',
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
    if (t == _i7.Post) {
      return _i7.Post.fromJson(data) as T;
    }
    if (t == _i8.PostComment) {
      return _i8.PostComment.fromJson(data) as T;
    }
    if (t == _i9.Country) {
      return _i9.Country.fromJson(data) as T;
    }
    if (t == _i10.Faction) {
      return _i10.Faction.fromJson(data) as T;
    }
    if (t == _i11.Language) {
      return _i11.Language.fromJson(data) as T;
    }
    if (t == _i12.MatchPodium) {
      return _i12.MatchPodium.fromJson(data) as T;
    }
    if (t == _i13.PlayerData) {
      return _i13.PlayerData.fromJson(data) as T;
    }
    if (t == _i14.MatchInPersonProof) {
      return _i14.MatchInPersonProof.fromJson(data) as T;
    }
    if (t == _i15.PlayedMatch) {
      return _i15.PlayedMatch.fromJson(data) as T;
    }
    if (t == _i16.PlayerInMatch) {
      return _i16.PlayerInMatch.fromJson(data) as T;
    }
    if (t == _i17.Location) {
      return _i17.Location.fromJson(data) as T;
    }
    if (t == _i18.MatchSchedulePairingAttempt) {
      return _i18.MatchSchedulePairingAttempt.fromJson(data) as T;
    }
    if (t == _i19.MatchSubscription) {
      return _i19.MatchSubscription.fromJson(data) as T;
    }
    if (t == _i20.PaginationMetadata) {
      return _i20.PaginationMetadata.fromJson(data) as T;
    }
    if (t == _i1.getType<_i5.CommentsPagination?>()) {
      return (data != null ? _i5.CommentsPagination.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.PostPagination?>()) {
      return (data != null ? _i6.PostPagination.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Post?>()) {
      return (data != null ? _i7.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.PostComment?>()) {
      return (data != null ? _i8.PostComment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Country?>()) {
      return (data != null ? _i9.Country.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Faction?>()) {
      return (data != null ? _i10.Faction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Language?>()) {
      return (data != null ? _i11.Language.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.MatchPodium?>()) {
      return (data != null ? _i12.MatchPodium.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.PlayerData?>()) {
      return (data != null ? _i13.PlayerData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.MatchInPersonProof?>()) {
      return (data != null ? _i14.MatchInPersonProof.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i15.PlayedMatch?>()) {
      return (data != null ? _i15.PlayedMatch.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.PlayerInMatch?>()) {
      return (data != null ? _i16.PlayerInMatch.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.Location?>()) {
      return (data != null ? _i17.Location.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.MatchSchedulePairingAttempt?>()) {
      return (data != null
              ? _i18.MatchSchedulePairingAttempt.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i19.MatchSubscription?>()) {
      return (data != null ? _i19.MatchSubscription.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.PaginationMetadata?>()) {
      return (data != null ? _i20.PaginationMetadata.fromJson(data) : null)
          as T;
    }
    if (t == List<_i8.PostComment>) {
      return (data as List).map((e) => deserialize<_i8.PostComment>(e)).toList()
          as T;
    }
    if (t == List<_i7.Post>) {
      return (data as List).map((e) => deserialize<_i7.Post>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i8.PostComment>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i8.PostComment>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i16.PlayerInMatch>) {
      return (data as List)
              .map((e) => deserialize<_i16.PlayerInMatch>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i16.PlayerInMatch>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i16.PlayerInMatch>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == _i1.getType<List<_i7.Post>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i7.Post>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i18.MatchSchedulePairingAttempt>) {
      return (data as List)
              .map((e) => deserialize<_i18.MatchSchedulePairingAttempt>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i18.MatchSchedulePairingAttempt>?>()) {
      return (data != null
              ? (data as List)
                    .map(
                      (e) => deserialize<_i18.MatchSchedulePairingAttempt>(e),
                    )
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i19.MatchSubscription>) {
      return (data as List)
              .map((e) => deserialize<_i19.MatchSubscription>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i19.MatchSubscription>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i19.MatchSubscription>(e))
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
    if (t == List<_i21.MatchSubscription>) {
      return (data as List)
              .map((e) => deserialize<_i21.MatchSubscription>(e))
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
      _i7.Post => 'Post',
      _i8.PostComment => 'PostComment',
      _i9.Country => 'Country',
      _i10.Faction => 'Faction',
      _i11.Language => 'Language',
      _i12.MatchPodium => 'MatchPodium',
      _i13.PlayerData => 'PlayerData',
      _i14.MatchInPersonProof => 'MatchInPersonProof',
      _i15.PlayedMatch => 'PlayedMatch',
      _i16.PlayerInMatch => 'PlayerInMatch',
      _i17.Location => 'Location',
      _i18.MatchSchedulePairingAttempt => 'MatchSchedulePairingAttempt',
      _i19.MatchSubscription => 'MatchSubscription',
      _i20.PaginationMetadata => 'PaginationMetadata',
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
      case _i7.Post():
        return 'Post';
      case _i8.PostComment():
        return 'PostComment';
      case _i9.Country():
        return 'Country';
      case _i10.Faction():
        return 'Faction';
      case _i11.Language():
        return 'Language';
      case _i12.MatchPodium():
        return 'MatchPodium';
      case _i13.PlayerData():
        return 'PlayerData';
      case _i14.MatchInPersonProof():
        return 'MatchInPersonProof';
      case _i15.PlayedMatch():
        return 'PlayedMatch';
      case _i16.PlayerInMatch():
        return 'PlayerInMatch';
      case _i17.Location():
        return 'Location';
      case _i18.MatchSchedulePairingAttempt():
        return 'MatchSchedulePairingAttempt';
      case _i19.MatchSubscription():
        return 'MatchSubscription';
      case _i20.PaginationMetadata():
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
    if (dataClassName == 'Post') {
      return deserialize<_i7.Post>(data['data']);
    }
    if (dataClassName == 'PostComment') {
      return deserialize<_i8.PostComment>(data['data']);
    }
    if (dataClassName == 'Country') {
      return deserialize<_i9.Country>(data['data']);
    }
    if (dataClassName == 'Faction') {
      return deserialize<_i10.Faction>(data['data']);
    }
    if (dataClassName == 'Language') {
      return deserialize<_i11.Language>(data['data']);
    }
    if (dataClassName == 'MatchPodium') {
      return deserialize<_i12.MatchPodium>(data['data']);
    }
    if (dataClassName == 'PlayerData') {
      return deserialize<_i13.PlayerData>(data['data']);
    }
    if (dataClassName == 'MatchInPersonProof') {
      return deserialize<_i14.MatchInPersonProof>(data['data']);
    }
    if (dataClassName == 'PlayedMatch') {
      return deserialize<_i15.PlayedMatch>(data['data']);
    }
    if (dataClassName == 'PlayerInMatch') {
      return deserialize<_i16.PlayerInMatch>(data['data']);
    }
    if (dataClassName == 'Location') {
      return deserialize<_i17.Location>(data['data']);
    }
    if (dataClassName == 'MatchSchedulePairingAttempt') {
      return deserialize<_i18.MatchSchedulePairingAttempt>(data['data']);
    }
    if (dataClassName == 'MatchSubscription') {
      return deserialize<_i19.MatchSubscription>(data['data']);
    }
    if (dataClassName == 'PaginationMetadata') {
      return deserialize<_i20.PaginationMetadata>(data['data']);
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
      case _i7.Post:
        return _i7.Post.t;
      case _i8.PostComment:
        return _i8.PostComment.t;
      case _i13.PlayerData:
        return _i13.PlayerData.t;
      case _i14.MatchInPersonProof:
        return _i14.MatchInPersonProof.t;
      case _i15.PlayedMatch:
        return _i15.PlayedMatch.t;
      case _i16.PlayerInMatch:
        return _i16.PlayerInMatch.t;
      case _i17.Location:
        return _i17.Location.t;
      case _i18.MatchSchedulePairingAttempt:
        return _i18.MatchSchedulePairingAttempt.t;
      case _i19.MatchSubscription:
        return _i19.MatchSubscription.t;
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
