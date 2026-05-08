library;

part 'vokativ_data.dart';

extension _StringExtension on String {
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';
}

class Vokativ {
  /// Returns list of looked up name and given suffix to complete vokativ
  ///
  /// * return ['Tom', 'e'] // 'Tome'
  static List<String> _getMatchingSuffix(
    String name,
    Map<String, String> suffixes,
  ) {
    for (var start = name.length; start > 0; start--) {
      final search = name.substring(name.length - start);
      final match = suffixes[search];
      if (match != null) {
        return [search, match];
      }
    }

    return ['', suffixes[''] ?? ''];
  }

  /// Gets female vokativ
  static String _vokativWomanFirstName(String name, [bool capitalize = false]) {
    if (name.substring(name.length - 1) == 'a') {
      final base = '${name.substring(0, name.length - 1)}o';
      return capitalize ? base.capitalize : base;
    }
    return name;
  }

  /// Gets females last name
  static String _vokativWomanLastName(String name, [bool capitalize = false]) {
    return capitalize ? name.capitalize : name;
  }

  /// Gets male vokativ
  ///
  /// [search] - resulted male name
  /// [suffix] - char/s that complete/s vokativ
  static String _vokativMan(String name, [bool capitalize = false]) {
    final matched = _getMatchingSuffix(name, _manSuffixes);
    final search = matched.first;
    final suffix = matched.last;
    final ret = '${name.substring(0, name.length - search.length)}$suffix';
    return capitalize ? ret.capitalize : ret;
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
  /// * final vokativ = Vokativ.getVokativ('David');
  /// * print(vokativ); // Davide
  static String getVokativ(
    String nameString, {
    bool? womanBool,
    bool? lastName,
    bool capitalize = false,
  }) {
    final name = nameString.toLowerCase();
    final woman = womanBool ?? isWoman(name);

    if (woman) {
      final isLastName = lastName ??
          (_getMatchingSuffix(name, _womanFirstVsLastNameSuffixes)[1] == 'l');
      return isLastName
          ? _vokativWomanLastName(name, capitalize)
          : _vokativWomanFirstName(name, capitalize);
    }
    return _vokativMan(name, capitalize);
  }
}
