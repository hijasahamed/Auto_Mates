import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      label: const MyTextWidget(
          text: 'Edit', color: Colors.blue, size: 12, weight: FontWeight.bold),
      icon: const Icon(
        Icons.edit,
        size: 15,
        color: Colors.blue,
      ),
    );
  }
}
