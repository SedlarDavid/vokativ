# Basic usage

```dart
main() {
  final vokativ = Vokativ.getVokativ('Tom', capitalize: true);
  print(vokativ == 'Tome'); // Prints true

  final isFemale = Vokativ.isWoman('Alena');
  print(isFemale); // Prints true
}
```