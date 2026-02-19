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
import 'entities/match/match_in_person_proof.dart' as _i11;
import 'entities/match/match_podium.dart' as _i12;
import 'entities/match/player_in_match.dart' as _i13;
import 'entities/others/pagination_metadata.dart' as _i14;
export 'api/community/models/comments_pagination.dart';
export 'api/community/models/post_pagination.dart';
export 'entities/community/post.dart';
export 'entities/community/post_comment.dart';
export 'entities/core/country.dart';
export 'entities/core/faction.dart';
export 'entities/match/match_in_person_proof.dart';
export 'entities/match/match_podium.dart';
export 'entities/match/player_in_match.dart';
export 'entities/others/pagination_metadata.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
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
    if (t == _i11.MatchInPersonProof) {
      return _i11.MatchInPersonProof.fromJson(data) as T;
    }
    if (t == _i12.MatchPodium) {
      return _i12.MatchPodium.fromJson(data) as T;
    }
    if (t == _i13.PlayerInMatch) {
      return _i13.PlayerInMatch.fromJson(data) as T;
    }
    if (t == _i14.PaginationMetadata) {
      return _i14.PaginationMetadata.fromJson(data) as T;
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
    if (t == _i1.getType<_i11.MatchInPersonProof?>()) {
      return (data != null ? _i11.MatchInPersonProof.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i12.MatchPodium?>()) {
      return (data != null ? _i12.MatchPodium.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.PlayerInMatch?>()) {
      return (data != null ? _i13.PlayerInMatch.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.PaginationMetadata?>()) {
      return (data != null ? _i14.PaginationMetadata.fromJson(data) : null)
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
      _i11.MatchInPersonProof => 'MatchInPersonProof',
      _i12.MatchPodium => 'MatchPodium',
      _i13.PlayerInMatch => 'PlayerInMatch',
      _i14.PaginationMetadata => 'PaginationMetadata',
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
      case _i11.MatchInPersonProof():
        return 'MatchInPersonProof';
      case _i12.MatchPodium():
        return 'MatchPodium';
      case _i13.PlayerInMatch():
        return 'PlayerInMatch';
      case _i14.PaginationMetadata():
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
    if (dataClassName == 'MatchInPersonProof') {
      return deserialize<_i11.MatchInPersonProof>(data['data']);
    }
    if (dataClassName == 'MatchPodium') {
      return deserialize<_i12.MatchPodium>(data['data']);
    }
    if (dataClassName == 'PlayerInMatch') {
      return deserialize<_i13.PlayerInMatch>(data['data']);
    }
    if (dataClassName == 'PaginationMetadata') {
      return deserialize<_i14.PaginationMetadata>(data['data']);
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
      case _i11.MatchInPersonProof:
        return _i11.MatchInPersonProof.t;
      case _i13.PlayerInMatch:
        return _i13.PlayerInMatch.t;
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
