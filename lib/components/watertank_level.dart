import 'package:flutter/material.dart';
import 'package:iot_project/components/progress_indicator.dart';
class waterTankCard extends StatelessWidget {
  const waterTankCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 510,
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
       
        children: const [
          Padding(
            padding:  EdgeInsets.only(bottom: 170),
            child: Text('Water tanks level',style: TextStyle(fontSize: 15,
            fontWeight: FontWeight.bold),),
          ),
          
              progressIndicator(),
              progressIndicator(),
           
          
          
        ],
      ),
    );
  }
}














































/*import 'package:flutter/material.dart';
import 'package:iot_project/components/progress_indicator.dart';

class WaterTankCard extends StatefulWidget {
  const WaterTankCard({Key? key}) : super(key: key);

  @override
  _WaterTankCardState createState() => _WaterTankCardState();
}

class _WaterTankCardState extends State<WaterTankCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 510,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 2),
            child: Text(
              'Water Tanks Level',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: ProgressIndicatorWidget(),
                ),
               // SizedBox(width: 10),
                /*Expanded(
                  child: ProgressIndicatorWidget(),
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}

*/

































/*import 'package:flutter/material.dart';
import 'package:iot_project/components/progress_indicator.dart';
// ignore: camel_case_types
class waterTankCard extends StatelessWidget {
  const waterTankCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 510,
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
       
        children: const [
          Padding(
            padding:  EdgeInsets.only(bottom: 170),
            child: Text('Water tanks level',style: TextStyle(fontSize: 15,
            fontWeight: FontWeight.bold),),
          ),
          
              progressIndicator(),
              progressIndicator(),
           
          
          
        ],
      ),
    );
  }
}*/