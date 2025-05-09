import 'dart:math';

import 'question.dart';
import 'settings.dart';

class QuestionGenerator {
  final Settings settings;
  final Random _random = Random();

  QuestionGenerator(this.settings);

  List<Question> generateQuestions() {
    List<Question> questions = [];

    for (int i = 0; i < settings.numQuestions; i++) {
      int factor1 = settings.tables[_random.nextInt(settings.tables.length)];
      int factor2 = _random.nextInt(settings.maxMultiplicand) + 1;
      int answer = factor1 * factor2;

      questions.add(
        Question(factor1: factor1, factor2: factor2, answer: answer),
      );
    }

    return questions;
  }
}
