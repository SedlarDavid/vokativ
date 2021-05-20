library vokativ;

part 'vokativ_data.dart';

///Extension for capitalizing any string
extension _StringExtension on String {
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';
}

class Vokativ {
  /// Returns list of looked up name and given suffix to complete vokativ
  ///
  /// * return ['Tom', 'e'] // 'Tome'
  static List<String> _getMatchingSuffix(
      String name, Map<String, String> suffixes) {
    var search;

    for (var start = name.length; start > 0; start--) {
      search = name.substring(name.length - start);
      if (suffixes[search] is String) {
        return [search, suffixes[search]!];
      }
    }

    return ['', suffixes[''] ?? ''];
  }

  /// Gets female vokativ
  static String _vokativWomanFirstName(String name, [bool capitalize = false]) {
    if (name.substring(name.length - 1) == 'a') {
      return !capitalize
          ? (name.substring(0, name.length - 1) + 'o')
          : (name.substring(0, name.length - 1) + 'o').capitalize;
    } else {
      return name;
    }
  }

  /// Gets females last name
  static _vokativWomanLastName(String name, [bool capitalize = false]) {
    return !capitalize ? name : name.capitalize;
  }

  /// Gets male vokativ
  ///
  /// [search] - resulted male name
  /// [suffix] - char/s that complete/s vokativ
  static _vokativMan(String name, [bool capitalize = false]) {
    final _geted = _getMatchingSuffix(name, _manSuffixes);
    final search = _geted.first;
    final suffix = _geted.last;
    final ret = name.substring(0, name.length - search.length);
    return !capitalize ? '$ret$suffix' : '$ret$suffix'.capitalize;
  }

  /// Validates gender by given name
  ///
  /// [true] -> [nameString] is females name
  /// [false] -> [nameString] is males name
  static bool isWoman(String nameString) {
    final name = nameString.toLowerCase();
    return _getMatchingSuffix(name, _manVsWomanSuffixes)[1] == 'w';
  }

  /// Gets vokativ for given name
  ///
  /// * final _vokativ = Vokativ.getVokativ('David');
  /// * print(_vokativ); // Davide
  static String getVokativ(String nameString,
      {bool? womanBool, bool? lastName, bool capitalize = false}) {
    final name = nameString.toLowerCase();
    var woman = womanBool;

    if (woman == null) {
      woman = isWoman(name);
    }

    if (woman) {
      if (lastName == null) {
        lastName =
            (_getMatchingSuffix(name, _womanFirstVsLastNameSuffixes)[1]) == 'l';
      }
      if (lastName) {
        return _vokativWomanLastName(name, capitalize);
      } else {
        return _vokativWomanFirstName(name, capitalize);
      }
    } else {
      return _vokativMan(name, capitalize);
    }
  }
}
