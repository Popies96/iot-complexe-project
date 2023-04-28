import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
class barchartRessources extends StatelessWidget {
  const barchartRessources({super.key});

  @override
  Widget build(BuildContext context) {
    return  BarChart(
      BarChartData(
        borderData: FlBorderData(
          border: Border.all(width:0),
        ),
        groupsSpace: 15,
        titlesData: FlTitlesData(
          show: true,
          bottomTitles:AxisTitles(sideTitles: SideTitles(
            showTitles: true,
          
          )),
          

          ),
        )
      );
    
  }
}