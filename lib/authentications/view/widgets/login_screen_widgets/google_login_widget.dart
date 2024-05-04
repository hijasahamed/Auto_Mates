import 'package:auto_mates/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/firebase/fire_base_auth_service.dart';
import 'package:flutter/material.dart';

class GoogleLoginwidget extends StatelessWidget {
  const GoogleLoginwidget({super.key,required this.screenSize,required this.authenticationBloc});
  final Size screenSize;
  final AuthenticationBloc authenticationBloc;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        logInWithGoogle(authenticationBloc);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
        ),
        width: screenSize.width/2,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: screenSize.height / 30,
              width: screenSize.width / 15,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/google logo.png'))),
            ),
            SizedBox(width: screenSize.width/35,),
            const Text('Login with Google',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
