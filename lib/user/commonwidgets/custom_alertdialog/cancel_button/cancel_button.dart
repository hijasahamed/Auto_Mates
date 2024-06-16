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
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Center(
          child: MyTextWidget(
            text: 'Cancel',
            color: Colors.red,
            size: 15,
            weight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
