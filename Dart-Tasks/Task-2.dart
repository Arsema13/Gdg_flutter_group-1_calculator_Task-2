import 'dart:async';
import 'dart:io';

class Calculator {
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  
  double divide(double a, double b) {
    if (b == 0) {
      throw Exception("Error: Division by zero is not allowed.");
    }
    return a / b;
  }

  double modulus(double a, double b) => a % b;
  double power(double a, double b) => a == 0 && b < 0 ? throw Exception("Error: Zero raised to a negative power is undefined.") : a * b;
}

void main() async {
  final calculator = Calculator();

  while (true) {
    try {
      stdout.write("Enter first number: ");
      double num1 = double.parse(stdin.readLineSync()!);

      stdout.write("Enter operator (+, -, *, /, %, ^): ");
      String operator = stdin.readLineSync()!;

      stdout.write("Enter second number: ");
      double num2 = double.parse(stdin.readLineSync()!);

      double result;

      switch (operator) {
        case '+':
          result = calculator.add(num1, num2);
          break;
        case '-':
          result = calculator.subtract(num1, num2);
          break;
        case '*':
          result = calculator.multiply(num1, num2);
          break;
        case '/':
          result = calculator.divide(num1, num2);
          break;
        case '%':
          result = calculator.modulus(num1, num2);
          break;
        case '^':
          result = calculator.power(num1, num2);
          break;
        default:
          print("Error: Invalid operator.");
          continue;
      }

      print("Calculating...");
      await Future.delayed(Duration(seconds: 5));
      print("Result: $result");

    } catch (e) {
      print("Error: Invalid input. ${e.toString()}");
    }

    stdout.write("Do you want to perform another calculation? (y/n): ");
    String? choice = stdin.readLineSync();
    if (choice == null || choice.toLowerCase() != 'y') {
      print("Exiting calculator. Goodbye!");
      break;
    }
  }
}
