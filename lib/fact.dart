import 'dart:math';

/// A class that represents a multiplication problem.
class MultiplicationFact {
  final int multiplicand;
  final int multiplier;

  MultiplicationFact(this.multiplicand, this.multiplier);

  /// Returns product of the two operands
  int get product => multiplicand * multiplier;
}

/// Generates a random MultiplicationFact within 1…maxTable
class FactGenerator {
  final _rng = Random();

  MultiplicationFact generate({int maxTable = 12}) {
    final a = _rng.nextInt(maxTable) + 1; // 1..maxTable
    final b = _rng.nextInt(maxTable) + 1;
    return MultiplicationFact(a, b);
  }
}
