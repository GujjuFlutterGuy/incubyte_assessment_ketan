class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    String delimiter = ',';
    String numbersToProcess = numbers;

    // Check for custom delimiter format: //[delimiter]\n[numbers]
    if (numbers.startsWith('//')) {
      final newlineIndex = numbers.indexOf('\n');
      if (newlineIndex != -1) {
        delimiter = numbers.substring(2, newlineIndex);
        numbersToProcess = numbers.substring(newlineIndex + 1);
      }
    }

    final parts = numbersToProcess.split(RegExp(delimiter == ',' ? r'[,\n]' : RegExp.escape(delimiter)));
    final numbersList = parts.map((part) => int.parse(part)).toList();
    
    // Check for negative numbers
    final negatives = numbersList.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      final negativesStr = negatives.join(',');
      throw Exception('negative numbers not allowed $negativesStr');
    }
    
    return numbersList.reduce((a, b) => a + b);
  }
}

