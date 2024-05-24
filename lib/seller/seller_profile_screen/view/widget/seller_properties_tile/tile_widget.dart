import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  const TileWidget({super.key, required this.screenSize,required this.title});
  final Size screenSize;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Ink(
      height: screenSize.height / 15,
      width: screenSize.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 195, 226, 239)),
      child: InkWell(
        onTap: () {
          
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: MyTextWidget(
                  text: title,
                  color: const Color(0XFF424141),
                  size: 15,
                  weight: FontWeight.bold)),
        ),
      ),
    );
  }
}
