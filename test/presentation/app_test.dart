// ignore_for_file: avoid_non_null_assertion
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solid_color_generator/presentation/app.dart';

void main() {
  testWidgets('App changes background color and text color on tap',
      (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('Hello There! 😊'), findsOneWidget);

    final Scaffold scaffold = tester.widget(find.byType(Scaffold));
    final Color initialBackgroundColor = scaffold.backgroundColor!;

    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    final Scaffold updatedScaffold = tester.widget(find.byType(Scaffold));
    final Color updatedBackgroundColor = updatedScaffold.backgroundColor!;
    expect(updatedBackgroundColor, isNot(initialBackgroundColor));
  });
}
