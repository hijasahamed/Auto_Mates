import 'package:auto_mates/screens/authentication/controller/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';

class SignupDealerLoginWidget extends StatelessWidget {
  const SignupDealerLoginWidget({super.key,required this.screenSize,required this.authenticationBloc});
  final Size screenSize;
  final AuthenticationBloc authenticationBloc;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.white12)),
          onPressed: () {
            authenticationBloc.add(NavigateToSignupPageEvent());
          },
          child: const Text(
            'Don’t have an Account? Signup',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ),
        SizedBox(
          height: screenSize.height / 50,
        ),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor:
                MaterialStateProperty.all(Colors.white12)),
          child: const Text(
            'Login as Dealer',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        )
      ],
    );
  }
}