import 'package:covid19/widgets/basic_container.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartSample3State();
}

class BarChartSample3State extends State<BarChartSample3> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 2000,
          barTouchData: BarTouchData(
            enabled: false,
            touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Colors.transparent,
              tooltipPadding: const EdgeInsets.all(0),
              tooltipBottomMargin: 8,
              getTooltipItem: (
                BarChartGroupData group,
                int groupIndex,
                BarChartRodData rod,
                int rodIndex,
              ) {
                return BarTooltipItem(
                  rod.y.round().toString(),
                  TextStyle(
                    color: Color(0xff7589a2), //TODO change color
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Dosis',
                  ),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
              showTitles: true,
              textStyle: TextStyle(
                  color: const Color(0xff7589a2),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Dosis',
                  fontSize: 14),
              margin: 20,
              getTitles: (double value) {
                switch (value.toInt()) {
                  case 0:
                    return '23';
                  case 1:
                    return '24';
                  case 2:
                    return '25';
                  case 3:
                    return '26';
                  case 4:
                    return '27';
                  case 5:
                    return '28';
                  case 6:
                    return '29';
                  default:
                    return '';
                }
              },
            ),
            leftTitles: SideTitles(showTitles: false),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          barGroups: [
            //TODO provide values
            BarChartGroupData(
                x: 0,
                barRods: [BarChartRodData(y: 800, color: Colors.redAccent)],
                showingTooltipIndicators: [0]),
            BarChartGroupData(
                x: 1,
                barRods: [BarChartRodData(y: 1200, color: Colors.redAccent)],
                showingTooltipIndicators: [0]),
            BarChartGroupData(
                x: 2,
                barRods: [BarChartRodData(y: 1000, color: Colors.redAccent)],
                showingTooltipIndicators: [0]),
            BarChartGroupData(
                x: 3,
                barRods: [BarChartRodData(y: 1500, color: Colors.redAccent)],
                showingTooltipIndicators: [0]),
            BarChartGroupData(
                x: 3,
                barRods: [BarChartRodData(y: 800, color: Colors.redAccent)],
                showingTooltipIndicators: [0]),
            BarChartGroupData(
                x: 3,
                barRods: [BarChartRodData(y: 950, color: Colors.redAccent)],
                showingTooltipIndicators: [0]),
          ],
        ),
      ),
    );
  }
}
