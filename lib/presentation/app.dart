import 'package:flutter/material.dart';
import 'package:solid_color_generator/logic/color_generator.dart';
import 'package:solid_color_generator/presentation/components/gesture_detector_with_ripple_effect.dart';

/// The main application widget.
class App extends StatefulWidget {
  /// Creates the main application widget.
  const App({super.key});

  @override
  State<App> createState() => _MainAppState();
}

class _MainAppState extends State<App> {
  final colorGenerator = ColorGenerator();
  Color backgroundColor = Colors.green;
  Color textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor,
        body: GestureDetectorWithRippleEffect(
          onTap: _onTap,
          child: Center(
            child: Text(
              'Hello There! 😊',
              style: TextStyle(
                fontSize: 30,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    _generateBackgroundColor();
    _updateTextColor();
  }

  void _generateBackgroundColor() {
    final newBackgroundColor = colorGenerator.generateRandomColor();

    setState(() => backgroundColor = newBackgroundColor);
  }

  void _updateTextColor() {
    final newTextColor =
        ThemeData.estimateBrightnessForColor(backgroundColor) ==
                Brightness.light
            ? Colors.black
            : Colors.white;

    if (textColor == newTextColor) return;

    setState(() => textColor = newTextColor);
  }
}
