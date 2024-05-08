import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/user/authentications/view/widgets/login_screen_widgets/text_formfield_widget.dart';
import 'package:flutter/material.dart';

class LoginSectionWidget extends StatelessWidget {
  const LoginSectionWidget(
      {super.key,
      required this.screenSize,
      required this.emailController,
      required this.passwordController,
      required this.formkey,
      required this.authenticationBloc});
  final Size screenSize;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey formkey;
  final AuthenticationBloc authenticationBloc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize.width,
      child: Column(
        children: [
          const Text(
            'Login',
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          TextFormFieldWidget(
              emailController: emailController,
              passwordController: passwordController,
              formkey: formkey,
              screenSize: screenSize),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    authenticationBloc.add(ForgetPasswordButtonClickedEvent());
                  },
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
