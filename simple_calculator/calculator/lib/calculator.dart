import 'dart:math';

class Calculator {
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError("Cannot divide by zero.");
    }
    return a / b;
  }
  double modulus(double a, double b) => a % b;
  double power(double a, double b) => pow(a, b).toDouble(); // Fix here!
}
