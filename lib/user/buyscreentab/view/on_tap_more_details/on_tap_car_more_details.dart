// ignore_for_file: use_build_context_synchronously

import 'package:auto_mates/seller/seller_homescreen/view/widgets/single_car_details/feature_the_car/payment_success_page/payment_success_page.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/bottom_app_bar/chat_button/chat_button.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/bottom_app_bar/interested_button/auto_back_widget/auto_back_widget.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/bottom_app_bar/interested_button/interested_button.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/car_details/car_details_widget.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/seller_details/seller_details_widget.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/favourite_screen/favourite_screen/fav_remove_button/user_favourite_remove_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnTapCarMoreDetailsCarScreen extends StatelessWidget {
  const OnTapCarMoreDetailsCarScreen(
      {super.key,
      required this.screenSize,
      required this.data,
      this.isUserFavScreen,
      this.isFromSearch,
      this.isFrominterestedCars});
  final Size screenSize;
  final dynamic data;
  final bool? isUserFavScreen;
  final bool? isFromSearch;
  final bool? isFrominterestedCars;
  @override
  Widget build(BuildContext context) {
    BuyScreenBloc carAddingToInterestedLoader = BuyScreenBloc();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: NormalAppBar(
            title: '${data['brand']} ${data['modelName']}',
          )),
      body: BlocListener<BuyScreenBloc, BuyScreenState>(
        bloc: carAddingToInterestedLoader,
        listener: (context, state)async {
          if (state is CarAddingToInterestedState) {
            paymentSuccessPage(context: context,paidAmount: 999,screenSize: screenSize,title: 'Car Marking As Interested');
            await Future.delayed(const Duration(seconds: 3));
            markUserInterest(
              context: context,
              isFromSearch: isFromSearch,
              car: data
            );
            UserData? user = await fetchUserDetails();
            updatePointsAfterDeduction(user!.id, deductedAmount);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SellerDetailsCardWidget(
                  screenSize: screenSize,
                  sellerData: data,
                ),
                CarDetailsWidget(
                  screenSize: screenSize,
                  data: data,
                  fromSeller: false,
                  isFromSearch: isFromSearch,
                  isUserFavScreen: isUserFavScreen,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ChatButton(
              screenSize: screenSize,
              data: data,
            ),
            (isUserFavScreen == true)
                ? UserFavouriteRemoveButton(screenSize: screenSize, data: data)
                : InterestedButton(
                    data: data,
                    screenSize: screenSize,
                    isFromSearch: isFromSearch,
                    isFrominterestedCars: isFrominterestedCars,
                    carAddingToInterestedLoader: carAddingToInterestedLoader,
                  )
          ],
        ),
      ),
    );
  }
}
