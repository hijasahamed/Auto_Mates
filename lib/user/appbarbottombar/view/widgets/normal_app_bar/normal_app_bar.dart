import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/popup_menu_button_widget.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/app_bar_gradient_color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NormalAppBar extends StatelessWidget {
  const NormalAppBar({super.key,required this.title,this.isFromSeller,this.sellerHomeScreenBloc,this.screenSize,this.data});
  final String title;
  final bool? isFromSeller;
  final SellerHomeScreenBloc? sellerHomeScreenBloc;
  final Size? screenSize;
  final DocumentSnapshot? data;
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
        actions: [
          (isFromSeller==true)?
          PopupMenuButtonWidget(screenSize: screenSize, data: data, sellerHomeScreenBloc: sellerHomeScreenBloc)
          :const SizedBox()
        ],
      );
  }
}