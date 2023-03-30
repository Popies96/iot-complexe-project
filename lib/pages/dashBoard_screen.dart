import 'package:flutter/material.dart';
import 'package:iot_project/components/customBar.dart';
import 'package:iot_project/components/Analytic_cards.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child:Column(
          children: [
            customBar(),
            SizedBox(height:16,),
            Analytic_cards()
            

        ],) ),
      
    );
  }
}
