import 'package:auto_mates/authentications/controller/bloc/authentication_bloc.dart';
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
      child: const Text(
        'Already have an Account? Login',
        style: TextStyle(
            fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }
}