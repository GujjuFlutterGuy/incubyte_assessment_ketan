// Manual test script to verify StringCalculator implementation
// Run with: dart test_manual.dart

import 'lib/string_calculator.dart';

void main() {
  final calculator = StringCalculator();
  int passed = 0;
  int failed = 0;

  print('=== Running StringCalculator Tests ===\n');

  // STEP 1: EMPTY STRING
  try {
    final result = calculator.add('');
    if (result == 0) {
      print('STEP 1: Empty string - PASSED (got $result)');
      passed++;
    } else {
      print('STEP 1: Empty string - FAILED (expected 0, got $result)');
      failed++;
    }
  } catch (e) {
    print('STEP 1: Empty string - FAILED (exception: $e)');
    failed++;
  }

  // STEP 2: SINGLE & TWO NUMBERS
  try {
    final result1 = calculator.add('1');
    if (result1 == 1) {
      print('STEP 2a: Single number - PASSED (got $result1)');
      passed++;
    } else {
      print('STEP 2a: Single number - FAILED (expected 1, got $result1)');
      failed++;
    }
  } catch (e) {
    print('STEP 2a: Single number - FAILED (exception: $e)');
    failed++;
  }

  try {
    final result2 = calculator.add('1,5');
    if (result2 == 6) {
      print('STEP 2b: Two numbers - PASSED (got $result2)');
      passed++;
    } else {
      print('STEP 2b: Two numbers - FAILED (expected 6, got $result2)');
      failed++;
    }
  } catch (e) {
    print('STEP 2b: Two numbers - FAILED (exception: $e)');
    failed++;
  }

  // STEP 3: ANY AMOUNT OF NUMBERS
  try {
    final result = calculator.add('1,2,3,4,5');
    if (result == 15) {
      print('STEP 3: Any amount of numbers - PASSED (got $result)');
      passed++;
    } else {
      print('STEP 3: Any amount of numbers - FAILED (expected 15, got $result)');
      failed++;
    }
  } catch (e) {
    print('STEP 3: Any amount of numbers - FAILED (exception: $e)');
    failed++;
  }

  // STEP 4: NEW LINE DELIMITERS
  try {
    final result = calculator.add('1\n2,3');
    if (result == 6) {
      print('STEP 4: New line delimiters - PASSED (got $result)');
      passed++;
    } else {
      print('STEP 4: New line delimiters - FAILED (expected 6, got $result)');
      failed++;
    }
  } catch (e) {
    print('STEP 4: New line delimiters - FAILED (exception: $e)');
    failed++;
  }

  // STEP 5: CUSTOM DELIMITERS
  try {
    final result1 = calculator.add('//;\n1;2');
    if (result1 == 3) {
      print('STEP 5a: Custom delimiter (;) - PASSED (got $result1)');
      passed++;
    } else {
      print('STEP 5a: Custom delimiter (;) - FAILED (expected 3, got $result1)');
      failed++;
    }
  } catch (e) {
    print('STEP 5a: Custom delimiter (;) - FAILED (exception: $e)');
    failed++;
  }

  try {
    final result2 = calculator.add('//|\n1|2|3');
    if (result2 == 6) {
      print('STEP 5b: Custom delimiter (|) - PASSED (got $result2)');
      passed++;
    } else {
      print('STEP 5b: Custom delimiter (|) - FAILED (expected 6, got $result2)');
      failed++;
    }
  } catch (e) {
    print('STEP 5b: Custom delimiter (|) - FAILED (exception: $e)');
    failed++;
  }

  // STEP 6: NEGATIVE NUMBERS EXCEPTION
  try {
    calculator.add('-1');
    print('STEP 6a: Single negative - FAILED (should throw exception)');
    failed++;
  } catch (e) {
    final message = e.toString();
    if (message.contains('negative numbers not allowed -1')) {
      print('STEP 6a: Single negative - PASSED (exception message correct)');
      passed++;
    } else {
      print('STEP 6a: Single negative - FAILED (wrong message: $message)');
      failed++;
    }
  }

  try {
    calculator.add('1,-3,5,-7');
    print('STEP 6b: Multiple negatives - FAILED (should throw exception)');
    failed++;
  } catch (e) {
    final message = e.toString();
    if (message.contains('negative numbers not allowed -3,-7')) {
      print('STEP 6b: Multiple negatives - PASSED (exception message correct)');
      passed++;
    } else {
      print('STEP 6b: Multiple negatives - FAILED (wrong message: $message)');
      failed++;
    }
  }

  try {
    calculator.add('//;\n1;-2;3');
    print('STEP 6c: Negative with custom delimiter - FAILED (should throw exception)');
    failed++;
  } catch (e) {
    final message = e.toString();
    if (message.contains('negative numbers not allowed -2')) {
      print('STEP 6c: Negative with custom delimiter - PASSED (exception message correct)');
      passed++;
    } else {
      print('STEP 6c: Negative with custom delimiter - FAILED (wrong message: $message)');
      failed++;
    }
  }

  print('\n=== Test Results ===');
  print('Passed: $passed');
  print('Failed: $failed');
  print('Total: ${passed + failed}');
  
  if (failed == 0) {
    print('\nAll tests passed!');
  } else {
    print('\nSome tests failed.');
  }
}

