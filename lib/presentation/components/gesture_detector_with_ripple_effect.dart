import 'package:flutter/material.dart';
import 'package:solid_color_generator/presentation/components/ripple_painter.dart';

const _defaultAnimationDuration = Duration(milliseconds: 300);
const _rippleRadiusShift = 100;

/// A [GestureDetector] that triggers a ripple effect when tapped.
/// The ripple effect is achieved by painting a circle that expands from the
/// point where the tap occurred.
class GestureDetectorWithRippleEffect extends StatefulWidget {
  /// The callback that is called when the widget is tapped.
  final VoidCallback onTap;

  /// The widget that is wrapped by the [GestureDetectorWithRippleEffect].
  final Widget child;

  /// Creates a [GestureDetectorWithRippleEffect].
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
      duration: _defaultAnimationDuration,
    )..addListener(
        () => setState(
          () => _rippleRadius = _controller.value * _rippleRadiusShift,
        ),
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
