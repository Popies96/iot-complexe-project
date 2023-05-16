import 'package:flutter/material.dart';

import 'building_security_items.dart';

// ignore: use_key_in_widget_constructors
class SecurityGridView extends StatelessWidget {
  final List<Map<String, dynamic>> securityItems = [
    {
      "title": "Fire Alarm",
      "imagePlaceholder": "assets/images/fire-sensor.png",
      "isSafe": true,
    },
    {
      "title": "Motion detection",
      "imagePlaceholder": "assets/images/sensor.png",
      "isSafe": false,
    },
    {
      "title": "Smart locks",
      "imagePlaceholder": "assets/images/lock.png",
      "isSafe": true,
    },
    {
      "title": "Emergency Call",
      "imagePlaceholder": "assets/images/ambulance.png",
      "isSafe": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: securityItems.length,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16),
      itemBuilder: (BuildContext context, int index) {
        return SecurityItem(
          title: securityItems[index]["title"],
          imagePlaceholder: securityItems[index]["imagePlaceholder"],
          isSafe: securityItems[index]["isSafe"],
        );
      },
    );
  }
}
