
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/user_banner/edit_profile/edit_screen/editing_screen.dart';
import 'package:flutter/material.dart';


class EditProfileButton extends StatelessWidget {
  const EditProfileButton(
      {super.key, required this.screenSize, required this.user});
  final Size screenSize;
  final UserData user;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return EditingScreen(
              screenSize: screenSize,
              user: user,
            );
          },
        ));
      },
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

