import 'package:flutter/material.dart';
class generalControl extends StatefulWidget {
  const generalControl({super.key});

  @override
  State<generalControl> createState() => _generalControlState();
}
List myDevices = [
  ['Lights','lib/assets/idea.png',true],
  ['Doors','lib/assets/door-lock.png',true],
  ['cameras','lib/assets/cctv.png',true],
  ['Routers','lib/assets/wifi-router.png',true]
];

class _generalControlState extends State<generalControl> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 510,
      height:230 ,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.white,
      borderRadius: BorderRadius.circular(10)),
      child:Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        
        children: [
          Padding(
            padding: const EdgeInsets.only(left:8.0, bottom: 8),
            child: Text('Monitoring',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          ),
          Expanded(child: GridView.builder(
            itemCount: myDevices.length,
           physics: NeverScrollableScrollPhysics(),
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2.5
          ), itemBuilder:(context, index) {
            return Padding(padding: EdgeInsets.all(8),
            child: Container(color: Colors.blue),);
          } ,))
        ],
      ) ,
    );
  }
}