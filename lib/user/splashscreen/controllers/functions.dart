import 'package:auto_mates/seller/seller_appbar_bottombar/view/seller_appbar_bottombar_screen.dart';
import 'package:auto_mates/user/appbarbottombar/view/appbar_bottombar_screen.dart';
import 'package:auto_mates/user/authentications/view/user_login_screen.dart';
import 'package:auto_mates/user/splashscreen/view/no_network_connection/no_network_widget.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const logedInKey = 'Userlogedin';
const sellerLogedInKey='sellerLogedin'; 

Future<void> goToNoNetworkWidget(context) async {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
    return const NoNetworkWidget();
  }));
}

Future<void> goToLoginScreen(context) async {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
    return UserLoginScreen();
  }));
}

Future<void> goToUserScreen(context) async {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
  builder: (ctx) => const AppbarBottomTabSwitchScreen()));
}

Future<void> goToSellerScreen(context) async {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
    return const Sellerappbarbottombar();
  }));
}

Future<void> checkIfUserLogedin(context) async {
  final sharedPref = await SharedPreferences.getInstance();
  final isLogedin = sharedPref.getBool(logedInKey);
  final isSellerLogedIn = sharedPref.getBool(sellerLogedInKey);
  if (kDebugMode) {
    print('user is $isLogedin');
    print('seller is $isSellerLogedIn');
  }  
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    await Future.delayed(const Duration(milliseconds: 1500));
    await goToNoNetworkWidget(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('No network connection.'),
      ),
    );
  } else if (isLogedin == null && isSellerLogedIn == null) {
    await Future.delayed(const Duration(milliseconds: 1500));
    await goToLoginScreen(context);
  }
  else if(isLogedin == true && isSellerLogedIn == null){
    await Future.delayed(const Duration(milliseconds: 1500));
    await goToUserScreen(context);
  }
  else if(isLogedin == false && isSellerLogedIn == null){
    await Future.delayed(const Duration(milliseconds: 1500));
    await goToLoginScreen(context);
  }
  else if(isLogedin == null && isSellerLogedIn == true){
    await Future.delayed(const Duration(milliseconds: 1500));
    await goToSellerScreen(context);
  }
  else if(isLogedin == null && isSellerLogedIn == false){
    await Future.delayed(const Duration(milliseconds: 1500));
    await goToLoginScreen(context);
  }
  else if(isLogedin == null && isSellerLogedIn == false){
    await Future.delayed(const Duration(milliseconds: 1500));
    await goToLoginScreen(context);
  }
  else if(isLogedin == true && isSellerLogedIn == false){
    await Future.delayed(const Duration(milliseconds: 1500));
    await goToUserScreen(context);
  }
  else if(isLogedin == false && isSellerLogedIn == true){
    await Future.delayed(const Duration(milliseconds: 1500));
    await goToSellerScreen(context);
  }
  else if(isLogedin == false && isSellerLogedIn == false){
    await Future.delayed(const Duration(milliseconds: 1500));
    await goToLoginScreen(context);
  }
}
