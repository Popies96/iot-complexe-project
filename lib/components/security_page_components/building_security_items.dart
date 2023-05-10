import 'package:flutter/material.dart';


class SecurityItem extends StatefulWidget {
  final String title;
  final String imagePlaceholder;
  final bool isSafe;

  SecurityItem({
    required this.title,
    required this.imagePlaceholder,
    required this.isSafe,
   
  });

  @override
  _SecurityItemState createState() => _SecurityItemState();
}

class _SecurityItemState extends State<SecurityItem> {
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      
      child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [
          Image.asset(
            widget.imagePlaceholder,
            scale: 10,
          ),
          
          Container(
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  widget.isSafe ? "Safe" : "Alert",
                  style: TextStyle(
                    color: widget.isSafe ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          
          ),
          
          Switch(
            value: _isOn,
            onChanged: (value) {
              setState(() {
                _isOn = value;
                
              });
            },
          ),
        ],
      ),
    );
  }
}
