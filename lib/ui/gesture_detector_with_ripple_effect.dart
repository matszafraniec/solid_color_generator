import 'package:flutter/material.dart';
import 'package:solid_color_generator/ui/ripple_painter.dart';

class GestureDetectorWithRippleEffect extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;

  const GestureDetectorWithRippleEffect({
    required this.onTap,
    required this.child,
    super.key,
  });

  @override
  State<GestureDetectorWithRippleEffect> createState() =>
      _GestureDetectorWithRippleEffectState();
}

class _GestureDetectorWithRippleEffectState
    extends State<GestureDetectorWithRippleEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Offset _tapPosition = Offset.zero;
  double _rippleRadius = 0.0;

  @override
  void initState() {
    super.initState();

    _setupAnimationController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _triggerRippleAnimation(details.localPosition),
      onTap: widget.onTap,
      child: CustomPaint(
        painter: RipplePainter(_tapPosition, _rippleRadius),
        child: widget.child,
      ),
    );
  }

  void _setupAnimationController() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(
        () => setState(() => _rippleRadius = _controller.value * 100),
      );
  }

  void _triggerRippleAnimation(Offset position) {
    setState(() {
      _tapPosition = position;
      _rippleRadius = 0;
    });
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
