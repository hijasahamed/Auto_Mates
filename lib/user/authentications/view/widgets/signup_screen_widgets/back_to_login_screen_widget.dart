import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class BackToLoginScreenWidget extends StatelessWidget {
  const BackToLoginScreenWidget({super.key,required this.authenticationBloc,required this.screenSize});
  final AuthenticationBloc authenticationBloc;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MyTextWidget(text: 'Already have an Account?', color: Colors.white, size: screenSize.width/30, weight: FontWeight.bold),
        TextButton(      
          onPressed: () {
            authenticationBloc.add(AlreadyHaveAccountButtonClickedEvent());
          },
          child: MyTextWidget(text: 'Login', color: Colors.blue, size: screenSize.width/28, weight: FontWeight.bold),
        )
      ],
    );
  }
}