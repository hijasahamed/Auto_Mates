import 'package:auto_mates/user/appbarbottombar/view/appbar_bottombar_screen.dart';
import 'package:auto_mates/user/authentications/view/user_login_screen.dart';
import 'package:auto_mates/user/splashscreen/view/widgets/no_network_widget.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const logedInKey = 'Userlogedin';

Future<void> goToLoginScreen(context) async {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
    return UserLoginScreen();
  }));
}

Future<void> goToNoNetworkWidget(context) async {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
    return const NoNetworkWidget();
  }));
}

Future<void> checkIfUserLogedin(context) async {
  final sharedPref = await SharedPreferences.getInstance();
  final isLogedin = sharedPref.getBool(logedInKey);
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    await Future.delayed(const Duration(milliseconds: 3150));
    await goToNoNetworkWidget(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('No network connection.'),
      ),
    );
  } else if (isLogedin == null || isLogedin == false) {
    await Future.delayed(const Duration(milliseconds: 3150));
    await goToLoginScreen(context);
  } else {
    await Future.delayed(const Duration(milliseconds: 3150));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (ctx) => const AppbarBottomTabSwitchScreen()));
  }
}
