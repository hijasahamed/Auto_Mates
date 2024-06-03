import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/bloc/seller_profile_bloc.dart';
import 'package:auto_mates/user/authentications/view/user_login_screen.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/splashscreen/controllers/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

sellerLogout({
  context,
}) async {
  await Future.delayed(const Duration(milliseconds: 2500));
  final sharedPref = await SharedPreferences.getInstance();
  await sharedPref.setBool(sellerLogedInKey, false);
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => UserLoginScreen()));
}

sellerLogoutAlertDialoge({context,screenSize,sellerProfileBloc}) {
  return showDialog(
    barrierColor: Colors.black54,
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const MyTextWidget(
            text: 'Logout',
            color: Color(0xFF424141),
            size: 26,
            weight: FontWeight.bold),
        content: const MyTextWidget(
            text: 'Do you want to Logout from AutoMates',
            color: Color(0xFF424141),
            size: 15,
            weight: FontWeight.bold),
        actions: [
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black26)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const MyTextWidget(
                  text: 'Back',
                  color: Colors.white,
                  size: 12,
                  weight: FontWeight.bold)),
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red)),
              onPressed: () {
               sellerProfileBloc.add(SellerLogoutConfirmButtonClickedEvent());
              },
              child: const MyTextWidget(
                  text: 'Logout',
                  color: Colors.white,
                  size: 12,
                  weight: FontWeight.bold)),
        ],
      );
    },
  );
}

removeUserInterestAlertDialog({context,docId}){
  return showDialog(
    context: context, 
    builder: (context) {
      return AlertDialog(
        title: const MyTextWidget(
            text: 'Remove Interest',
            color: Color(0xFF424141),
            size: 20,
            weight: FontWeight.bold),
        content: const MyTextWidget(
            text: "Permenently remove this user's interest",
            color: Color(0xFF424141),
            size: 13,
            weight: FontWeight.bold),
        actions: [
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black26)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const MyTextWidget(
                  text: 'Back',
                  color: Colors.white,
                  size: 12,
                  weight: FontWeight.bold)),
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red)),
              onPressed: () {
                removeUsersInterest(context: context,docId: docId);
              },
              child: const MyTextWidget(
                  text: 'Remove',
                  color: Colors.white,
                  size: 12,
                  weight: FontWeight.bold)),
        ],
      );
    },
  );
}

Stream<QuerySnapshot> getUsersInterestsWithSellerId(sellerId){  
  return FirebaseFirestore.instance
  .collection('userInterestMarked')
  .where('carSellerId',isEqualTo: sellerId)
  .snapshots();
}

removeUsersInterest({context,docId}){
  userInterestMarked.doc(docId).delete(); 
  snackbarWidget('User interest removed', context,Colors.red, Colors.white, SnackBarBehavior.floating);
}

callCarInterestedCustomer({context,data,screenSize}){
  return showDialog(
    context: context, 
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Container(
          height: screenSize.height/6,
          width: screenSize.width/6,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(data['carImage']),fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10)
          ),         
        ),
        content: SizedBox(
          height: screenSize.height/5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextWidget(text: 'Car model : ${data['carName']}', color: Colors.black, size: 18, weight: FontWeight.bold),
              const Spacer(),
              MyTextWidget(
                text: '${data['userName']} from ${data['userLocation']} has marked a interest on this car with Registration number ${data['carNumber']}', 
                color: Colors.black, 
                size: 14, weight:FontWeight.bold,
                maxline: true,),
                const Spacer(),
              const MyTextWidget(text: 'To make a deal with this customer contact in the below number', color: Colors.blue, size: 15, weight: FontWeight.bold,maxline: true,)
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              makeCall(context: context,mobileNumber: data['userContact']);
            }, 
            style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.green)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MyTextWidget(text: 'Call', color: Colors.white, size: 16, weight: FontWeight.bold),
                SizedBox(width: screenSize.width/50,),
                MyTextWidget(text: '+91 ${data['userContact']}', color: Colors.white, size: 16, weight: FontWeight.bold)
              ],
            )
          )
        ],
      );
    },
  );
}