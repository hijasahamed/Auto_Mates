import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: screenSize.height / 20,
        width: screenSize.width / 3.9,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: MyTextWidget(
            text: 'Cancel',
            color: Colors.blueGrey,
            size: screenSize.width/30,
            weight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
