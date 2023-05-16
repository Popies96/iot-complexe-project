import 'package:flutter/material.dart';
// ignore: camel_case_types
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
        icon: const Icon(Icons.notifications_none_outlined),
        selectedIcon: const Icon(Icons.notifications),),
        Container(
          margin: const EdgeInsets.all(5),
          child: const CircleAvatar(
          radius: 20,
          child: Icon(Icons.person)
          ),
        )

      ],
    );
  }
}