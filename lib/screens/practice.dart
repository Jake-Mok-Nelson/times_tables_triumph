import 'package:flutter/material.dart';
import '../model/question_generator.dart';
import '../model/settings.dart';
import '../ui/practice_session_widget.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  late Settings _settings;

  @override
  void initState() {
    super.initState();
    _settings = Settings(); // Default settings
  }

  void _startPracticeSession() {
    final questionGenerator = QuestionGenerator(_settings);
    final questions = questionGenerator.generateQuestions();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => Scaffold(
              appBar: AppBar(title: Text('Practice')),
              body: PracticeSessionWidget(questions: questions),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Tables:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 8.0,
              children: List.generate(12, (index) {
                final table = index + 1;
                return ChoiceChip(
                  label: Text('$table'),
                  selected: _settings.tables.contains(table),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _settings.tables.add(table);
                      } else {
                        _settings.tables.remove(table);
                      }
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 16),
            TextButton.icon(
              label: Text('Clear All'),
              icon: Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  _settings.tables.clear();
                });
              },
            ),
            SizedBox(height: 16),
              
            Text(
              'Max Multiplicand:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _settings.maxMultiplicand.toDouble(),
              min: 1,
              max: 20,
              divisions: 19,
              label: _settings.maxMultiplicand.toString(),
              onChanged: (value) {
                setState(() {
                  _settings.maxMultiplicand = value.toInt();
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Number of Questions:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _settings.numQuestions.toDouble(),
              min: 1,
              max: 50,
              divisions: 49,
              label: _settings.numQuestions.toString(),
              onChanged: (value) {
                setState(() {
                  _settings.numQuestions = value.toInt();
                });
              },
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _startPracticeSession,
                child: Text('Start Practice'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
