import 'package:flutter/material.dart';
import 'package:iot_project/data/data.dart';

class DoorGrid extends StatefulWidget {
  const DoorGrid({Key? key}) : super(key: key);

  @override
  _DoorGridState createState() => _DoorGridState();
}

class _DoorGridState extends State<DoorGrid> {
  List<bool> _switchValues = List.filled(doors.length, false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        
        childAspectRatio: 4,
        crossAxisCount: 3,
        children: List.generate(doors.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _switchValues[index] = !_switchValues[index];
              });
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: _switchValues[index]
                    ? LinearGradient(
                        colors: [Color.fromARGB(255, 77, 126, 249), Color.fromARGB(255, 65, 139, 236)],
                        
                        

                      )
                    : null,
                color: _switchValues[index]
                    ? null
                    : Color.fromARGB(255, 93, 122, 142),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(doors[index].name,style: TextStyle(color: Colors.white),),
                  Switch(
                    activeColor: Colors.greenAccent,
                    value: _switchValues[index],
                    onChanged: (_) {
                      setState(() {
                        _switchValues[index] = !_switchValues[index];
                        doors[index].isOpen = _switchValues[index];
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
