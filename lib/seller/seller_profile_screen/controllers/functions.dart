import 'dart:developer';

import 'package:auto_mates/seller/seller_profile_screen/view/widget/user_interest_page/interest_holder_datas/interest_holder_ontap/interest_holder_ontap.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/authentications/view/user_login_screen.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/buy_screen.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/splashscreen/controllers/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

Stream<String> getTotalSalesAmountStream() {
  return FirebaseFirestore.instance.collection('soldcars').snapshots().map((querySnapshot) {
    int totalSalesAmount = 0;
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>?;
      if (data != null && data.containsKey('soldAmount')) {
        String soldAmountString = data['soldAmount'];
        String cleanedAmountString = soldAmountString.replaceAll(RegExp(r'[^0-9]'), '');
        int soldAmount = int.tryParse(cleanedAmountString) ?? 0; 
        totalSalesAmount += soldAmount;
      }
    }
    final formattedAmount = NumberFormat.decimalPattern('en_IN').format(totalSalesAmount);
    return formattedAmount;
  });
}

removeUsersInterestedCar({context, docId,noData,isNavBack,isSellerRemovingInterestedCar,removeInterestBySeller})async {
  if(isNavBack==true){
    Navigator.of(context).pop();
  }
  userInterestMarked.doc(docId).delete();
  if(isSellerRemovingInterestedCar == true){
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('userSignupData')
          .doc(removeInterestBySeller['userId'])
          .get();

      if (userDoc.exists) {
        var data = userDoc.data() as Map<String, dynamic>;
        int currentCoins = data['autoMatesCoin'];

        int updatedCoins = currentCoins + 999;

        await FirebaseFirestore.instance
            .collection('userSignupData')
            .doc(removeInterestBySeller['userId'])
            .update({'autoMatesCoin': updatedCoins});
      }
    launchWhatsApp(
      phoneNumber: removeInterestBySeller['userContact'], 
      message: 'Hello ${removeInterestBySeller['userName']} ✋.We have Removed the interest for ${removeInterestBySeller['CarBrand']} ${removeInterestBySeller['carName']} with RegNo. ${removeInterestBySeller['carNumber']}. Your payment will be Refunded to AutoMates Coin.'
    );
  }else{
    UserData? user = await fetchUserDetails();
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('userSignupData')
          .doc(user.id)
          .get();

      if (userDoc.exists) {
        var data = userDoc.data() as Map<String, dynamic>;
        int currentCoins = data['autoMatesCoin'];

        int updatedCoins = currentCoins + 399;

        await FirebaseFirestore.instance
            .collection('userSignupData')
            .doc(user.id)
            .update({'autoMatesCoin': updatedCoins});
      }
    }
  }
  if (noData == true) {
    snackbarWidget('Sorry this car is been sold or removed by the seller', context,
        Colors.red, Colors.white, SnackBarBehavior.floating);
  } else {
    snackbarWidget('User interest removed', context, Colors.red, Colors.white,
        SnackBarBehavior.floating);
  }
  buyScreenBloc.add(InterstButtonClickedRebuildUiEvent());
}


updateTheSellerViewdStatus({docId})async{
  try{
     await FirebaseFirestore.instance
        .collection('userInterestMarked')
        .doc(docId)
        .update({'sellerViewed': 'yes'});
  }
  catch (e){
    log(e.toString());
  }
}

Future<void> deleteSoldCar({String? documentId}) async {
  try {
    await FirebaseFirestore.instance
        .collection('soldcars')
        .doc(documentId)
        .delete();
  } catch (e) {
    log(e.toString());
  }
}

Future<void> changeSellersSubscriptionPlan({required String sellerId}) async {
  try {
    final sellerDocRef = FirebaseFirestore.instance
        .collection('sellerSignupData')
        .doc(sellerId);
    await sellerDocRef.update({
      'plan': 'unSubscribed',
    });
  } catch (e) {
    log(e.toString());
  }
}


double parsePrice(String priceString) {
  String cleanedPriceString = priceString.replaceAll(',', '');
  return double.tryParse(cleanedPriceString) ?? 0.0;
}
