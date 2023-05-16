
import 'package:flutter/material.dart';
import 'package:iot_project/components/circular_slider/utils.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'AirCoditioning_card.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double progressVal = 0.5;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return SweepGradient(
                startAngle: degToRad(0),
                endAngle: degToRad(184),
                colors: [Colors.blue, Colors.grey.withAlpha(50)],
                stops: [progressVal, progressVal],
                transform: GradientRotation(
                  degToRad(178),
                ),
              ).createShader(rect);
            },
            child: Center(
              child: CustomArc(),
            ),
          ),
          Center(
            child: Container(
              width: kDiameter - 30,
              height: kDiameter - 30,
              decoration: BoxDecoration(

                   gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 23, 109, 239), Color.fromARGB(255, 61, 138, 253)],

                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.2, 0.4],
                  ),
                  shape: BoxShape.circle,
                  
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 30,
                        spreadRadius: 10,
                        color: Color(0xff005BE0).withAlpha(
                            normalize(progressVal * 20000, 100, 255).toInt()),
                        offset: const Offset(1, 3))
                  ]),
              child: SleekCircularSlider(
                min: kMinDegree,
                max: kMaxDegree,
                initialValue: 22,
                appearance: CircularSliderAppearance(
                  startAngle: 180,
                  angleRange: 180,
                  size: kDiameter - 100,
                  customWidths: CustomSliderWidths(
                    trackWidth: 10,
                    shadowWidth: 0,
                    progressBarWidth: 01,
                    handlerSize: 10,
                  ),
                  customColors: CustomSliderColors(
                    hideShadow: true,
                    progressBarColor: Colors.transparent,
                    trackColor: Colors.transparent,
                    dotColor: Colors.white,
                  ),
                ),
                onChange: (value) {
                  setState(() {
                    progressVal = normalize(value, kMinDegree, kMaxDegree);
                  });
                },
                innerWidget: (percentage) {
                  return Center(
                    child: Text(
                      '${percentage.toInt()}°c',
                      style:const  TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
