import 'package:auto_mates/screens/authentication/ui/view/user_login_screen.dart';
import 'package:flutter/material.dart';

class BackToLoginScreenWidget extends StatelessWidget {
  const BackToLoginScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white10)),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const UserLoginScreen(),
        ));
      },
      child: const Text(
        'Already have an Account? Login',
        style: TextStyle(
            fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }
}