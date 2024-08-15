import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class PremiumFeaturesText extends StatelessWidget {
  const PremiumFeaturesText({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sell,
              size: screenSize.width / 25,
              color: Colors.grey,
            ),
            MyTextWidget(
                text: 'Unlimited car posting',
                color: Colors.grey,
                size: screenSize.width / 30,
                weight: FontWeight.bold)
          ],
        ),
        SizedBox(
          height: screenSize.height / 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.ads_click,
              size: screenSize.width / 25,
              color: Colors.grey,
            ),
            MyTextWidget(
                text: 'Feature your cars',
                color: Colors.grey,
                size: screenSize.width / 30,
                weight: FontWeight.bold)
          ],
        ),
      ],
    );
  }
}
