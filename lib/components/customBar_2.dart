import 'package:flutter/material.dart';
import 'profile_info.dart';

class customBar2 extends StatelessWidget {
  const customBar2({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          child: Text(
            'Devices',
            style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
        ),
        SizedBox(width: 753),
        SizedBox(
          width: 350,
            child: TextField(
          decoration: InputDecoration(
              hintText: "Search for Statistics",
              helperStyle: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 15,
              ),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black.withOpacity(0.5),
              )),
        )),
        profileinfo()
      ],
    );
  }
}
