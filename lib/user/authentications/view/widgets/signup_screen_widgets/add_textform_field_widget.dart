import 'package:auto_mates/user/authentications/view/widgets/signup_screen_widgets/text_form_widget.dart';
import 'package:flutter/material.dart';

class AddTextformFieldWidget extends StatelessWidget {
  const AddTextformFieldWidget(
      {super.key,
      required this.screenSize,
      required this.emailController,
      required this.passwordController,
      required this.reChekPasswordController,
      required this.formkey});
  final Size screenSize;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final TextEditingController reChekPasswordController;
  final GlobalKey formkey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: SizedBox(
        width: screenSize.width,
        height: screenSize.height / 4,
        child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(height: screenSize.height/50,),
                TextFormWidget(
                  text: 'Email',
                  controller: emailController,
                  warning: 'Enter Email',
                  obscure: false,
                  keyBoardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  fillColor: Colors.white
                ),
                SizedBox(height: screenSize.height/50,),
                TextFormWidget(
                  text: 'Password',
                  controller: passwordController,
                  warning: 'Enter Password',
                  obscure: true,
                  keyBoardType: TextInputType.name,
                  textCapitalization: TextCapitalization.none,
                  fillColor: Colors.white,
                ),
              ],
            )),
      ),
    );
  }
}
