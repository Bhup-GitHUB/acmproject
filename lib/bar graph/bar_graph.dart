import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'indiviual_bar.dart';

class MyBarGraph extends StatelessWidget {
  final List<IndiviualBar> barData;

  const MyBarGraph({super.key, required this.barData});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: 10,
        minY: 0,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getbottomtiels,
            ),
          ),
        ),
        barGroups: barData
            .map((data) => BarChartGroupData(
                  x: data.x,
                  barRods: [
                    BarChartRodData(
                      toY: data.y,
                      color: Colors.blue,
                      width: 20,
                      borderRadius: BorderRadius.circular(4),
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }
}

Widget getbottomtiels(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text("S", style: style);
      break;
    case 1:
      text = const Text("M", style: style);
      break;
    case 2:
      text = const Text("T", style: style);
      break;
    case 3:
      text = const Text("W", style: style);
      break;
    case 4:
      text = const Text("T", style: style);
      break;
    case 5:
      text = const Text("F", style: style);
      break;
    case 6:
      text = const Text("S", style: style);
      break;
    default:
      text = const Text("", style: style);
  }

  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
