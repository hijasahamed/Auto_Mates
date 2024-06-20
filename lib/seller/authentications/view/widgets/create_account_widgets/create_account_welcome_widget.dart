import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class CreateAccountWelcomeScreen extends StatelessWidget {
  const CreateAccountWelcomeScreen({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: screenSize.height / 4.8,
          width: screenSize.width / 2,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/create a account.webp'),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          height: screenSize.height / 120,
        ),
        const MyTextWidget(
            text: 'Sell Cars Easily With AutoMates',
            color: Colors.black,
            size: 15,
            weight: FontWeight.bold)
      ],
    );
  }
}
