import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/user/authentications/controller/functions/common_fuctions.dart';
import 'package:auto_mates/user/authentications/view/widgets/login_signup_buttonshape/login_signup_button_shape.dart';
import 'package:flutter/material.dart';

class SignupButtonWidget extends StatelessWidget {
  const SignupButtonWidget({super.key,required this.screenSize,
      required this.authenticationBloc,
      required this.emailController,
      required this.passwordController,
      required this.reChekPasswordController,
      required this.formkey,required this.auth});
  final Size screenSize;
  final AuthenticationBloc authenticationBloc;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final TextEditingController reChekPasswordController;
  final GlobalKey formkey;
  final FirebaseAuthService auth;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {        
        return signupButtonClicked(emailController.text, passwordController.text, authenticationBloc,formkey,context);
      },
      child: ClipPath(
        clipper: Customshape(),
        child: Container(
          color: const Color(0XFF143A42),  
          height: screenSize.height/10,
          child: const Center(
              child: Text(
            'Signup',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          )),
        ),
      ),
    );
  }
}