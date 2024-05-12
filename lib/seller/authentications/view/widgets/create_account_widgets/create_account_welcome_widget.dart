import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';

class CreateAccountWelcomeScreen extends StatelessWidget {
  const CreateAccountWelcomeScreen({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: screenSize.height / 4.3,
          width: screenSize.width / 2,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/create a account.webp'),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          height: screenSize.height / 50,
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
