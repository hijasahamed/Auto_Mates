import 'package:auto_mates/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/authentications/view/widgets/signup_screen_widgets/add_textform_field_widget.dart';
import 'package:auto_mates/authentications/view/widgets/signup_screen_widgets/back_to_login_screen_widget.dart';
import 'package:flutter/material.dart';

class SignupWelcomeWidget extends StatelessWidget {
  const SignupWelcomeWidget(
      {super.key,
      required this.screenSize,
      required this.authenticationBloc,
      required this.userNameController,
      required this.emailController,
      required this.passwordController,
      required this.reChekPasswordController,
      required this.formkey});
  final Size screenSize;
  final AuthenticationBloc authenticationBloc;
  final TextEditingController userNameController;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final TextEditingController reChekPasswordController;
  final GlobalKey formkey;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height / 1.8,
      width: screenSize.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Spacer(),
          const Column(
            children: [
              Text(
                'Create Account To Explore More',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              Text(
                'Signup',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          const Spacer(),
          AddTextformFieldWidget(
              screenSize: screenSize,
              userNameController: userNameController,
              emailController: emailController,
              passwordController: passwordController,
              reChekPasswordController: reChekPasswordController,
              formkey: formkey),
          const Spacer(),
          BackToLoginScreenWidget(authenticationBloc: authenticationBloc),
        ],
      ),
    );
  }
}
