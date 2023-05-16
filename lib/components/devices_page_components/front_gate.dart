
import 'package:flutter/material.dart';

class SingleDoorContainer extends StatefulWidget {
  const SingleDoorContainer({Key? key}) : super(key: key);

  @override
  _SingleDoorContainerState createState() => _SingleDoorContainerState();
}

class _SingleDoorContainerState extends State<SingleDoorContainer> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          gradient: _switchValue
                    ? LinearGradient(
                        colors: [Color.fromARGB(255, 77, 126, 249), Color.fromARGB(255, 65, 139, 236)],
                        
                        

                      )
                    : null,
                color: _switchValue
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
          Text(
            'Front gate',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 50,),
          Switch(
            activeColor: Colors.greenAccent,
            value: _switchValue,
            onChanged: (newValue) {
              setState(() {
                _switchValue = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
