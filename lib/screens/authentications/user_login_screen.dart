import 'package:auto_mates/screens/authentications/text_form_field_widget.dart';
import 'package:auto_mates/screens/authentications/user_signup_screen.dart';
import 'package:flutter/material.dart';

class UserLoginScreen extends StatelessWidget {
  const UserLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 76, 207, 239),
              Color.fromARGB(255, 80, 171, 250)
            ],
          ),
        ),
      ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenSize.height/3.5,
                width: screenSize.width,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Welcome Back!',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Color(0xFF424141)),),
                    Text('Login into your account',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Color(0xFF424141)))
                  ],
                ),
              ),
              SizedBox(
                width: screenSize.width,
                child: Column(
                  children: [
                    const Text('Login',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Color(0xFF424141)),),
                    const TextFormFieldWidget(hintText: 'Username'),
                    const TextFormFieldWidget(hintText: 'Password'),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: (){}, 
                          child: const Text('Forget Password?',style: TextStyle(fontWeight: FontWeight.w500,color: Color(0xFF424141)),),
                        )
                      ),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  
                }, 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: screenSize.height/20,
                      width: screenSize.width/8,
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/google logo.png'))
                      ),
                    ),
                    const Text('Login with Google',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Color(0xFF424141))),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserSignupScreen(),));
                }, 
                child: const Text('Don’t have an Account? Signup',style: TextStyle(fontWeight: FontWeight.w500,color: Color(0xFF424141)),),
              )
            ],
          ),
        )
      ),     
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 76, 207, 239),
              Color.fromARGB(255, 80, 171, 250)
            ],
          ),
        ),
        child: const Center(child: Text('Login',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),)),
      ),
    );
  }
}