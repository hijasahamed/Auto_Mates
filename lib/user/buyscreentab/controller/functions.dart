// ignore_for_file: use_build_context_synchronously

import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

final CollectionReference userFavouriteCars =
    FirebaseFirestore.instance.collection('userFavouriteCars');

Future<void> addCarToUserFavourite(
    {required DocumentSnapshot data, required context}) async {

    UserData? userData = await fetchUserDetails();
    String userName = userData!.userName;
    String userContact = userData.mobile;

  try {
    QuerySnapshot existingCar =
        await userFavouriteCars.where('carToSellId', isEqualTo: data.id).where('userContact', isEqualTo: userContact).get();

    if (existingCar.docs.isNotEmpty) {
      snackbarWidget('Car is already in favourites', context, Colors.red,
          Colors.white, SnackBarBehavior.floating);
      return;
    }
    

    Map<String, dynamic> carData = {
      'userName':userName,
      'userContact':userContact,
      'sellerId': data['sellerId'],
      'image': data['image'],
      'carToSellId': data.id,
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

Future<void> markUserInterest({
  context,
  car,
}) async {
  UserData? userData = await fetchUserDetails();
  String userName = userData!.userName;
  String userContact = userData.mobile;
  String userLocation = userData.location;

  final QuerySnapshot existingDocs =
      await userInterestMarked.where('userContact', isEqualTo: userContact).where('carId', isEqualTo: car.id).get();

  if (existingDocs.docs.isEmpty) {
    final data = {
      'userName': userName,
      'userContact': userContact,
      'userLocation': userLocation,
      'carImage': car['image'],
      'carName': car['modelName'],
      'CarBrand': car['brand'],
      'carNumber': car['regNumber'],
      'carSellerId': car['sellerId'],
      'carId':car.id,
      'carRate': car['price']
    };
    userInterestMarked.add(data);
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
  await Future.delayed(const Duration(milliseconds: 1000));
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

void sellerDetailsAlertDialog(
    {required BuildContext context, required dynamic data}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const MyTextWidget(
            text: 'Contact Seller',
            color: Colors.black,
            size: 20,
            weight: FontWeight.bold),
        content: MyTextWidget(
            text: '${data.companyName}',
            color: Colors.black,
            size: 17,
            weight: FontWeight.w500),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red)),
            child: const MyTextWidget(text: 'Back', color: Colors.white, size: 15, weight: FontWeight.bold)
          ),
          ElevatedButton.icon(
            onPressed: () async {
              makeCall(context: context,mobileNumber: data.mobile);
            },
            icon: const Icon(Icons.call, color: Colors.white),
            label: const MyTextWidget(text: 'Call now', color: Colors.white, size: 15, weight: FontWeight.bold),
            style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.green)),
          ),
        ],
      );
    },
  );
}


makeCall({mobileNumber,context})async{
  final url = Uri.parse('tel:$mobileNumber');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
    Navigator.pop(context);
  } else {
    snackbarWidget('Could not launch call app', context, Colors.red, Colors.white, SnackBarBehavior.floating);
  }
}


Future<List<Map<String, dynamic>>>  checkIfUserInterestedCar({carId})async{
  List<Map<String, dynamic>> result = [];
  final sharedPref=await SharedPreferences.getInstance();
  dynamic mobile= sharedPref.getString('mobile');
  try{
    QuerySnapshot existingCarInterested= await userInterestMarked
        .where('carId', isEqualTo: carId)
        .where('userContact', isEqualTo: mobile)
        .get();
    for(var doc in existingCarInterested.docs){
      result.add({'id':doc.id,...doc.data() as Map<String,dynamic>});
    }
    return result;
  }catch (e){
    return [];
  }
}