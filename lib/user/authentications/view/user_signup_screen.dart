import 'package:auto_mates/user/appbarbottombar/view/appbar_bottombar_screen.dart';
import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/authentications/view/user_login_screen.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:auto_mates/user/authentications/view/widgets/signup_screen_widgets/signup_button_widget.dart';
import 'package:auto_mates/user/authentications/view/widgets/signup_screen_widgets/signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserSignupScreen extends StatelessWidget {
  UserSignupScreen(
      {super.key, required this.screenSize, required this.authenticationBloc});
  final Size screenSize;
  final AuthenticationBloc authenticationBloc;
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final locationController = TextEditingController();
  final mobileController = TextEditingController();
  final reChekPasswordController = TextEditingController();
  final GlobalKey<FormState> userSignupFormkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      bloc: authenticationBloc,
      listenWhen: (previous, current) => current is AuthenticationActionState,
      buildWhen: (previous, current) => current is! AuthenticationActionState,
      listener: (context, state) {
        if (state is SignupButtonClickedActionState){          
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const AppbarBottomTabSwitchScreen(isAccountCreated: true,),
          ));
        }
         else if (state is AlreadyHaveAccountButtonClickedActionState) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => UserLoginScreen(),
          ));
        }
        else if(state is SignupSuccessfullAndAccountCreatedActionState){
          snackbarWidget('User Account Created Successfully.Welcome to AutoMates', context,Colors.blue,Colors.white,SnackBarBehavior.floating);
        }
        else if (state is SignupNotSuccessfullActionState){
          snackbarWidget('User account not created.Provide Correct Details', context,Colors.blue,Colors.white,SnackBarBehavior.floating);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: screenSize.height,
              width: screenSize.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/car.png'),fit: BoxFit.cover)
                ),
              child: SafeArea(
                child: Container(
                  color: Colors.black54,
                  child: Column(                    
                    children: [
                      Expanded(
                        child: SignupWidget(
                            screenSize: screenSize,
                            authenticationBloc: authenticationBloc,
                            userNameController: userNameController,
                            emailController: emailController,
                            locationController: locationController,
                            mobileController: mobileController,
                            passwordController: passwordController,
                            reChekPasswordController: reChekPasswordController,
                            userSignupFormkey: userSignupFormkey),
                      ),
                      SignupButtonWidget(
                        screenSize: screenSize,
                        authenticationBloc: authenticationBloc,
                        userNameController: userNameController,
                        emailController: emailController,
                        locationController: locationController,
                        mobileController: mobileController,
                        passwordController: passwordController,
                        reChekPasswordController: reChekPasswordController,
                        userSignupFormkey: userSignupFormkey,
                        auth: auth,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
