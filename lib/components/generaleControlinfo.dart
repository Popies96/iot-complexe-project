import 'package:flutter/material.dart';

class generaleControlInfo extends StatelessWidget {
  final String iconPath;
  final String deviceName;
  final String description;
  final bool powerOn;
   void Function(bool)? onChanged;

  generaleControlInfo(
      {super.key,
      required this.iconPath,
      required this.deviceName,
       required this.description,
      required this.powerOn,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:powerOn ? Color(0xff005BE0) : Color.fromARGB(255, 93, 122, 142) ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Center(
                  child: Image.asset(
                iconPath,
                scale: 15,
              ))),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(deviceName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                Text(description,style: TextStyle(color: Colors.white),)
              ],),
              Switch(value: powerOn, onChanged:onChanged,
              activeColor: Color.fromARGB(255, 50, 224, 56),)
        ],
      ),
    );
  }
}
