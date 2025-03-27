import 'package:flutter/material.dart';

class RipplePainter extends CustomPainter {
  final Offset _position;
  final double _radius;

  RipplePainter(
    this._position,
    this._radius,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(1 - (_radius / 100))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    if (_radius > 0) {
      canvas.drawCircle(_position, _radius, paint);
    }
  }

  @override
  bool shouldRepaint(RipplePainter oldDelegate) {
    return oldDelegate._radius != _radius;
  }
}
