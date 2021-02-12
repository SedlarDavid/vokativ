import 'package:flutter_test/flutter_test.dart';
import 'package:vokativ/vokativ.dart';

import 'data/man_first_name_tests.dart';
import 'data/man_last_name_tests.dart';
import 'data/woman_first_name_tests.dart';
import 'data/woman_last_name_tests.dart';

void main() {
  group('Vokativ', () {
    test('Should work', () {
      expect(
          vokativ(
            'Tom',
          ),
          'Tome');
    });

    test('translates man first names', () {
      for (var entry in manFirstNames.entries) {
        expect(vokativ(entry.key, capitalize: false), entry.value);
        expect(isWoman(entry.key), false);
      }
    });
    test('translates man last names', () {
      for (var entry in manLastNames.entries) {
        expect(
            vokativ(entry.key, lastName: true, capitalize: false), entry.value);
        expect(isWoman(entry.key), false);
      }
    });

    test('translates woman first names', () {
      for (var entry in womanFirstNames.entries) {
        expect(vokativ(entry.key, womanBool: true, capitalize: false),
            entry.value);
        expect(isWoman(entry.key), true);
      }
    });
    test('translates woman last names', () {
      for (var entry in womanLastNames.entries) {
        expect(
            vokativ(entry.key, lastName: true, capitalize: false), entry.value);
        expect(isWoman(entry.key), true);
      }
    });
  });
}
