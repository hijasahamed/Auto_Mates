import 'package:auto_mates/user/appbarbottombar/view/appbar_bottombar_screen.dart';
import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/authentications/view/widgets/login_signup_buttonshape/login_signup_button_shape.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupButtonWidget extends StatelessWidget {
  const SignupButtonWidget(
      {super.key,
      required this.screenSize,
      required this.authenticationBloc,
      required this.userNameController,
      required this.emailController,
      required this.locationController,
      required this.mobileController,
      required this.passwordController,
      required this.reChekPasswordController,
      required this.userSignupFormkey,
      required this.auth});
  final Size screenSize;
  final AuthenticationBloc authenticationBloc;
  final TextEditingController userNameController;
  final TextEditingController passwordController;
  final TextEditingController locationController;
  final TextEditingController mobileController;
  final TextEditingController emailController;
  final TextEditingController reChekPasswordController;
  final GlobalKey userSignupFormkey;
  final FirebaseAuthService auth;
  @override
  Widget build(BuildContext context) {
    AuthenticationBloc authblocInstance = AuthenticationBloc();
    return BlocProvider(
      create: (context) => authblocInstance,
      child: BlocListener<AuthenticationBloc,AuthenticationState>(
        bloc: authblocInstance,
        listener: (context, state) {
          if(state is UserLoginLoadingStartState){
            showDialog(
              context: context,
              barrierDismissible: false, 
              builder: (context) {
              return const Center(child: CircularProgressIndicator(color: Colors.blue,));
            },);
          }
          else if(state is UserLoginLoadingStopState){            
            Navigator.pop(context);
          }
          else if(state is UserLogedinState){
            Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const AppbarBottomTabSwitchScreen(),
          ));
            snackbarWidget('Account created', context, Colors.green, Colors.white, SnackBarBehavior.floating);
          }
        },
        child: BlocBuilder<AuthenticationBloc,AuthenticationState>(
          bloc: authblocInstance,
          builder: (context, state) {
            return InkWell(
              onTap: () {                
                  signupButtonClicked(
                  location: locationController.text,
                  mobile: mobileController.text,
                  userName: userNameController.text,
                  recheckPassword: reChekPasswordController.text,
                  email: emailController.text,
                  password: passwordController.text,
                  authblocInstance: authblocInstance,
                  formkey: userSignupFormkey,
                  context: context);             
              },
              child: ClipPath(
                clipper: Customshape(),
                child: Container(
                  color: const Color(0XFF143A42),         
                  height: screenSize.height / 10,
                  child: const Center(
                      child: Text(
                    'Signup',
                    style: TextStyle(
                        fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white),
                  )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
