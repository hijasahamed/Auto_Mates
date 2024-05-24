import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class NoDataErrorPlaceholder extends StatelessWidget {
  const NoDataErrorPlaceholder({super.key, required this.screenSize,required this.titleText});
  final Size screenSize;
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: screenSize.height / 9,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/error placeholder.png'))),
        ),
        MyTextWidget(
            text: titleText,
            color: const Color(0XFF424141),
            size: 20,
            weight: FontWeight.bold)
      ],
    ));
  }
}
