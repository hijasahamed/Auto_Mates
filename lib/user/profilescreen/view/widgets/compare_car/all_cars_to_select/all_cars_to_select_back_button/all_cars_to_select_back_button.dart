import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:flutter/material.dart';

class AllCarsToSelectBackButton extends StatelessWidget {
  const AllCarsToSelectBackButton({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              carForComparing1.clear();
              carForComparing2.clear();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.clear)),
        MyTextWidget(
            text: 'select car for comparison',
            color: Colors.grey,
            size: screenSize.width / 30,
            weight: FontWeight.bold)
      ],
    );
  }
}
