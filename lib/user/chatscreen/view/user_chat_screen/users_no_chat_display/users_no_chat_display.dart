import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class UsersNoChatDisplay extends StatelessWidget {
  const UsersNoChatDisplay({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.message, color: Colors.blue, size: screenSize.width / 5),
          MyTextWidget(
            text: 'No chat messages',
            color: Colors.black,
            size: screenSize.width / 27,
            weight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
