


import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/authentications/view/user_login_screen.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:auto_mates/user/splashscreen/controllers/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserData?> fetchUserDetails()async{
  final sharedPref=await SharedPreferences.getInstance();
  dynamic id= sharedPref.getString('id');
  dynamic email= sharedPref.getString('email');
  dynamic userName= sharedPref.getString('userName');
  dynamic location= sharedPref.getString('location');
  dynamic mobile= sharedPref.getString('mobile');
  dynamic userProfile =sharedPref.getString('userProfile');
  return UserData(id: id, email: email, userName: userName,location: location,mobile: mobile,userProfile: userProfile);
}

Future<void> confirmUserLogout({context}) async {
  final GoogleSignIn googleSignInn = GoogleSignIn();
  await googleSignInn.signOut();
  await FirebaseAuth.instance.signOut();
  final sharedPref = await SharedPreferences.getInstance();
  await sharedPref.setBool(logedInKey, false); 
}


Future<void> removeFavoriteCar({docId,context,favouriteIconBlocInstance})async{
  userFavouriteCars.doc(docId).delete();
  if(favouriteIconBlocInstance !=null){
    favouriteIconBlocInstance.add(FavouriteButtonClickedRebuildUiEvent());
  }
  snackbarWidget('Car Removed from favourites', context,Colors.red, Colors.white, SnackBarBehavior.floating);
}


Stream<QuerySnapshot> getUsersInterestedCars(String userContact) {
  return FirebaseFirestore.instance
      .collection('userInterestMarked')
      .where('userContact', isEqualTo: userContact)
      .snapshots();
}

Stream<QuerySnapshot> getUsersFavouriteCars({String? userContact}){
  return FirebaseFirestore.instance
  .collection('userFavouriteCars')
  .where('userContact',isEqualTo: userContact)
  .snapshots();
}

Stream<QuerySnapshot> getUsersFavouriteSellers({String? userContact}){
  return FirebaseFirestore.instance
  .collection('FavouriteSeller')
  .where('userContact',isEqualTo: userContact)
  .snapshots();
}


Future<DocumentSnapshot?> getCarDetailFromInterestedCarsList({carNumber}) async {
  try{
      final querySnapshot = await FirebaseFirestore.instance
      .collection('carstosell')
      .where('regNumber', isEqualTo: carNumber) 
      .get();
  
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first;
    } else {
      return null;
    }
  } catch (e){
    return null;
  }
}


Future<List<DocumentSnapshot>> getFavouriteSellersAllCars({sellerId}) async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    
    QuerySnapshot querySnapshot = await firestore
        .collection('carstosell')
        .where('sellerId', isEqualTo: sellerId)
        .get();
        
    List<DocumentSnapshot> documents = querySnapshot.docs;

    return documents;
  } catch (e) {
    if (kDebugMode) {
      print('Error getting documents: $e');
    }
    return [];
  }
}
