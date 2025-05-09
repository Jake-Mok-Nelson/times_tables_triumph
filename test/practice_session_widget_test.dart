import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:times_tables_triumph/ui/practice_session_widget.dart';
import 'package:times_tables_triumph/model/question.dart';

void main() {
  testWidgets(
    'PracticeSessionWidget goes through questions and shows summary',
    (WidgetTester tester) async {
      // Arrange
      final questions = [
        Question(factor1: 1, factor2: 2, answer: 2),
        Question(factor1: 3, factor2: 4, answer: 12),
      ];

      // Load the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: PracticeSessionWidget(questions: questions)),
        ),
      );

      // Assert initial state
      expect(find.text('1 x 2 = ?'), findsOneWidget);
      expect(find.text('1 x 2 = 2'), findsNothing);

      // Act: Mark first question correct
      await tester.tap(find.text('Correct'));
      await tester.pumpAndSettle();

      // Assert second question displayed
      expect(find.text('3 x 4 = ?'), findsOneWidget);

      // Act: Mark second question incorrect
      await tester.tap(find.text('Incorrect'));
      await tester.pumpAndSettle();

      // Assert summary screen displayed
      expect(find.text('Practice Session Complete!'), findsOneWidget);
      expect(find.text('Correct: 1'), findsOneWidget);
      expect(find.text('Incorrect: 1'), findsOneWidget);
      expect(find.text('Back'), findsOneWidget);
    },
  );
}
