import 'package:flutter_test/flutter_test.dart';
import 'package:solid_color_generator/presentation/components/ripple_painter.dart';

void main() {
  const mockedOffset = Offset(50, 50);
  const oldPainterRadius = 10.0;

  group('RipplePainter', () {
    test('shouldRepaint returns true when radius changes', () {
      const newPainterRadius = 20.0;

      final oldPainter = RipplePainter(mockedOffset, oldPainterRadius);
      final newPainter = RipplePainter(mockedOffset, newPainterRadius);

      expect(newPainter.shouldRepaint(oldPainter), isTrue);
    });

    test('shouldRepaint returns false when radius does not change', () {
      const newPainterRadius = 10.0;

      final oldPainter = RipplePainter(mockedOffset, oldPainterRadius);
      final newPainter = RipplePainter(mockedOffset, newPainterRadius);

      expect(newPainter.shouldRepaint(oldPainter), isFalse);
    });
  });
}
