import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class AutoBackWidgetBackButton extends StatelessWidget {
  const AutoBackWidgetBackButton(
      {super.key,
      required this.screenSize,});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.red)),
      child: MyTextWidget(
          text: 'Back',
          color: Colors.white,
          size: screenSize.width / 30,
          weight: FontWeight.bold),
    );
  }
}
