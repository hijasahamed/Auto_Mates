import 'package:auto_mates/appbarbottombar/controller/bloc/appbottombar_bloc.dart';
import 'package:auto_mates/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/authentications/view/user_login_screen.dart';
import 'package:auto_mates/firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticationBloc(),),
        BlocProvider(create: (context) => AppbottombarBloc(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, 
        theme: ThemeData.light(),      
        home: UserLoginScreen(),
      ),
    );
  }
}
