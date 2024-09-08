import 'package:auto_mates/user/appbarbottombar/view/appbar_bottombar_screen.dart';
import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/splashscreen/controllers/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleSignupUpdateDetails extends StatefulWidget {
  const GoogleSignupUpdateDetails({
    super.key, 
    required this.screenSize,
    required this.authenticationBloc,
    required this.userId,
    required this.googleEmail});

  final Size screenSize;
  final AuthenticationBloc authenticationBloc;
  final String userId;
  final String googleEmail;

  @override
  State<GoogleSignupUpdateDetails> createState() =>
      _GoogleSignupUpdateDetailsState();
}

class _GoogleSignupUpdateDetailsState extends State<GoogleSignupUpdateDetails> {
  final _formKey = GlobalKey<FormState>();


  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  void dispose() {
    _mobileController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _updateUserData(context) async {
    if (_formKey.currentState!.validate()) {
      print('updating data');
      await FirebaseFirestore.instance
          .collection('userSignupData')
          .doc(widget.userId)
          .update({
        'mobile': _mobileController.text,
        'location': _locationController.text,
      }).then((value)async {
        print('then working');
        UserData? isExistingUser = await checkIfUserAvailable(widget.googleEmail);
        final sharedPref = await SharedPreferences.getInstance();
        await sharedPref.setBool(logedInKey, true);
        await sharedPref.setString('id', isExistingUser!.id);
        await sharedPref.setString('email', isExistingUser.email);
        await sharedPref.setString('userName', isExistingUser.userName); 
        await sharedPref.setString('mobile', isExistingUser.mobile);
        await sharedPref.setString('location', isExistingUser.location);
        await sharedPref.setString('userProfile', isExistingUser.userProfile);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>  const AppbarBottomTabSwitchScreen(),
          ));
      },);     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: widget.screenSize.height,
        width: widget.screenSize.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/car.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Container(
            color: Colors.black54,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  MyTextWidget(text: 'You need to update your Mobile and Location when Signing with Google', color: Colors.white, size: widget.screenSize.width/25, weight: FontWeight.bold,maxline: true,alignTextCenter: true,),
                  SizedBox(height: widget.screenSize.height/15,),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: _mobileController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',                      
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: const Color(0XFF143A42),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid mobile number';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    style: const TextStyle(color: Colors.white),
                    controller: _locationController,
                    decoration: InputDecoration(
                      labelText: 'Location',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: const Color(0XFF143A42),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your location';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 40),

                  ElevatedButton(
                    onPressed: () => _updateUserData(context),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    child: const MyTextWidget(text: 'Update Details', color: Colors.white, size: 15, weight: FontWeight.w600)
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}