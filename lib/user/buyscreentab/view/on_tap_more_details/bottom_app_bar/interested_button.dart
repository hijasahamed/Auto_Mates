import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/bottom_app_bar/auto_back_widget.dart';
import 'package:flutter/material.dart';

class InterestedButton extends StatelessWidget {
  const InterestedButton(
      {super.key, required this.data, required this.screenSize});
  final Size screenSize;
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: const Color(0xFFDBEDF5),
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AutoBackWidget(
              screenSize: screenSize,
              data: data,
            );
          },
        );
      },
      child: Ink(
        height: screenSize.height / 20,
        width: screenSize.width / 1.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7), color: Colors.green),
        child: const Center(
          child: Text(
            'Interested',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
