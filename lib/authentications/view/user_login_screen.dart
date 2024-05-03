import 'package:auto_mates/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/authentications/view/dealer_login_screen.dart';
import 'package:auto_mates/authentications/view/widgets/login_screen_widgets/google_login_widget.dart';
import 'package:auto_mates/authentications/view/widgets/login_screen_widgets/login_button_widget.dart';
import 'package:auto_mates/authentications/view/widgets/login_screen_widgets/login_section_widget.dart';
import 'package:auto_mates/authentications/view/widgets/login_screen_widgets/signup_dealer_login_widget.dart';
import 'package:auto_mates/authentications/view/user_signup_screen.dart';
import 'package:auto_mates/authentications/view/widgets/login_screen_widgets/welcome_text_widget.dart';
import 'package:auto_mates/appbarbottombar/view/appbar_bottombar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserLoginScreen extends StatelessWidget {
  UserLoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc = AuthenticationBloc();
    final screenSize = MediaQuery.of(context).size;
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      bloc: authenticationBloc,
      listenWhen: (previous, current) => current is AuthenticationActionState,
      buildWhen: (previous, current) => current is! AuthenticationActionState,
      listener: (context, state) {
        if (state is NavigateToSignupPageActionState) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => UserSignupScreen(
                screenSize: screenSize, authenticationBloc: authenticationBloc),
          ));
        } else if (state is LoginButtonClickedActionState) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AppbarBottomTabSwitchScreen(),
          ));
        } else if (state is NavigateToDealerLoginPageActionState) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const DealerLoginScreen(),
          ));
        } else if (state is AlreadyHaveAccountButtonClickedActionState) {
          Navigator.of(context).pop();
        } else if (state is SignupButtonClickedActionState) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AppbarBottomTabSwitchScreen(),
          ));
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
              color: Colors.black.withOpacity(0.6),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WelcomeTextWidget(screenSize: screenSize),
                    LoginSectionWidget(
                        screenSize: screenSize,
                        emailController: emailController,
                        passwordController: passwordController,
                        formkey: formkey),
                    GoogleLoginwidget(screenSize: screenSize),
                    SignupDealerLoginWidget(
                        screenSize: screenSize,
                        authenticationBloc: authenticationBloc),
                    LoginButtonWidget(
                        screenSize: screenSize,
                        authenticationBloc: authenticationBloc,
                        emailController: emailController,
                        passwordController: passwordController),
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
