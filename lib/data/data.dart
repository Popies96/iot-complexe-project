import 'package:flutter/material.dart';
import 'package:iot_project/Models/Analytic_info_model.dart';
import 'package:iot_project/pages/home_screen.dart';



// iterate over the list and print each element

List analyticData = [
  AnalyticInfo(
    title: "Power consumption",
    count: '300 Kw',
    color: Colors.purple,
  ),
  AnalyticInfo(
    title: "Gas consumption",
    count: '9m',
    color: Colors.green,
  ),
  AnalyticInfo(
    title: "Temperature",
    count: "",
    color: Colors.pink,
  ),
  AnalyticInfo(
    title: "Water consumption",
    count: '17 m',
    color: Colors.blue,
  ),
];

