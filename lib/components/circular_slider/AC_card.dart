import 'package:flutter/material.dart';
import 'package:iot_project/components/circular_slider/slider_widget.dart';

class AcCard extends StatefulWidget {
  const AcCard({super.key});

  @override
  State<AcCard> createState() => _AcCardState();
}

class _AcCardState extends State<AcCard> {
  bool value = true;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Air conditioning',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Switch(
                    value: value,
                    activeColor: Color(0xff005BE0),
                    onChanged: (newvalue) {
                      setState(() {
                        value = newvalue;
                      });
                    })
              ],
            ),
          ),
          Container(height: 185, width: double.infinity, child: SliderWidget()),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isSelected1 = !isSelected1;
                    });
                  },
                  icon: !isSelected1
                      ? Icon(
                          Icons.water_drop_outlined,
                          color: Colors.grey,
                        )
                      : Icon(
                          Icons.water_drop_rounded,
                          color: Color(0xff005BE0),
                        ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isSelected2 = !isSelected2;
                    });
                  },
                  color: Colors.blue,
                  icon: 
                    !isSelected2
                        ? Icon(Icons.wb_sunny_outlined,color: Colors.grey,)
                        : Icon(Icons.wb_sunny_rounded,color: Color(0xff005BE0),)
                  ),
           
                IconButton(
                  onPressed: () {
                    setState(() {
                      isSelected3 = !isSelected3;
                    });
                  },
                  icon: !isSelected3
                      ? Icon(Icons.wind_power_outlined, color: Colors.grey)
                      : Icon(
                          Icons.wind_power_rounded,
                          color: Color(0xff005BE0),
                        ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isSelected4 = !isSelected4;
                    });
                  },
                  icon:
                    !isSelected4 ?  Icon(Icons.snowing , color: Colors.grey): Icon(Icons.snowing, color: Color(0xff005BE0))
                  ),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
