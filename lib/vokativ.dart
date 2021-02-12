library vokativ;

import 'package:vokativ/data/man_suffixes.dart';
import 'package:vokativ/data/man_vs_woman_suffixes.dart';
import 'package:vokativ/data/woman_first_vs_last_name_suffixes.dart';

class Vokativ {
  static List<String> _getMatchingSuffix(name, Map<String, String> suffixes) {
    var search;

    for (var start = name.length; start > 0; start--) {
      search = name.substr(-start);
      if (suffixes[search] == 'string') {
        return [search, suffixes[search]];
      }
    }

    return ['', suffixes[''] ?? ''];
  }

  static String _vokativWomanFirstName(name) {
    if (name.substr(-1, 1) == 'a') {
      return name.substr(0, name.length - 1) + 'o';
    } else {
      return name;
    }
  }

  static String _vokativWomanLastName(name) {
    return name;
  }

  static String _vokativMan(name) {
    var search, suffix = _getMatchingSuffix(name, manSuffixes);
    var ret = name.substr(0, name.length - search.length);
    // name = name[:-len(suffix)] if suffix else name
    return '$ret$suffix';
  }

  static bool isWoman(nameString) {
    final name = nameString.toLowerCase();
    return _getMatchingSuffix(name, manVsWomanSuffixes)[1] == 'w';
  }

  static String vokativ(nameString, {womanBool, lastName}) {
    final name = nameString.toLowerCase();
    var woman = womanBool;

    if (woman == null) {
      woman = isWoman(name);
    }

    if (woman) {
      if (lastName == null) {
        lastName =
            (_getMatchingSuffix(name, wFirstVsLastNameSuffixes)[1] ?? 'l') ==
                'l';
      }
      if (lastName) {
        return _vokativWomanLastName(name);
      } else {
        return _vokativWomanFirstName(name);
      }
    } else {
      return _vokativMan(name);
    }
  }
}
