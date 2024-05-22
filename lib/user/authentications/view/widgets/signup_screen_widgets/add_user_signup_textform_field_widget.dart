import 'package:auto_mates/user/commonwidgets/text_form_field/text_form_widget.dart';
import 'package:flutter/material.dart';

class AddUserSignupTextformFieldWidget extends StatelessWidget {
  const AddUserSignupTextformFieldWidget(
      {super.key,
      required this.screenSize,
      required this.userNameController,
      required this.emailController,
      required this.passwordController,
      required this.reChekPasswordController,
      required this.locationController,
      required this.mobileController,
      required this.userSignupFormkey});
  final Size screenSize;
  final TextEditingController userNameController;
  final TextEditingController locationController;
  final TextEditingController mobileController;
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
      child: Form(
          key: userSignupFormkey,
          child: Column(
            children: [
              MyTextFormWidget(
                screenSize: screenSize,
                text: 'UserName',
                valueTextColor: Colors.white,
                enabledBorderColor: const Color.fromARGB(255, 101, 98, 98),
                focusedBorderColor: Colors.white,
                fillColor: const Color(0XFF143A42),
                labelTextColor: Colors.white, 
                controller: userNameController,
                warning: 'Enter a username',
                obscure: false,
                keyBoardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                                  
              ),
              SizedBox(height: screenSize.height/50,),
              MyTextFormWidget(
                screenSize: screenSize,
                text: 'Email',
                valueTextColor: Colors.white,
                enabledBorderColor: const Color.fromARGB(255, 101, 98, 98),
                focusedBorderColor: Colors.white,
                fillColor: const Color(0XFF143A42),
                labelTextColor: Colors.white,
                controller: emailController,
                warning: 'Enter a valid Email',
                obscure: false,
                keyBoardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
              ),
              SizedBox(height: screenSize.height/50,),
              MyTextFormWidget(
                screenSize: screenSize,
                text: 'Mobile',
                valueTextColor: Colors.white,
                enabledBorderColor: const Color.fromARGB(255, 101, 98, 98),
                focusedBorderColor: Colors.white,
                fillColor: const Color(0XFF143A42), 
                labelTextColor: Colors.white,
                controller: mobileController,
                warning: 'Enter a valid mobile number',
                obscure: false,
                keyBoardType: TextInputType.phone,
                textCapitalization: TextCapitalization.none,               
              ),
              SizedBox(height: screenSize.height/50,),
              MyTextFormWidget(
                screenSize: screenSize,
                text: 'Location',
                valueTextColor: Colors.white,
                enabledBorderColor: const Color.fromARGB(255, 101, 98, 98),
                focusedBorderColor: Colors.white,
                fillColor: const Color(0XFF143A42),
                labelTextColor: Colors.white, 
                controller: locationController,
                warning: 'Enter your location',
                obscure: false,
                keyBoardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,                 
              ),
              SizedBox(height: screenSize.height/50,),
              MyTextFormWidget(
                screenSize: screenSize,
                text: 'Password',
                valueTextColor: Colors.white,
                enabledBorderColor: const Color.fromARGB(255, 101, 98, 98),
                focusedBorderColor: Colors.white,
                fillColor: const Color(0XFF143A42),
                labelTextColor: Colors.white,
                controller: passwordController,
                warning: 'Enter a Password',
                obscure: true,
                keyBoardType: TextInputType.name,
                textCapitalization: TextCapitalization.none,
              ),
              SizedBox(height: screenSize.height/50,),
              MyTextFormWidget(
                screenSize: screenSize,
                text: 'Re enter password',
                valueTextColor: Colors.white,
                enabledBorderColor: const Color.fromARGB(255, 101, 98, 98),
                focusedBorderColor: Colors.white,
                fillColor: const Color(0XFF143A42),
                labelTextColor: Colors.white, 
                controller: reChekPasswordController,
                warning: 'Enter the same password',
                obscure: true,
                keyBoardType: TextInputType.name,
                textCapitalization: TextCapitalization.none,                 
              ),
            ],
          )),
    );
  }
}
