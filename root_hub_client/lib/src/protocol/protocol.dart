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
import 'api/match_making/models/location_pagination.dart' as _i4;
import 'entities/community/post.dart' as _i5;
import 'entities/community/post_comment.dart' as _i6;
import 'entities/core/country.dart' as _i7;
import 'entities/core/faction.dart' as _i8;
import 'entities/core/language.dart' as _i9;
import 'entities/core/match_podium.dart' as _i10;
import 'entities/core/player_data.dart' as _i11;
import 'entities/match/match_in_person_proof.dart' as _i12;
import 'entities/match/played_match.dart' as _i13;
import 'entities/match/player_in_match.dart' as _i14;
import 'entities/match_making/chat/match_chat_history.dart' as _i15;
import 'entities/match_making/chat/match_chat_message.dart' as _i16;
import 'entities/match_making/google_place_location.dart' as _i17;
import 'entities/match_making/location.dart' as _i18;
import 'entities/match_making/manual_input_location.dart' as _i19;
import 'entities/match_making/match_schedule.dart' as _i20;
import 'entities/match_making/match_subscription.dart' as _i21;
import 'entities/others/pagination_metadata.dart' as _i22;
import 'package:root_hub_client/src/protocol/entities/match_making/chat/match_chat_message.dart'
    as _i23;
import 'package:root_hub_client/src/protocol/entities/match_making/location.dart'
    as _i24;
import 'package:root_hub_client/src/protocol/entities/match_making/match_subscription.dart'
    as _i25;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i26;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
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
    if (t == _i4.LocationPagination) {
      return _i4.LocationPagination.fromJson(data) as T;
    }
    if (t == _i5.Post) {
      return _i5.Post.fromJson(data) as T;
    }
    if (t == _i6.PostComment) {
      return _i6.PostComment.fromJson(data) as T;
    }
    if (t == _i7.Country) {
      return _i7.Country.fromJson(data) as T;
    }
    if (t == _i8.Faction) {
      return _i8.Faction.fromJson(data) as T;
    }
    if (t == _i9.Language) {
      return _i9.Language.fromJson(data) as T;
    }
    if (t == _i10.MatchPodium) {
      return _i10.MatchPodium.fromJson(data) as T;
    }
    if (t == _i11.PlayerData) {
      return _i11.PlayerData.fromJson(data) as T;
    }
    if (t == _i12.MatchInPersonProof) {
      return _i12.MatchInPersonProof.fromJson(data) as T;
    }
    if (t == _i13.PlayedMatch) {
      return _i13.PlayedMatch.fromJson(data) as T;
    }
    if (t == _i14.PlayerInMatch) {
      return _i14.PlayerInMatch.fromJson(data) as T;
    }
    if (t == _i15.MatchChatHistory) {
      return _i15.MatchChatHistory.fromJson(data) as T;
    }
    if (t == _i16.MatchChatMessage) {
      return _i16.MatchChatMessage.fromJson(data) as T;
    }
    if (t == _i17.GooglePlaceLocation) {
      return _i17.GooglePlaceLocation.fromJson(data) as T;
    }
    if (t == _i18.Location) {
      return _i18.Location.fromJson(data) as T;
    }
    if (t == _i19.ManualInputLocation) {
      return _i19.ManualInputLocation.fromJson(data) as T;
    }
    if (t == _i20.MatchSchedulePairingAttempt) {
      return _i20.MatchSchedulePairingAttempt.fromJson(data) as T;
    }
    if (t == _i21.MatchSubscription) {
      return _i21.MatchSubscription.fromJson(data) as T;
    }
    if (t == _i22.PaginationMetadata) {
      return _i22.PaginationMetadata.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.CommentsPagination?>()) {
      return (data != null ? _i2.CommentsPagination.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.PostPagination?>()) {
      return (data != null ? _i3.PostPagination.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.LocationPagination?>()) {
      return (data != null ? _i4.LocationPagination.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Post?>()) {
      return (data != null ? _i5.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.PostComment?>()) {
      return (data != null ? _i6.PostComment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Country?>()) {
      return (data != null ? _i7.Country.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Faction?>()) {
      return (data != null ? _i8.Faction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Language?>()) {
      return (data != null ? _i9.Language.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.MatchPodium?>()) {
      return (data != null ? _i10.MatchPodium.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.PlayerData?>()) {
      return (data != null ? _i11.PlayerData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.MatchInPersonProof?>()) {
      return (data != null ? _i12.MatchInPersonProof.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i13.PlayedMatch?>()) {
      return (data != null ? _i13.PlayedMatch.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.PlayerInMatch?>()) {
      return (data != null ? _i14.PlayerInMatch.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.MatchChatHistory?>()) {
      return (data != null ? _i15.MatchChatHistory.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.MatchChatMessage?>()) {
      return (data != null ? _i16.MatchChatMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.GooglePlaceLocation?>()) {
      return (data != null ? _i17.GooglePlaceLocation.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i18.Location?>()) {
      return (data != null ? _i18.Location.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.ManualInputLocation?>()) {
      return (data != null ? _i19.ManualInputLocation.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i20.MatchSchedulePairingAttempt?>()) {
      return (data != null
              ? _i20.MatchSchedulePairingAttempt.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i21.MatchSubscription?>()) {
      return (data != null ? _i21.MatchSubscription.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.PaginationMetadata?>()) {
      return (data != null ? _i22.PaginationMetadata.fromJson(data) : null)
          as T;
    }
    if (t == List<_i6.PostComment>) {
      return (data as List).map((e) => deserialize<_i6.PostComment>(e)).toList()
          as T;
    }
    if (t == List<_i5.Post>) {
      return (data as List).map((e) => deserialize<_i5.Post>(e)).toList() as T;
    }
    if (t == List<_i18.Location>) {
      return (data as List).map((e) => deserialize<_i18.Location>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i6.PostComment>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i6.PostComment>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i14.PlayerInMatch>) {
      return (data as List)
              .map((e) => deserialize<_i14.PlayerInMatch>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i14.PlayerInMatch>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i14.PlayerInMatch>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == _i1.getType<List<_i5.Post>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i5.Post>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i20.MatchSchedulePairingAttempt>) {
      return (data as List)
              .map((e) => deserialize<_i20.MatchSchedulePairingAttempt>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i20.MatchSchedulePairingAttempt>?>()) {
      return (data != null
              ? (data as List)
                    .map(
                      (e) => deserialize<_i20.MatchSchedulePairingAttempt>(e),
                    )
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i21.MatchSubscription>) {
      return (data as List)
              .map((e) => deserialize<_i21.MatchSubscription>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i21.MatchSubscription>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i21.MatchSubscription>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i16.MatchChatMessage>) {
      return (data as List)
              .map((e) => deserialize<_i16.MatchChatMessage>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i16.MatchChatMessage>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i16.MatchChatMessage>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i19.ManualInputLocation>) {
      return (data as List)
              .map((e) => deserialize<_i19.ManualInputLocation>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i19.ManualInputLocation>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i19.ManualInputLocation>(e))
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
    if (t == List<_i13.PlayedMatch>) {
      return (data as List)
              .map((e) => deserialize<_i13.PlayedMatch>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i13.PlayedMatch>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i13.PlayedMatch>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i23.MatchChatMessage>) {
      return (data as List)
              .map((e) => deserialize<_i23.MatchChatMessage>(e))
              .toList()
          as T;
    }
    if (t == List<_i24.Location>) {
      return (data as List).map((e) => deserialize<_i24.Location>(e)).toList()
          as T;
    }
    if (t == List<_i25.MatchSubscription>) {
      return (data as List)
              .map((e) => deserialize<_i25.MatchSubscription>(e))
              .toList()
          as T;
    }
    try {
      return _i26.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i27.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.CommentsPagination => 'CommentsPagination',
      _i3.PostPagination => 'PostPagination',
      _i4.LocationPagination => 'LocationPagination',
      _i5.Post => 'Post',
      _i6.PostComment => 'PostComment',
      _i7.Country => 'Country',
      _i8.Faction => 'Faction',
      _i9.Language => 'Language',
      _i10.MatchPodium => 'MatchPodium',
      _i11.PlayerData => 'PlayerData',
      _i12.MatchInPersonProof => 'MatchInPersonProof',
      _i13.PlayedMatch => 'PlayedMatch',
      _i14.PlayerInMatch => 'PlayerInMatch',
      _i15.MatchChatHistory => 'MatchChatHistory',
      _i16.MatchChatMessage => 'MatchChatMessage',
      _i17.GooglePlaceLocation => 'GooglePlaceLocation',
      _i18.Location => 'Location',
      _i19.ManualInputLocation => 'ManualInputLocation',
      _i20.MatchSchedulePairingAttempt => 'MatchSchedulePairingAttempt',
      _i21.MatchSubscription => 'MatchSubscription',
      _i22.PaginationMetadata => 'PaginationMetadata',
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
      case _i4.LocationPagination():
        return 'LocationPagination';
      case _i5.Post():
        return 'Post';
      case _i6.PostComment():
        return 'PostComment';
      case _i7.Country():
        return 'Country';
      case _i8.Faction():
        return 'Faction';
      case _i9.Language():
        return 'Language';
      case _i10.MatchPodium():
        return 'MatchPodium';
      case _i11.PlayerData():
        return 'PlayerData';
      case _i12.MatchInPersonProof():
        return 'MatchInPersonProof';
      case _i13.PlayedMatch():
        return 'PlayedMatch';
      case _i14.PlayerInMatch():
        return 'PlayerInMatch';
      case _i15.MatchChatHistory():
        return 'MatchChatHistory';
      case _i16.MatchChatMessage():
        return 'MatchChatMessage';
      case _i17.GooglePlaceLocation():
        return 'GooglePlaceLocation';
      case _i18.Location():
        return 'Location';
      case _i19.ManualInputLocation():
        return 'ManualInputLocation';
      case _i20.MatchSchedulePairingAttempt():
        return 'MatchSchedulePairingAttempt';
      case _i21.MatchSubscription():
        return 'MatchSubscription';
      case _i22.PaginationMetadata():
        return 'PaginationMetadata';
    }
    className = _i26.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i27.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'LocationPagination') {
      return deserialize<_i4.LocationPagination>(data['data']);
    }
    if (dataClassName == 'Post') {
      return deserialize<_i5.Post>(data['data']);
    }
    if (dataClassName == 'PostComment') {
      return deserialize<_i6.PostComment>(data['data']);
    }
    if (dataClassName == 'Country') {
      return deserialize<_i7.Country>(data['data']);
    }
    if (dataClassName == 'Faction') {
      return deserialize<_i8.Faction>(data['data']);
    }
    if (dataClassName == 'Language') {
      return deserialize<_i9.Language>(data['data']);
    }
    if (dataClassName == 'MatchPodium') {
      return deserialize<_i10.MatchPodium>(data['data']);
    }
    if (dataClassName == 'PlayerData') {
      return deserialize<_i11.PlayerData>(data['data']);
    }
    if (dataClassName == 'MatchInPersonProof') {
      return deserialize<_i12.MatchInPersonProof>(data['data']);
    }
    if (dataClassName == 'PlayedMatch') {
      return deserialize<_i13.PlayedMatch>(data['data']);
    }
    if (dataClassName == 'PlayerInMatch') {
      return deserialize<_i14.PlayerInMatch>(data['data']);
    }
    if (dataClassName == 'MatchChatHistory') {
      return deserialize<_i15.MatchChatHistory>(data['data']);
    }
    if (dataClassName == 'MatchChatMessage') {
      return deserialize<_i16.MatchChatMessage>(data['data']);
    }
    if (dataClassName == 'GooglePlaceLocation') {
      return deserialize<_i17.GooglePlaceLocation>(data['data']);
    }
    if (dataClassName == 'Location') {
      return deserialize<_i18.Location>(data['data']);
    }
    if (dataClassName == 'ManualInputLocation') {
      return deserialize<_i19.ManualInputLocation>(data['data']);
    }
    if (dataClassName == 'MatchSchedulePairingAttempt') {
      return deserialize<_i20.MatchSchedulePairingAttempt>(data['data']);
    }
    if (dataClassName == 'MatchSubscription') {
      return deserialize<_i21.MatchSubscription>(data['data']);
    }
    if (dataClassName == 'PaginationMetadata') {
      return deserialize<_i22.PaginationMetadata>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i26.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i27.Protocol().deserializeByClassName(data);
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
      return _i26.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i27.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
