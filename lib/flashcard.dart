import 'package:flutter/material.dart';
import 'package:times_tables_triumph/fact.dart';

/// A flashcard that shows a multiplication question and flips to reveal the answer.
class FlashCardWidget extends StatefulWidget {
  final FactGenerator generator;

  const FlashCardWidget({super.key, required this.generator});

  @override
  FlashCardWidgetState createState() => FlashCardWidgetState();
}

class FlashCardWidgetState extends State<FlashCardWidget> {
  bool _showAnswer = false;
  late MultiplicationFact fact = widget.generator.generate(maxTable: 12);

  @override
  Widget build(BuildContext context) {
    final displayText =
        _showAnswer
            // Back of card: show full fact with answer
            ? '${fact.multiplicand} x ${fact.multiplier} = ${fact.product}'
            // Front of card: show question only
            : '${fact.multiplicand} x ${fact.multiplier} = ?';

    return GestureDetector(
      onTap:
          () => setState(() {
            if (_showAnswer) {
              _setNewFact();
            } else {
              _showAnswer = true;
            }
          }),
      child: Card(
        color: Theme.of(context).cardTheme.color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        margin: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          alignment: Alignment.center,
          child: Text(
            displayText,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontSize: 32),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  _setNewFact() {
    setState(() {
      fact = widget.generator.generate(maxTable: 12);
      _showAnswer = false;
    });
  }
}
