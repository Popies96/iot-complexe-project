import 'package:flutter/material.dart';
import 'package:iot_project/components/devices_page_components/smart_parking_card.dart';

class parkingLots extends StatelessWidget {
  const parkingLots({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: 400,
      width: 550,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Parking lots',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          ),
          ParkingLotWidget(
            totalSlots: 10,
            emptySlots: 5,
            reservedSlots: [3, 4, 7],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 225, 84, 74),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    width: 25,
                    height: 25,
                  ),
                  SizedBox(width: 8,),
                  Text(
                    'Reserved area',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600
                    ),
                  )
                ],
              ),
              SizedBox(width: 10,),
                Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 126, 185, 244),
                    borderRadius: BorderRadius.circular(30)),
                    width: 25,
                    height: 25,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Available area',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
