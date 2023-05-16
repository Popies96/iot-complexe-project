import 'package:flutter/material.dart';
import 'package:iot_project/components/generaleControlinfo.dart';

class generalControl extends StatefulWidget {
  const generalControl({super.key});

  @override
  State<generalControl> createState() => _generalControlState();
}

List myDevices = [
  ['Lights', 'assets/images/idea.png', 'Controls', true],
  ['Doors', 'assets/images/door-lock.png', 'Controls', false],
  ['Cameras', 'assets/images/cctv.png', 'Controls', false],
  ['Routers', 'assets/images/wifi-router.png', 'Controls', true]
];


class _generalControlState extends State<generalControl> {
  void powerSwitchChanged(bool values , int index) {
    setState(() {
      myDevices[index][3] = values;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 510,
      height: 230,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8),
            child: Text(
              'Monitoring',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: GridView.builder(
            itemCount: myDevices.length,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 2.7),
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.all(8),
                  child: generaleControlInfo(
                    deviceName: myDevices[index][0],
                    iconPath: myDevices[index][1],
                    description: myDevices[index][2],
                    powerOn: myDevices[index][3],
                    onChanged:(value) => powerSwitchChanged(value,index),
                  ));
            },
          ))
        ],
      ),
    );
  }
}
