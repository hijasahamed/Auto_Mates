import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class UserChatDeleteAlertDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final Size screenSize;

  const UserChatDeleteAlertDialog(
      {super.key,
      required this.onConfirm,
      required this.onCancel,
      required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: MyTextWidget(
          text: 'Delete Chat',
          color: Colors.blueGrey,
          size: screenSize.width / 20,
          weight: FontWeight.w600),
      content: MyTextWidget(
          text:
              '''Are you sure you want to permenently delete this chat? This action cannot be undone.''',
          color: Colors.blueGrey,
          maxline: true,
          size: screenSize.width / 30,
          weight: FontWeight.w600),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: MyTextWidget(text: 'Cancel', color: const Color.fromARGB(255, 89, 89, 89), size: screenSize.width/30, weight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: onConfirm,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: MyTextWidget(text: 'Delete', color: Colors.white, size: screenSize.width/30, weight: FontWeight.bold,)
        ),
      ],
    );
  }
}
