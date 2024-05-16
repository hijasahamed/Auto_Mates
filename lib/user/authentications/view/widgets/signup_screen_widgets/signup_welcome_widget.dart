import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/user/authentications/view/widgets/signup_screen_widgets/add_user_signup_textform_field_widget.dart';
import 'package:auto_mates/user/authentications/view/widgets/signup_screen_widgets/back_to_login_screen_widget.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';

class SignupWidget extends StatelessWidget {
  const SignupWidget(
      {super.key,
      required this.screenSize,
      required this.authenticationBloc,
      required this.userNameController,
      required this.emailController,
      required this.passwordController,
      required this.reChekPasswordController,
      required this.userSignupFormkey});
  final Size screenSize;
  final AuthenticationBloc authenticationBloc;
  final TextEditingController userNameController;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final TextEditingController reChekPasswordController;
  final GlobalKey userSignupFormkey;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height / 1.2,
      width: screenSize.width,
      child: Column(
        children: [
          SizedBox(height: screenSize.height/12,),
          const Column(
            children: [
              MyTextWidget(text: 'Create Account To Explore More', color: Colors.white, size: 25, weight: FontWeight.bold),
              MyTextWidget(text: 'Signup', color: Colors.white, size: 30, weight: FontWeight.bold),
            ],
          ),
          SizedBox(height: screenSize.height/15,),
          AddUserSignupTextformFieldWidget(
              screenSize: screenSize,
              userNameController: userNameController,
              emailController: emailController,
              passwordController: passwordController,
              reChekPasswordController: reChekPasswordController,
              userSignupFormkey: userSignupFormkey),
          SizedBox(height: screenSize.height/50,),
          BackToLoginScreenWidget(authenticationBloc: authenticationBloc),
          const Spacer(),
        ],
      ),
    );
  }
}
