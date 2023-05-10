import 'package:flutter/material.dart';
import 'package:iot_project/data/data.dart';

class LightsCard extends StatefulWidget {
  @override
  _LightsCardState createState() => _LightsCardState();
}

class _LightsCardState extends State<LightsCard> {
  String _selectedFloor = "Floor 1";
  List<Light> _lights = groundFloorLights;

  void _onFloorSelected(String floor) {
    setState(() {
      _selectedFloor = floor;
      if (_selectedFloor == "Floor 1") {
        _lights = groundFloorLights;
      } else if (_selectedFloor == "Floor 2") {
        _lights = firstFloorLights;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: _selectedFloor,
              items: [
                DropdownMenuItem(
                  child: Text("Floor 1"),
                  value: "Floor 1",
                ),
                DropdownMenuItem(
                  child: Text("Floor 2"),
                  value: "Floor 2",
                ),
              ],
              onChanged: (value)  => _onFloorSelected(value!),
            ),
          ),
          Expanded(
             child: ListView.builder(
              
    itemCount: _lights.length,
    itemBuilder: (BuildContext context, int index) {
      final light = _lights[index];
      return InkWell(
        onTap: () {
          setState(() {
            light.isOn = !light.isOn;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                            color: light.isOn ? Colors.yellow : Colors.grey,
                          ),
            child: ListTile(
              
              title: Text(light.name),
              leading: Icon(Icons.lightbulb_outline),
              trailing: Switch(
                value: light.isOn,
                onChanged: (bool value) {
                  setState(() {
                    light.isOn = value;
                        });
                      },
                    ),
                  )),
        ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
