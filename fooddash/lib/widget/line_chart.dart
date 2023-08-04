import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  final List<FlSpot> data = [
  const   FlSpot(0, 3),
   const  FlSpot(1, 1),
   const  FlSpot(2, 4),
   const  FlSpot(3, 2),
   const  FlSpot(4, 5),
   const  FlSpot(5, 7),
  ];

  LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding:const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            gridData:const FlGridData(show: false),
            titlesData:const FlTitlesData(show: false),
            borderData: FlBorderData(show: false),
            minX: 0,
            maxX: 5,
            minY: 0,
            maxY: 8,
            lineBarsData: [
              LineChartBarData(
                spots: data,
                isCurved: true,
                color: Colors.amber,
                dotData:const FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      );
    
  }
}