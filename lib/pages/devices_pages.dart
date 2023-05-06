import 'package:flutter/material.dart';

import '../components/customBar.dart';
import '../components/customBar_2.dart';

class devicesPage extends StatelessWidget {
  const devicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color.fromARGB(31, 164, 194, 224),
          padding: EdgeInsets.all(8.0),
          child: ListView(scrollDirection: Axis.vertical, children: [
            Column(
              children: [
                customBar2(),
              SizedBox(height: 16,)],
            )
          ])
      ),
    );
  }
}