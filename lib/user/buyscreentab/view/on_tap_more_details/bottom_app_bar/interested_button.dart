import 'package:auto_mates/seller/seller_profile_screen/controllers/functions.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/buy_screen.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/bottom_app_bar/auto_back_widget/auto_back_widget.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InterestedButton extends StatelessWidget {
  const InterestedButton(
      {super.key, required this.data, required this.screenSize,this.isFromSearch,this.isFrominterestedCars,required this.carAddingToInterestedLoader});
  final Size screenSize;
  final dynamic data;
  final bool? isFromSearch;
  final bool? isFrominterestedCars;
  final BuyScreenBloc carAddingToInterestedLoader;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuyScreenBloc, BuyScreenState>(
      bloc: buyScreenBloc,
      builder: (context, state) {
        return FutureBuilder<List>(
          future: (isFromSearch==true)
          ? checkIfUserInterestedCar(
            carId: data['id'],
          )
          : checkIfUserInterestedCar(
            carId: data.id,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white,
                ),
                height: screenSize.height / 20,
                width: screenSize.width / 1.9,
                child: const Center(
                    child: CircularProgressIndicator(
                  color: Colors.blue,
                  strokeWidth: 2.5,
                )),
              );
            }
            final List interestData = snapshot.data ?? [];
            bool isInterested = interestData.isNotEmpty;
            String? docId;
            if (isInterested) {
              docId = interestData[0]['id'] as String;
            }
            return InkWell(
              highlightColor: const Color(0xFFDBEDF5),
              onTap: () {
                isInterested
                    ? removeUsersInterestedCar(context: context, docId: docId)
                    : showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AutoBackWidget(
                            screenSize: screenSize,
                            data: data,
                            isFromSearch: isFromSearch,
                            carAddingToInterestedLoader: carAddingToInterestedLoader,
                          );
                        },
                      );
              },
              child: Ink(
                height: screenSize.height / 20,
                width: screenSize.width / 1.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: isInterested ? Colors.red : Colors.green,
                ),
                child: Center(                  
                  child: MyTextWidget(text: isInterested ? 'Remove Interest' : 'Interested', color: Colors.white, size: screenSize.width/30, weight: FontWeight.bold),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
