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
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i2;
import '../../entities/core/geo_location.dart' as _i3;
import '../../entities/core/faction.dart' as _i4;
import '../../entities/match/player_in_match.dart' as _i5;
import '../../entities/community/post.dart' as _i6;
import '../../entities/community/post_comment.dart' as _i7;
import '../../entities/match_making/match_schedule.dart' as _i8;
import '../../entities/match_making/match_subscription.dart' as _i9;
import '../../entities/match_making/chat/match_chat_message.dart' as _i10;
import '../../entities/match_making/manual_input_location.dart' as _i11;
import '../../entities/core/anonymous_player.dart' as _i12;
import '../../entities/match/player_perfomance_in_match.dart' as _i13;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i14;

abstract class PlayerData implements _i1.SerializableModel {
  PlayerData._({
    this.id,
    required this.authUserId,
    this.authUser,
    required this.displayName,
    this.currentLocationId,
    this.currentLocation,
    required this.favoriteFaction,
    this.matchEntries,
    this.posts,
    this.comments,
    this.currentHosting,
    this.subscriptions,
    this.chatMessages,
    this.manualInputLocations,
    this.createdAnonymousPlayers,
    this.perfomances,
  });

  factory PlayerData({
    int? id,
    required _i1.UuidValue authUserId,
    _i2.AuthUser? authUser,
    required String displayName,
    int? currentLocationId,
    _i3.GeoLocation? currentLocation,
    required _i4.Faction favoriteFaction,
    List<_i5.PlayerInMatch>? matchEntries,
    List<_i6.Post>? posts,
    List<_i7.PostComment>? comments,
    List<_i8.MatchSchedulePairingAttempt>? currentHosting,
    List<_i9.MatchSubscription>? subscriptions,
    List<_i10.MatchChatMessage>? chatMessages,
    List<_i11.ManualInputLocation>? manualInputLocations,
    List<_i12.AnonymousPlayer>? createdAnonymousPlayers,
    List<_i13.PlayerPerfomanceInMatch>? perfomances,
  }) = _PlayerDataImpl;

  factory PlayerData.fromJson(Map<String, dynamic> jsonSerialization) {
    return PlayerData(
      id: jsonSerialization['id'] as int?,
      authUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      authUser: jsonSerialization['authUser'] == null
          ? null
          : _i14.Protocol().deserialize<_i2.AuthUser>(
              jsonSerialization['authUser'],
            ),
      displayName: jsonSerialization['displayName'] as String,
      currentLocationId: jsonSerialization['currentLocationId'] as int?,
      currentLocation: jsonSerialization['currentLocation'] == null
          ? null
          : _i14.Protocol().deserialize<_i3.GeoLocation>(
              jsonSerialization['currentLocation'],
            ),
      favoriteFaction: _i4.Faction.fromJson(
        (jsonSerialization['favoriteFaction'] as String),
      ),
      matchEntries: jsonSerialization['matchEntries'] == null
          ? null
          : _i14.Protocol().deserialize<List<_i5.PlayerInMatch>>(
              jsonSerialization['matchEntries'],
            ),
      posts: jsonSerialization['posts'] == null
          ? null
          : _i14.Protocol().deserialize<List<_i6.Post>>(
              jsonSerialization['posts'],
            ),
      comments: jsonSerialization['comments'] == null
          ? null
          : _i14.Protocol().deserialize<List<_i7.PostComment>>(
              jsonSerialization['comments'],
            ),
      currentHosting: jsonSerialization['currentHosting'] == null
          ? null
          : _i14.Protocol().deserialize<List<_i8.MatchSchedulePairingAttempt>>(
              jsonSerialization['currentHosting'],
            ),
      subscriptions: jsonSerialization['subscriptions'] == null
          ? null
          : _i14.Protocol().deserialize<List<_i9.MatchSubscription>>(
              jsonSerialization['subscriptions'],
            ),
      chatMessages: jsonSerialization['chatMessages'] == null
          ? null
          : _i14.Protocol().deserialize<List<_i10.MatchChatMessage>>(
              jsonSerialization['chatMessages'],
            ),
      manualInputLocations: jsonSerialization['manualInputLocations'] == null
          ? null
          : _i14.Protocol().deserialize<List<_i11.ManualInputLocation>>(
              jsonSerialization['manualInputLocations'],
            ),
      createdAnonymousPlayers:
          jsonSerialization['createdAnonymousPlayers'] == null
          ? null
          : _i14.Protocol().deserialize<List<_i12.AnonymousPlayer>>(
              jsonSerialization['createdAnonymousPlayers'],
            ),
      perfomances: jsonSerialization['perfomances'] == null
          ? null
          : _i14.Protocol().deserialize<List<_i13.PlayerPerfomanceInMatch>>(
              jsonSerialization['perfomances'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i1.UuidValue authUserId;

  /// The [AuthUser] this profile belongs to
  _i2.AuthUser? authUser;

  String displayName;

  int? currentLocationId;

  _i3.GeoLocation? currentLocation;

  _i4.Faction favoriteFaction;

  List<_i5.PlayerInMatch>? matchEntries;

  List<_i6.Post>? posts;

  List<_i7.PostComment>? comments;

  List<_i8.MatchSchedulePairingAttempt>? currentHosting;

  List<_i9.MatchSubscription>? subscriptions;

  List<_i10.MatchChatMessage>? chatMessages;

  List<_i11.ManualInputLocation>? manualInputLocations;

  List<_i12.AnonymousPlayer>? createdAnonymousPlayers;

  List<_i13.PlayerPerfomanceInMatch>? perfomances;

  /// Returns a shallow copy of this [PlayerData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PlayerData copyWith({
    int? id,
    _i1.UuidValue? authUserId,
    _i2.AuthUser? authUser,
    String? displayName,
    int? currentLocationId,
    _i3.GeoLocation? currentLocation,
    _i4.Faction? favoriteFaction,
    List<_i5.PlayerInMatch>? matchEntries,
    List<_i6.Post>? posts,
    List<_i7.PostComment>? comments,
    List<_i8.MatchSchedulePairingAttempt>? currentHosting,
    List<_i9.MatchSubscription>? subscriptions,
    List<_i10.MatchChatMessage>? chatMessages,
    List<_i11.ManualInputLocation>? manualInputLocations,
    List<_i12.AnonymousPlayer>? createdAnonymousPlayers,
    List<_i13.PlayerPerfomanceInMatch>? perfomances,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlayerData',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      if (authUser != null) 'authUser': authUser?.toJson(),
      'displayName': displayName,
      if (currentLocationId != null) 'currentLocationId': currentLocationId,
      if (currentLocation != null) 'currentLocation': currentLocation?.toJson(),
      'favoriteFaction': favoriteFaction.toJson(),
      if (matchEntries != null)
        'matchEntries': matchEntries?.toJson(valueToJson: (v) => v.toJson()),
      if (posts != null) 'posts': posts?.toJson(valueToJson: (v) => v.toJson()),
      if (comments != null)
        'comments': comments?.toJson(valueToJson: (v) => v.toJson()),
      if (currentHosting != null)
        'currentHosting': currentHosting?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (subscriptions != null)
        'subscriptions': subscriptions?.toJson(valueToJson: (v) => v.toJson()),
      if (chatMessages != null)
        'chatMessages': chatMessages?.toJson(valueToJson: (v) => v.toJson()),
      if (manualInputLocations != null)
        'manualInputLocations': manualInputLocations?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (createdAnonymousPlayers != null)
        'createdAnonymousPlayers': createdAnonymousPlayers?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (perfomances != null)
        'perfomances': perfomances?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlayerDataImpl extends PlayerData {
  _PlayerDataImpl({
    int? id,
    required _i1.UuidValue authUserId,
    _i2.AuthUser? authUser,
    required String displayName,
    int? currentLocationId,
    _i3.GeoLocation? currentLocation,
    required _i4.Faction favoriteFaction,
    List<_i5.PlayerInMatch>? matchEntries,
    List<_i6.Post>? posts,
    List<_i7.PostComment>? comments,
    List<_i8.MatchSchedulePairingAttempt>? currentHosting,
    List<_i9.MatchSubscription>? subscriptions,
    List<_i10.MatchChatMessage>? chatMessages,
    List<_i11.ManualInputLocation>? manualInputLocations,
    List<_i12.AnonymousPlayer>? createdAnonymousPlayers,
    List<_i13.PlayerPerfomanceInMatch>? perfomances,
  }) : super._(
         id: id,
         authUserId: authUserId,
         authUser: authUser,
         displayName: displayName,
         currentLocationId: currentLocationId,
         currentLocation: currentLocation,
         favoriteFaction: favoriteFaction,
         matchEntries: matchEntries,
         posts: posts,
         comments: comments,
         currentHosting: currentHosting,
         subscriptions: subscriptions,
         chatMessages: chatMessages,
         manualInputLocations: manualInputLocations,
         createdAnonymousPlayers: createdAnonymousPlayers,
         perfomances: perfomances,
       );

  /// Returns a shallow copy of this [PlayerData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PlayerData copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? authUserId,
    Object? authUser = _Undefined,
    String? displayName,
    Object? currentLocationId = _Undefined,
    Object? currentLocation = _Undefined,
    _i4.Faction? favoriteFaction,
    Object? matchEntries = _Undefined,
    Object? posts = _Undefined,
    Object? comments = _Undefined,
    Object? currentHosting = _Undefined,
    Object? subscriptions = _Undefined,
    Object? chatMessages = _Undefined,
    Object? manualInputLocations = _Undefined,
    Object? createdAnonymousPlayers = _Undefined,
    Object? perfomances = _Undefined,
  }) {
    return PlayerData(
      id: id is int? ? id : this.id,
      authUserId: authUserId ?? this.authUserId,
      authUser: authUser is _i2.AuthUser?
          ? authUser
          : this.authUser?.copyWith(),
      displayName: displayName ?? this.displayName,
      currentLocationId: currentLocationId is int?
          ? currentLocationId
          : this.currentLocationId,
      currentLocation: currentLocation is _i3.GeoLocation?
          ? currentLocation
          : this.currentLocation?.copyWith(),
      favoriteFaction: favoriteFaction ?? this.favoriteFaction,
      matchEntries: matchEntries is List<_i5.PlayerInMatch>?
          ? matchEntries
          : this.matchEntries?.map((e0) => e0.copyWith()).toList(),
      posts: posts is List<_i6.Post>?
          ? posts
          : this.posts?.map((e0) => e0.copyWith()).toList(),
      comments: comments is List<_i7.PostComment>?
          ? comments
          : this.comments?.map((e0) => e0.copyWith()).toList(),
      currentHosting: currentHosting is List<_i8.MatchSchedulePairingAttempt>?
          ? currentHosting
          : this.currentHosting?.map((e0) => e0.copyWith()).toList(),
      subscriptions: subscriptions is List<_i9.MatchSubscription>?
          ? subscriptions
          : this.subscriptions?.map((e0) => e0.copyWith()).toList(),
      chatMessages: chatMessages is List<_i10.MatchChatMessage>?
          ? chatMessages
          : this.chatMessages?.map((e0) => e0.copyWith()).toList(),
      manualInputLocations:
          manualInputLocations is List<_i11.ManualInputLocation>?
          ? manualInputLocations
          : this.manualInputLocations?.map((e0) => e0.copyWith()).toList(),
      createdAnonymousPlayers:
          createdAnonymousPlayers is List<_i12.AnonymousPlayer>?
          ? createdAnonymousPlayers
          : this.createdAnonymousPlayers?.map((e0) => e0.copyWith()).toList(),
      perfomances: perfomances is List<_i13.PlayerPerfomanceInMatch>?
          ? perfomances
          : this.perfomances?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
