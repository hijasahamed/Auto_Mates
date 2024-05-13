import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/user/authentications/view/widgets/signup_screen_widgets/add_textform_field_widget.dart';
import 'package:auto_mates/user/authentications/view/widgets/signup_screen_widgets/back_to_login_screen_widget.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';

class SignupWelcomeWidget extends StatelessWidget {
  const SignupWelcomeWidget(
      {super.key,
      required this.screenSize,
      required this.authenticationBloc,
      required this.emailController,
      required this.passwordController,
      required this.reChekPasswordController,
      required this.formkey});
  final Size screenSize;
  final AuthenticationBloc authenticationBloc;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final TextEditingController reChekPasswordController;
  final GlobalKey formkey;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height / 1.2,
      width: screenSize.width,
      child: Column(
        children: [
          const Spacer(),
          const Column(
            children: [
              MyTextWidget(text: 'Create Account To Explore More', color: Colors.white, size: 25, weight: FontWeight.bold),
              MyTextWidget(text: 'Signup', color: Colors.white, size: 30, weight: FontWeight.bold),
            ],
          ),
          AddTextformFieldWidget(
              screenSize: screenSize,
              emailController: emailController,
              passwordController: passwordController,
              reChekPasswordController: reChekPasswordController,
              formkey: formkey),
          BackToLoginScreenWidget(authenticationBloc: authenticationBloc),
          const Spacer(),
        ],
      ),
    );
  }
}
