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
import 'api/match/models/played_matches_pagination.dart' as _i4;
import 'api/match/models/player_match_result_input.dart' as _i5;
import 'api/match_making/models/location_pagination.dart' as _i6;
import 'entities/community/post.dart' as _i7;
import 'entities/community/post_comment.dart' as _i8;
import 'entities/core/anonymous_player.dart' as _i9;
import 'entities/core/country.dart' as _i10;
import 'entities/core/faction.dart' as _i11;
import 'entities/core/language.dart' as _i12;
import 'entities/core/match_podium.dart' as _i13;
import 'entities/core/player_data.dart' as _i14;
import 'entities/match/match_in_person_proof.dart' as _i15;
import 'entities/match/played_match.dart' as _i16;
import 'entities/match/player_in_match.dart' as _i17;
import 'entities/match/player_perfomance_in_match.dart' as _i18;
import 'entities/match_making/chat/match_chat_history.dart' as _i19;
import 'entities/match_making/chat/match_chat_message.dart' as _i20;
import 'entities/match_making/google_place_location.dart' as _i21;
import 'entities/match_making/location.dart' as _i22;
import 'entities/match_making/manual_input_location.dart' as _i23;
import 'entities/match_making/match_schedule.dart' as _i24;
import 'entities/match_making/match_subscription.dart' as _i25;
import 'entities/others/pagination_metadata.dart' as _i26;
import 'package:root_hub_client/src/protocol/entities/match/played_match.dart'
    as _i27;
import 'package:root_hub_client/src/protocol/api/match/models/player_match_result_input.dart'
    as _i28;
import 'package:root_hub_client/src/protocol/entities/match_making/chat/match_chat_message.dart'
    as _i29;
import 'package:root_hub_client/src/protocol/entities/match_making/location.dart'
    as _i30;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i31;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i32;
export 'api/community/models/comments_pagination.dart';
export 'api/community/models/post_pagination.dart';
export 'api/match/models/played_matches_pagination.dart';
export 'api/match/models/player_match_result_input.dart';
export 'api/match_making/models/location_pagination.dart';
export 'entities/community/post.dart';
export 'entities/community/post_comment.dart';
export 'entities/core/anonymous_player.dart';
export 'entities/core/country.dart';
export 'entities/core/faction.dart';
export 'entities/core/language.dart';
export 'entities/core/match_podium.dart';
export 'entities/core/player_data.dart';
export 'entities/match/match_in_person_proof.dart';
export 'entities/match/played_match.dart';
export 'entities/match/player_in_match.dart';
export 'entities/match/player_perfomance_in_match.dart';
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
    if (t == _i4.PlayedMatchesPagination) {
      return _i4.PlayedMatchesPagination.fromJson(data) as T;
    }
    if (t == _i5.PlayerMatchResultInput) {
      return _i5.PlayerMatchResultInput.fromJson(data) as T;
    }
    if (t == _i6.LocationPagination) {
      return _i6.LocationPagination.fromJson(data) as T;
    }
    if (t == _i7.Post) {
      return _i7.Post.fromJson(data) as T;
    }
    if (t == _i8.PostComment) {
      return _i8.PostComment.fromJson(data) as T;
    }
    if (t == _i9.AnonymousPlayer) {
      return _i9.AnonymousPlayer.fromJson(data) as T;
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
    if (t == _i18.PlayerPerfomanceInMatch) {
      return _i18.PlayerPerfomanceInMatch.fromJson(data) as T;
    }
    if (t == _i19.MatchChatHistory) {
      return _i19.MatchChatHistory.fromJson(data) as T;
    }
    if (t == _i20.MatchChatMessage) {
      return _i20.MatchChatMessage.fromJson(data) as T;
    }
    if (t == _i21.GooglePlaceLocation) {
      return _i21.GooglePlaceLocation.fromJson(data) as T;
    }
    if (t == _i22.Location) {
      return _i22.Location.fromJson(data) as T;
    }
    if (t == _i23.ManualInputLocation) {
      return _i23.ManualInputLocation.fromJson(data) as T;
    }
    if (t == _i24.MatchSchedulePairingAttempt) {
      return _i24.MatchSchedulePairingAttempt.fromJson(data) as T;
    }
    if (t == _i25.MatchSubscription) {
      return _i25.MatchSubscription.fromJson(data) as T;
    }
    if (t == _i26.PaginationMetadata) {
      return _i26.PaginationMetadata.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.CommentsPagination?>()) {
      return (data != null ? _i2.CommentsPagination.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.PostPagination?>()) {
      return (data != null ? _i3.PostPagination.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.PlayedMatchesPagination?>()) {
      return (data != null ? _i4.PlayedMatchesPagination.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i5.PlayerMatchResultInput?>()) {
      return (data != null ? _i5.PlayerMatchResultInput.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i6.LocationPagination?>()) {
      return (data != null ? _i6.LocationPagination.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Post?>()) {
      return (data != null ? _i7.Post.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.PostComment?>()) {
      return (data != null ? _i8.PostComment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.AnonymousPlayer?>()) {
      return (data != null ? _i9.AnonymousPlayer.fromJson(data) : null) as T;
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
    if (t == _i1.getType<_i18.PlayerPerfomanceInMatch?>()) {
      return (data != null ? _i18.PlayerPerfomanceInMatch.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i19.MatchChatHistory?>()) {
      return (data != null ? _i19.MatchChatHistory.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.MatchChatMessage?>()) {
      return (data != null ? _i20.MatchChatMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.GooglePlaceLocation?>()) {
      return (data != null ? _i21.GooglePlaceLocation.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i22.Location?>()) {
      return (data != null ? _i22.Location.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.ManualInputLocation?>()) {
      return (data != null ? _i23.ManualInputLocation.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i24.MatchSchedulePairingAttempt?>()) {
      return (data != null
              ? _i24.MatchSchedulePairingAttempt.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i25.MatchSubscription?>()) {
      return (data != null ? _i25.MatchSubscription.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.PaginationMetadata?>()) {
      return (data != null ? _i26.PaginationMetadata.fromJson(data) : null)
          as T;
    }
    if (t == List<_i8.PostComment>) {
      return (data as List).map((e) => deserialize<_i8.PostComment>(e)).toList()
          as T;
    }
    if (t == List<_i7.Post>) {
      return (data as List).map((e) => deserialize<_i7.Post>(e)).toList() as T;
    }
    if (t == List<_i25.MatchSubscription>) {
      return (data as List)
              .map((e) => deserialize<_i25.MatchSubscription>(e))
              .toList()
          as T;
    }
    if (t == List<_i22.Location>) {
      return (data as List).map((e) => deserialize<_i22.Location>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i8.PostComment>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i8.PostComment>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i18.PlayerPerfomanceInMatch>) {
      return (data as List)
              .map((e) => deserialize<_i18.PlayerPerfomanceInMatch>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i18.PlayerPerfomanceInMatch>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i18.PlayerPerfomanceInMatch>(e))
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
    if (t == _i1.getType<List<_i7.Post>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i7.Post>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i24.MatchSchedulePairingAttempt>) {
      return (data as List)
              .map((e) => deserialize<_i24.MatchSchedulePairingAttempt>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i24.MatchSchedulePairingAttempt>?>()) {
      return (data != null
              ? (data as List)
                    .map(
                      (e) => deserialize<_i24.MatchSchedulePairingAttempt>(e),
                    )
                    .toList()
              : null)
          as T;
    }
    if (t == _i1.getType<List<_i25.MatchSubscription>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i25.MatchSubscription>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i20.MatchChatMessage>) {
      return (data as List)
              .map((e) => deserialize<_i20.MatchChatMessage>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i20.MatchChatMessage>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i20.MatchChatMessage>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i23.ManualInputLocation>) {
      return (data as List)
              .map((e) => deserialize<_i23.ManualInputLocation>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i23.ManualInputLocation>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i23.ManualInputLocation>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i9.AnonymousPlayer>) {
      return (data as List)
              .map((e) => deserialize<_i9.AnonymousPlayer>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i9.AnonymousPlayer>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i9.AnonymousPlayer>(e))
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
    if (t == List<_i16.PlayedMatch>) {
      return (data as List)
              .map((e) => deserialize<_i16.PlayedMatch>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i16.PlayedMatch>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i16.PlayedMatch>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i27.PlayedMatch>) {
      return (data as List)
              .map((e) => deserialize<_i27.PlayedMatch>(e))
              .toList()
          as T;
    }
    if (t == List<_i28.PlayerMatchResultInput>) {
      return (data as List)
              .map((e) => deserialize<_i28.PlayerMatchResultInput>(e))
              .toList()
          as T;
    }
    if (t == List<_i29.MatchChatMessage>) {
      return (data as List)
              .map((e) => deserialize<_i29.MatchChatMessage>(e))
              .toList()
          as T;
    }
    if (t == List<_i30.Location>) {
      return (data as List).map((e) => deserialize<_i30.Location>(e)).toList()
          as T;
    }
    try {
      return _i31.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i32.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.CommentsPagination => 'CommentsPagination',
      _i3.PostPagination => 'PostPagination',
      _i4.PlayedMatchesPagination => 'PlayedMatchesPagination',
      _i5.PlayerMatchResultInput => 'PlayerMatchResultInput',
      _i6.LocationPagination => 'LocationPagination',
      _i7.Post => 'Post',
      _i8.PostComment => 'PostComment',
      _i9.AnonymousPlayer => 'AnonymousPlayer',
      _i10.Country => 'Country',
      _i11.Faction => 'Faction',
      _i12.Language => 'Language',
      _i13.MatchPodium => 'MatchPodium',
      _i14.PlayerData => 'PlayerData',
      _i15.MatchInPersonProof => 'MatchInPersonProof',
      _i16.PlayedMatch => 'PlayedMatch',
      _i17.PlayerInMatch => 'PlayerInMatch',
      _i18.PlayerPerfomanceInMatch => 'PlayerPerfomanceInMatch',
      _i19.MatchChatHistory => 'MatchChatHistory',
      _i20.MatchChatMessage => 'MatchChatMessage',
      _i21.GooglePlaceLocation => 'GooglePlaceLocation',
      _i22.Location => 'Location',
      _i23.ManualInputLocation => 'ManualInputLocation',
      _i24.MatchSchedulePairingAttempt => 'MatchSchedulePairingAttempt',
      _i25.MatchSubscription => 'MatchSubscription',
      _i26.PaginationMetadata => 'PaginationMetadata',
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
      case _i4.PlayedMatchesPagination():
        return 'PlayedMatchesPagination';
      case _i5.PlayerMatchResultInput():
        return 'PlayerMatchResultInput';
      case _i6.LocationPagination():
        return 'LocationPagination';
      case _i7.Post():
        return 'Post';
      case _i8.PostComment():
        return 'PostComment';
      case _i9.AnonymousPlayer():
        return 'AnonymousPlayer';
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
      case _i18.PlayerPerfomanceInMatch():
        return 'PlayerPerfomanceInMatch';
      case _i19.MatchChatHistory():
        return 'MatchChatHistory';
      case _i20.MatchChatMessage():
        return 'MatchChatMessage';
      case _i21.GooglePlaceLocation():
        return 'GooglePlaceLocation';
      case _i22.Location():
        return 'Location';
      case _i23.ManualInputLocation():
        return 'ManualInputLocation';
      case _i24.MatchSchedulePairingAttempt():
        return 'MatchSchedulePairingAttempt';
      case _i25.MatchSubscription():
        return 'MatchSubscription';
      case _i26.PaginationMetadata():
        return 'PaginationMetadata';
    }
    className = _i31.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i32.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'PlayedMatchesPagination') {
      return deserialize<_i4.PlayedMatchesPagination>(data['data']);
    }
    if (dataClassName == 'PlayerMatchResultInput') {
      return deserialize<_i5.PlayerMatchResultInput>(data['data']);
    }
    if (dataClassName == 'LocationPagination') {
      return deserialize<_i6.LocationPagination>(data['data']);
    }
    if (dataClassName == 'Post') {
      return deserialize<_i7.Post>(data['data']);
    }
    if (dataClassName == 'PostComment') {
      return deserialize<_i8.PostComment>(data['data']);
    }
    if (dataClassName == 'AnonymousPlayer') {
      return deserialize<_i9.AnonymousPlayer>(data['data']);
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
    if (dataClassName == 'PlayerPerfomanceInMatch') {
      return deserialize<_i18.PlayerPerfomanceInMatch>(data['data']);
    }
    if (dataClassName == 'MatchChatHistory') {
      return deserialize<_i19.MatchChatHistory>(data['data']);
    }
    if (dataClassName == 'MatchChatMessage') {
      return deserialize<_i20.MatchChatMessage>(data['data']);
    }
    if (dataClassName == 'GooglePlaceLocation') {
      return deserialize<_i21.GooglePlaceLocation>(data['data']);
    }
    if (dataClassName == 'Location') {
      return deserialize<_i22.Location>(data['data']);
    }
    if (dataClassName == 'ManualInputLocation') {
      return deserialize<_i23.ManualInputLocation>(data['data']);
    }
    if (dataClassName == 'MatchSchedulePairingAttempt') {
      return deserialize<_i24.MatchSchedulePairingAttempt>(data['data']);
    }
    if (dataClassName == 'MatchSubscription') {
      return deserialize<_i25.MatchSubscription>(data['data']);
    }
    if (dataClassName == 'PaginationMetadata') {
      return deserialize<_i26.PaginationMetadata>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i31.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i32.Protocol().deserializeByClassName(data);
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
      return _i31.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i32.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
