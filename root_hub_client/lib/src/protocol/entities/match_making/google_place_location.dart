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
import '../../entities/match_making/location.dart' as _i2;
import 'package:root_hub_client/src/protocol/protocol.dart' as _i3;

abstract class GooglePlaceLocation implements _i1.SerializableModel {
  GooglePlaceLocation._({
    this.id,
    required this.providerPlaceId,
    required this.name,
    this.formattedAddress,
    this.shortFormattedAddress,
    required this.lat,
    required this.lng,
    this.url,
    this.websiteUri,
    this.phoneNumber,
    this.types,
    this.primaryType,
    this.rating,
    this.userRatingCount,
    this.priceLevel,
    this.primaryPhotoName,
    this.timezone,
    bool? isPublicPlace,
    this.notes,
    this.location,
    required this.createdAt,
    required this.updatedAt,
  }) : isPublicPlace = isPublicPlace ?? true;

  factory GooglePlaceLocation({
    int? id,
    required String providerPlaceId,
    required String name,
    String? formattedAddress,
    String? shortFormattedAddress,
    required double lat,
    required double lng,
    String? url,
    String? websiteUri,
    String? phoneNumber,
    List<String>? types,
    String? primaryType,
    double? rating,
    int? userRatingCount,
    String? priceLevel,
    String? primaryPhotoName,
    String? timezone,
    bool? isPublicPlace,
    String? notes,
    _i2.Location? location,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _GooglePlaceLocationImpl;

  factory GooglePlaceLocation.fromJson(Map<String, dynamic> jsonSerialization) {
    return GooglePlaceLocation(
      id: jsonSerialization['id'] as int?,
      providerPlaceId: jsonSerialization['providerPlaceId'] as String,
      name: jsonSerialization['name'] as String,
      formattedAddress: jsonSerialization['formattedAddress'] as String?,
      shortFormattedAddress:
          jsonSerialization['shortFormattedAddress'] as String?,
      lat: (jsonSerialization['lat'] as num).toDouble(),
      lng: (jsonSerialization['lng'] as num).toDouble(),
      url: jsonSerialization['url'] as String?,
      websiteUri: jsonSerialization['websiteUri'] as String?,
      phoneNumber: jsonSerialization['phoneNumber'] as String?,
      types: jsonSerialization['types'] == null
          ? null
          : _i3.Protocol().deserialize<List<String>>(
              jsonSerialization['types'],
            ),
      primaryType: jsonSerialization['primaryType'] as String?,
      rating: (jsonSerialization['rating'] as num?)?.toDouble(),
      userRatingCount: jsonSerialization['userRatingCount'] as int?,
      priceLevel: jsonSerialization['priceLevel'] as String?,
      primaryPhotoName: jsonSerialization['primaryPhotoName'] as String?,
      timezone: jsonSerialization['timezone'] as String?,
      isPublicPlace: jsonSerialization['isPublicPlace'] as bool?,
      notes: jsonSerialization['notes'] as String?,
      location: jsonSerialization['location'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.Location>(
              jsonSerialization['location'],
            ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String providerPlaceId;

  String name;

  String? formattedAddress;

  String? shortFormattedAddress;

  double lat;

  double lng;

  String? url;

  String? websiteUri;

  String? phoneNumber;

  List<String>? types;

  String? primaryType;

  double? rating;

  int? userRatingCount;

  String? priceLevel;

  String? primaryPhotoName;

  String? timezone;

  bool isPublicPlace;

  String? notes;

  _i2.Location? location;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [GooglePlaceLocation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GooglePlaceLocation copyWith({
    int? id,
    String? providerPlaceId,
    String? name,
    String? formattedAddress,
    String? shortFormattedAddress,
    double? lat,
    double? lng,
    String? url,
    String? websiteUri,
    String? phoneNumber,
    List<String>? types,
    String? primaryType,
    double? rating,
    int? userRatingCount,
    String? priceLevel,
    String? primaryPhotoName,
    String? timezone,
    bool? isPublicPlace,
    String? notes,
    _i2.Location? location,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'GooglePlaceLocation',
      if (id != null) 'id': id,
      'providerPlaceId': providerPlaceId,
      'name': name,
      if (formattedAddress != null) 'formattedAddress': formattedAddress,
      if (shortFormattedAddress != null)
        'shortFormattedAddress': shortFormattedAddress,
      'lat': lat,
      'lng': lng,
      if (url != null) 'url': url,
      if (websiteUri != null) 'websiteUri': websiteUri,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (types != null) 'types': types?.toJson(),
      if (primaryType != null) 'primaryType': primaryType,
      if (rating != null) 'rating': rating,
      if (userRatingCount != null) 'userRatingCount': userRatingCount,
      if (priceLevel != null) 'priceLevel': priceLevel,
      if (primaryPhotoName != null) 'primaryPhotoName': primaryPhotoName,
      if (timezone != null) 'timezone': timezone,
      'isPublicPlace': isPublicPlace,
      if (notes != null) 'notes': notes,
      if (location != null) 'location': location?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GooglePlaceLocationImpl extends GooglePlaceLocation {
  _GooglePlaceLocationImpl({
    int? id,
    required String providerPlaceId,
    required String name,
    String? formattedAddress,
    String? shortFormattedAddress,
    required double lat,
    required double lng,
    String? url,
    String? websiteUri,
    String? phoneNumber,
    List<String>? types,
    String? primaryType,
    double? rating,
    int? userRatingCount,
    String? priceLevel,
    String? primaryPhotoName,
    String? timezone,
    bool? isPublicPlace,
    String? notes,
    _i2.Location? location,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         providerPlaceId: providerPlaceId,
         name: name,
         formattedAddress: formattedAddress,
         shortFormattedAddress: shortFormattedAddress,
         lat: lat,
         lng: lng,
         url: url,
         websiteUri: websiteUri,
         phoneNumber: phoneNumber,
         types: types,
         primaryType: primaryType,
         rating: rating,
         userRatingCount: userRatingCount,
         priceLevel: priceLevel,
         primaryPhotoName: primaryPhotoName,
         timezone: timezone,
         isPublicPlace: isPublicPlace,
         notes: notes,
         location: location,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [GooglePlaceLocation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GooglePlaceLocation copyWith({
    Object? id = _Undefined,
    String? providerPlaceId,
    String? name,
    Object? formattedAddress = _Undefined,
    Object? shortFormattedAddress = _Undefined,
    double? lat,
    double? lng,
    Object? url = _Undefined,
    Object? websiteUri = _Undefined,
    Object? phoneNumber = _Undefined,
    Object? types = _Undefined,
    Object? primaryType = _Undefined,
    Object? rating = _Undefined,
    Object? userRatingCount = _Undefined,
    Object? priceLevel = _Undefined,
    Object? primaryPhotoName = _Undefined,
    Object? timezone = _Undefined,
    bool? isPublicPlace,
    Object? notes = _Undefined,
    Object? location = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return GooglePlaceLocation(
      id: id is int? ? id : this.id,
      providerPlaceId: providerPlaceId ?? this.providerPlaceId,
      name: name ?? this.name,
      formattedAddress: formattedAddress is String?
          ? formattedAddress
          : this.formattedAddress,
      shortFormattedAddress: shortFormattedAddress is String?
          ? shortFormattedAddress
          : this.shortFormattedAddress,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      url: url is String? ? url : this.url,
      websiteUri: websiteUri is String? ? websiteUri : this.websiteUri,
      phoneNumber: phoneNumber is String? ? phoneNumber : this.phoneNumber,
      types: types is List<String>?
          ? types
          : this.types?.map((e0) => e0).toList(),
      primaryType: primaryType is String? ? primaryType : this.primaryType,
      rating: rating is double? ? rating : this.rating,
      userRatingCount: userRatingCount is int?
          ? userRatingCount
          : this.userRatingCount,
      priceLevel: priceLevel is String? ? priceLevel : this.priceLevel,
      primaryPhotoName: primaryPhotoName is String?
          ? primaryPhotoName
          : this.primaryPhotoName,
      timezone: timezone is String? ? timezone : this.timezone,
      isPublicPlace: isPublicPlace ?? this.isPublicPlace,
      notes: notes is String? ? notes : this.notes,
      location: location is _i2.Location?
          ? location
          : this.location?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
