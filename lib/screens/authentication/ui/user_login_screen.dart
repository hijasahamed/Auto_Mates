import 'package:auto_mates/screens/authentication/ui/text_form_field_widget.dart';
import 'package:auto_mates/screens/authentication/ui/user_signup_screen.dart';
import 'package:auto_mates/screens/bottomtabswitch/bottom_tab_switch.dart';
import 'package:flutter/material.dart';

class UserLoginScreen extends StatelessWidget {
  const UserLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,      
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/wheel.webp'),fit: BoxFit.cover,)
        ),
        child: Container(
          height: screenSize.height,
          width: screenSize.width,
          color: Colors.black.withOpacity(0.6),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: screenSize.height/3.5,
                  width: screenSize.width,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Welcome Back!',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),),
                      Text('Login into your account',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white))
                    ],
                  ),
                ),
                SizedBox(
                  width: screenSize.width,
                  child: Column(
                    children: [
                      const Text('Login',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),),
                      const TextFormFieldWidget(hintText: 'Username',),
                      const TextFormFieldWidget(hintText: 'Password',),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: (){}, 
                            child: const Text('Forget Password?',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
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
                      const Text('Login with Google',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white)),
                    ],
                  ),
                ),
                Column(
                  children: [
                    TextButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white12)), 
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserSignupScreen(screenSize: screenSize),));
                      }, 
                      child: const Text('Don’t have an Account? Signup',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
                    ),
                    SizedBox(height: screenSize.height/50,),
                    TextButton(
                      onPressed: () {
                        
                      },
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)), 
                      child: const Text('Login as Dealer',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BottomTabSwitchScreen(),));
                  },
                  child: ClipPath(
                    clipper: Customshape(),
                    child: Container(                      
                      color: const Color(0xFF284845),
                      height: screenSize.height/10,
                      child: const Center(child: Text('Login',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w600,color: Colors.white),)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}