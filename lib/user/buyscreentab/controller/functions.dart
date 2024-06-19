// ignore_for_file: use_build_context_synchronously

import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/buyscreentab/model/buyscreen_model.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/buy_screen.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/filter_car_screen/car_brands/filter_with_car_brands.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

final CollectionReference userFavouriteCars =
    FirebaseFirestore.instance.collection('userFavouriteCars');

Future<void> addCarToUserFavourite({data, context, isFromSearch,favouriteIconBlocInstance}) async {
  UserData? userData = await fetchUserDetails();
  String userName = userData!.userName;
  String userContact = userData.mobile;

  try {
    QuerySnapshot existingCar = await userFavouriteCars
        .where('carToSellId',
            isEqualTo: (isFromSearch == true) ? data['id'] : data.id)
        .where('userContact', isEqualTo: userContact)
        .get();

    if (existingCar.docs.isNotEmpty) {
      snackbarWidget('Car is already in favourites', context, Colors.red,
          Colors.white, SnackBarBehavior.floating);
      return;
    }

    Map<String, dynamic> carData = {
      'userName': userName,
      'userContact': userContact,
      'sellerId': data['sellerId'],
      'image': data['image'],
      'thumbnail':data['thumbnail'],
      'carToSellId': (isFromSearch == true) ? data['id'] : data.id,
      'brand': data['brand'],
      'modelName': data['modelName'],
      'color': data['color'],
      'year': data['year'],
      'price': data['price'],
      'fuel': data['fuel'],
      'kilometer': data['kilometer'],
      'regNumber': data['regNumber'],
      'noOfOwners': data['noOfOwners'],
      'transmission': data['transmission'],
      'insurance': data['insurance'],
      'seat': data['seat'],
      'milage': data['milage'],
      'sunroof': data['sunroof'],
      'bootspace': data['bootspace'],
      'infotainment': data['infotainment'],
      'alloywheel': data['alloywheel'],
      'carheight': data['carheight'],
      'carwidth': data['carwidth'],
      'carlength': data['carlength'],
      'groundclearance': data['groundclearance'],
      'airbag': data['airbag'],
      'airconditioner': data['airconditioner'],
      'powerwindow': data['powerwindow'],
      'bodytype': data['bodytype'],
      'fueltank': data['fueltank'],
      'overview': data['overview'],
    };

    await userFavouriteCars.add(carData);
    favouriteIconBlocInstance.add(FavouriteButtonClickedRebuildUiEvent());
    snackbarWidget('Car added to favourites', context, Colors.green,
        Colors.white, SnackBarBehavior.floating);
  } catch (e) {
    snackbarWidget('Failed to add car to favourites', context, Colors.blueGrey,
        Colors.white, SnackBarBehavior.floating);
  }
}

Future<void> checkIfFavourite({id, isFavOrNotValueNotifier}) async {
  final CollectionReference userFavouriteCars =
      FirebaseFirestore.instance.collection('userFavouriteCars');

  final QuerySnapshot isOrNot =
      await userFavouriteCars.where('carToSellId', isEqualTo: id).get();

  if (isOrNot.docs.isNotEmpty) {
    isFavOrNotValueNotifier.value = true;
    isFavOrNotValueNotifier.notifyListeners();
  } else {
    isFavOrNotValueNotifier.value = false;
    isFavOrNotValueNotifier.notifyListeners();
  }
}

final CollectionReference userInterestMarked =
    FirebaseFirestore.instance.collection('userInterestMarked');

Future<void> markUserInterest({context, car, isFromSearch}) async {
  UserData? userData = await fetchUserDetails();
  String userName = userData!.userName;
  String userContact = userData.mobile;
  String userLocation = userData.location;

  final sellerDetails = await getSellerDetailsById(car['sellerId']);

  final QuerySnapshot existingDocs = await userInterestMarked
      .where('userContact', isEqualTo: userContact)
      .where('carId', isEqualTo: (isFromSearch == true) ? car['id'] : car.id)
      .get();

  if (existingDocs.docs.isEmpty) {
    final data = {
      'userName': userName,
      'userContact': userContact,
      'userLocation': userLocation,
      'carImage': car['thumbnail'],
      'carName': car['modelName'],
      'CarBrand': car['brand'],
      'carNumber': car['regNumber'],
      'carSellerId': car['sellerId'],
      'carId': (isFromSearch == true) ? car['id'] : car.id,
      'carRate': car['price'],
      'sellerName': sellerDetails!.companyName,
    };
    userInterestMarked.add(data);
    buyScreenBloc.add(InterstButtonClickedRebuildUiEvent());
    snackbarWidget('Your interest is been marked', context, Colors.blue,
        Colors.white, SnackBarBehavior.floating);
    Navigator.of(context).pop();
  } else {
    snackbarWidget(
        'Interest already marked for this car. Seller will contact you in short',
        context,
        Colors.blue,
        Colors.white,
        SnackBarBehavior.floating);
    Navigator.of(context).pop();
  }
}

Future<SellerData?> getSellerDetailsById(String sellerId) async {
  await Future.delayed(const Duration(milliseconds: 400));
  final CollectionReference sellerSignupFirebaseObject =
      FirebaseFirestore.instance.collection('sellerSignupData');
  try {
    QuerySnapshot querySnapshot = await sellerSignupFirebaseObject.get();
    for (var doc in querySnapshot.docs) {
      if (doc.id == sellerId) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        SellerData sellerDetails = SellerData(
          id: doc.id,
          companyName: data['companyName'],
          location: data['location'],
          mobile: data['mobile'],
        );
        return sellerDetails;
      }
    }
  } catch (e) {
    return null;
  }
  return null;
}

makeCall({mobileNumber, context}) async {
  final url = Uri.parse('tel:$mobileNumber');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
    Navigator.pop(context);
  } else {
    snackbarWidget('Could not launch call app', context, Colors.red,
        Colors.white, SnackBarBehavior.floating);
  }
}

Future<List<Map<String, dynamic>>> checkIfUserInterestedCar({carId}) async {
  List<Map<String, dynamic>> result = [];
  final sharedPref = await SharedPreferences.getInstance();
  dynamic mobile = sharedPref.getString('mobile');
  try {
    QuerySnapshot existingCarInterested = await userInterestMarked
        .where('carId', isEqualTo: carId)
        .where('userContact', isEqualTo: mobile)
        .get();
    for (var doc in existingCarInterested.docs) {
      result.add({'id': doc.id, ...doc.data() as Map<String, dynamic>});
    }
    return result;
  } catch (e) {
    return [];
  }
}

Future<List<Map<String, dynamic>>> isCarToSellInUserFavourite({
  carToSellId,
}) async {
  List<Map<String, dynamic>> result = [];
  final sharedPref = await SharedPreferences.getInstance();
  dynamic mobile = sharedPref.getString('mobile');
  try {
    QuerySnapshot isFavourite = await userFavouriteCars
        .where('carToSellId', isEqualTo: carToSellId)
        .where('userContact', isEqualTo: mobile)
        .get();
    for (var doc in isFavourite.docs) {
      result.add({'id': doc.id, ...doc.data() as Map<String, dynamic>});
    }
    return result;
  } catch (e) {
    return [];
  }
}

String getSelectedFuelType() {
  for (var fuel in fuelTypes) {
    if (selectedCarFilterdList.contains(fuel.fuelType)) {
      return fuel.fuelType;
    }
  }
  return 'Fuel Types';
}


Future<List<DocumentSnapshot>> findCarForRelatedCars({required dynamic data,required carNumber}) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('carstosell')
      .where('bodytype', isEqualTo: data)
      .get();
      List<DocumentSnapshot> filteredDocs = querySnapshot.docs.where((doc) => doc['regNumber'] != carNumber).toList();
  return filteredDocs;
}


final CollectionReference favouriteSellerAddedByUser =
    FirebaseFirestore.instance.collection('FavouriteSeller');


Future<void> addSellerToFavourite({context,sellerData,sellerFavIconBlocInstance})async{
  UserData? userData = await fetchUserDetails();
  try{

    QuerySnapshot existingFavSeller = await favouriteSellerAddedByUser
        .where('sellerMobile',isEqualTo: sellerData.mobile)
        .where('userContact', isEqualTo: userData!.mobile)
        .get();

    if (existingFavSeller.docs.isNotEmpty) {
      snackbarWidget('Seller is already in favourite', context, Colors.red,
          Colors.white, SnackBarBehavior.floating);
      return;
    }

    Map<String,dynamic> data={
      'sellerName':sellerData.companyName,
      'sellerMobile':sellerData.mobile,
      'sellerLocation':sellerData.location,
      'userName':userData.userName,
      'userContact':userData.mobile
    };
    await favouriteSellerAddedByUser.add(data);
    sellerFavIconBlocInstance.add(SellerAddedToFavouriteButtonRefreshEvent());
    snackbarWidget('Seller marked as favourite', context, Colors.green,
        Colors.white, SnackBarBehavior.floating);
  } catch(e){
    snackbarWidget('Failed to add car to favourites', context, Colors.blueGrey,
        Colors.white, SnackBarBehavior.floating);
  }
}

Future<List<Map<String, dynamic>>> isSellerInFavourites({
  sellerDetails,
}) async {
  List<Map<String, dynamic>> result = [];
  final sharedPref = await SharedPreferences.getInstance();
  dynamic userMobile = sharedPref.getString('mobile');
  try {
    QuerySnapshot isSellerFavourite = await favouriteSellerAddedByUser
        .where('sellerMobile', isEqualTo: sellerDetails.mobile)
        .where('userContact', isEqualTo: userMobile)
        .get();
    for (var doc in isSellerFavourite.docs) {
      result.add({'id': doc.id, ...doc.data() as Map<String, dynamic>});
    }
    return result;
  } catch (e) {
    return [];
  }
}

removeSellerFromFavourites({context,docId,sellerFavIconBlocInstance}){
  favouriteSellerAddedByUser.doc(docId).delete();
  sellerFavIconBlocInstance.add(SellerAddedToFavouriteButtonRefreshEvent());
  snackbarWidget('Seller removed from favourites', context, Colors.red, Colors.white, SnackBarBehavior.floating);
}

