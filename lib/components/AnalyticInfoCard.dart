import 'package:flutter/material.dart';
import 'package:iot_project/Models/Analytic_info_model.dart';
class AnalyticInfoCard extends StatelessWidget {
  const AnalyticInfoCard({super.key, required this.info});
final AnalyticInfo info ;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${info.title}',style: TextStyle(color: Colors.black54,
              fontWeight: FontWeight.w700,
              fontSize: 18),),
              Container(
                padding: EdgeInsets.all(8),
                height: 48,
                width: 48,
                decoration: BoxDecoration(color: info.color!.withOpacity(0.1),
                shape: BoxShape.circle),
                
              )

            ],
          ),
          Text('${info.count}',style:TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600
          ) ,)

        ],
      ),
    );
  }
}