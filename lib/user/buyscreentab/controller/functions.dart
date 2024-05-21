
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final CollectionReference userFavouriteCars = FirebaseFirestore.instance.collection('userFavouriteCars');

Future<void> addCarToUserFavourite({required DocumentSnapshot data, required context}) async {

  Map<String, dynamic> carData = {
    'brand': data['brand'],
    'modelName': data['modelName'],
    'year': data['year'],
    'kilometer': data['kilometer'],
    'price': data['price'],
    'image': data['image'],
    'color': data['color'],
    'fuel': data['fuel'],
  };

  try {
    await userFavouriteCars.add(carData);
    snackbarWidget('Car added to favourites successfully', context, Colors.blue, Colors.white, SnackBarBehavior.floating);
  } catch (e) {
    snackbarWidget('Failed to add car to favourites: $e', context, Colors.blueGrey, Colors.white, SnackBarBehavior.floating);
  }
}

Future<void> removeFavoriteCar({docId,context})async{
  userFavouriteCars.doc(docId).delete();
  snackbarWidget('Car Removed from favourites', context,Colors.blue, Colors.white, SnackBarBehavior.floating);
}

