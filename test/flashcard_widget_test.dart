import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:times_tables_triumph/ui/flashcard_widget.dart';
import 'package:times_tables_triumph/model/question.dart';

void main() {
  testWidgets('FlashcardWidget flips to reveal the answer on tap', (
    WidgetTester tester,
  ) async {
    // Arrange
    final question = Question(factor1: 2, factor2: 3, answer: 6);

    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: FlashcardWidget(question: question))),
    );

    // Assert initial state
    expect(find.text('2 x 3 = ?'), findsOneWidget);
    expect(find.text('2 x 3 = 6'), findsNothing);

    // Act: Tap the flashcard to flip it
    await tester.tap(find.byType(FlashcardWidget));
    await tester.pumpAndSettle();

    // Assert flipped state
    expect(find.text('2 x 3 = ?'), findsNothing);
    expect(find.text('2 x 3 = 6'), findsOneWidget);
  });
}
