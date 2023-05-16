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
    count: '9m³',
    color: Colors.green,
  ),
  AnalyticInfo(
    title: "Temperature",
    count: "",
    color: Colors.pink,
  ),
  AnalyticInfo(
    title: "Water consumption",
    count: '17 L',
    color: Colors.blue,
  ),
];

class Door {
  final String name;
  bool isOpen;

  Door({
    required this.name,
    this.isOpen = false,
  });
}

List<Door> doors = [
  Door(name: 'Front Door'),
  Door(name: 'Back Door'),
  Door(name: 'Garage Door'),
  Door(name: 'Bathroom Door'),
  Door(name: 'Bedroom Door'),
  Door(name: 'Kitchen Door'),
  Door(name: 'Basement Door'),
  Door(name: 'Patio Door'),
  Door(name: 'Office Door'),
  Door(name: 'Laundry Room Door'),
  Door(name: 'Attic Door'),
  Door(name: 'Closet Door'),
];

class Light {
  final String name;
  bool isOn;

  Light({required this.name, required this.isOn});
}

final List<Light> groundFloorLights = [
  Light(name: 'Light 1', isOn: false),
  Light(name: 'Light 2', isOn: true),
  Light(name: 'Light 3', isOn: false),
  Light(name: 'Light 4', isOn: true),
  Light(name: 'Light 5', isOn: false),
  Light(name: 'Light 6', isOn: true),
  Light(name: 'Light 7', isOn: false),
  Light(name: 'Light 8', isOn: true),
  Light(name: 'Light 9', isOn: false),
  Light(name: 'Light 10', isOn: true),
];

final List<Light> firstFloorLights = [
  Light(name: 'Light 11', isOn: false),
  Light(name: 'Light 12', isOn: true),
  Light(name: 'Light 13', isOn: false),
  Light(name: 'Light 14', isOn: true),
  Light(name: 'Light 15', isOn: false),
  Light(name: 'Light 16', isOn: true),
  Light(name: 'Light 17', isOn: false),
  Light(name: 'Light 18', isOn: true),
  Light(name: 'Light 19', isOn: false),
  Light(name: 'Light 20', isOn: true),
];
