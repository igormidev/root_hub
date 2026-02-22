// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_create_table_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MatchCreateTableState {

 String get title; String get description; int get minPlayers; int get maxPlayers; DateTime get scheduledDate; TimeOfDay get scheduledTime; bool get hostWillPlay; bool get hasLoadedRecentLocations; List<Location> get recentLocations; String get locationQuery; bool get isSearchingLocations; bool get hasPerformedLocationSearch; List<Location> get searchResults; RootHubException? get locationSearchError; Location? get selectedLocation; bool get isCreatingTable; RootHubException? get createTableError;
/// Create a copy of MatchCreateTableState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchCreateTableStateCopyWith<MatchCreateTableState> get copyWith => _$MatchCreateTableStateCopyWithImpl<MatchCreateTableState>(this as MatchCreateTableState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchCreateTableState&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.minPlayers, minPlayers) || other.minPlayers == minPlayers)&&(identical(other.maxPlayers, maxPlayers) || other.maxPlayers == maxPlayers)&&(identical(other.scheduledDate, scheduledDate) || other.scheduledDate == scheduledDate)&&(identical(other.scheduledTime, scheduledTime) || other.scheduledTime == scheduledTime)&&(identical(other.hostWillPlay, hostWillPlay) || other.hostWillPlay == hostWillPlay)&&(identical(other.hasLoadedRecentLocations, hasLoadedRecentLocations) || other.hasLoadedRecentLocations == hasLoadedRecentLocations)&&const DeepCollectionEquality().equals(other.recentLocations, recentLocations)&&(identical(other.locationQuery, locationQuery) || other.locationQuery == locationQuery)&&(identical(other.isSearchingLocations, isSearchingLocations) || other.isSearchingLocations == isSearchingLocations)&&(identical(other.hasPerformedLocationSearch, hasPerformedLocationSearch) || other.hasPerformedLocationSearch == hasPerformedLocationSearch)&&const DeepCollectionEquality().equals(other.searchResults, searchResults)&&(identical(other.locationSearchError, locationSearchError) || other.locationSearchError == locationSearchError)&&(identical(other.selectedLocation, selectedLocation) || other.selectedLocation == selectedLocation)&&(identical(other.isCreatingTable, isCreatingTable) || other.isCreatingTable == isCreatingTable)&&(identical(other.createTableError, createTableError) || other.createTableError == createTableError));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,minPlayers,maxPlayers,scheduledDate,scheduledTime,hostWillPlay,hasLoadedRecentLocations,const DeepCollectionEquality().hash(recentLocations),locationQuery,isSearchingLocations,hasPerformedLocationSearch,const DeepCollectionEquality().hash(searchResults),locationSearchError,selectedLocation,isCreatingTable,createTableError);

@override
String toString() {
  return 'MatchCreateTableState(title: $title, description: $description, minPlayers: $minPlayers, maxPlayers: $maxPlayers, scheduledDate: $scheduledDate, scheduledTime: $scheduledTime, hostWillPlay: $hostWillPlay, hasLoadedRecentLocations: $hasLoadedRecentLocations, recentLocations: $recentLocations, locationQuery: $locationQuery, isSearchingLocations: $isSearchingLocations, hasPerformedLocationSearch: $hasPerformedLocationSearch, searchResults: $searchResults, locationSearchError: $locationSearchError, selectedLocation: $selectedLocation, isCreatingTable: $isCreatingTable, createTableError: $createTableError)';
}


}

/// @nodoc
abstract mixin class $MatchCreateTableStateCopyWith<$Res>  {
  factory $MatchCreateTableStateCopyWith(MatchCreateTableState value, $Res Function(MatchCreateTableState) _then) = _$MatchCreateTableStateCopyWithImpl;
@useResult
$Res call({
 String title, String description, int minPlayers, int maxPlayers, DateTime scheduledDate, TimeOfDay scheduledTime, bool hostWillPlay, bool hasLoadedRecentLocations, List<Location> recentLocations, String locationQuery, bool isSearchingLocations, bool hasPerformedLocationSearch, List<Location> searchResults, RootHubException? locationSearchError, Location? selectedLocation, bool isCreatingTable, RootHubException? createTableError
});




}
/// @nodoc
class _$MatchCreateTableStateCopyWithImpl<$Res>
    implements $MatchCreateTableStateCopyWith<$Res> {
  _$MatchCreateTableStateCopyWithImpl(this._self, this._then);

  final MatchCreateTableState _self;
  final $Res Function(MatchCreateTableState) _then;

/// Create a copy of MatchCreateTableState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? minPlayers = null,Object? maxPlayers = null,Object? scheduledDate = null,Object? scheduledTime = null,Object? hostWillPlay = null,Object? hasLoadedRecentLocations = null,Object? recentLocations = null,Object? locationQuery = null,Object? isSearchingLocations = null,Object? hasPerformedLocationSearch = null,Object? searchResults = null,Object? locationSearchError = freezed,Object? selectedLocation = freezed,Object? isCreatingTable = null,Object? createTableError = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,minPlayers: null == minPlayers ? _self.minPlayers : minPlayers // ignore: cast_nullable_to_non_nullable
as int,maxPlayers: null == maxPlayers ? _self.maxPlayers : maxPlayers // ignore: cast_nullable_to_non_nullable
as int,scheduledDate: null == scheduledDate ? _self.scheduledDate : scheduledDate // ignore: cast_nullable_to_non_nullable
as DateTime,scheduledTime: null == scheduledTime ? _self.scheduledTime : scheduledTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay,hostWillPlay: null == hostWillPlay ? _self.hostWillPlay : hostWillPlay // ignore: cast_nullable_to_non_nullable
as bool,hasLoadedRecentLocations: null == hasLoadedRecentLocations ? _self.hasLoadedRecentLocations : hasLoadedRecentLocations // ignore: cast_nullable_to_non_nullable
as bool,recentLocations: null == recentLocations ? _self.recentLocations : recentLocations // ignore: cast_nullable_to_non_nullable
as List<Location>,locationQuery: null == locationQuery ? _self.locationQuery : locationQuery // ignore: cast_nullable_to_non_nullable
as String,isSearchingLocations: null == isSearchingLocations ? _self.isSearchingLocations : isSearchingLocations // ignore: cast_nullable_to_non_nullable
as bool,hasPerformedLocationSearch: null == hasPerformedLocationSearch ? _self.hasPerformedLocationSearch : hasPerformedLocationSearch // ignore: cast_nullable_to_non_nullable
as bool,searchResults: null == searchResults ? _self.searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<Location>,locationSearchError: freezed == locationSearchError ? _self.locationSearchError : locationSearchError // ignore: cast_nullable_to_non_nullable
as RootHubException?,selectedLocation: freezed == selectedLocation ? _self.selectedLocation : selectedLocation // ignore: cast_nullable_to_non_nullable
as Location?,isCreatingTable: null == isCreatingTable ? _self.isCreatingTable : isCreatingTable // ignore: cast_nullable_to_non_nullable
as bool,createTableError: freezed == createTableError ? _self.createTableError : createTableError // ignore: cast_nullable_to_non_nullable
as RootHubException?,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchCreateTableState].
extension MatchCreateTableStatePatterns on MatchCreateTableState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchCreateTableState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchCreateTableState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchCreateTableState value)  $default,){
final _that = this;
switch (_that) {
case _MatchCreateTableState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchCreateTableState value)?  $default,){
final _that = this;
switch (_that) {
case _MatchCreateTableState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description,  int minPlayers,  int maxPlayers,  DateTime scheduledDate,  TimeOfDay scheduledTime,  bool hostWillPlay,  bool hasLoadedRecentLocations,  List<Location> recentLocations,  String locationQuery,  bool isSearchingLocations,  bool hasPerformedLocationSearch,  List<Location> searchResults,  RootHubException? locationSearchError,  Location? selectedLocation,  bool isCreatingTable,  RootHubException? createTableError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchCreateTableState() when $default != null:
return $default(_that.title,_that.description,_that.minPlayers,_that.maxPlayers,_that.scheduledDate,_that.scheduledTime,_that.hostWillPlay,_that.hasLoadedRecentLocations,_that.recentLocations,_that.locationQuery,_that.isSearchingLocations,_that.hasPerformedLocationSearch,_that.searchResults,_that.locationSearchError,_that.selectedLocation,_that.isCreatingTable,_that.createTableError);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description,  int minPlayers,  int maxPlayers,  DateTime scheduledDate,  TimeOfDay scheduledTime,  bool hostWillPlay,  bool hasLoadedRecentLocations,  List<Location> recentLocations,  String locationQuery,  bool isSearchingLocations,  bool hasPerformedLocationSearch,  List<Location> searchResults,  RootHubException? locationSearchError,  Location? selectedLocation,  bool isCreatingTable,  RootHubException? createTableError)  $default,) {final _that = this;
switch (_that) {
case _MatchCreateTableState():
return $default(_that.title,_that.description,_that.minPlayers,_that.maxPlayers,_that.scheduledDate,_that.scheduledTime,_that.hostWillPlay,_that.hasLoadedRecentLocations,_that.recentLocations,_that.locationQuery,_that.isSearchingLocations,_that.hasPerformedLocationSearch,_that.searchResults,_that.locationSearchError,_that.selectedLocation,_that.isCreatingTable,_that.createTableError);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description,  int minPlayers,  int maxPlayers,  DateTime scheduledDate,  TimeOfDay scheduledTime,  bool hostWillPlay,  bool hasLoadedRecentLocations,  List<Location> recentLocations,  String locationQuery,  bool isSearchingLocations,  bool hasPerformedLocationSearch,  List<Location> searchResults,  RootHubException? locationSearchError,  Location? selectedLocation,  bool isCreatingTable,  RootHubException? createTableError)?  $default,) {final _that = this;
switch (_that) {
case _MatchCreateTableState() when $default != null:
return $default(_that.title,_that.description,_that.minPlayers,_that.maxPlayers,_that.scheduledDate,_that.scheduledTime,_that.hostWillPlay,_that.hasLoadedRecentLocations,_that.recentLocations,_that.locationQuery,_that.isSearchingLocations,_that.hasPerformedLocationSearch,_that.searchResults,_that.locationSearchError,_that.selectedLocation,_that.isCreatingTable,_that.createTableError);case _:
  return null;

}
}

}

/// @nodoc


class _MatchCreateTableState implements MatchCreateTableState {
  const _MatchCreateTableState({this.title = '', this.description = '', this.minPlayers = 3, this.maxPlayers = 4, required this.scheduledDate, required this.scheduledTime, this.hostWillPlay = true, this.hasLoadedRecentLocations = false, final  List<Location> recentLocations = const <Location>[], this.locationQuery = '', this.isSearchingLocations = false, this.hasPerformedLocationSearch = false, final  List<Location> searchResults = const <Location>[], this.locationSearchError, this.selectedLocation, this.isCreatingTable = false, this.createTableError}): _recentLocations = recentLocations,_searchResults = searchResults;
  

@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
@override@JsonKey() final  int minPlayers;
@override@JsonKey() final  int maxPlayers;
@override final  DateTime scheduledDate;
@override final  TimeOfDay scheduledTime;
@override@JsonKey() final  bool hostWillPlay;
@override@JsonKey() final  bool hasLoadedRecentLocations;
 final  List<Location> _recentLocations;
@override@JsonKey() List<Location> get recentLocations {
  if (_recentLocations is EqualUnmodifiableListView) return _recentLocations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentLocations);
}

@override@JsonKey() final  String locationQuery;
@override@JsonKey() final  bool isSearchingLocations;
@override@JsonKey() final  bool hasPerformedLocationSearch;
 final  List<Location> _searchResults;
@override@JsonKey() List<Location> get searchResults {
  if (_searchResults is EqualUnmodifiableListView) return _searchResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchResults);
}

@override final  RootHubException? locationSearchError;
@override final  Location? selectedLocation;
@override@JsonKey() final  bool isCreatingTable;
@override final  RootHubException? createTableError;

/// Create a copy of MatchCreateTableState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchCreateTableStateCopyWith<_MatchCreateTableState> get copyWith => __$MatchCreateTableStateCopyWithImpl<_MatchCreateTableState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchCreateTableState&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.minPlayers, minPlayers) || other.minPlayers == minPlayers)&&(identical(other.maxPlayers, maxPlayers) || other.maxPlayers == maxPlayers)&&(identical(other.scheduledDate, scheduledDate) || other.scheduledDate == scheduledDate)&&(identical(other.scheduledTime, scheduledTime) || other.scheduledTime == scheduledTime)&&(identical(other.hostWillPlay, hostWillPlay) || other.hostWillPlay == hostWillPlay)&&(identical(other.hasLoadedRecentLocations, hasLoadedRecentLocations) || other.hasLoadedRecentLocations == hasLoadedRecentLocations)&&const DeepCollectionEquality().equals(other._recentLocations, _recentLocations)&&(identical(other.locationQuery, locationQuery) || other.locationQuery == locationQuery)&&(identical(other.isSearchingLocations, isSearchingLocations) || other.isSearchingLocations == isSearchingLocations)&&(identical(other.hasPerformedLocationSearch, hasPerformedLocationSearch) || other.hasPerformedLocationSearch == hasPerformedLocationSearch)&&const DeepCollectionEquality().equals(other._searchResults, _searchResults)&&(identical(other.locationSearchError, locationSearchError) || other.locationSearchError == locationSearchError)&&(identical(other.selectedLocation, selectedLocation) || other.selectedLocation == selectedLocation)&&(identical(other.isCreatingTable, isCreatingTable) || other.isCreatingTable == isCreatingTable)&&(identical(other.createTableError, createTableError) || other.createTableError == createTableError));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,minPlayers,maxPlayers,scheduledDate,scheduledTime,hostWillPlay,hasLoadedRecentLocations,const DeepCollectionEquality().hash(_recentLocations),locationQuery,isSearchingLocations,hasPerformedLocationSearch,const DeepCollectionEquality().hash(_searchResults),locationSearchError,selectedLocation,isCreatingTable,createTableError);

@override
String toString() {
  return 'MatchCreateTableState(title: $title, description: $description, minPlayers: $minPlayers, maxPlayers: $maxPlayers, scheduledDate: $scheduledDate, scheduledTime: $scheduledTime, hostWillPlay: $hostWillPlay, hasLoadedRecentLocations: $hasLoadedRecentLocations, recentLocations: $recentLocations, locationQuery: $locationQuery, isSearchingLocations: $isSearchingLocations, hasPerformedLocationSearch: $hasPerformedLocationSearch, searchResults: $searchResults, locationSearchError: $locationSearchError, selectedLocation: $selectedLocation, isCreatingTable: $isCreatingTable, createTableError: $createTableError)';
}


}

/// @nodoc
abstract mixin class _$MatchCreateTableStateCopyWith<$Res> implements $MatchCreateTableStateCopyWith<$Res> {
  factory _$MatchCreateTableStateCopyWith(_MatchCreateTableState value, $Res Function(_MatchCreateTableState) _then) = __$MatchCreateTableStateCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, int minPlayers, int maxPlayers, DateTime scheduledDate, TimeOfDay scheduledTime, bool hostWillPlay, bool hasLoadedRecentLocations, List<Location> recentLocations, String locationQuery, bool isSearchingLocations, bool hasPerformedLocationSearch, List<Location> searchResults, RootHubException? locationSearchError, Location? selectedLocation, bool isCreatingTable, RootHubException? createTableError
});




}
/// @nodoc
class __$MatchCreateTableStateCopyWithImpl<$Res>
    implements _$MatchCreateTableStateCopyWith<$Res> {
  __$MatchCreateTableStateCopyWithImpl(this._self, this._then);

  final _MatchCreateTableState _self;
  final $Res Function(_MatchCreateTableState) _then;

/// Create a copy of MatchCreateTableState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? minPlayers = null,Object? maxPlayers = null,Object? scheduledDate = null,Object? scheduledTime = null,Object? hostWillPlay = null,Object? hasLoadedRecentLocations = null,Object? recentLocations = null,Object? locationQuery = null,Object? isSearchingLocations = null,Object? hasPerformedLocationSearch = null,Object? searchResults = null,Object? locationSearchError = freezed,Object? selectedLocation = freezed,Object? isCreatingTable = null,Object? createTableError = freezed,}) {
  return _then(_MatchCreateTableState(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,minPlayers: null == minPlayers ? _self.minPlayers : minPlayers // ignore: cast_nullable_to_non_nullable
as int,maxPlayers: null == maxPlayers ? _self.maxPlayers : maxPlayers // ignore: cast_nullable_to_non_nullable
as int,scheduledDate: null == scheduledDate ? _self.scheduledDate : scheduledDate // ignore: cast_nullable_to_non_nullable
as DateTime,scheduledTime: null == scheduledTime ? _self.scheduledTime : scheduledTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay,hostWillPlay: null == hostWillPlay ? _self.hostWillPlay : hostWillPlay // ignore: cast_nullable_to_non_nullable
as bool,hasLoadedRecentLocations: null == hasLoadedRecentLocations ? _self.hasLoadedRecentLocations : hasLoadedRecentLocations // ignore: cast_nullable_to_non_nullable
as bool,recentLocations: null == recentLocations ? _self._recentLocations : recentLocations // ignore: cast_nullable_to_non_nullable
as List<Location>,locationQuery: null == locationQuery ? _self.locationQuery : locationQuery // ignore: cast_nullable_to_non_nullable
as String,isSearchingLocations: null == isSearchingLocations ? _self.isSearchingLocations : isSearchingLocations // ignore: cast_nullable_to_non_nullable
as bool,hasPerformedLocationSearch: null == hasPerformedLocationSearch ? _self.hasPerformedLocationSearch : hasPerformedLocationSearch // ignore: cast_nullable_to_non_nullable
as bool,searchResults: null == searchResults ? _self._searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<Location>,locationSearchError: freezed == locationSearchError ? _self.locationSearchError : locationSearchError // ignore: cast_nullable_to_non_nullable
as RootHubException?,selectedLocation: freezed == selectedLocation ? _self.selectedLocation : selectedLocation // ignore: cast_nullable_to_non_nullable
as Location?,isCreatingTable: null == isCreatingTable ? _self.isCreatingTable : isCreatingTable // ignore: cast_nullable_to_non_nullable
as bool,createTableError: freezed == createTableError ? _self.createTableError : createTableError // ignore: cast_nullable_to_non_nullable
as RootHubException?,
  ));
}


}

// dart format on
