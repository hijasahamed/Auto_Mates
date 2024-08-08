import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/homescreen/view/widgets/latest_car_news/latest_car_news_banners/latest_car_news_banners.dart';
import 'package:auto_mates/user/homescreen/view/widgets/latest_car_news/latest_car_news_title_and_more_button/latest_car_news_title_and_more_button.dart';
import 'package:auto_mates/user/news/news_screen.dart';
import 'package:flutter/material.dart';

class LatestCarNews extends StatelessWidget {
  const LatestCarNews({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LatestCarNewsTitleAndMoreButton(screenSize: screenSize),
        LatestCarNewsBanners()
      ],
    );
  }
}
