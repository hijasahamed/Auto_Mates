import 'package:auto_mates/seller/seller_profile_screen/view/bloc/seller_profile_bloc.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/widget/banner_card_widget.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/widget/seller_logout_widget.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/widget/seller_properties_tile/seller_properties_tiles_widget.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/logout_section/loging_out_screen_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerProfileScreen extends StatelessWidget {
  const SellerProfileScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final SellerProfileBloc sellerProfileBloc=SellerProfileBloc();
    return BlocConsumer<SellerProfileBloc, SellerProfileState>(
      bloc: sellerProfileBloc,
      listener: (context, state) {
        if(state is SellerLogoutButtonClickedActionState){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => LogingOutScreenWidget(screenSize: screenSize,seller: false,),
          ));
        }        
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                BannerCardWidget(
                  screenSize: screenSize,
                ),
                Expanded(
                  child: SellerPropertiesTilesWidget(screenSize: screenSize,)
                ),
                SellerLogoutWidget(screenSize: screenSize,sellerProfileBloc: sellerProfileBloc,)
              ],
            ),
          ),
        );
      },
    );
  }
}
