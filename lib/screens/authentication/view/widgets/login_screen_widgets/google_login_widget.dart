import 'package:flutter/material.dart';

class GoogleLoginwidget extends StatelessWidget {
  const GoogleLoginwidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: screenSize.height / 30,
            width: screenSize.width / 15,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/google logo.png'))),
          ),
          SizedBox(width: screenSize.width/35,),
          const Text('Login with Google',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
        ],
      ),
    );
  }
}
