import 'package:auto_mates/user/appbarbottombar/view/widgets/app_bar_gradient_color.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';

class SellerScreenAppbarWidget extends StatelessWidget {
  const SellerScreenAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      flexibleSpace: const AppBarGradientColor(),
      title: const MyTextWidget(text: 'Seller Side', color: Colors.white, size: 20, weight: FontWeight.bold),
      centerTitle: true,
      leading: IconButton(
        onPressed: (){}, 
        icon: Icon(Icons.menu,color: Colors.white,size: 40,)
      ),
    );
  }
}