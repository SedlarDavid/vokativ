# Name vokative package for Dart

A simple package that provides methods for getting name vokatives.
Currently working with Czech male/female names.

Forks or PR for different languages are very welcomed!

## Usage

Getting name vokatives

```dart
import 'package:vokativ/vokativ.dart';

void main() {
  var firstName = 'David';
  var secondName = 'Jiří';

  var firstNameVokativ = Vokativ.getVokativ(firstName);
  var secondNameVokativ = Vokativ.getVokativ(secondName);

  print(firstNameVokativ); // 'Davide'
  print(secondNameVokativ); // 'Jiří'
}
```

Detection of gender based on name

```dart
import 'package:vokativ/vokativ.dart';

void main() {
  var firstName = 'David';
  var secondName = 'Alena';

  var firstNameGender = Vokativ.isWoman(firstName);
  var secondNameGender = Vokativ.isWoman(secondName);

  print(firstNameGender); // 'false'
  print(secondNameGender); // 'true'
}
```

### Where does it begun?

> This repository is almost direct copy of [Vokativ pro JS](https://github.com/pragonauts/vokativ) and [Vokativ](https://github.com/Mimino666/vokativ) overwritten to Dart language.
> I would like to thank these guys for awesome code and great work.

> Tento repozitář je téměř přímou kopií [Vokativ pro JS](https://github.com/pragonauts/vokativ) a [Vokativ](https://github.com/Mimino666/vokativ) přepsanou do jazyka Dart.
> Chtěl bych klukům poděkovat za jejich kód a skvělou práci.