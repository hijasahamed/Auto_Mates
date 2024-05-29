import 'package:auto_mates/seller/authentications/controllers/functions.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
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
      'image': data['image'],
      'UnId':data.id,
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


final CollectionReference userInterestMarked = FirebaseFirestore.instance.collection('userInterestMarked');

Future<void> markUserInterest ({context,carImage,carName,carNumber,})async{
  UserData? userData=await fetchUserDetails();
  String userName=userData!.userName;
  String userContact = userData.mobile;
  String userLocation = userData.location;
  
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


Future<SellerData?> getSellerDetailsById(String sellerId) async {
  await Future.delayed(const Duration(milliseconds: 1300));
  final CollectionReference sellerSignupFirebaseObject = FirebaseFirestore.instance.collection('sellerSignupData');
  try{
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
  }catch (e) {    
    return null;
  }
  return null;
}