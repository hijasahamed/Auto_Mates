import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class AutoBackWidgetContent extends StatelessWidget {
  const AutoBackWidgetContent({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyTextWidget(
          text:
              'Thank you for showing interest in this car. The seller will contact you shortly if you click the intrested button to discuss the deal.',
          color: Colors.blueGrey,
          size: screenSize.width / 30,
          weight: FontWeight.bold,
          maxline: true,
        ),
        SizedBox(
          height: screenSize.height / 100,
        ),
        MyTextWidget(
          text:
              'Rs 999/- is charged for Marking Interest. This amount is not refundable.',
          color: Colors.black,
          size: screenSize.width / 25,
          weight: FontWeight.bold,
          maxline: true,
        ),
      ],
    );
  }
}
