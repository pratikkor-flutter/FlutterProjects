import 'package:adabank/theme/shared_style.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class NetGraph extends StatelessWidget {
  const NetGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: const AxisTitles(),
          rightTitles: const AxisTitles(),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                switch (value.toInt()) {
                  case 0:
                    return Text(
                      "0",
                      style: textStyle(12, FontWeight.w500, Colors.white54),
                    );
                  case 1:
                    return Text(
                      "1k",
                      style: textStyle(12, FontWeight.w500, Colors.white54),
                    );
                  case 2:
                    return Text(
                      "2k",
                      style: textStyle(12, FontWeight.w500, Colors.white54),
                    );
                  case 3:
                    return Text(
                      "3k",
                      style: textStyle(12, FontWeight.w500, Colors.white54),
                    );

                  case 4:
                    return Text(
                      "4k",
                      style: textStyle(12, FontWeight.w500, Colors.white54),
                    );
                }
                return const Text("");
              },
            ),
          ),
          bottomTitles: AxisTitles(
            axisNameWidget: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "1 Aug",
                  style: textStyle(12, FontWeight.w500, Colors.white54),
                ),
                Text(
                  "11 Aug",
                  style: textStyle(12, FontWeight.w500, Colors.white54),
                ),
                Text(
                  "21 Aug",
                  style: textStyle(12, FontWeight.w500, Colors.white54),
                ),
                Text(
                  "31 Aug",
                  style: textStyle(12, FontWeight.w500, Colors.white54),
                ),
              ],
            ),
          ),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        minX: 0,
        maxX: 3,
        minY: 0,
        maxY: 5,
        lineBarsData: [
          LineChartBarData(
            dotData: const FlDotData(
              show: false,
            ),
            spots: const [
              FlSpot(0, 0),
              FlSpot(0.5, 2),
              FlSpot(0.8, 1.5),
              FlSpot(1, 3),
              FlSpot(1.5, 0.8),
              FlSpot(2, 4),
              FlSpot(2.5, 3.8),
              FlSpot(3, 5),
            ],
            isCurved: true,
            color: const Color.fromARGB(255, 233, 255, 171),
            barWidth: 2,
            isStrokeCapRound: true,
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color.fromARGB(117, 233, 255, 171),
                  Theme.of(context).primaryColor,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
