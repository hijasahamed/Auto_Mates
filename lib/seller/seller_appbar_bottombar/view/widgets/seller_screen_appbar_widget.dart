import 'package:auto_mates/seller/authentications/controllers/functions.dart';
import 'package:auto_mates/seller/seller_appbar_bottombar/controllers/functions.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/app_bar_gradient_color.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class SellerScreenAppbarWidget extends StatelessWidget {
  const SellerScreenAppbarWidget({super.key,required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      flexibleSpace: const AppBarGradientColor(),
      title: MyTextWidget(text: name, color: Colors.white, size:27, weight: FontWeight.bold),
      actions: [
        IconButton(
          onPressed: () {

          },
          icon: const Icon(Icons.search,size: 35,color: Colors.white,)
        )
      ],
    );
    // return FutureBuilder(
    //   future: fetchSellerDetails(),
    //   builder: (context, snapshot) {
    //     SellerData data=snapshot.data!;
    //     return AppBar(
    //       backgroundColor: Colors.white,
    //       flexibleSpace: const AppBarGradientColor(),
    //       title: const MyTextWidget(
    //           text: 'Seller Side',
    //           color: Colors.white,
    //           size: 27,
    //           weight: FontWeight.bold),
    //       actions: [
    //         IconButton(
    //             onPressed: () {},
    //             icon: const Icon(
    //               Icons.search,
    //               size: 35,
    //               color: Colors.white,
    //             ))
    //       ],
    //     );
    //   },
    // );
  }
}
