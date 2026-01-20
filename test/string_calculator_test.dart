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

    // STEP 2: SINGLE & TWO NUMBERS
    test('should return the number itself for single number', () {
      expect(calculator.add('1'), 1);
    });

    test('should return sum for two comma-separated numbers', () {
      expect(calculator.add('1,5'), 6);
    });


  });
}

