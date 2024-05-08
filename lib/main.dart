import 'package:auto_mates/user/appbarbottombar/controller/bloc/appbottombar_bloc.dart';
import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/user/firebase/firebase_options.dart';
import 'package:auto_mates/user/splashscreen/view/bloc/splash_bloc.dart';
import 'package:auto_mates/user/splashscreen/view/splash_screen.dart';
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
        BlocProvider(create: (context) => AppbottombarBloc(),),
        BlocProvider(create: (context) => SplashBloc(),)
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,      
        home: SplashScreen(),
      ),
    );
  }
}
