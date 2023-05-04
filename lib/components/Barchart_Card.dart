
import 'package:flutter/material.dart';

import 'barchart_Ressources.dart';

class barchartCard extends StatelessWidget {
  const barchartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 510,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.white,
      borderRadius: BorderRadius.circular(10)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ressources usage statistics',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.black.withOpacity(0.7),
        ),),
        Expanded(child: BarChartSample2()),
      ],),
      
    );
}
}