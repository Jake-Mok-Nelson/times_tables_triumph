import 'package:flutter/material.dart';
import '../model/question.dart';
import 'flashcard_widget.dart';

class PracticeSessionWidget extends StatefulWidget {
  final List<Question> questions;

  const PracticeSessionWidget({super.key, required this.questions});

  @override
  // ignore: library_private_types_in_public_api
  _PracticeSessionWidgetState createState() => _PracticeSessionWidgetState();
}

class _PracticeSessionWidgetState extends State<PracticeSessionWidget> {
  int currentIndex = 0;
  int correctCount = 0;
  int incorrectCount = 0;

  void _handleAnswer(bool isCorrect) {
    setState(() {
      // Check if the current index is within the bounds of the questions list
      // This prevents accessing an index that is out of range
      if (currentIndex >= widget.questions.length) return;

      // Check if the answer is correct
      if (isCorrect) {
        correctCount++;
      } else {
        incorrectCount++;
      }
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentIndex >= widget.questions.length) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Practice Session Complete!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Correct: $correctCount',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            Text(
              'Incorrect: $incorrectCount',
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Back'),
            ),
          ],
        ),
      );
    }

    final currentQuestion = widget.questions[currentIndex];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlashcardWidget(question: currentQuestion),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => _handleAnswer(true),
              child: Text('Correct'),
            ),
            ElevatedButton(
              onPressed: () => _handleAnswer(false),
              child: Text('Incorrect'),
            ),
          ],
        ),
      ],
    );
  }
}
