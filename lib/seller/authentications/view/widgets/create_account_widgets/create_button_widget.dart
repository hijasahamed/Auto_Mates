import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';

class CreateButtonWidget extends StatelessWidget {
  const CreateButtonWidget({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height / 18,
      width: screenSize.width / 2.5,
      child: Material(
        color: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: () {
            
          },
          child: const Center(
              child: MyTextWidget(
                  text: 'Signup',
                  color: Colors.white,
                  size: 20,
                  weight: FontWeight.bold)),
        ),
      ),
    );
  }
}
