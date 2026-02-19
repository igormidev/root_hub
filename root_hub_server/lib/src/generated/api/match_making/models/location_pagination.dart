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
import '../../../entities/match_making/location.dart' as _i2;
import '../../../entities/others/pagination_metadata.dart' as _i3;
import 'package:root_hub_server/src/generated/protocol.dart' as _i4;

abstract class LocationPagination
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  LocationPagination._({
    required this.locations,
    required this.paginationMetadata,
  });

  factory LocationPagination({
    required List<_i2.Location> locations,
    required _i3.PaginationMetadata paginationMetadata,
  }) = _LocationPaginationImpl;

  factory LocationPagination.fromJson(Map<String, dynamic> jsonSerialization) {
    return LocationPagination(
      locations: _i4.Protocol().deserialize<List<_i2.Location>>(
        jsonSerialization['locations'],
      ),
      paginationMetadata: _i4.Protocol().deserialize<_i3.PaginationMetadata>(
        jsonSerialization['paginationMetadata'],
      ),
    );
  }

  List<_i2.Location> locations;

  _i3.PaginationMetadata paginationMetadata;

  /// Returns a shallow copy of this [LocationPagination]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LocationPagination copyWith({
    List<_i2.Location>? locations,
    _i3.PaginationMetadata? paginationMetadata,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LocationPagination',
      'locations': locations.toJson(valueToJson: (v) => v.toJson()),
      'paginationMetadata': paginationMetadata.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LocationPagination',
      'locations': locations.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'paginationMetadata': paginationMetadata.toJsonForProtocol(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _LocationPaginationImpl extends LocationPagination {
  _LocationPaginationImpl({
    required List<_i2.Location> locations,
    required _i3.PaginationMetadata paginationMetadata,
  }) : super._(
         locations: locations,
         paginationMetadata: paginationMetadata,
       );

  /// Returns a shallow copy of this [LocationPagination]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LocationPagination copyWith({
    List<_i2.Location>? locations,
    _i3.PaginationMetadata? paginationMetadata,
  }) {
    return LocationPagination(
      locations:
          locations ?? this.locations.map((e0) => e0.copyWith()).toList(),
      paginationMetadata:
          paginationMetadata ?? this.paginationMetadata.copyWith(),
    );
  }
}
