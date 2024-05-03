import 'package:auto_mates/appbarbottombar/view/appbar_bottombar_screen.dart';
import 'package:auto_mates/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/authentications/controller/functions/common_fuctions.dart';
import 'package:auto_mates/authentications/controller/functions/fire_base_auth_service.dart';
import 'package:auto_mates/authentications/view/widgets/signup_screen_widgets/signup_button_widget.dart';
import 'package:auto_mates/authentications/view/widgets/signup_screen_widgets/signup_welcome_widget.dart';
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
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AppbarBottomTabSwitchScreen(),
          ));
        }
        else if(state is SignupSuccessfullAndAccountCreatedActionState){
          snackbarWidget('User Account Created Successfully', context);
        }
      },
      builder: (context, state) {
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
              color: Colors.black.withOpacity(0.75),
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
          ),
        );
      },
    );
  }
}
