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

    // STEP 3: ANY AMOUNT OF NUMBERS
    test('should return sum for any amount of comma-separated numbers', () {
      expect(calculator.add('1,2,3,4,5'), 15);
    });


    // STEP 4: NEW LINE DELIMITERS
    test('should handle new line as delimiter along with commas', () {
      expect(calculator.add('1\n2,3'), 6);
    });

    // STEP 5: CUSTOM DELIMITERS
    test('should handle custom delimiter specified in format //[delimiter]\\n[numbers]', () {
      expect(calculator.add('//;\n1;2'), 3);
    });

    test('should use custom delimiter instead of commas and newlines', () {
      expect(calculator.add('//|\n1|2|3'), 6);
    });

    // STEP 6: NEGATIVE NUMBERS EXCEPTION
    test('should throw exception with message for single negative number', () {
      expect(
            () => calculator.add('-1'),
        throwsA(predicate((e) => e is Exception && e.toString().contains('negative numbers not allowed -1'))),
      );
    });

    test('should throw exception with all negative numbers in message', () {
      expect(
            () => calculator.add('1,-3,5,-7'),
        throwsA(predicate((e) => e is Exception && e.toString().contains('negative numbers not allowed -3,-7'))),
      );
    });

    test('should throw exception for negative numbers with custom delimiter', () {
      expect(
            () => calculator.add('//;\n1;-2;3'),
        throwsA(predicate((e) => e is Exception && e.toString().contains('negative numbers not allowed -2'))),
      );
    });




  });
}

