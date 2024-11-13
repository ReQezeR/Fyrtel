import 'dart:math';

extension Linear on double {
  double linear(double minValue, double maxValue) {
    if (this < minValue) {
      return 0;
    } else if (this >= minValue && this < maxValue) {
      return (this - minValue) / (maxValue - minValue);
    } else {
      return 1;
    }
  }
}

extension DoubleRounding on double {
  double roundToDecimals(int fractionDigits) {
    double mod = pow(10.0, fractionDigits).toDouble();
    return ((this * mod).round().toDouble() / mod);
  }
}
