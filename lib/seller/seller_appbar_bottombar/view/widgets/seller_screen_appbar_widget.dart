
import 'package:auto_mates/user/appbarbottombar/view/widgets/app_bar_gradient_color.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class SellerScreenAppbarWidget extends StatelessWidget {
  const SellerScreenAppbarWidget({super.key,required this.name,required this.screenSize});
  final String name;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      flexibleSpace: const AppBarGradientColor(),
      centerTitle: false,
      title: MyTextWidget(text: name, color: Colors.white, size:27, weight: FontWeight.bold),      
    );
  }
}
