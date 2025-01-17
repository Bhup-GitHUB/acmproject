import 'package:acm/bar%20graph/indiviual_bar.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;

  List<IndiviualBar> barData = [];

  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thuAmount,
    required this.friAmount,
    required this.satAmount,
  }) {
    initializeBarData();
  }

  void initializeBarData() {
    barData = [
      IndiviualBar(x: 0, y: sunAmount),
      IndiviualBar(x: 1, y: monAmount),
      IndiviualBar(x: 2, y: tueAmount),
      IndiviualBar(x: 3, y: wedAmount),
      IndiviualBar(x: 4, y: thuAmount),
      IndiviualBar(x: 5, y: friAmount),
      IndiviualBar(x: 6, y: satAmount),
    ];
  }
}
