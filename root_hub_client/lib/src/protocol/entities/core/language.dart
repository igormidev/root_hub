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

enum Language implements _i1.SerializableModel {
  arabicMSA,
  arabicEgyptian,
  arabicGulf,
  bengali,
  chinese,
  dutch,
  english,
  french,
  german,
  gujarati,
  hindi,
  indonesian,
  italian,
  japanese,
  korean,
  malay,
  marathi,
  persian,
  polish,
  portugueseBrazil,
  portuguesePortugal,
  punjabi,
  russian,
  spanish,
  swahili,
  tagalog,
  tamil,
  telugu,
  thai,
  turkish,
  ukrainian,
  urdu,
  vietnamese;

  static Language fromJson(String name) {
    switch (name) {
      case 'arabicMSA':
        return Language.arabicMSA;
      case 'arabicEgyptian':
        return Language.arabicEgyptian;
      case 'arabicGulf':
        return Language.arabicGulf;
      case 'bengali':
        return Language.bengali;
      case 'chinese':
        return Language.chinese;
      case 'dutch':
        return Language.dutch;
      case 'english':
        return Language.english;
      case 'french':
        return Language.french;
      case 'german':
        return Language.german;
      case 'gujarati':
        return Language.gujarati;
      case 'hindi':
        return Language.hindi;
      case 'indonesian':
        return Language.indonesian;
      case 'italian':
        return Language.italian;
      case 'japanese':
        return Language.japanese;
      case 'korean':
        return Language.korean;
      case 'malay':
        return Language.malay;
      case 'marathi':
        return Language.marathi;
      case 'persian':
        return Language.persian;
      case 'polish':
        return Language.polish;
      case 'portugueseBrazil':
        return Language.portugueseBrazil;
      case 'portuguesePortugal':
        return Language.portuguesePortugal;
      case 'punjabi':
        return Language.punjabi;
      case 'russian':
        return Language.russian;
      case 'spanish':
        return Language.spanish;
      case 'swahili':
        return Language.swahili;
      case 'tagalog':
        return Language.tagalog;
      case 'tamil':
        return Language.tamil;
      case 'telugu':
        return Language.telugu;
      case 'thai':
        return Language.thai;
      case 'turkish':
        return Language.turkish;
      case 'ukrainian':
        return Language.ukrainian;
      case 'urdu':
        return Language.urdu;
      case 'vietnamese':
        return Language.vietnamese;
      default:
        throw ArgumentError('Value "$name" cannot be converted to "Language"');
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
