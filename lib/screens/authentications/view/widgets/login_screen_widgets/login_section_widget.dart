import 'package:auto_mates/screens/authentications/view/widgets/login_screen_widgets/text_formfield_widget.dart';
import 'package:flutter/material.dart';

class LoginSectionWidget extends StatelessWidget {
  const LoginSectionWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize.width,
      child: Column(
        children: [
          const Text(
            'Login',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          const TextFormFieldWidget(
            hintText: 'Username',
          ),
          const TextFormFieldWidget(
            hintText: 'Password',
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                )),
          )
        ],
      ),
    );
  }
}