import 'package:auto_mates/user/appbarbottombar/view/appbar_bottombar_screen.dart';
import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/authentications/view/widgets/login_signup_buttonshape/login_signup_button_shape.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget(
      {super.key,
      required this.screenSize,
      required this.authenticationBloc,
      required this.emailController,
      required this.passwordController,
      required this.userLoginformkey});
  final Size screenSize;
  final AuthenticationBloc authenticationBloc;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey userLoginformkey;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => authenticationBloc,
      child: BlocListener<AuthenticationBloc,AuthenticationState>(
        bloc: authenticationBloc,
        listener: (context, state) {
          if(state is UserLoginLoadingStartState){
            showDialog(
              context: context,
              barrierDismissible: false, 
              builder: (context) {
              return Center(child: LottieBuilder.asset(
                    'assets/animations/loading_animation.json',
                    height: screenSize.height / 8,
                    width: screenSize.width / 4,
                    repeat: true,
                  ),);
            },);
          }
          else if(state is UserLoginLoadingStopState){            
            Navigator.pop(context);
          }
          else if(state is UserLogedinState){
            Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const AppbarBottomTabSwitchScreen(),
            ));
            snackbarWidget('Loged In', context, Colors.green, Colors.white, SnackBarBehavior.floating);
          }
        },
        child: BlocBuilder<AuthenticationBloc,AuthenticationState>(
          bloc: authenticationBloc,
          builder: (context, state) {
            return InkWell(
              onTap: () {                
                loginButtonClicked(emailController.text, passwordController.text, authenticationBloc,userLoginformkey,context);
                
              },
              child: ClipPath(
                clipper: Customshape(),
                child: Container(
                  color: const Color(0XFF143A42),         
                  height: screenSize.height / 10,
                  child: const Center(
                      child: Text(
                    'Login',
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