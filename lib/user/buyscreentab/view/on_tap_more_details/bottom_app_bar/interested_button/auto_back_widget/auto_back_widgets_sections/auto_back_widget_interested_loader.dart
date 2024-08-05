import 'package:flutter/material.dart';

class AutoBackWidgetInterestedLoader extends StatelessWidget {
  final Size screenSize;

  const AutoBackWidgetInterestedLoader({super.key, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: screenSize.width / 20,
          width: screenSize.width / 20,
          child: const CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          )),
    );
  }
}
