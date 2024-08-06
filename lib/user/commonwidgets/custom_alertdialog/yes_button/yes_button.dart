import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/seller/seller_profile_screen/controllers/functions.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/bloc/seller_profile_bloc.dart';
import 'package:auto_mates/user/authentications/view/user_login_screen.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:flutter/material.dart';

class YesButton extends StatelessWidget {
  const YesButton(
      {super.key,
      required this.screenSize,
      this.isSellerCalling,
      this.isUserLogout,
      this.profileScreenBloc,
      this.isUsersInterestRemoving,
      this.userInterestedData,
      this.deleteInterestFromCarsPage,
      this.removeFavSeller,
      this.favSellerData,
      this.sellerProfileBloc,
      this.isSellerLogout,
      this.isSellerRemovingInterestedCar,
      this.interestedDataIdInSeller,
      this.markCarAsSold,
      this.markCarsoldBloc,
      this.markCarAsSoldData,
      this.sellerCarDelete,
      this.sellerCarData,
      this.sellerHomeScreenBloc,
      this.isSellerCarDetailsAppbarDelete,
      this.isUserFavDelete,
      this.userFavData,
      this.sellerData});
  final Size screenSize;
  final bool? isSellerCalling;
  final dynamic sellerData;
  final bool? isUserLogout;
  final ProfileScreenBloc? profileScreenBloc;
  final bool? isUsersInterestRemoving;
  final dynamic userInterestedData;
  final bool? deleteInterestFromCarsPage;
  final bool? removeFavSeller;
  final dynamic favSellerData;
  final SellerProfileBloc? sellerProfileBloc;
  final bool? isSellerLogout;
  final bool? isSellerRemovingInterestedCar;
  final dynamic interestedDataIdInSeller;
  final bool? markCarAsSold;
  final SellerHomeScreenBloc? markCarsoldBloc;
  final dynamic markCarAsSoldData;
  final bool? sellerCarDelete;
  final dynamic sellerCarData;
  final SellerHomeScreenBloc? sellerHomeScreenBloc;
  final bool? isSellerCarDetailsAppbarDelete;
  final bool? isUserFavDelete;
  final dynamic userFavData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        (isSellerCalling==true)
        ? makeCall(context: context,mobileNumber: sellerData.mobile)
        : (isUserLogout==true)
        ? confirmUserLogout(context: context).then((value) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => UserLoginScreen()),
            (Route<dynamic> route) => false,
          );
        },)
        : (isUsersInterestRemoving==true)
        ? removeUsersInterestedCar(context: context,docId: (deleteInterestFromCarsPage == true)? userInterestedData : userInterestedData.id,isNavBack: true,)
        : (removeFavSeller==true)
        ? removeSellerFromFavourites(context: context, docId: favSellerData.id,backNavigation: true)
        : (isSellerLogout==true)
        ? sellerLogout(context: context)
        : (isSellerRemovingInterestedCar==true)
        ? removeUsersInterestedCar(context: context,docId: interestedDataIdInSeller,)
        : (markCarAsSold==true)
        ? getCarSoldPrice(carData: markCarAsSoldData,context: context,markCarsoldBloc: markCarsoldBloc,screenSize: screenSize)         
        : (sellerCarDelete==true)
        ? deleteCarToSell(sellerCarData.id, context, sellerHomeScreenBloc, isSellerCarDetailsAppbarDelete)
        : (isUserFavDelete==true)
        ? removeFavoriteCar(docId: userFavData.id, context: context).then((value) => Navigator.of(context).pop(),)
        : null;        
      },
      child: Container(
        height: screenSize.height / 20,
        width: screenSize.width / 4,
        decoration: BoxDecoration(
          color: (isSellerCalling == true)? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: MyTextWidget(
              text: (isSellerCalling == true)? 'Call'
              : (isSellerLogout == true || isUserLogout == true)? 'Logout'
              : 'confirm',
              color: Colors.white,
              size: screenSize.width/30,
              weight: FontWeight.w500),
        ),
      ),
    );
  }
}
