import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/car_holder/car_holder_car_more_details/car_holder_car_more_details.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/car_holder/car_holder_car_name_brand/car_holder_car_name_brand.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/car_holder/car_image/car_holder_car_image.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/car_holder/positioned_button/car_holder_button.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/on_tap_car_more_details.dart';
import 'package:flutter/material.dart';

class CarHolder extends StatelessWidget {
  const CarHolder(
      {super.key,
      required this.screenSize,
      required this.data,
      this.sellerHomeScreenBloc,
      this.isFromUser,
      this.isUserFavScreen,
      this.isFromSeller});
  final Size screenSize;
  final dynamic data;
  final bool? isFromSeller;
  final SellerHomeScreenBloc? sellerHomeScreenBloc;
  final bool? isFromUser;
  final bool? isUserFavScreen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        (isFromSeller == true)
            ? sellerHomeScreenBloc?.add(NavigateToSingleCarDetailsPageEvent(data: data))
            : Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return OnTapCarMoreDetailsCarScreen(
                    screenSize: screenSize,
                    data: data,
                    isUserFavScreen: isUserFavScreen,
                    isFromSearch: false,
                  );
                },
              ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Card(
          elevation: 5,
          shadowColor: const Color(0xFFDBEDF5),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CarHolderCarImage(screenSize: screenSize, data: data),
                  CarHolderButton(data: data, screenSize: screenSize,isFromSeller: isFromSeller,isFromUser: isFromUser,sellerHomeScreenBloc: sellerHomeScreenBloc,)
                ],
              ),
              CarHolderCarNameBrand(screenSize: screenSize, data: data),
              CarHolderCarMoreDetails(screenSize: screenSize, data: data)
            ],
          ),
        ),
      ),
    );
  }
}
