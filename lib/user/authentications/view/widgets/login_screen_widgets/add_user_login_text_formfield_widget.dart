import 'package:auto_mates/user/commonwidgets/text_form_field/text_form_widget.dart';
import 'package:flutter/material.dart';

class AddUserLoginTextFormFieldWidget extends StatelessWidget {
  const AddUserLoginTextFormFieldWidget(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.userLoginformkey,
      required this.screenSize});
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey userLoginformkey;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Form(
        key: userLoginformkey,
        child: Column(
          children: [
            MyTextFormWidget(
              screenSize: screenSize,
                text: 'Email',
                controller: emailController,
                warning: 'Enter a valid email',
                obscure: false,
                keyBoardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                fillColor: Colors.white),
            SizedBox(
              height: screenSize.height / 30,
            ),
            MyTextFormWidget(
              screenSize: screenSize,
                text: 'Password',
                controller: passwordController,
                warning: 'Enter correct password',
                obscure: true,
                keyBoardType: TextInputType.name,
                textCapitalization: TextCapitalization.none,
                fillColor: Colors.white),
          ],
        ),
      ),
    );
  }
}
