import 'package:flutter/material.dart';
import 'package:iot_project/components/circular_slider/AC_card.dart';
import 'package:iot_project/components/circular_slider/slider_widget.dart';
import 'package:iot_project/components/customBar.dart';
import 'package:iot_project/components/poolingTest.dart';
import 'package:iot_project/components/Barchart_Card.dart';
import 'package:iot_project/components/line_chart.dart';
import 'package:iot_project/components/watertank_level.dart';
import 'package:iot_project/components/weather_card.dart';

import '../components/generalControl_card.dart';



class HomePage extends StatelessWidget {
  
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          color:const  Color.fromARGB(31, 164, 194, 224),
          padding: const EdgeInsets.all(8.0),
          child: ListView(scrollDirection: Axis.vertical, children: [
            Column(
              children: [
                const customBar(),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Analytic_cards(),
                          const SizedBox(height: 16),
                          Row(
                            children: const [
                              barchartCard(),
                              SizedBox(width: 20,),
                              lineChartCard(),
                            ],
                          ),
                          const SizedBox(height: 16,),
                          Row(
                            children: const [
                              waterTankCard(),
                             SizedBox(width: 16,),
                              generalControl()
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                             // ignore: sized_box_for_whitespace
                             Container(
                              height: 365,
                              width: double.infinity,
                              child: WeatherCard()
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              height: 330,
                              width: double.infinity,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child:const  AcCard(),
                            )
                          ],
                        ))
                  ],
                ),
              ],
            ),
          ])),
    );
  }
}
