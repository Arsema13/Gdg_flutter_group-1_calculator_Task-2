import 'dart:async';
import 'dart:io';

class Calculator {
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;

  double divide(double a, double b) {
    if (b == 0) {
      throw Exception("Cannot divide by zero!");
    }
    return a / b;
  }
}

Future<void> main() async {
  Calculator calc = Calculator();

  while (true) {
    try {
      stdout.write("Enter first number: ");
      double num1 = double.parse(stdin.readLineSync()!);

      stdout.write("Enter an operator (+, -, *, /): ");
      String operator = stdin.readLineSync()!;

      stdout.write("Enter second number: ");
      double num2 = double.parse(stdin.readLineSync()!);

      double result;

      switch (operator) {
        case '+':
          result = calc.add(num1, num2);
          break;
        case '-':
          result = calc.subtract(num1, num2);
          break;
        case '*':
          result = calc.multiply(num1, num2);
          break;
        case '/':
          result = calc.divide(num1, num2);
          break;
        default:
          print("Invalid operator! Try again.");
          continue;
      }

      print("Calculating...");
      await Future.delayed(Duration(seconds: 5)); // 5-second delay
      print("Result: $result");
    } catch (e) {
      print("Error: ${e.toString()}");
    }

    stdout.write("Do you want to perform another calculation? (yes/no): ");
    String? response = stdin.readLineSync();
    if (response?.toLowerCase() != 'yes') break;
  }
}
