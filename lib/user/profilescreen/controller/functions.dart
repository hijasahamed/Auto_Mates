
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/authentications/view/user_login_screen.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:auto_mates/user/splashscreen/controllers/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

// profileScreenAlertMessage({context, profileScreenBloc,removeInterestMarked,interestedData}) {
//   return showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         backgroundColor: Colors.white,
//         title: MyTextWidget(
//             text: removeInterestMarked? 'Remove Interest' : 'Logout',
//             color: const Color(0xFF424141),
//             size: 24,
//             weight: FontWeight.bold),
//         content: MyTextWidget(
//             text: removeInterestMarked? 'Do you want to remove the interest? This will be removed for the seller also.': 'Do you want to Logout from AutoMates',
//             color: const Color(0xFF424141),
//             size: 15,
//             maxline: true,
//             weight: FontWeight.bold),
//         actions: [
//           ElevatedButton(
//               style: const ButtonStyle(
//                   backgroundColor: WidgetStatePropertyAll(Colors.black26)),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const MyTextWidget(
//                   text: 'Back',
//                   color: Colors.white,
//                   size: 12,
//                   weight: FontWeight.bold)),
//           ElevatedButton(
//               style: const ButtonStyle(
//                   backgroundColor: WidgetStatePropertyAll(Colors.red)),
//               onPressed: () {
//                 removeInterestMarked? removeUsersInterest(context: context,docId: interestedData.id) : profileScreenBloc.add(ConfirmLogoutEvent());
//                 Navigator.pop(context);
//               },
//               child: MyTextWidget(
//                   text: removeInterestMarked? 'Remove Interest' : 'Logout',
//                   color: Colors.white,
//                   size: 12,
//                   weight: FontWeight.bold)),
//         ],
//       );
//     },
//   );
// }

Future<void> confirmUserLogout({context}) async {
  final GoogleSignIn googleSignInn = GoogleSignIn();
  await googleSignInn.signOut();
  await FirebaseAuth.instance.signOut();
  final sharedPref = await SharedPreferences.getInstance();
  await sharedPref.setBool(logedInKey, false); 
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => UserLoginScreen(),
  ));
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