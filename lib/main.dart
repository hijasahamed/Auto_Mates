
import 'package:auto_mates/screens/authentications/user_login_screen.dart';
import 'package:auto_mates/screens/bottomtabswitch/bottom_tab_switch.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,      
      // home: BottomTabSwitchScreen()
      home: UserLoginScreen(),
    );
  }
}
