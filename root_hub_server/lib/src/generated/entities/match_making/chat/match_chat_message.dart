/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../../entities/match_making/chat/match_chat_message_type.dart'
    as _i2;
import '../../../entities/match_making/chat/match_chat_history.dart' as _i3;
import '../../../entities/core/player_data.dart' as _i4;
import 'package:root_hub_server/src/generated/protocol.dart' as _i5;

abstract class MatchChatMessage
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  MatchChatMessage._({
    this.id,
    required this.sentAt,
    required this.content,
    this.imageUrl,
    this.blurhash,
    this.imageWidth,
    this.imageHeight,
    required this.messageType,
    required this.matchChatHistoryId,
    this.matchChatHistory,
    required this.playerDataId,
    this.sender,
  });

  factory MatchChatMessage({
    int? id,
    required DateTime sentAt,
    required String content,
    String? imageUrl,
    String? blurhash,
    int? imageWidth,
    int? imageHeight,
    required _i2.MatchChatMessageType messageType,
    required int matchChatHistoryId,
    _i3.MatchChatHistory? matchChatHistory,
    required int playerDataId,
    _i4.PlayerData? sender,
  }) = _MatchChatMessageImpl;

  factory MatchChatMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return MatchChatMessage(
      id: jsonSerialization['id'] as int?,
      sentAt: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['sentAt']),
      content: jsonSerialization['content'] as String,
      imageUrl: jsonSerialization['imageUrl'] as String?,
      blurhash: jsonSerialization['blurhash'] as String?,
      imageWidth: jsonSerialization['imageWidth'] as int?,
      imageHeight: jsonSerialization['imageHeight'] as int?,
      messageType: _i2.MatchChatMessageType.fromJson(
        (jsonSerialization['messageType'] as String),
      ),
      matchChatHistoryId: jsonSerialization['matchChatHistoryId'] as int,
      matchChatHistory: jsonSerialization['matchChatHistory'] == null
          ? null
          : _i5.Protocol().deserialize<_i3.MatchChatHistory>(
              jsonSerialization['matchChatHistory'],
            ),
      playerDataId: jsonSerialization['playerDataId'] as int,
      sender: jsonSerialization['sender'] == null
          ? null
          : _i5.Protocol().deserialize<_i4.PlayerData>(
              jsonSerialization['sender'],
            ),
    );
  }

  static final t = MatchChatMessageTable();

  static const db = MatchChatMessageRepository._();

  @override
  int? id;

  DateTime sentAt;

  String content;

  String? imageUrl;

  String? blurhash;

  int? imageWidth;

  int? imageHeight;

  _i2.MatchChatMessageType messageType;

  int matchChatHistoryId;

  _i3.MatchChatHistory? matchChatHistory;

  int playerDataId;

  _i4.PlayerData? sender;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [MatchChatMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchChatMessage copyWith({
    int? id,
    DateTime? sentAt,
    String? content,
    String? imageUrl,
    String? blurhash,
    int? imageWidth,
    int? imageHeight,
    _i2.MatchChatMessageType? messageType,
    int? matchChatHistoryId,
    _i3.MatchChatHistory? matchChatHistory,
    int? playerDataId,
    _i4.PlayerData? sender,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchChatMessage',
      if (id != null) 'id': id,
      'sentAt': sentAt.toJson(),
      'content': content,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (blurhash != null) 'blurhash': blurhash,
      if (imageWidth != null) 'imageWidth': imageWidth,
      if (imageHeight != null) 'imageHeight': imageHeight,
      'messageType': messageType.toJson(),
      'matchChatHistoryId': matchChatHistoryId,
      if (matchChatHistory != null)
        'matchChatHistory': matchChatHistory?.toJson(),
      'playerDataId': playerDataId,
      if (sender != null) 'sender': sender?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MatchChatMessage',
      if (id != null) 'id': id,
      'sentAt': sentAt.toJson(),
      'content': content,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (blurhash != null) 'blurhash': blurhash,
      if (imageWidth != null) 'imageWidth': imageWidth,
      if (imageHeight != null) 'imageHeight': imageHeight,
      'messageType': messageType.toJson(),
      'matchChatHistoryId': matchChatHistoryId,
      if (matchChatHistory != null)
        'matchChatHistory': matchChatHistory?.toJsonForProtocol(),
      'playerDataId': playerDataId,
      if (sender != null) 'sender': sender?.toJsonForProtocol(),
    };
  }

  static MatchChatMessageInclude include({
    _i3.MatchChatHistoryInclude? matchChatHistory,
    _i4.PlayerDataInclude? sender,
  }) {
    return MatchChatMessageInclude._(
      matchChatHistory: matchChatHistory,
      sender: sender,
    );
  }

  static MatchChatMessageIncludeList includeList({
    _i1.WhereExpressionBuilder<MatchChatMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MatchChatMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MatchChatMessageTable>? orderByList,
    MatchChatMessageInclude? include,
  }) {
    return MatchChatMessageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MatchChatMessage.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MatchChatMessage.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MatchChatMessageImpl extends MatchChatMessage {
  _MatchChatMessageImpl({
    int? id,
    required DateTime sentAt,
    required String content,
    String? imageUrl,
    String? blurhash,
    int? imageWidth,
    int? imageHeight,
    required _i2.MatchChatMessageType messageType,
    required int matchChatHistoryId,
    _i3.MatchChatHistory? matchChatHistory,
    required int playerDataId,
    _i4.PlayerData? sender,
  }) : super._(
         id: id,
         sentAt: sentAt,
         content: content,
         imageUrl: imageUrl,
         blurhash: blurhash,
         imageWidth: imageWidth,
         imageHeight: imageHeight,
         messageType: messageType,
         matchChatHistoryId: matchChatHistoryId,
         matchChatHistory: matchChatHistory,
         playerDataId: playerDataId,
         sender: sender,
       );

  /// Returns a shallow copy of this [MatchChatMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchChatMessage copyWith({
    Object? id = _Undefined,
    DateTime? sentAt,
    String? content,
    Object? imageUrl = _Undefined,
    Object? blurhash = _Undefined,
    Object? imageWidth = _Undefined,
    Object? imageHeight = _Undefined,
    _i2.MatchChatMessageType? messageType,
    int? matchChatHistoryId,
    Object? matchChatHistory = _Undefined,
    int? playerDataId,
    Object? sender = _Undefined,
  }) {
    return MatchChatMessage(
      id: id is int? ? id : this.id,
      sentAt: sentAt ?? this.sentAt,
      content: content ?? this.content,
      imageUrl: imageUrl is String? ? imageUrl : this.imageUrl,
      blurhash: blurhash is String? ? blurhash : this.blurhash,
      imageWidth: imageWidth is int? ? imageWidth : this.imageWidth,
      imageHeight: imageHeight is int? ? imageHeight : this.imageHeight,
      messageType: messageType ?? this.messageType,
      matchChatHistoryId: matchChatHistoryId ?? this.matchChatHistoryId,
      matchChatHistory: matchChatHistory is _i3.MatchChatHistory?
          ? matchChatHistory
          : this.matchChatHistory?.copyWith(),
      playerDataId: playerDataId ?? this.playerDataId,
      sender: sender is _i4.PlayerData? ? sender : this.sender?.copyWith(),
    );
  }
}

class MatchChatMessageUpdateTable
    extends _i1.UpdateTable<MatchChatMessageTable> {
  MatchChatMessageUpdateTable(super.table);

  _i1.ColumnValue<DateTime, DateTime> sentAt(DateTime value) => _i1.ColumnValue(
    table.sentAt,
    value,
  );

  _i1.ColumnValue<String, String> content(String value) => _i1.ColumnValue(
    table.content,
    value,
  );

  _i1.ColumnValue<String, String> imageUrl(String? value) => _i1.ColumnValue(
    table.imageUrl,
    value,
  );

  _i1.ColumnValue<String, String> blurhash(String? value) => _i1.ColumnValue(
    table.blurhash,
    value,
  );

  _i1.ColumnValue<int, int> imageWidth(int? value) => _i1.ColumnValue(
    table.imageWidth,
    value,
  );

  _i1.ColumnValue<int, int> imageHeight(int? value) => _i1.ColumnValue(
    table.imageHeight,
    value,
  );

  _i1.ColumnValue<_i2.MatchChatMessageType, _i2.MatchChatMessageType>
  messageType(_i2.MatchChatMessageType value) => _i1.ColumnValue(
    table.messageType,
    value,
  );

  _i1.ColumnValue<int, int> matchChatHistoryId(int value) => _i1.ColumnValue(
    table.matchChatHistoryId,
    value,
  );

  _i1.ColumnValue<int, int> playerDataId(int value) => _i1.ColumnValue(
    table.playerDataId,
    value,
  );
}

class MatchChatMessageTable extends _i1.Table<int?> {
  MatchChatMessageTable({super.tableRelation})
    : super(tableName: 'match_chat_message') {
    updateTable = MatchChatMessageUpdateTable(this);
    sentAt = _i1.ColumnDateTime(
      'sentAt',
      this,
    );
    content = _i1.ColumnString(
      'content',
      this,
    );
    imageUrl = _i1.ColumnString(
      'imageUrl',
      this,
    );
    blurhash = _i1.ColumnString(
      'blurhash',
      this,
    );
    imageWidth = _i1.ColumnInt(
      'imageWidth',
      this,
    );
    imageHeight = _i1.ColumnInt(
      'imageHeight',
      this,
    );
    messageType = _i1.ColumnEnum(
      'messageType',
      this,
      _i1.EnumSerialization.byName,
    );
    matchChatHistoryId = _i1.ColumnInt(
      'matchChatHistoryId',
      this,
    );
    playerDataId = _i1.ColumnInt(
      'playerDataId',
      this,
    );
  }

  late final MatchChatMessageUpdateTable updateTable;

  late final _i1.ColumnDateTime sentAt;

  late final _i1.ColumnString content;

  late final _i1.ColumnString imageUrl;

  late final _i1.ColumnString blurhash;

  late final _i1.ColumnInt imageWidth;

  late final _i1.ColumnInt imageHeight;

  late final _i1.ColumnEnum<_i2.MatchChatMessageType> messageType;

  late final _i1.ColumnInt matchChatHistoryId;

  _i3.MatchChatHistoryTable? _matchChatHistory;

  late final _i1.ColumnInt playerDataId;

  _i4.PlayerDataTable? _sender;

  _i3.MatchChatHistoryTable get matchChatHistory {
    if (_matchChatHistory != null) return _matchChatHistory!;
    _matchChatHistory = _i1.createRelationTable(
      relationFieldName: 'matchChatHistory',
      field: MatchChatMessage.t.matchChatHistoryId,
      foreignField: _i3.MatchChatHistory.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.MatchChatHistoryTable(tableRelation: foreignTableRelation),
    );
    return _matchChatHistory!;
  }

  _i4.PlayerDataTable get sender {
    if (_sender != null) return _sender!;
    _sender = _i1.createRelationTable(
      relationFieldName: 'sender',
      field: MatchChatMessage.t.playerDataId,
      foreignField: _i4.PlayerData.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.PlayerDataTable(tableRelation: foreignTableRelation),
    );
    return _sender!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    sentAt,
    content,
    imageUrl,
    blurhash,
    imageWidth,
    imageHeight,
    messageType,
    matchChatHistoryId,
    playerDataId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'matchChatHistory') {
      return matchChatHistory;
    }
    if (relationField == 'sender') {
      return sender;
    }
    return null;
  }
}

class MatchChatMessageInclude extends _i1.IncludeObject {
  MatchChatMessageInclude._({
    _i3.MatchChatHistoryInclude? matchChatHistory,
    _i4.PlayerDataInclude? sender,
  }) {
    _matchChatHistory = matchChatHistory;
    _sender = sender;
  }

  _i3.MatchChatHistoryInclude? _matchChatHistory;

  _i4.PlayerDataInclude? _sender;

  @override
  Map<String, _i1.Include?> get includes => {
    'matchChatHistory': _matchChatHistory,
    'sender': _sender,
  };

  @override
  _i1.Table<int?> get table => MatchChatMessage.t;
}

class MatchChatMessageIncludeList extends _i1.IncludeList {
  MatchChatMessageIncludeList._({
    _i1.WhereExpressionBuilder<MatchChatMessageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MatchChatMessage.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => MatchChatMessage.t;
}

class MatchChatMessageRepository {
  const MatchChatMessageRepository._();

  final attachRow = const MatchChatMessageAttachRowRepository._();

  /// Returns a list of [MatchChatMessage]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<MatchChatMessage>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MatchChatMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MatchChatMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MatchChatMessageTable>? orderByList,
    _i1.Transaction? transaction,
    MatchChatMessageInclude? include,
  }) async {
    return session.db.find<MatchChatMessage>(
      where: where?.call(MatchChatMessage.t),
      orderBy: orderBy?.call(MatchChatMessage.t),
      orderByList: orderByList?.call(MatchChatMessage.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [MatchChatMessage] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<MatchChatMessage?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MatchChatMessageTable>? where,
    int? offset,
    _i1.OrderByBuilder<MatchChatMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MatchChatMessageTable>? orderByList,
    _i1.Transaction? transaction,
    MatchChatMessageInclude? include,
  }) async {
    return session.db.findFirstRow<MatchChatMessage>(
      where: where?.call(MatchChatMessage.t),
      orderBy: orderBy?.call(MatchChatMessage.t),
      orderByList: orderByList?.call(MatchChatMessage.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [MatchChatMessage] by its [id] or null if no such row exists.
  Future<MatchChatMessage?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    MatchChatMessageInclude? include,
  }) async {
    return session.db.findById<MatchChatMessage>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [MatchChatMessage]s in the list and returns the inserted rows.
  ///
  /// The returned [MatchChatMessage]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<MatchChatMessage>> insert(
    _i1.Session session,
    List<MatchChatMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<MatchChatMessage>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [MatchChatMessage] and returns the inserted row.
  ///
  /// The returned [MatchChatMessage] will have its `id` field set.
  Future<MatchChatMessage> insertRow(
    _i1.Session session,
    MatchChatMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MatchChatMessage>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MatchChatMessage]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MatchChatMessage>> update(
    _i1.Session session,
    List<MatchChatMessage> rows, {
    _i1.ColumnSelections<MatchChatMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MatchChatMessage>(
      rows,
      columns: columns?.call(MatchChatMessage.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MatchChatMessage]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MatchChatMessage> updateRow(
    _i1.Session session,
    MatchChatMessage row, {
    _i1.ColumnSelections<MatchChatMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MatchChatMessage>(
      row,
      columns: columns?.call(MatchChatMessage.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MatchChatMessage] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<MatchChatMessage?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<MatchChatMessageUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<MatchChatMessage>(
      id,
      columnValues: columnValues(MatchChatMessage.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [MatchChatMessage]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<MatchChatMessage>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<MatchChatMessageUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<MatchChatMessageTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MatchChatMessageTable>? orderBy,
    _i1.OrderByListBuilder<MatchChatMessageTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<MatchChatMessage>(
      columnValues: columnValues(MatchChatMessage.t.updateTable),
      where: where(MatchChatMessage.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MatchChatMessage.t),
      orderByList: orderByList?.call(MatchChatMessage.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [MatchChatMessage]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MatchChatMessage>> delete(
    _i1.Session session,
    List<MatchChatMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MatchChatMessage>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MatchChatMessage].
  Future<MatchChatMessage> deleteRow(
    _i1.Session session,
    MatchChatMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MatchChatMessage>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MatchChatMessage>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MatchChatMessageTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MatchChatMessage>(
      where: where(MatchChatMessage.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MatchChatMessageTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MatchChatMessage>(
      where: where?.call(MatchChatMessage.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class MatchChatMessageAttachRowRepository {
  const MatchChatMessageAttachRowRepository._();

  /// Creates a relation between the given [MatchChatMessage] and [MatchChatHistory]
  /// by setting the [MatchChatMessage]'s foreign key `matchChatHistoryId` to refer to the [MatchChatHistory].
  Future<void> matchChatHistory(
    _i1.Session session,
    MatchChatMessage matchChatMessage,
    _i3.MatchChatHistory matchChatHistory, {
    _i1.Transaction? transaction,
  }) async {
    if (matchChatMessage.id == null) {
      throw ArgumentError.notNull('matchChatMessage.id');
    }
    if (matchChatHistory.id == null) {
      throw ArgumentError.notNull('matchChatHistory.id');
    }

    var $matchChatMessage = matchChatMessage.copyWith(
      matchChatHistoryId: matchChatHistory.id,
    );
    await session.db.updateRow<MatchChatMessage>(
      $matchChatMessage,
      columns: [MatchChatMessage.t.matchChatHistoryId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [MatchChatMessage] and [PlayerData]
  /// by setting the [MatchChatMessage]'s foreign key `playerDataId` to refer to the [PlayerData].
  Future<void> sender(
    _i1.Session session,
    MatchChatMessage matchChatMessage,
    _i4.PlayerData sender, {
    _i1.Transaction? transaction,
  }) async {
    if (matchChatMessage.id == null) {
      throw ArgumentError.notNull('matchChatMessage.id');
    }
    if (sender.id == null) {
      throw ArgumentError.notNull('sender.id');
    }

    var $matchChatMessage = matchChatMessage.copyWith(playerDataId: sender.id);
    await session.db.updateRow<MatchChatMessage>(
      $matchChatMessage,
      columns: [MatchChatMessage.t.playerDataId],
      transaction: transaction,
    );
  }
}
