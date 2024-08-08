import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/news/news_screen.dart';
import 'package:flutter/material.dart';

class LatestCarNewsTitleAndMoreButton extends StatelessWidget {
  const LatestCarNewsTitleAndMoreButton({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: screenSize.width / 70),
          child: MyTextWidget(
              text: 'Latest News',
              color: const Color(0xff424141),
              size: screenSize.width / 16.5,
              weight: FontWeight.bold),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return NewsScreen(
                    screenSize: screenSize,
                  );
                },
              ));
            },
            child: MyTextWidget(
                text: 'See More',
                color: Colors.blue,
                size: screenSize.width / 38,
                weight: FontWeight.bold))
      ],
    );
  }
}
