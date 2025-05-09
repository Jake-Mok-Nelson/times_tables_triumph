import 'package:flutter_test/flutter_test.dart';
import 'package:times_tables_triumph/model/question_generator.dart';
import 'package:times_tables_triumph/model/settings.dart';

void main() {
  group('QuestionGenerator', () {
    test('generates the correct number of questions', () {
      // Arrange
      final settings =
          Settings()
            ..numQuestions = 5
            ..tables = [2, 3]
            ..maxMultiplicand = 10;
      final generator = QuestionGenerator(settings);

      // Act
      final questions = generator.generateQuestions();

      // Assert
      expect(questions.length, settings.numQuestions);
    });

    test('generates questions with factors within the specified settings', () {
      // Arrange
      final settings =
          Settings()
            ..tables = [2, 3]
            ..maxMultiplicand = 5;
      final generator = QuestionGenerator(settings);

      // Act
      final questions = generator.generateQuestions();

      // Assert
      for (final question in questions) {
        expect(settings.tables.contains(question.factor1), isTrue);
        expect(question.factor2, inInclusiveRange(1, settings.maxMultiplicand));
        expect(question.answer, equals(question.factor1 * question.factor2));
      }
    });
  });
}
