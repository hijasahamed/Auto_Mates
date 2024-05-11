import 'package:auto_mates/seller/authentications/view/seller_login_screen.dart';
import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/user/authentications/view/forgot_password_screen.dart';
import 'package:auto_mates/user/authentications/view/widgets/login_screen_widgets/google_login_widget.dart';
import 'package:auto_mates/user/authentications/view/widgets/login_screen_widgets/login_button_widget.dart';
import 'package:auto_mates/user/authentications/view/widgets/login_screen_widgets/login_section_widget.dart';
import 'package:auto_mates/user/authentications/view/widgets/login_screen_widgets/signup_dealer_login_widget.dart';
import 'package:auto_mates/user/authentications/view/user_signup_screen.dart';
import 'package:auto_mates/user/authentications/view/widgets/login_screen_widgets/welcome_text_widget.dart';
import 'package:auto_mates/user/appbarbottombar/view/appbar_bottombar_screen.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
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
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => UserSignupScreen(
                screenSize: screenSize, authenticationBloc: authenticationBloc),
          ));
        } else if (state is LoginButtonClickedActionState) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AppbarBottomTabSwitchScreen(),
          ));
        } else if (state is NavigateToDealerLoginPageActionState) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const SellerLoginScreen(),
          ));
        }
        else if (state is LoginNotSuccessfullActionState){
          snackbarWidget('Email and Password Incorrect', context,Colors.red,Colors.white,SnackBarBehavior.floating);
        }        
        else if(state is LoginWithGoogleButtonSuccessfulNavigateToScreenActionState){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const AppbarBottomTabSwitchScreen(),
          ));
        }
        else if(state is ForgetPasswordButtonClickedActionState){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ForgotPasswordScreen(screenSize: screenSize,authenticationBloc: authenticationBloc,),
          ));
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [                   
                      WelcomeTextWidget(screenSize: screenSize),
                      LoginSectionWidget(
                          screenSize: screenSize,
                          emailController: emailController,
                          passwordController: passwordController,
                          formkey: formkey,
                          authenticationBloc: authenticationBloc,),
                      GoogleLoginwidget(screenSize: screenSize,authenticationBloc: authenticationBloc,),
                      SignupDealerLoginWidget(
                          screenSize: screenSize,
                          authenticationBloc: authenticationBloc),
                      LoginButtonWidget(
                          screenSize: screenSize,
                          authenticationBloc: authenticationBloc,
                          emailController: emailController,
                          passwordController: passwordController,
                          formkey: formkey,),
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
