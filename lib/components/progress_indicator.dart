import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
/*import 'dart:async';
import 'package:iot_project/data/data1.dart';
import 'package:iot_project/Models/Circular_Percent_model.dart';
import 'package:http/http.dart' as http;
import 'package:iot_project/pages/config.dart';*/



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






































/*
class ProgressIndicatorWidget extends StatefulWidget {
  const ProgressIndicatorWidget({Key? key}) : super(key: key);

  @override
  _ProgressIndicatorWidgetState createState() => _ProgressIndicatorWidgetState();
}

class _ProgressIndicatorWidgetState extends State<ProgressIndicatorWidget> {
  late PollingService _pollingService1;

  @override
  void initState() {
    super.initState();
    _pollingService1 = PollingService(onDataReceived: (data) {
      // Update the widget state with the new data
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _pollingService1,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class PollingService extends StatefulWidget {
  final Function(List) onDataReceived;

  const PollingService({Key? key, required this.onDataReceived}) : super(key: key);

  @override
  _PollingServiceState createState() => _PollingServiceState();
}

class _PollingServiceState extends State<PollingService> {
  Timer? _timer;
  List _data = [];
  String _response = '';

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _pollData();
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _pollData() {
    // Simulate data retrieval from an API
    _makeRequest();
List analyticData = [
  
  AnalyticInfo(
    title: "Tank 1 ",
    count: _response,
    color: Colors.purple,
    
    percentage: double.tryParse(_response)?? 0 ,
  ),
 /* AnalyticInfo(
    title: "Tank 1",
    count: '9m',
    color: Colors.green,
    percentage: 45,
  ),*/
];
    setState(() {
      _data = analyticData;
    });

    // Call the onDataReceived callback function with the new data
    widget.onDataReceived(_data);
  }

  Future<void> _makeRequest() async {
    // Replace this with the URL of the API you want to query
    const headers = {'Content-Type': 'application/json'};
    final response = await http.get(Uri.parse(Temp), headers: headers);
    if (response.statusCode == 200) {
      setState(() {
        _response = response.body;
      });
    } else {
      setState(() {
        _response = 'Error: ${response.statusCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 1,
        mainAxisSpacing: 12,
        childAspectRatio: 9,
      ),
      itemBuilder: (context, index) {
        final analyticInfo = _data[index];
        final percentage = analyticInfo.percentage; // Replace with the correct property name from your data model

        return CircularPercentIndicator(
          radius: 75.0,
          lineWidth: 10.0,
          percent: percentage / 100, // Divide by 100 to convert to decimal
          center: Text('${percentage.toStringAsFixed(0)}%'),
          progressColor: Colors.blue,
          backgroundColor: Colors.blue.shade100,
          circularStrokeCap: CircularStrokeCap.round,
        );
      },
    );
  }
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
}*/