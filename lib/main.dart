import 'package:auto_mates/seller/authentications/view/bloc/seller_authentication_bloc.dart';
import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/bloc/seller_profile_bloc.dart';
import 'package:auto_mates/user/appbarbottombar/controller/bloc/appbottombar_bloc.dart';
import 'package:auto_mates/user/authentications/controller/bloc/authentication_bloc.dart';
import 'package:auto_mates/firebase/firebase_options.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:auto_mates/user/splashscreen/view/bloc/splash_bloc.dart';
import 'package:auto_mates/user/splashscreen/view/splash_screen/splash_screen.dart';
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
        BlocProvider(create: (context) => SplashBloc(),),
        BlocProvider(create: (context) => SellerAuthenticationBloc(),),
        BlocProvider(create: (context) => SellerHomeScreenBloc(),),
        BlocProvider(create: (context) => ProfileScreenBloc(),),
        BlocProvider(create: (context) => SellerProfileBloc(),),
        BlocProvider(create: (context) => BuyScreenBloc(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
        home: const SplashScreen(),        
      ),
    );
  }
}
