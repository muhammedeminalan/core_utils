import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core_utils/core_utils.dart';

void main() {
  group('ColumnExtension on List<Widget>', () {
    testWidgets('.column() creates a Column', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: [
              const Text('A'),
              const Text('B'),
            ].column(),
          ),
        ),
      );

      expect(find.byType(Column), findsOneWidget);
      expect(find.text('A'), findsOneWidget);
      expect(find.text('B'), findsOneWidget);
    });

    testWidgets('.column(spacing: 8) inserts SizedBox spacers', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: [
              const Text('A'),
              const Text('B'),
              const Text('C'),
            ].column(spacing: 8),
          ),
        ),
      );

      // 3 items + 2 spacers = children count should include SizedBoxes
      final column = tester.widget<Column>(find.byType(Column));
      expect(column.children.length, 5); // A, spacer, B, spacer, C
    });
  });

  group('RowExtension on List<Widget>', () {
    testWidgets('.row() creates a Row', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: [
              const Text('X'),
              const Text('Y'),
            ].row(),
          ),
        ),
      );

      expect(find.byType(Row), findsOneWidget);
      expect(find.text('X'), findsOneWidget);
      expect(find.text('Y'), findsOneWidget);
    });
  });

  group('Column/Row Axis Extensions', () {
    testWidgets('Column.crossCenter sets CrossAxisAlignment.center', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: const [Text('Test')],
            ).crossCenter,
          ),
        ),
      );

      final column = tester.widget<Column>(find.byType(Column));
      expect(column.crossAxisAlignment, CrossAxisAlignment.center);
    });

    testWidgets('Row.mainEnd sets MainAxisAlignment.end', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Row(
              children: const [Text('Test')],
            ).mainEnd,
          ),
        ),
      );

      final row = tester.widget<Row>(find.byType(Row));
      expect(row.mainAxisAlignment, MainAxisAlignment.end);
    });
  });
}
