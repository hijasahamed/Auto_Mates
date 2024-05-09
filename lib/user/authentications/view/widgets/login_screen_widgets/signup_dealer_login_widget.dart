import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';

class SignupDealerLoginWidget extends StatelessWidget {
  const SignupDealerLoginWidget({super.key,required this.screenSize,required this.authenticationBloc});
  final Size screenSize;
  final AuthenticationBloc authenticationBloc;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Don’t have an Account? ',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            TextButton(
              onPressed: (){
                authenticationBloc.add(NavigateToSignupPageEvent());
              }, 
              child: const Text(
              'Signup',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            )
          ],
        ),
        SizedBox(
          height: screenSize.height / 50,
        ),
        TextButton(
          onPressed: () {
            authenticationBloc.add(NavigateToDealerLoginPageEvent());
          },
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