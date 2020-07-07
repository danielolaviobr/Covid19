import 'dart:math';
import 'package:covid19/main.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  final List<int> dataList;

  const Chart({Key key, this.dataList}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChartState();
}

class ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: widget.dataList.reduce(max).toDouble() > 10000
              ? widget.dataList.reduce(max).toDouble() + 4000
              : widget.dataList.reduce(max).toDouble() + 2000,
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
                List<int> myDates = apiData.pastSevenDays();

                switch (value.toInt()) {
                  case 0:
                    return myDates[6].toString();
                  case 1:
                    return myDates[5].toString();
                  case 2:
                    return myDates[4].toString();
                  case 3:
                    return myDates[3].toString();
                  case 4:
                    return myDates[2].toString();
                  case 5:
                    return myDates[1].toString();
                  case 6:
                    return myDates[0].toString();
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
            BarChartGroupData(x: 0, barRods: [
              BarChartRodData(
                  y: widget.dataList[6].toDouble(), color: Colors.redAccent)
            ], showingTooltipIndicators: [
              0
            ]),
            BarChartGroupData(x: 1, barRods: [
              BarChartRodData(
                  y: widget.dataList[5].toDouble(), color: Colors.redAccent)
            ], showingTooltipIndicators: [
              0
            ]),
            BarChartGroupData(x: 2, barRods: [
              BarChartRodData(
                  y: widget.dataList[4].toDouble(), color: Colors.redAccent)
            ], showingTooltipIndicators: [
              0
            ]),
            BarChartGroupData(x: 3, barRods: [
              BarChartRodData(
                  y: widget.dataList[3].toDouble(), color: Colors.redAccent)
            ], showingTooltipIndicators: [
              0
            ]),
            BarChartGroupData(x: 3, barRods: [
              BarChartRodData(
                  y: widget.dataList[2].toDouble(), color: Colors.redAccent)
            ], showingTooltipIndicators: [
              0
            ]),
            BarChartGroupData(x: 3, barRods: [
              BarChartRodData(
                  y: widget.dataList[1].toDouble(), color: Colors.redAccent)
            ], showingTooltipIndicators: [
              0
            ]),
            BarChartGroupData(x: 3, barRods: [
              BarChartRodData(
                  y: widget.dataList[0].toDouble(), color: Colors.redAccent)
            ], showingTooltipIndicators: [
              0
            ]),
          ],
        ),
      ),
    );
  }
}
