import 'package:auto_mates/screens/authentication/ui/text_form_field_widget.dart';
import 'package:auto_mates/screens/authentication/ui/user_login_screen.dart';
import 'package:auto_mates/screens/bottomtabswitch/bottom_tab_switch.dart';
import 'package:flutter/material.dart';

class UserSignupScreen extends StatelessWidget {
  const UserSignupScreen({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/wheel.webp'),
          fit: BoxFit.cover,
        )),
        child: Container(
          height: screenSize.height,
          width: screenSize.width,
          color: Colors.black.withOpacity(0.6),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: screenSize.height / 1.8,
                  width: screenSize.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Spacer(),
                      SizedBox(
                        width: screenSize.width,
                        child: const Column(
                          children: [
                            Text('Create Account To Explore More',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                            Text(
                              'Signup',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            TextFormFieldWidget(
                              hintText: 'Username',
                            ),
                            TextFormFieldWidget(
                              hintText: 'Email',
                            ),
                            TextFormFieldWidget(
                              hintText: 'Password',
                            ),
                            TextFormFieldWidget(
                              hintText: 'Confirm Password',
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white10)),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const UserLoginScreen(),
                          ));
                        },
                        child: const Text(
                          'Already have an Account? Signup',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const BottomTabSwitchScreen(),
                    ));
                  },
                  child: ClipPath(
                    clipper: Customshape(),
                    child: Container(
                      color: const Color(0xFF284845),
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
                ),
              ],
            ),
          ),
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
