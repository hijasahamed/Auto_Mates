import 'package:flutter/material.dart';

class CircularIndicatorWidget extends StatelessWidget {
  const CircularIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
