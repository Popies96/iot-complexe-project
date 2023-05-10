import 'package:flutter/material.dart';
class cameraCard extends StatelessWidget {
  final String cameraNumber ;
  cameraCard({super.key,required this.cameraNumber});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 650,
      height: 400,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.white,
      borderRadius: BorderRadiusDirectional.circular(20)),
      child: Column(children: [
        Text('$cameraNumber',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        Container(color: Colors.grey,width:double.infinity-10,height:310),
        


      ]),
    );
  }
}