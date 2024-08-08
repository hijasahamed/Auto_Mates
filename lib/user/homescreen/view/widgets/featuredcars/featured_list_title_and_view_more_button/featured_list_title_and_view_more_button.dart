import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class FeaturedListTitleAndViewMoreButton extends StatelessWidget {
  const FeaturedListTitleAndViewMoreButton(
      {super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            MyTextWidget(
                text: 'Featured Cars',
                color: const Color(0xff424141),
                size: screenSize.width / 16.5,
                weight: FontWeight.bold),
            SizedBox(
              width: screenSize.width / 40,
            ),
            Container(
                height: screenSize.height / 40,
                width: screenSize.width / 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green),
                child: Center(
                  child: MyTextWidget(
                      text: 'Promoted',
                      color: Colors.white,
                      size: screenSize.width / 45,
                      weight: FontWeight.bold),
                )),
          ],
        ),
        TextButton(
            onPressed: () {},
            child: MyTextWidget(
                text: 'View All',
                color: Colors.blue,
                size: screenSize.width / 35,
                weight: FontWeight.bold))
      ],
    );
  }
}
