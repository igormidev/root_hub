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

enum Faction implements _i1.SerializableModel {
  marquiseDeCat,
  eyrieDynasties,
  woodlandAlliance,
  vagabond,
  riverfolkCompany,
  theLizardCult,
  undergroundDuchy,
  corvidConspiracy,
  lordOfTheHundreds,
  keepersInIron;

  static Faction fromJson(String name) {
    switch (name) {
      case 'marquiseDeCat':
        return Faction.marquiseDeCat;
      case 'eyrieDynasties':
        return Faction.eyrieDynasties;
      case 'woodlandAlliance':
        return Faction.woodlandAlliance;
      case 'vagabond':
        return Faction.vagabond;
      case 'riverfolkCompany':
        return Faction.riverfolkCompany;
      case 'theLizardCult':
        return Faction.theLizardCult;
      case 'undergroundDuchy':
        return Faction.undergroundDuchy;
      case 'corvidConspiracy':
        return Faction.corvidConspiracy;
      case 'lordOfTheHundreds':
        return Faction.lordOfTheHundreds;
      case 'keepersInIron':
        return Faction.keepersInIron;
      default:
        throw ArgumentError('Value "$name" cannot be converted to "Faction"');
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
