import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wonzy_core_utils/core_utils.dart';

void main() {
  group('PaddingExtensions', () {
    testWidgets('.paddingAll wraps with Padding', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('test').paddingAll(16)),
      );

      final paddingFinder = find.byType(Padding);
      expect(paddingFinder, findsOneWidget);

      final padding = tester.widget<Padding>(paddingFinder);
      expect(padding.padding, const EdgeInsets.all(16));
    });

    testWidgets('.paddingHorizontal wraps with horizontal padding', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('test').paddingHorizontal(12)),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(padding.padding, const EdgeInsets.symmetric(horizontal: 12));
    });
  });

  group('AlignmentExtensions', () {
    testWidgets('.center wraps with Center', (tester) async {
      await tester.pumpWidget(MaterialApp(home: const Text('test').center));

      expect(find.byType(Center), findsOneWidget);
    });
  });

  group('FlexExtensions', () {
    testWidgets('.expanded wraps with Expanded', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Row(children: [const Text('test').expanded(flex: 2)]),
        ),
      );

      final expanded = tester.widget<Expanded>(find.byType(Expanded));
      expect(expanded.flex, 2);
    });
  });

  group('SizeConstraintExtensions', () {
    testWidgets('.sized wraps with SizedBox', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('test').sized(width: 100, height: 50)),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, 100);
      expect(sizedBox.height, 50);
    });

    testWidgets('.square wraps with square SizedBox', (tester) async {
      await tester.pumpWidget(MaterialApp(home: const Text('test').square(60)));

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, 60);
      expect(sizedBox.height, 60);
    });
  });
}
