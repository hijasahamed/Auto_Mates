import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/user/authentications/view/widgets/signup_screen_widgets/add_user_signup_textform_field_widget.dart';
import 'package:auto_mates/user/authentications/view/widgets/signup_screen_widgets/user_image.dart';
import 'package:flutter/material.dart';

class SignupWidget extends StatelessWidget {
  const SignupWidget(
      {super.key,
      required this.screenSize,
      required this.authenticationBloc,
      required this.userNameController,
      required this.emailController,
      required this.locationController,
      required this.mobileController,
      required this.passwordController,
      required this.reChekPasswordController,
      required this.userSignupFormkey});
  final Size screenSize;
  final AuthenticationBloc authenticationBloc;
  final TextEditingController userNameController;
  final TextEditingController locationController;
  final TextEditingController mobileController;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final TextEditingController reChekPasswordController;
  final GlobalKey userSignupFormkey;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: screenSize.height/40,),  
          const UserImage(),              
          SizedBox(height: screenSize.height/40,),
          AddUserSignupTextformFieldWidget(
              screenSize: screenSize,
              userNameController: userNameController,
              locationController: locationController,
              mobileController: mobileController,
              emailController: emailController,
              passwordController: passwordController,
              reChekPasswordController: reChekPasswordController,
              userSignupFormkey: userSignupFormkey),
          SizedBox(height: screenSize.height/50,),            
        ],
      ),
    );
  }
}
