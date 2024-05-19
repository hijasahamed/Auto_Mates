import 'package:auto_mates/user/appbarbottombar/view/widgets/app_bar_gradient_color.dart';
import 'package:flutter/material.dart';

class NormalAppBar extends StatelessWidget {
  const NormalAppBar({super.key,required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        flexibleSpace: const AppBarGradientColor(),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      );
  }
}