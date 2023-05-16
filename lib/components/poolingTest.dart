import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iot_project/components/AnalyticInfoCard.dart';
import 'package:iot_project/data/data.dart';
import 'package:iot_project/Models/Analytic_info_model.dart';
import 'package:http/http.dart' as http;
import 'package:iot_project/pages/config.dart';


class Analytic_cards extends StatefulWidget {
  const Analytic_cards({Key? key}) : super(key: key);

  @override
  _Analytic_cardsState createState() => _Analytic_cardsState();
}

class _Analytic_cardsState extends State<Analytic_cards> {
  late PollingService _pollingService;

  @override
  void initState() {
    super.initState();
    _pollingService = PollingService(onDataReceived: (data) {
      // Update the widget state with the new data
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _pollingService,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class PollingService extends StatefulWidget {
  final Function(List) onDataReceived;

  const PollingService({Key? key, required this.onDataReceived})
      : super(key: key);

  @override
  _PollingServiceState createState() => _PollingServiceState();
}

class _PollingServiceState extends State<PollingService> {
  Timer? _timer;
  List _data = [];
  List _data1 = [];
  List _data2 = [];
  List _data3 = [];
  String _response ='';
  String _response1 ='';
  String _response2 ='';
  String _response3 ='';


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
    _timer = Timer.periodic(const Duration(seconds: 0), (timer) {
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
    _makeRequest1();
    _makeRequest2();
    _makeRequest3();
    List analyticData = [
      AnalyticInfo(
        title: "Power consumption",
        count: _response3,
        color: Colors.purple,
      ),
      AnalyticInfo(
        title: "Gas consumption",
        count: _response1,
        color: Colors.green,
      ),
      AnalyticInfo(
        title: "Temperature",
        count: _response,
        color: Colors.pink,
      ),
      AnalyticInfo(
        title: "Water consumption",
        count: _response2,
        color: Colors.blue,
      ),
    ];

    setState(() {
            _data = analyticData;
            _data1 = analyticData;
            _data2 = analyticData;
            _data3 = analyticData;
            
    });


    // Call the onDataReceived callback function with the new data
    widget.onDataReceived(_data);
    widget.onDataReceived(_data1);
    widget.onDataReceived(_data2);
    widget.onDataReceived(_data3);
  }
  Future<void> _makeRequest() async {
    // Replace this with the URL of the API you want to query
    final  url = lastTemp;  
    const headers = {'Content-Type': 'application/json'};
    final response = await http.get(Uri.parse(url), headers: headers);
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
    
Future<void> _makeRequest1() async {
    // Replace this with the URL of the API you want to query 
    const headers = {'Content-Type': 'application/json'};
    final response1 = await http.get(Uri.parse(lastGas), headers: headers);
    if (response1.statusCode == 200) {
      setState(() {
        _response1 = response1.body;
      });
    } else {
      setState(() {
        _response1 = 'Error: ${response1.statusCode}';
      });
    }
    }
    Future<void> _makeRequest2() async {
    // Replace this with the URL of the API you want to query 
    const headers = {'Content-Type': 'application/json'};
    final response2 = await http.get(Uri.parse(lastLit), headers: headers);
    if (response2.statusCode == 200) {
      setState(() {
        _response2 = response2.body;
      });
    } else {
      setState(() {
        _response2 = 'Error: ${response2.statusCode}';
      });
    }
    }


    Future<void> _makeRequest3() async {
    // Replace this with the URL of the API you want to query 
    const headers = {'Content-Type': 'application/json'};
    final response3 = await http.get(Uri.parse(lastener), headers: headers);
    if (response3.statusCode == 200) {
      setState(() {
        _response3 = response3.body;
      });
    } else {
      setState(() {
        _response3 = 'Error: ${response3.statusCode}';
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
        crossAxisCount: 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2.5,
      ),
      itemBuilder: (context, index) =>
          AnalyticInfoCard(info: _data[index]),
    );
  }
}
