import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final CollectionReference userFavouriteCars = FirebaseFirestore.instance.collection('userFavouriteCars');

Future<void> addCarToUserFavourite({required DocumentSnapshot data, required context}) async {
  try {
    QuerySnapshot existingCar = await userFavouriteCars
        .where('UnId', isEqualTo: data.id)
        .get();

    if (existingCar.docs.isNotEmpty) {
      snackbarWidget('Car is already in favourites', context, Colors.blue, Colors.white, SnackBarBehavior.floating);
      return;
    }

    Map<String, dynamic> carData = {
      'brand': data['brand'],
      'modelName': data['modelName'],
      'year': data['year'],
      'kilometer': data['kilometer'],
      'price': data['price'],
      'image': data['image'],
      'color': data['color'],
      'fuel': data['fuel'],
      'regNumber':data['regNumber'],
      'UnId':data.id,
    };

    await userFavouriteCars.add(carData);
    snackbarWidget('Car added to favourites successfully', context, Colors.blue, Colors.white, SnackBarBehavior.floating);
  } catch (e) {
    snackbarWidget('Failed to add car to favourites', context, Colors.blueGrey, Colors.white, SnackBarBehavior.floating);
  }
}

Future<void> checkIfFavourite({id,isFavOrNotValueNotifier}) async {
    final CollectionReference userFavouriteCars = FirebaseFirestore.instance.collection('userFavouriteCars');

    final QuerySnapshot isOrNot = await userFavouriteCars.where('UnId', isEqualTo: id).get();

    if (isOrNot.docs.isNotEmpty) {
    isFavOrNotValueNotifier.value = true;
  } else {
    isFavOrNotValueNotifier.value = false; 
  }
  }


Future<void> markUserInterest ({context,carImage,carName,carNumber,})async{
  UserData? userData=await fetchUserDetails();
  String userName=userData!.userName;
  String userContact = userData.mobile;
  String userLocation = userData.location;
  final CollectionReference userInterestMarked = FirebaseFirestore.instance.collection('userInterestMarked');
  final QuerySnapshot existingDocs = await userInterestMarked
      .where('carNumber', isEqualTo: carNumber)
      .get();
      
  if(existingDocs.docs.isEmpty){
    final data={ 
     'userName': userName,
     'userContact' : userContact,
     'userLocation' : userLocation,
     'carImag' : carImage,
     'carName': carName,
     'carNumber' : carNumber
    };
    userInterestMarked.add(data);     
    snackbarWidget('Your interest is been marked', context, Colors.blue,Colors.white, SnackBarBehavior.floating);
    Navigator.of(context).pop();
  }else{
    snackbarWidget('Interest already marked for this car. Seller will contact you in short', context, Colors.blue,Colors.white, SnackBarBehavior.floating);
    Navigator.of(context).pop();
  }
 
}


