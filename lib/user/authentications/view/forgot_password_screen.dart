import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
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
          appBar: AppBar(
            backgroundColor: Colors.white,
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
                const Icon(
                  Icons.lock,
                  color: Colors.red,
                  size: 50,
                ),
                const MyTextWidget(
                    text: 'Reset Password',
                    color: Color(0xFF424141),
                    size: 20,
                    weight: FontWeight.bold),
                const Padding(
                  padding: EdgeInsets.only(left: 25, top: 10),
                  child: MyTextWidget(
                      text:
                          'We will send you an email with a link to reset your password please enter the email associated with\nyour account below',
                      color: Color(0xFF424141),
                      size: 15,
                      weight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 15, bottom: 15),
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
                      fillColor: const Color(0xFFDBEDF5),
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
                InkWell(
                  onTap: ()async {
                    authenticationBloc.add(ResetPasswordButtonClickedEvent());
                  },
                  child: Container(
                      width: screenSize.width / 2,
                      height: screenSize.height / 18,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
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
