import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class UpgradePremiumMainText extends StatelessWidget {
  const UpgradePremiumMainText({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyTextWidget(
            text: 'Upgrade To Premium',
            color: Colors.blueGrey,
            size: screenSize.width / 17,
            weight: FontWeight.bold),
        SizedBox(
          height: screenSize.width / 50,
        ),
        Icon(
          Icons.star,
          color: const Color.fromARGB(255, 230, 207, 6),
          size: screenSize.width / 12,
        ),
      ],
    );
  }
}
