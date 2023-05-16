import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
class progressIndicator extends StatefulWidget {
  const progressIndicator({super.key});

  @override
  State<progressIndicator> createState() => _progressIndicatorState();
}

class _progressIndicatorState extends State<progressIndicator> {
  @override
  Widget build(BuildContext context) {
    return  CircularPercentIndicator(
            radius:75.0,
            lineWidth: 10.0,
            percent: 0.4,
            center: const Text("40%",style:TextStyle(fontSize: 30,fontWeight: FontWeight.normal)),
            progressColor: Colors.blue,
            backgroundColor: Colors.blue.shade100,
            circularStrokeCap: CircularStrokeCap.round,
          );
      
  }
}