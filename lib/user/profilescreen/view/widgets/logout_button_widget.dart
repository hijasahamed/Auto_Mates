import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:flutter/material.dart';

class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          logoutButtonClicked(context);
        },
        child: const Text('Logout'));
  }
}
