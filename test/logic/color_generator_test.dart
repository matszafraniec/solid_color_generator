import 'package:flutter_test/flutter_test.dart';
import 'package:solid_color_generator/logic/color_generator.dart';

const _alpha = 255;
const _maxRGB = 255;

void main() {
  group('ColorGenerator', () {
    final colorGenerator = ColorGenerator();

    test('generateRandomColor returns a valid Color object', () {
      final color = colorGenerator.generateRandomColor();

      expect(color.alpha, equals(_alpha));
      expect(color.red, inInclusiveRange(0, _maxRGB));
      expect(color.green, inInclusiveRange(0, _maxRGB));
      expect(color.blue, inInclusiveRange(0, _maxRGB));
    });
  });
}
