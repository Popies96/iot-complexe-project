import 'package:flutter/material.dart';
class profileinfo extends StatelessWidget {
  const profileinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: const EdgeInsets.all(10.0),
          onPressed: () {}
        ,
        icon: Icon(Icons.notifications_none_outlined),
        selectedIcon: Icon(Icons.notifications),),
        Container(
          margin: EdgeInsets.all(5),
          child: CircleAvatar(child: Icon(Icons.person),
          radius: 20),
        )

      ],
    );
  }
}