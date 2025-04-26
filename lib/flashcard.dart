import 'package:flutter/material.dart';
import 'package:times_tables_triumph/fact.dart';

/// A flashcard that shows a multiplication question and flips to reveal the answer.
class FlashCardWidget extends StatefulWidget {
  final MultiplicationFact fact;

  const FlashCardWidget({super.key, required this.fact});

  @override
  FlashCardWidgetState createState() => FlashCardWidgetState();
}

class FlashCardWidgetState extends State<FlashCardWidget> {
  bool _showAnswer = false;

  @override
  Widget build(BuildContext context) {
    final displayText = _showAnswer
        // Back of card: show full fact with answer
        ? '${widget.fact.multiplicand} × ${widget.fact.multiplier} = ${widget.fact.product}'
        // Front of card: show question only
        : '${widget.fact.multiplicand} × ${widget.fact.multiplier} = ?';

    return GestureDetector(
      onTap: () => setState(() => _showAnswer = !_showAnswer),
      child: Card(
        color: Theme.of(context).cardTheme.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          alignment: Alignment.center,
          child: Text(
            displayText,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
