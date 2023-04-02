import 'package:flutter/material.dart';
import 'package:iot_project/components/customBar.dart';
import 'package:iot_project/components/Analytic_cards.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child:ListView(
          scrollDirection: Axis.vertical,
          children:[ Column(
            children: [
              customBar(),
              SizedBox(height:16,),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Analytic_cards()),
                    Expanded(
                      flex: 2,
                      child:Container())
                ],
              )
              
        
          ],),]
        ) ),
      
    );
  }
}
