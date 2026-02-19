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
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'api/community/models/comments_pagination.dart' as _i2;
import 'api/community/models/post_pagination.dart' as _i3;
import 'entities/community/post.dart' as _i4;
import 'entities/community/post_comment.dart' as _i5;
import 'entities/core/country.dart' as _i6;
import 'entities/core/faction.dart' as _i7;
import 'entities/core/language.dart' as _i8;
import 'entities/core/player_data.dart' as _i9;
import 'entities/match/match_in_person_proof.dart' as _i10;
import 'entities/match/match_podium.dart' as _i11;
import 'entities/match/played_match.dart' as _i12;
import 'entities/match/player_in_match.dart' as _i13;
import 'entities/others/pagination_metadata.dart' as _i14;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i15;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i16;
export 'api/community/models/comments_pagination.dart';
export 'api/community/models/post_pagination.dart';
export 'entities/community/post.dart';
export 'entities/community/post_comment.dart';
export 'entities/core/country.dart';
export 'entities/core/faction.dart';
export 'entities/core/language.dart';
export 'entities/core/player_data.dart';
export 'entities/match/match_in_person_proof.dart';
export 'entities/match/match_podium.dart';
export 'entities/match/played_match.dart';
export 'entities/match/player_in_match.dart';
export 'entities/others/pagination_metadata.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

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

    if (t == _i2.CommentsPagination) {
      return _i2.CommentsPagination.fromJson(data) as T;
    }
    if (t == _i3.PostPagination) {
      return _i3.PostPagination.fromJson(data) as T;
    }
    if (t == _i4.Post) {
      return _i4.Post.fromJson(data) as T;
    }
    if (t == _i5.PostComment) {
      return _i5.PostComment.fromJson(data) as T;
    }
    if (t == _i6.Country) {
      return _i6.Country.fromJson(data) as T;
    }
    if (t == _i7.Faction) {
      return _i7.Faction.fromJson(data) as T;
    }
    if (t == _i8.Language) {
      return _i8.Language.fromJson(data) as T;
    }
    if (t == _i9.PlayerData) {
      return _i9.PlayerData.fromJson(data) as T;
    }
    if (t == _i10.MatchInPersonProof) {
      return _i10.MatchInPersonProof.fromJson(data) as T;
    }
    if (t == _i11.MatchPodium) {
      return _i11.MatchPodium.fromJson(data) as T;
    }
    if (t == _i12.PlayedMatch) {
      return _i12.PlayedMatch.fromJson(data) as T;
    }
    if (t == _i13.PlayerInMatch) {
      return _i13.PlayerInMatch.fromJson(data) as T;
    }
    if (t == _i14.PaginationMetadata) {
      return _i14.PaginationMetadata.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.CommentsPagination?>()) {
      return (data != null ? _i2.CommentsPagination.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.PostPagination?>()) {
      return (data != null ? _i3.PostPagination.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Post?>()) {
      return (data != null ? _i4.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.PostComment?>()) {
      return (data != null ? _i5.PostComment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Country?>()) {
      return (data != null ? _i6.Country.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Faction?>()) {
      return (data != null ? _i7.Faction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Language?>()) {
      return (data != null ? _i8.Language.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.PlayerData?>()) {
      return (data != null ? _i9.PlayerData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.MatchInPersonProof?>()) {
      return (data != null ? _i10.MatchInPersonProof.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i11.MatchPodium?>()) {
      return (data != null ? _i11.MatchPodium.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.PlayedMatch?>()) {
      return (data != null ? _i12.PlayedMatch.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.PlayerInMatch?>()) {
      return (data != null ? _i13.PlayerInMatch.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.PaginationMetadata?>()) {
      return (data != null ? _i14.PaginationMetadata.fromJson(data) : null)
          as T;
    }
    if (t == List<_i5.PostComment>) {
      return (data as List).map((e) => deserialize<_i5.PostComment>(e)).toList()
          as T;
    }
    if (t == List<_i4.Post>) {
      return (data as List).map((e) => deserialize<_i4.Post>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i5.PostComment>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i5.PostComment>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i13.PlayerInMatch>) {
      return (data as List)
              .map((e) => deserialize<_i13.PlayerInMatch>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i13.PlayerInMatch>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i13.PlayerInMatch>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == _i1.getType<List<_i4.Post>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i4.Post>(e)).toList()
              : null)
          as T;
    }
    try {
      return _i15.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i16.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.CommentsPagination => 'CommentsPagination',
      _i3.PostPagination => 'PostPagination',
      _i4.Post => 'Post',
      _i5.PostComment => 'PostComment',
      _i6.Country => 'Country',
      _i7.Faction => 'Faction',
      _i8.Language => 'Language',
      _i9.PlayerData => 'PlayerData',
      _i10.MatchInPersonProof => 'MatchInPersonProof',
      _i11.MatchPodium => 'MatchPodium',
      _i12.PlayedMatch => 'PlayedMatch',
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
      case _i2.CommentsPagination():
        return 'CommentsPagination';
      case _i3.PostPagination():
        return 'PostPagination';
      case _i4.Post():
        return 'Post';
      case _i5.PostComment():
        return 'PostComment';
      case _i6.Country():
        return 'Country';
      case _i7.Faction():
        return 'Faction';
      case _i8.Language():
        return 'Language';
      case _i9.PlayerData():
        return 'PlayerData';
      case _i10.MatchInPersonProof():
        return 'MatchInPersonProof';
      case _i11.MatchPodium():
        return 'MatchPodium';
      case _i12.PlayedMatch():
        return 'PlayedMatch';
      case _i13.PlayerInMatch():
        return 'PlayerInMatch';
      case _i14.PaginationMetadata():
        return 'PaginationMetadata';
    }
    className = _i15.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i16.Protocol().getClassNameForObject(data);
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
      return deserialize<_i2.CommentsPagination>(data['data']);
    }
    if (dataClassName == 'PostPagination') {
      return deserialize<_i3.PostPagination>(data['data']);
    }
    if (dataClassName == 'Post') {
      return deserialize<_i4.Post>(data['data']);
    }
    if (dataClassName == 'PostComment') {
      return deserialize<_i5.PostComment>(data['data']);
    }
    if (dataClassName == 'Country') {
      return deserialize<_i6.Country>(data['data']);
    }
    if (dataClassName == 'Faction') {
      return deserialize<_i7.Faction>(data['data']);
    }
    if (dataClassName == 'Language') {
      return deserialize<_i8.Language>(data['data']);
    }
    if (dataClassName == 'PlayerData') {
      return deserialize<_i9.PlayerData>(data['data']);
    }
    if (dataClassName == 'MatchInPersonProof') {
      return deserialize<_i10.MatchInPersonProof>(data['data']);
    }
    if (dataClassName == 'MatchPodium') {
      return deserialize<_i11.MatchPodium>(data['data']);
    }
    if (dataClassName == 'PlayedMatch') {
      return deserialize<_i12.PlayedMatch>(data['data']);
    }
    if (dataClassName == 'PlayerInMatch') {
      return deserialize<_i13.PlayerInMatch>(data['data']);
    }
    if (dataClassName == 'PaginationMetadata') {
      return deserialize<_i14.PaginationMetadata>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i15.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i16.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

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
      return _i15.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i16.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
