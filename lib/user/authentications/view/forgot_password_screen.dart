import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen(
      {super.key, required this.screenSize, required this.authenticationBloc});
  final Size screenSize;
  final AuthenticationBloc authenticationBloc;
  final TextEditingController resetPasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      bloc: authenticationBloc,
      listenWhen: (previous, current) => current is AuthenticationActionState,
      buildWhen: (previous, current) => current is! AuthenticationActionState,
      listener: (context, state) {
        if(state is ResetPasswordButtonClickedActionState){
          resetPassword(resetPasswordcontroller, context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50), 
            child: NormalAppBar(title: '',isChangePassword: true,)
          ),
          body: SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: screenSize.height / 4.8,
                  width: screenSize.width / 1.9,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/reset password.avif'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: screenSize.height / 60,
                ),
                Icon(
                  Icons.lock,
                  color: Colors.red,
                  size: screenSize.width/8,
                ),
                MyTextWidget(
                    text: 'Reset Password',
                    color: const Color(0xFF424141),
                    size: screenSize.width/20,
                    weight: FontWeight.w500),
                MyTextWidget(
                    text:
                        'We will send you an email with a link to reset your password please enter the email associated with\nyour account below',
                    color: const Color(0xFF424141),
                    size: screenSize.width/25,
                    maxline: true,
                    alignTextCenter: true,
                    weight: FontWeight.w400),
                Padding(
                  padding: EdgeInsets.all(screenSize.width/25),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: resetPasswordcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter registerd email';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: const TextStyle(
                        color: Color(0xFF424141),
                        fontWeight: FontWeight.normal),
                    decoration: InputDecoration(
                      hintText: 'Registerd email',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 86, 86, 86),
                          fontWeight: FontWeight.normal),
                      fillColor: const Color.fromARGB(255, 243, 243, 243),
                      filled: true,
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height/35,),
                InkWell(
                  onTap: ()async {
                    authenticationBloc.add(ResetPasswordButtonClickedEvent());
                  },
                  child: Ink(
                      width: screenSize.width / 1.3,
                      height: screenSize.height / 18,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                          child: MyTextWidget(
                              text: 'Reset Password',
                              color: Colors.white,
                              size: 15,
                              weight: FontWeight.bold))),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
