import 'package:flutter_test/flutter_test.dart';

import 'package:vokativ/vokativ.dart';

void main() {
  group('Vokativ', () {
    test('Should work', () {
      expect(vokativ('Tom'), 'Tome');
    });
  });
}
