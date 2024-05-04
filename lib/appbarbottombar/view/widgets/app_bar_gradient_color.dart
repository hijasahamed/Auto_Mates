
import 'package:flutter/material.dart';

class AppBarGradientColor extends StatelessWidget {
  const AppBarGradientColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 76, 207, 239),
              Color.fromARGB(255, 80, 171, 250)
            ],
          ),
        ),
      );
  }
}