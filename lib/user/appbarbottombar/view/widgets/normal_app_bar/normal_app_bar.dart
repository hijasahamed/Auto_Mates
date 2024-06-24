import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/all_cars_to_sell/pop_up_button/popup_menu_button_widget.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/app_bar_gradient_color.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_car_screen/filter_screen.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class NormalAppBar extends StatelessWidget {
  const NormalAppBar(
      {super.key,
      required this.title,
      this.isFromSeller,
      this.sellerHomeScreenBloc,
      this.screenSize,
      this.data,
      this.isFromFilterResultPage,
      this.isFromFilterPage,
      });
  final String title;
  final bool? isFromSeller;
  final SellerHomeScreenBloc? sellerHomeScreenBloc;
  final Size? screenSize;
  final dynamic data;
  final bool? isFromFilterResultPage;
  final bool? isFromFilterPage;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      flexibleSpace:
          (isFromFilterResultPage == true) ? null : const AppBarGradientColor(),
      leading: IconButton(
          onPressed: () {
            if (isFromFilterResultPage == true) {
              filterdCarList.clear();
              selectedCarFilterdList.clear();
              Navigator.pop(context);
            }
            else if(isFromFilterPage==true){
              selectedCarFilterdList.clear();
              Navigator.pop(context);
            } else {
              Navigator.pop(context);
            }
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color:
                (isFromFilterResultPage == true) ? Colors.grey : Colors.white,
          )),
      title: MyTextWidget(
          text: title,
          color: (isFromFilterResultPage == true) ? Colors.grey : Colors.white,
          size: 19,
          weight: FontWeight.bold),
      centerTitle: false,
      actions: [
        (isFromSeller == true)
            ? PopupMenuButtonWidget(
                screenSize: screenSize,
                data: data,
                sellerHomeScreenBloc: sellerHomeScreenBloc,
                isFromCarDetailsAppBar: true,
              )
            : const SizedBox()
      ],
    );
  }
}
