import 'package:auto_mates/seller/seller_profile_screen/view/bloc/seller_profile_bloc.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:flutter/material.dart';

class SellerLogoutWidget extends StatelessWidget {
  const SellerLogoutWidget({super.key,required this.screenSize,required this.sellerProfileBloc});
  final Size screenSize;
  final SellerProfileBloc sellerProfileBloc;
  @override
  Widget build(BuildContext context) {
    return Ink(
      height: screenSize.height/16,
      width: screenSize.width/2.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red
      ),
      child: InkWell(
        onTap: () {
          sellerProfileBloc.add(SellerLogoutButtonClickedEvent());
        },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MyTextWidget(text: 'Logout', color: Colors.white, size: 18, weight: FontWeight.bold),
              SizedBox(width: screenSize.width/70,),
              const Icon(Icons.logout,color: Colors.white,)
            ],
          ),
        ),
      ),
    );
  }
}