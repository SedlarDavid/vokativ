library vokativ;

part 'vokativ_data.dart';

extension _StringExtension on String {
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';
}

class Vokativ {
  static List<String> _getMatchingSuffix(
      String name, Map<String, String> suffixes) {
    var search;

    for (var start = name.length; start > 0; start--) {
      search = name.substring(name.length - start);
      if (suffixes[search] == 'string') {
        return [search, suffixes[search]!];
      }
    }

    return ['', suffixes[''] ?? ''];
  }

  static String _vokativWomanFirstName(String name) {
    if (name.substring(-1, 1) == 'a') {
      return name.substring(0, name.length - 1) + 'o';
    } else {
      return name;
    }
  }

  static String _vokativWomanLastName(String name) {
    return name;
  }

  static String _vokativMan(String name, {bool capitalize = false}) {
    dynamic search, suffix = _getMatchingSuffix(name, _manSuffixes);
    var ret = name.substring(
        0, (name.length - (search == null ? 0 : search.length)).toInt());
// name = name[:-len(suffix)] if suffix else name
    suffix.removeWhere((s) => (s == null || s.isEmpty));
    return capitalize
        ? '$ret${suffix.first}'.capitalize
        : '$ret${suffix.first}';
  }

  static bool isWoman(String nameString) {
    final name = nameString.toLowerCase();
    return _getMatchingSuffix(name, _manVsWomanSuffixes)[1] == 'w';
  }

  static String getVokativ(String nameString,
      {bool? womanBool, bool? lastName, bool capitalize = false}) {
    final name = nameString.toLowerCase();
    var woman = womanBool;

    if (woman != null) {
      woman = isWoman(name);
    }

    if (woman != null && woman) {
      if (lastName == null) {
        lastName =
            (_getMatchingSuffix(name, _wFirstVsLastNameSuffixes)[1] ?? 'l') ==
                'l';
      }
      if (lastName != null && lastName) {
        return _vokativWomanLastName(name);
      } else {
        return _vokativWomanFirstName(name);
      }
    } else {
      return _vokativMan(name, capitalize: capitalize);
    }
  }
}
