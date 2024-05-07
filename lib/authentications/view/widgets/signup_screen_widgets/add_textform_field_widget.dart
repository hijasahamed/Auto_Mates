import 'package:auto_mates/authentications/view/widgets/signup_screen_widgets/text_form_widget.dart';
import 'package:flutter/material.dart';

class AddTextformFieldWidget extends StatelessWidget {
  const AddTextformFieldWidget({super.key,required this.screenSize,required this.userNameController,
      required this.emailController,
      required this.passwordController,
      required this.reChekPasswordController,
      required this.formkey});
  final Size screenSize;
  final TextEditingController userNameController;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final TextEditingController reChekPasswordController;
  final GlobalKey formkey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,), 
      child: SizedBox(
        width: screenSize.width,
        height: screenSize.height/2.7,
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            TextFormWidget(text: 'Username',controller: userNameController,warning: 'Enter Username',obscure: false,),
            TextFormWidget(text: 'Email',controller: emailController,warning: 'Enter Email',obscure: false,),
            TextFormWidget(text: 'Password',controller: passwordController,warning: 'Enter Password',obscure: true,),
            TextFormWidget(text: 'ConfirmPassword',controller: reChekPasswordController,warning: 'Re enter Password',obscure: true,),
            ],
          )
        ),
      ),
    );
  }
}