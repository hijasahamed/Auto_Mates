import 'package:auto_mates/screens/authentication/view/widgets/login_screen_widgets/text_formfield_widget.dart';
import 'package:flutter/material.dart';

class AddTextformFieldWidget extends StatelessWidget {
  const AddTextformFieldWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize.width,
      child: const Column(
        children: [                           
          TextFormFieldWidget(
            hintText: 'Username',
          ),
          TextFormFieldWidget(
            hintText: 'Password',
          ),
          TextFormFieldWidget(
            hintText: 'Confirm Password',
          ),
        ],
      ),
    );
  }
}