import 'package:flutter/material.dart';
import 'package:iot_project/components/linechart_ressource.dart';


class lineChartCard extends StatelessWidget {
  const lineChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 510,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Solar energy statistics',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          Expanded(child: LineChartSample2()),
        ],
      ),
    );
  }
}
