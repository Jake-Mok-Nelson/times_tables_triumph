import 'package:flutter_test/flutter_test.dart';
import 'package:times_tables_triumph/fact.dart';

void main() {
  group('MultiplicationFact', () {
    test('product returns correct result', () {
      // Arrange: create a fact 3 × 7
      final fact = MultiplicationFact(3, 7);

      // Act & Assert: product should be 21
      expect(fact.product, equals(21), reason: '3 × 7 should be 21');
    });

    test('product handles larger numbers', () {
      // Arrange: create a fact 12 × 12
      final fact = MultiplicationFact(12, 12);

      // Act & Assert: product should be 144
      expect(fact.product, equals(144), reason: '12 × 12 should be 144');
    });
  });

  group('FactGenerator', () {
    final generator = FactGenerator();

    test('generate() default maxTable produces operands 1–12', () {
      // Sample multiple times to ensure range
      for (var i = 0; i < 100; i++) {
        final fact = generator.generate();
        expect(
          fact.multiplicand,
          inInclusiveRange(1, 12),
          reason: 'multiplicand should be between 1 and 12',
        );
        expect(
          fact.multiplier,
          inInclusiveRange(1, 12),
          reason: 'multiplier should be between 1 and 12',
        );
      }
    });

    test('generate(maxTable: n) respects custom upper bound', () {
      const customMax = 20;
      // Sample for custom range
      for (var i = 0; i < 100; i++) {
        final fact = generator.generate(maxTable: customMax);
        expect(
          fact.multiplicand,
          inInclusiveRange(1, customMax),
          reason: 'multiplicand should be between 1 and \$customMax',
        );
        expect(
          fact.multiplier,
          inInclusiveRange(1, customMax),
          reason: 'multiplier should be between 1 and \$customMax',
        );
      }
    });
  });
}
