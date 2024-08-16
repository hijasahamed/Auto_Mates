import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/seller/seller_profile_screen/controllers/functions.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/bloc/seller_profile_bloc.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/widget/seller_banner/banner_card_widget.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/widget/seller_properties_tile/property_tiles/seller_properties_tiles_widget.dart';
import 'package:auto_mates/user/commonwidgets/custom_alertdialog/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerProfileScreen extends StatelessWidget {
  const SellerProfileScreen({super.key, required this.data});
  final SellerData data;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final SellerProfileBloc sellerProfileBloc = SellerProfileBloc();
    return BlocConsumer<SellerProfileBloc, SellerProfileState>(
      bloc: sellerProfileBloc,
      listener: (context, state) async {
        if (state is SellerLogoutButtonClickedActionState) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => CustomAlertDialog(
              image: 'assets/images/logout.png',
              title: 'Logout',
              subtitle: 'Do you want to Logout from AutoMates',
              screenSize: screenSize,
              isSellerLogout: true,
              sellerProfileBloc: sellerProfileBloc,
            ),
          );
        } else if (state is SellerLogoutConfirmButtonClickedActionState) {
          sellerLogout(context: context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [                
                BannerCardWidget(
                  screenSize: screenSize,
                  data: data,
                  sellerProfileBloc: sellerProfileBloc,
                ),
                SellerPropertiesTilesWidget(
                  screenSize: screenSize,
                  sellerData: data,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
