import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';

class BackToLoginScreenWidget extends StatelessWidget {
  const BackToLoginScreenWidget({super.key,required this.authenticationBloc});
  final AuthenticationBloc authenticationBloc;
  @override
  Widget build(BuildContext context) {
    return TextButton(      
      onPressed: () {
        authenticationBloc.add(AlreadyHaveAccountButtonClickedEvent());
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have an Account? ',
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Color.fromARGB(255, 78, 78, 78)),
          ),
          Text(
            'Login',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}