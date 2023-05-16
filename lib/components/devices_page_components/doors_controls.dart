import 'package:flutter/material.dart';
import 'package:iot_project/components/devices_page_components/front_gate.dart';

import 'building_map_paint.dart';
class doorsControls extends StatelessWidget {
  const doorsControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
      width: 750,
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Doors controls',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
          Row(
            children: [
            SingleDoorContainer()
          ],),

           DoorGrid()
        ],
      ),
    );
  }
}