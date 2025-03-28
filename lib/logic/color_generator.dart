import 'dart:math';
import 'dart:ui';

const _alpha = 255;
const _maxRGB = 255;

/// Color generator class, generates random colors.
class ColorGenerator {
  final _random = Random();

  /// Generates a random color.
  Color generateRandomColor() {
    return Color.fromARGB(
      _alpha,
      _random.nextInt(_maxRGB),
      _random.nextInt(_maxRGB),
      _random.nextInt(_maxRGB),
    );
  }
}
