import 'package:auto_mates/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/authentications/controller/functions/fire_base_auth_service.dart';
import 'package:auto_mates/authentications/view/widgets/signup_screen_widgets/signup_button_widget.dart';
import 'package:auto_mates/authentications/view/widgets/signup_screen_widgets/signup_welcome_widget.dart';
import 'package:flutter/material.dart';

class UserSignupScreen extends StatelessWidget {
  UserSignupScreen(
      {super.key, required this.screenSize, required this.authenticationBloc});
  final Size screenSize;
  final AuthenticationBloc authenticationBloc;
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final reChekPasswordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  // final FirebaseAuthService auth= FirebaseAuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/wheel.webp'),
          fit: BoxFit.cover,
        )),
        child: Container(
          height: screenSize.height,
          width: screenSize.width,
          color: Colors.black.withOpacity(0.6),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SignupWelcomeWidget(
                    screenSize: screenSize,
                    authenticationBloc: authenticationBloc,
                    emailController: emailController,
                    userNameController: userNameController,
                    passwordController: passwordController,
                    reChekPasswordController: reChekPasswordController,
                    formkey: formkey),
                SignupButtonWidget(
                    screenSize: screenSize,
                    authenticationBloc: authenticationBloc,
                    emailController: emailController,
                    userNameController: userNameController,
                    passwordController: passwordController,
                    reChekPasswordController: reChekPasswordController,
                    formkey: formkey,
                    auth: auth,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
