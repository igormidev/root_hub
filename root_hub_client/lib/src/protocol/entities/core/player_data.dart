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
import '../../entities/core/country.dart' as _i3;
import '../../entities/core/faction.dart' as _i4;
import '../../entities/match/player_in_match.dart' as _i5;
import '../../entities/community/post.dart' as _i6;
import '../../entities/community/post_comment.dart' as _i7;
import '../../entities/match_making/match_schedule.dart' as _i8;
import '../../entities/match_making/match_subscription.dart' as _i9;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i10;

abstract class PlayerData implements _i1.SerializableModel {
  PlayerData._({
    this.id,
    required this.authUserId,
    this.authUser,
    this.currentCountry,
    this.nationality,
    required this.favoriteFaction,
    this.matchEntries,
    this.posts,
    this.comments,
    this.pairingAttempts,
    this.subscriptions,
  });

  factory PlayerData({
    int? id,
    required _i1.UuidValue authUserId,
    _i2.AuthUser? authUser,
    _i3.Country? currentCountry,
    _i3.Country? nationality,
    required _i4.Faction favoriteFaction,
    List<_i5.PlayerInMatch>? matchEntries,
    List<_i6.Post>? posts,
    List<_i7.PostComment>? comments,
    List<_i8.MatchSchedulePairingAttempt>? pairingAttempts,
    List<_i9.MatchSubscription>? subscriptions,
  }) = _PlayerDataImpl;

  factory PlayerData.fromJson(Map<String, dynamic> jsonSerialization) {
    return PlayerData(
      id: jsonSerialization['id'] as int?,
      authUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      authUser: jsonSerialization['authUser'] == null
          ? null
          : _i10.Protocol().deserialize<_i2.AuthUser>(
              jsonSerialization['authUser'],
            ),
      currentCountry: jsonSerialization['currentCountry'] == null
          ? null
          : _i3.Country.fromJson(
              (jsonSerialization['currentCountry'] as String),
            ),
      nationality: jsonSerialization['nationality'] == null
          ? null
          : _i3.Country.fromJson((jsonSerialization['nationality'] as String)),
      favoriteFaction: _i4.Faction.fromJson(
        (jsonSerialization['favoriteFaction'] as String),
      ),
      matchEntries: jsonSerialization['matchEntries'] == null
          ? null
          : _i10.Protocol().deserialize<List<_i5.PlayerInMatch>>(
              jsonSerialization['matchEntries'],
            ),
      posts: jsonSerialization['posts'] == null
          ? null
          : _i10.Protocol().deserialize<List<_i6.Post>>(
              jsonSerialization['posts'],
            ),
      comments: jsonSerialization['comments'] == null
          ? null
          : _i10.Protocol().deserialize<List<_i7.PostComment>>(
              jsonSerialization['comments'],
            ),
      pairingAttempts: jsonSerialization['pairingAttempts'] == null
          ? null
          : _i10.Protocol().deserialize<List<_i8.MatchSchedulePairingAttempt>>(
              jsonSerialization['pairingAttempts'],
            ),
      subscriptions: jsonSerialization['subscriptions'] == null
          ? null
          : _i10.Protocol().deserialize<List<_i9.MatchSubscription>>(
              jsonSerialization['subscriptions'],
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

  _i3.Country? currentCountry;

  _i3.Country? nationality;

  _i4.Faction favoriteFaction;

  List<_i5.PlayerInMatch>? matchEntries;

  List<_i6.Post>? posts;

  List<_i7.PostComment>? comments;

  List<_i8.MatchSchedulePairingAttempt>? pairingAttempts;

  List<_i9.MatchSubscription>? subscriptions;

  /// Returns a shallow copy of this [PlayerData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PlayerData copyWith({
    int? id,
    _i1.UuidValue? authUserId,
    _i2.AuthUser? authUser,
    _i3.Country? currentCountry,
    _i3.Country? nationality,
    _i4.Faction? favoriteFaction,
    List<_i5.PlayerInMatch>? matchEntries,
    List<_i6.Post>? posts,
    List<_i7.PostComment>? comments,
    List<_i8.MatchSchedulePairingAttempt>? pairingAttempts,
    List<_i9.MatchSubscription>? subscriptions,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlayerData',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      if (authUser != null) 'authUser': authUser?.toJson(),
      if (currentCountry != null) 'currentCountry': currentCountry?.toJson(),
      if (nationality != null) 'nationality': nationality?.toJson(),
      'favoriteFaction': favoriteFaction.toJson(),
      if (matchEntries != null)
        'matchEntries': matchEntries?.toJson(valueToJson: (v) => v.toJson()),
      if (posts != null) 'posts': posts?.toJson(valueToJson: (v) => v.toJson()),
      if (comments != null)
        'comments': comments?.toJson(valueToJson: (v) => v.toJson()),
      if (pairingAttempts != null)
        'pairingAttempts': pairingAttempts?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (subscriptions != null)
        'subscriptions': subscriptions?.toJson(valueToJson: (v) => v.toJson()),
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
    _i3.Country? currentCountry,
    _i3.Country? nationality,
    required _i4.Faction favoriteFaction,
    List<_i5.PlayerInMatch>? matchEntries,
    List<_i6.Post>? posts,
    List<_i7.PostComment>? comments,
    List<_i8.MatchSchedulePairingAttempt>? pairingAttempts,
    List<_i9.MatchSubscription>? subscriptions,
  }) : super._(
         id: id,
         authUserId: authUserId,
         authUser: authUser,
         currentCountry: currentCountry,
         nationality: nationality,
         favoriteFaction: favoriteFaction,
         matchEntries: matchEntries,
         posts: posts,
         comments: comments,
         pairingAttempts: pairingAttempts,
         subscriptions: subscriptions,
       );

  /// Returns a shallow copy of this [PlayerData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PlayerData copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? authUserId,
    Object? authUser = _Undefined,
    Object? currentCountry = _Undefined,
    Object? nationality = _Undefined,
    _i4.Faction? favoriteFaction,
    Object? matchEntries = _Undefined,
    Object? posts = _Undefined,
    Object? comments = _Undefined,
    Object? pairingAttempts = _Undefined,
    Object? subscriptions = _Undefined,
  }) {
    return PlayerData(
      id: id is int? ? id : this.id,
      authUserId: authUserId ?? this.authUserId,
      authUser: authUser is _i2.AuthUser?
          ? authUser
          : this.authUser?.copyWith(),
      currentCountry: currentCountry is _i3.Country?
          ? currentCountry
          : this.currentCountry,
      nationality: nationality is _i3.Country? ? nationality : this.nationality,
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
      pairingAttempts: pairingAttempts is List<_i8.MatchSchedulePairingAttempt>?
          ? pairingAttempts
          : this.pairingAttempts?.map((e0) => e0.copyWith()).toList(),
      subscriptions: subscriptions is List<_i9.MatchSubscription>?
          ? subscriptions
          : this.subscriptions?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
