import 'package:test/test.dart';
import 'package:vokativ/vokativ.dart';

part 'data/man_first_name_data.dart';

part 'data/man_last_name_data.dart';

part 'data/woman_first_name_data.dart';

part 'data/woman_last_name_data.dart';

void main() {
  group('Vokativ tests', () {
    test('Should work', () {
      expect(Vokativ.getVokativ('Tom', capitalize: true), 'Tome');
    });

    test('Translates man first names', () {
      for (var entry in _manFirstNames.entries) {
        expect(Vokativ.getVokativ(entry.key, capitalize: false), entry.value);
        expect(Vokativ.isWoman(entry.key), false);
      }
    });
    test('Translates man last names', () {
      for (var entry in _manLastNames.entries) {
        expect(Vokativ.getVokativ(entry.key, lastName: true, capitalize: false),
            entry.value);
        expect(Vokativ.isWoman(entry.key), false);
      }
    });

    test('Translates woman first names', () {
      for (var entry in _womanFirstNames.entries) {
        expect(
            Vokativ.getVokativ(entry.key, womanBool: true, capitalize: false),
            entry.value);
        expect(Vokativ.isWoman(entry.key), true);
      }
    });
    test('Translates woman last names', () {
      for (var entry in _womanLastNames.entries) {
        expect(Vokativ.getVokativ(entry.key, lastName: true, capitalize: false),
            entry.value);
        expect(Vokativ.isWoman(entry.key), true);
      }
    });
  });
}
