import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class NoDataErrorPlaceholder extends StatelessWidget {
  const NoDataErrorPlaceholder({super.key, required this.screenSize,required this.titleText});
  final Size screenSize;
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: screenSize.height / 4,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/no data available.avif'))),
          ),
          MyTextWidget(
              text: titleText,
              color: const Color(0XFF424141),
              size: 15,
              weight: FontWeight.w600)
        ],
      )),
    );
  }
}
