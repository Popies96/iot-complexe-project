import 'package:flutter/material.dart';
import 'package:iot_project/components/security_page_components/building_security_items.dart';
import 'package:iot_project/components/security_page_components/camera_widget.dart';
import 'package:iot_project/components/security_page_components/customBar3.dart';
import 'package:iot_project/components/security_page_components/video_stream.dart';

import '../components/security_page_components/alarms_grid.dart';

class securityPage extends StatelessWidget {
  const securityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: double.infinity,
          color: Color.fromARGB(31, 164, 194, 224),
          padding: EdgeInsets.all(8.0),
          child: ListView(scrollDirection: Axis.vertical, children: [
            Column(
              children: [
                customBar3(),
                SizedBox(
                  height: 16,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        cameraCard(cameraNumber: 'Front door camera'),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                            width: 650,
                            height: 400,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Text('Security alarm ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Expanded(child: SecurityGridView())
                              ],
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        cameraCard(cameraNumber: 'Camera 1'),
                        SizedBox(
                          width: 16,
                        ),
                        cameraCard(cameraNumber: 'Camera 2')
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        cameraCard(cameraNumber: 'Camera 3'),
                        SizedBox(
                          width: 16,
                        ),
                        cameraCard(cameraNumber: 'Camera 4')
                      ],
                    ),
                  ],
                )
              ],
            ),
          ])),
    );
  }
}
