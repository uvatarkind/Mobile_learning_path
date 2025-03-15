import 'dart:async';
import 'dart:io';
import 'calculator.dart';

Future<void> calculate() async {
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
          print("Invalid operator. Please use +, -, *, /, %, ^.");
          continue;
      }
      
      print("Calculating...");
      await Future.delayed(Duration(seconds: 5));
      print("Result: $result\n");
    } catch (e) {
      print("Error: ${e.toString()}\n");
    }

    stdout.write("Do you want to perform another calculation? (y/n): ");
    String choice = stdin.readLineSync()!.toLowerCase();
    if (choice != 'y') break;
  }
  print("Thank you for using the calculator!");
}

void main() {
  calculate();
}