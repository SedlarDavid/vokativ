import 'package:vokativ/vokativ.dart';

void main() {
  // Vokativ for a male first name.
  print(Vokativ.getVokativ('David', capitalize: true)); // Davide

  // Vokativ for a female first name.
  print(Vokativ.getVokativ('Alena', capitalize: true)); // Aleno

  // Gender detection.
  print(Vokativ.isWoman('Alena')); // true
  print(Vokativ.isWoman('David')); // false
}
