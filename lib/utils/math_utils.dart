import 'dart:math';
/// 
class MathUtils {
  ///truncates to decimals
  static double roundDouble(double value, int places) {
    final mod = pow(10.0, places).toDouble();

    return (value * mod).round().toDouble() / mod;
  }
}
