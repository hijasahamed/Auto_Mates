import 'package:auto_mates/screens/authentication/view/widgets/login_screen_widgets/login_button_widget.dart';
import 'package:auto_mates/screens/bottomtabswitch/bottom_tab_switch.dart';
import 'package:flutter/material.dart';

class SignupButtonWidget extends StatelessWidget {
  const SignupButtonWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const BottomTabSwitchScreen(),
        ));
      },
      child: ClipPath(
        clipper: Customshape(),
        child: Container(
          color: const Color(0xFF284845),
          height: screenSize.height/10,
          child: const Center(
              child: Text(
            'Signup',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          )),
        ),
      ),
    );
  }
}