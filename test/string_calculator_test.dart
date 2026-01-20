import 'package:test/test.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {
  group('StringCalculator', () {
    late StringCalculator calculator;

    setUp(() {
      calculator = StringCalculator();
    });

    // STEP 1: EMPTY STRING
    test('should return 0 for empty string', () {
      expect(calculator.add(''), 0);
    });


  });
}

