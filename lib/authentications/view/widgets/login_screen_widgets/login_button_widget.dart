import 'package:auto_mates/authentications/controller/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key,required this.screenSize,required this.authenticationBloc});
  final Size screenSize;
  final AuthenticationBloc authenticationBloc;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        authenticationBloc.add(LoginButtonClickedEvent());
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
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          )),
        ),
      ),
    );
  }
}



class Customshape extends CustomClipper<Path>{ 
  @override 
  Path getClip(Size size) { 
    double height = size.height; 
    double width = size.width; 
  
    var path = Path();
    path.lineTo(0, 0); 
    path.quadraticBezierTo(width / 2, height * 0.6, width, 0); 
    path.lineTo(width, height); 
    path.lineTo(0, height); 
    path.close(); 

    return path; 
  } 
  
  @override 
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) { 
    return true; 
  } 
  
} 