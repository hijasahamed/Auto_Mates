import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/user/authentications/controller/functions/common_fuctions.dart';
import 'package:auto_mates/user/authentications/view/widgets/login_signup_buttonshape/login_signup_button_shape.dart';
import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget(
      {super.key,
      required this.screenSize,
      required this.authenticationBloc,
      required this.emailController,
      required this.passwordController,
      required this.formkey});
  final Size screenSize;
  final AuthenticationBloc authenticationBloc;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey formkey;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        return loginButtonClicked(
            emailController.text, passwordController.text, authenticationBloc,formkey);
      },
      child: ClipPath(
        clipper: Customshape(),
        child: Container(
          color: const Color(0xFF284845),
          height: screenSize.height / 10,
          child: const Center(
              child: Text(
            'Login',
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white),
          )),
        ),
      ),
    );
  }
}


