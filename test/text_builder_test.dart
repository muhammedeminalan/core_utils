import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wonzy_core_utils/core_utils.dart';

void main() {
  group('TextBuilder', () {
    testWidgets('creates Text widget from string', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: 'Hello'.text)));

      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets('.bold applies FontWeight.w700', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: 'Bold'.text.bold)),
      );

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.fontWeight, FontWeight.w700);
    });

    testWidgets('.italic applies FontStyle.italic', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: 'Italic'.text.italic)),
      );

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.fontStyle, FontStyle.italic);
    });

    testWidgets('.color applies text color', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: 'Red'.text.color(Colors.red))),
      );

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.color, Colors.red);
    });

    testWidgets('.fontSize applies font size', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: 'Big'.text.fontSize(24))),
      );

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.fontSize, 24);
    });

    testWidgets('chaining works correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: 'Styled'.text.bold.italic.color(Colors.blue).fontSize(20),
          ),
        ),
      );

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.fontWeight, FontWeight.w700);
      expect(text.style?.fontStyle, FontStyle.italic);
      expect(text.style?.color, Colors.blue);
      expect(text.style?.fontSize, 20);
    });
  });
}
