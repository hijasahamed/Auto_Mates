import 'package:auto_mates/seller/seller_profile_screen/view/bloc/seller_profile_bloc.dart';
import 'package:auto_mates/user/authentications/view/user_login_screen.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:auto_mates/user/splashscreen/controllers/functions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

sellerLogout({
  context,
}) async {
  await Future.delayed(const Duration(milliseconds: 2500));
  final sharedPref = await SharedPreferences.getInstance();
  await sharedPref.setBool(sellerLogedInKey, false);
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => UserLoginScreen()));
}

sellerLogoutAlertDialoge({context,screenSize,sellerProfileBloc}) {
  return showDialog(
    barrierColor: Colors.black54,
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const MyTextWidget(
            text: 'Logout',
            color: Color(0xFF424141),
            size: 26,
            weight: FontWeight.bold),
        content: const MyTextWidget(
            text: 'Do you want to Logout from AutoMates',
            color: Color(0xFF424141),
            size: 15,
            weight: FontWeight.bold),
        actions: [
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black26)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const MyTextWidget(
                  text: 'Back',
                  color: Colors.white,
                  size: 12,
                  weight: FontWeight.bold)),
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red)),
              onPressed: () {
               sellerProfileBloc.add(SellerLogoutConfirmButtonClickedEvent());
              },
              child: const MyTextWidget(
                  text: 'Logout',
                  color: Colors.white,
                  size: 12,
                  weight: FontWeight.bold)),
        ],
      );
    },
  );
}
