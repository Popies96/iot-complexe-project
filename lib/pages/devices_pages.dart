import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:iot_project/components/devices_page_components/Lights_control.dart';

import 'package:iot_project/components/devices_page_components/Smart_parking_lots.dart';
import 'package:iot_project/components/devices_page_components/doors_controls.dart';

import '../components/customBar.dart';
import '../components/customBar_2.dart';
import '../components/devices_page_components/smart_parking_card.dart';

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
              SizedBox(height: 16,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    parkingLots(),
                    SizedBox(width: 16,),
                    doorsControls(),
                    
                  ],
              ),
              SizedBox(height: 16,),
              Container(
                padding: EdgeInsets.all(8),
                width: 550,
                height: 450,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Colors.white),
                child: LightsCard())
              ],
              
            )
          ])
      ),
    );
  }
}