import 'package:auto_mates/screens/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/screens/authentications/view/user_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticationBloc(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, 
        theme: ThemeData.light(),      
        home: const UserLoginScreen(),
      ),
    );
  }
}
