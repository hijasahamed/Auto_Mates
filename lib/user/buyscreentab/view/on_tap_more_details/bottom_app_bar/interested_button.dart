import 'package:auto_mates/seller/seller_profile_screen/controllers/functions.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/bottom_app_bar/auto_back_widget.dart';
import 'package:flutter/material.dart';

class InterestedButton extends StatelessWidget {
  const InterestedButton(
      {super.key, required this.data, required this.screenSize});
  final Size screenSize;
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: checkIfUserInterestedCar(carId: data.id,),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: screenSize.height / 20,
            width: screenSize.width / 2.3,
            child: const Center(child: CircularProgressIndicator(color: Colors.blue,)),
          );
        }
        final List interestData = snapshot.data ?? [];        
        bool isInterested = interestData.isNotEmpty;
        String? docId;
        if(isInterested){
          docId=interestData[0]['id'] as String;
        }
        return InkWell(
          highlightColor: const Color(0xFFDBEDF5),
          onTap: () {
            isInterested? removeUsersInterest(context: context,docId: docId)
            :showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AutoBackWidget(
                  screenSize: screenSize,
                  data: data,
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
              child: Text(
                isInterested ? 'Remove Interest' : 'Interested',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
