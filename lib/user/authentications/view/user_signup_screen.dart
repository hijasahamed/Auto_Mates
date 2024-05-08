import 'package:auto_mates/user/appbarbottombar/view/appbar_bottombar_screen.dart';
import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/user/authentications/view/user_login_screen.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:auto_mates/user/firebase/fire_base_auth_service.dart';
import 'package:auto_mates/user/authentications/view/widgets/signup_screen_widgets/signup_button_widget.dart';
import 'package:auto_mates/user/authentications/view/widgets/signup_screen_widgets/signup_welcome_widget.dart';
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
  final reChekPasswordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      bloc: authenticationBloc,
      listenWhen: (previous, current) => current is AuthenticationActionState,
      buildWhen: (previous, current) => current is! AuthenticationActionState,
      listener: (context, state) {
        if (state is SignupButtonClickedActionState) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const AppbarBottomTabSwitchScreen(),
          ));
        }
         else if (state is AlreadyHaveAccountButtonClickedActionState) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => UserLoginScreen(),
          ));
        }
        else if(state is SignupSuccessfullAndAccountCreatedActionState){
          snackbarWidget('User Account Created Successfully', context,Colors.green,Colors.white,SnackBarBehavior.floating);
        }
        else if (state is SignupNotSuccessfullActionState){
          snackbarWidget('Provide Correct Details', context,Colors.red,Colors.white,SnackBarBehavior.floating);
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            height: screenSize.height,
            width: screenSize.width,
            color: const Color(0XFFDBEDF5),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SignupWelcomeWidget(
                      screenSize: screenSize,
                      authenticationBloc: authenticationBloc,
                      emailController: emailController,
                      userNameController: userNameController,
                      passwordController: passwordController,
                      reChekPasswordController: reChekPasswordController,
                      formkey: formkey),
                  SignupButtonWidget(
                    screenSize: screenSize,
                    authenticationBloc: authenticationBloc,
                    emailController: emailController,
                    userNameController: userNameController,
                    passwordController: passwordController,
                    reChekPasswordController: reChekPasswordController,
                    formkey: formkey,
                    auth: auth,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
