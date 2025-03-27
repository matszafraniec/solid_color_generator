import 'dart:math';
import 'dart:ui';

class ColorGenerator {
  late Random _random;

  ColorGenerator() {
    _random = Random();
  }

  Color generateRandomColor() {
    return Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }
}
