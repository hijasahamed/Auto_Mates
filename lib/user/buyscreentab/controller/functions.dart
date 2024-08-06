// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/buy_screen.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:permission_handler/permission_handler.dart';
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
  String userId = userData.id;

  final sellerDetails = await getSellerDetailsById(car['sellerId']);

  final QuerySnapshot existingDocs = await userInterestMarked
      .where('userId', isEqualTo: userId)
      .where('carId', isEqualTo: (isFromSearch == true) ? car['id'] : car.id)
      .get();

  if (existingDocs.docs.isEmpty) {
    final data = {
      'userId' : userId,
      'userName': userName,
      'userContact': userContact,
      'userLocation': userLocation,
      'sellerViewed' : 'no',
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
    snackbarWidget('Your interest is been marked', context, Colors.green,
        Colors.white, SnackBarBehavior.floating);
    Navigator.of(context).pop();
  } else {
    return;
  }
}

Future<SellerData?> getSellerDetailsById(String sellerId) async {
  final CollectionReference sellerSignupFirebaseObject =
      FirebaseFirestore.instance.collection('sellerSignupData');
  try {
    QuerySnapshot querySnapshot = await sellerSignupFirebaseObject.get();
    for (var doc in querySnapshot.docs) {
      if (doc.id == sellerId) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        SellerData sellerDetails = SellerData(
          sellerProfile:data['sellerProfile'],
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
      'sellerProfile':sellerData.sellerProfile,
      'sellerName':sellerData.companyName,
      'sellerMobile':sellerData.mobile,
      'sellerLocation':sellerData.location,
      'sellerId':sellerData.id,
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

removeSellerFromFavourites({context,docId,sellerFavIconBlocInstance, bool? backNavigation}){
  favouriteSellerAddedByUser.doc(docId).delete();
  if(sellerFavIconBlocInstance !=null ){
    sellerFavIconBlocInstance.add(SellerAddedToFavouriteButtonRefreshEvent());
  }
  if(backNavigation == true){
    Navigator.pop(context);
  }
  snackbarWidget('Seller removed from favourites', context, Colors.red, Colors.white, SnackBarBehavior.floating);
}

// Filtering Section

final List<Map<String, dynamic>> filterdCarList = [];
BuyScreenBloc filterCarLengthBlocInstance = BuyScreenBloc(); 

Future<void> filterCars({
  required String value,
  required String deletionKey,
  required String carToSellField,
  required List<Map<String, dynamic>> filterdCarList,
}) async {

  final CollectionReference carsCollection = FirebaseFirestore.instance.collection('carstosell');
  Query query = carsCollection.where(carToSellField, isEqualTo: value);
  QuerySnapshot querySnapshot = await query.get();

  for (var doc in querySnapshot.docs) {
    Map<String, dynamic> carData = doc.data() as Map<String, dynamic>;
    carData['deletionKey'] = deletionKey;
    bool exists = filterdCarList.any((car) => car['regNumber'] == carData['regNumber']);
    if (!exists) {
      filterdCarList.add(carData);
    }
    else{
      filterdCarList.removeWhere((car) => car['regNumber'] == carData['regNumber'] && car['deletionKey'] == carData['deletionKey']);
    }
  }
  filterCarLengthBlocInstance.add(ApplyFilterButtonTextRefreshEvent());
}

Future<void> filterCarsWithSeat({
  required String value,
  required String carToSellField,
  required List<Map<String, dynamic>> filterdCarList,
}) async {
  int? valInt = int.tryParse(value);
  final CollectionReference carsCollection = FirebaseFirestore.instance.collection('carstosell');
 QuerySnapshot querySnapshot = await carsCollection.get();

  for (var doc in querySnapshot.docs) {
    Map<String, dynamic> carData = doc.data() as Map<String, dynamic>;
    carData['seatDeletionKey'] = 'deleteWithSeat';
    String fieldValueStr = carData[carToSellField].toString();
    int? fieldValueInt = int.tryParse(fieldValueStr);
    if (fieldValueInt != null && fieldValueInt == valInt) {
      bool exists = filterdCarList.any((car) => car['regNumber'] == carData['regNumber']);
      if (!exists) {
        filterdCarList.add(carData);
      }
      else{
        bool containsDeletionKey = filterdCarList.any((car) => car.containsKey('seatDeletionKey'));
        if(containsDeletionKey){       
          filterdCarList.removeWhere((car) => car['regNumber'] == carData['regNumber'] && car['seatDeletionKey'] == carData['seatDeletionKey']);
        }    
      }
    }
  }
  filterCarLengthBlocInstance.add(ApplyFilterButtonTextRefreshEvent());
}

Future<void> filterCarsWithBudget({
  required int index,
  required String value,
  required String carToSellField,
  required List<Map<String, dynamic>> filterdCarList,
}) async {
  dynamic budget = value.split(' ').last;
  dynamic valInt = int.tryParse(budget);
  final CollectionReference carsCollection = FirebaseFirestore.instance.collection('carstosell');
 QuerySnapshot querySnapshot = await carsCollection.get();

  for (var doc in querySnapshot.docs) {
    Map<String, dynamic> carData = doc.data() as Map<String, dynamic>;
    carData['budgetDeletionKey'] = 'deleteWithbudget';
    String fieldValueStr = carData[carToSellField].toString();
    dynamic intbudget = fieldValueStr.split('.').first;
    int? fieldValueInt = int.tryParse(intbudget);
    if (index<10?fieldValueInt != null && fieldValueInt < valInt:fieldValueInt != null && fieldValueInt > valInt) {
      bool exists = filterdCarList.any((car) => car['regNumber'] == carData['regNumber']);
      if (!exists) {
        filterdCarList.add(carData);
      }
      else{
        bool containsDeletionKey = filterdCarList.any((car) => car.containsKey('budgetDeletionKey'));
        if(containsDeletionKey){       
          filterdCarList.removeWhere((car) => car['regNumber'] == carData['regNumber'] && car['budgetDeletionKey'] == carData['budgetDeletionKey']);
        }
      }
    }
  }
  filterCarLengthBlocInstance.add(ApplyFilterButtonTextRefreshEvent());
}




// show seller loc on map

void checkLocationPermissionToViewSellerMap(double lat, double lng) async {
  PermissionStatus locationStatus = await Permission.location.request();
  if (locationStatus.isGranted) {
    openGoogleMaps(lat, lng);
  } else if (locationStatus.isDenied) {
  } else if (locationStatus.isPermanentlyDenied) {
    openAppSettings();
  }
}

TileLayer get openmap => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
  );


Future<void> openGoogleMaps(double lat, double lng) async {
  final googleMapsUrl =
      Uri.parse("https://www.google.com/maps/search/?api=1&query=$lat,$lng");

  await launchUrl(googleMapsUrl);
}


Future<Map<String, double>?> getMapLocationFromSeller(String sellerId) async {
  final CollectionReference sellerSignupFirebaseObject =
      FirebaseFirestore.instance.collection('sellerSignupData');
  try {
    DocumentSnapshot docSnapshot = await sellerSignupFirebaseObject.doc(sellerId).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data() as Map<String, dynamic>?;
      if (data != null && data.containsKey('mapLocation')) {
        Map<String, dynamic> mapLocation = data['mapLocation'];
        return {
          'lat': mapLocation['lat'],
          'long': mapLocation['long'],
        };
      }
    }
  } catch (e) {
    log(e.toString());
  }
  return null;
}

// seller rating section

Stream<double> getAverageRating({required String documentId}) async* {
  final CollectionReference collection = FirebaseFirestore.instance.collection('sellerSignupData');
  
  yield* collection.doc(documentId).snapshots().map((snapshot) {
    if (snapshot.exists) {
      final data = snapshot.data() as Map<String, dynamic>;
      List<dynamic> ratings = data['rating'] ?? [];
      
      if (ratings.isNotEmpty) {
        List doubleRatings = ratings.map((e) => e.toDouble()).toList();
        double sum = doubleRatings.fold(0.0, (previousValue, element) => previousValue + element);
        double average = sum / doubleRatings.length;
        return double.parse((average).toStringAsFixed(1));
      }
    }
    return 0.0;
  });
}

Stream<int> getNumberOfRating({required String documentId}) async* {
  final CollectionReference collection = FirebaseFirestore.instance.collection('sellerSignupData');
  
  yield* collection.doc(documentId).snapshots().map((snapshot) {
    if (snapshot.exists) {
      final data = snapshot.data() as Map<String, dynamic>;
      List<dynamic> ratings = data['rating'] ?? [];
      
      if (ratings.isNotEmpty) {
        List doubleRatings = ratings.map((e) => e.toDouble()).toList();
        return doubleRatings.length;
      }
    }
    return 0;
  });
}


// update automates coin after deduction

Future<void> updatePointsAfterDeduction(String userId, int deductedAmt) async {
  try {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('userSignupData')
        .doc(userId)
        .get();

    if (userDoc.exists) {
      var data = userDoc.data() as Map<String, dynamic>;
      int currentCoins = data['autoMatesCoin'] ?? 0;

      int updatedCoins = currentCoins - deductedAmt;

      await FirebaseFirestore.instance
          .collection('userSignupData')
          .doc(userId)
          .update({'autoMatesCoin': updatedCoins});

    } else {
      return;
    }
  } catch (e) {
    return;
  }
}