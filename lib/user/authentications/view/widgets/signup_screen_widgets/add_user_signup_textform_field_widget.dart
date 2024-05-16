import 'package:auto_mates/user/authentications/view/widgets/text_form_field/text_form_widget.dart';
import 'package:flutter/material.dart';

class AddUserSignupTextformFieldWidget extends StatelessWidget {
  const AddUserSignupTextformFieldWidget(
      {super.key,
      required this.screenSize,
      required this.userNameController,
      required this.emailController,
      required this.passwordController,
      required this.reChekPasswordController,
      required this.userSignupFormkey});
  final Size screenSize;
  final TextEditingController userNameController;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final TextEditingController reChekPasswordController;
  final GlobalKey userSignupFormkey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: SizedBox(
        child: Form(
            key: userSignupFormkey,
            child: Column(
              children: [
                MyTextFormWidget(
                  screenSize: screenSize,
                  text: 'UserName', 
                  controller: userNameController,
                  warning: 'Enter a username',
                  obscure: false,
                  keyBoardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.words,
                  fillColor: Colors.white,                  
                ),
                SizedBox(height: screenSize.height/50,),
                MyTextFormWidget(
                  screenSize: screenSize,
                  text: 'Email',
                  controller: emailController,
                  warning: 'Enter a valid Email',
                  obscure: false,
                  keyBoardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  fillColor: Colors.white
                ),
                SizedBox(height: screenSize.height/50,),
                MyTextFormWidget(
                  screenSize: screenSize,
                  text: 'Password',
                  controller: passwordController,
                  warning: 'Enter a Password',
                  obscure: true,
                  keyBoardType: TextInputType.name,
                  textCapitalization: TextCapitalization.none,
                  fillColor: Colors.white,
                ),
                SizedBox(height: screenSize.height/50,),
                MyTextFormWidget(
                  screenSize: screenSize,
                  text: 'Re enter password', 
                  controller: reChekPasswordController,
                  warning: 'Enter the same password',
                  obscure: true,
                  keyBoardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  fillColor: Colors.white,                  
                ),
              ],
            )),
      ),
    );
  }
}
