import 'package:auto_mates/user/authentications/view/user_login_screen.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/buy_screen.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/splashscreen/controllers/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

sellerLogout({
  context,
}) async {
  final sharedPref = await SharedPreferences.getInstance();
  await sharedPref.setBool(sellerLogedInKey, false);
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => UserLoginScreen()),
    (Route<dynamic> route) => false,
  );
}

Stream<QuerySnapshot> getUsersInterestsWithSellerId(sellerId) {
  return FirebaseFirestore.instance
      .collection('userInterestMarked')
      .where('carSellerId', isEqualTo: sellerId)
      .snapshots();
}

Stream<QuerySnapshot> getSellersSoldCars(sellerData) {
  return FirebaseFirestore.instance
      .collection('soldcars')
      .where('sellerPhone', isEqualTo: sellerData.mobile)
      .where('sellerName', isEqualTo: sellerData.companyName)
      .snapshots();
}

Future<int> getTotalSalesAmount() async {
  int totalSalesAmount = 0;
  
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('soldcars').get();
  for (QueryDocumentSnapshot doc in querySnapshot.docs) {
    String soldAmountString = doc['soldAmount'];
    int soldAmount = int.tryParse(soldAmountString) ?? 0;
    totalSalesAmount += soldAmount;
  }
  
  return totalSalesAmount;
}

removeUsersInterest({context, docId, noData}) {
  Navigator.pop(context);
  userInterestMarked.doc(docId).delete();
  if (noData == true) {
    snackbarWidget('Sorry this car is been sold or removed by the seller', context,
        Colors.red, Colors.white, SnackBarBehavior.floating);
  } else {
    snackbarWidget('User interest removed', context, Colors.red, Colors.white,
        SnackBarBehavior.floating);
  }
  buyScreenBloc.add(InterstButtonClickedRebuildUiEvent());
}

callCarInterestedCustomer({context, data, screenSize}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Container(
          height: screenSize.height / 6,
          width: screenSize.width / 6,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(data['carImage']), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10)),
        ),
        content: SizedBox(
          height: screenSize.height / 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextWidget(
                  text: 'Car model : ${data['carName']}',
                  color: Colors.black,
                  size: 18,
                  weight: FontWeight.bold),
              const Spacer(),
              MyTextWidget(
                text:
                    '${data['userName']} from ${data['userLocation']} has marked a interest on this car with Registration number ${data['carNumber']}',
                color: Colors.black,
                size: 14,
                weight: FontWeight.bold,
                maxline: true,
              ),
              const Spacer(),
              const MyTextWidget(
                text:
                    'To make a deal with this customer contact in the below number',
                color: Colors.blue,
                size: 15,
                weight: FontWeight.bold,
                maxline: true,
              )
            ],
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                makeCall(context: context, mobileNumber: data['userContact']);
              },
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.green)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MyTextWidget(
                      text: 'Call',
                      color: Colors.white,
                      size: 16,
                      weight: FontWeight.bold),
                  SizedBox(
                    width: screenSize.width / 50,
                  ),
                  MyTextWidget(
                      text: '+91 ${data['userContact']}',
                      color: Colors.white,
                      size: 16,
                      weight: FontWeight.bold)
                ],
              ))
        ],
      );
    },
  );
}
