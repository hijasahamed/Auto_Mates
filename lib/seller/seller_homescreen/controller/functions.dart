// ignore_for_file: use_build_context_synchronously, avoid_print
import 'dart:developer';
import 'dart:io';
import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/seller/seller_appbar_bottombar/controllers/functions.dart';
import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/premium_bottomsheet/premium_bottomsheet.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/single_car_details/get_sold_price/get_sold_price.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final CollectionReference firebaseObject = FirebaseFirestore.instance.collection('carstosell');

SellerHomeScreenBloc refreshAllCarToSellInstance = SellerHomeScreenBloc();


void checkSellerCarCountExeeded({required String sellerId,required SellerHomeScreenBloc sellerHomeScreenBloc,context,screenSize}) async {
  try {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('carstosell')
        .where('sellerId', isEqualTo: sellerId)
        .get();

    final count = querySnapshot.docs.length;

    if (count == 1 || count > 1) {
      showBottomSheetForPremium(context: context,screenSize: screenSize);      
    } else {
      sellerHomeScreenBloc.add(FloatingButtonClickedEvent());
    }

  } catch (e) {
    print('Error checking seller status: $e');
  }
}


postNewCar(
    {required
 BuildContext context,
  postCarFormkey,
  required TextEditingController carBrandController,
  required TextEditingController carModelNameController,
  required TextEditingController carColorController,
  required TextEditingController carYearController,
  required TextEditingController carPriceController,
  required TextEditingController carFuelController,
  required TextEditingController carKilometerController,
  required TextEditingController regNumberController,
  required TextEditingController numOfOwnerController,
  required TextEditingController transmissionController,
  required TextEditingController insuranceController,
  required TextEditingController seatCapacityController,
  required TextEditingController milageController,
  required TextEditingController sunroofController,
  required TextEditingController bootspaceController,
  required TextEditingController infotainmentSystemController,
  required TextEditingController alloyWheelController,
  required TextEditingController carHeightController,
  required TextEditingController carWidthController,
  required TextEditingController carLengthController,
  required TextEditingController groundClearanceController,
  required TextEditingController airBagController,
  required TextEditingController airConditionerController,
  required TextEditingController powerWindowController,
  required TextEditingController bodyTypeController,
  required TextEditingController fuelTankController,
  required TextEditingController overViewController,
  required TextEditingController boughtPriceController,
  sellerHomeScreenBloc
  }) async{
   SellerData? sellerDetails = await fetchSellerDetails();
   if (sellerDetails == null) {
    snackbarWidget('seller data not found', context, Colors.red, Colors.white,SnackBarBehavior.floating);
    sellerHomeScreenBloc.add(PostingCarStopLoadingEvent());
    return;
  }
  List<dynamic> imageUrls = await addMultiImagesToDb();
  String? thumbnailUrl = await addThumbnailToDb();
  final data = {
    'thumbnail':thumbnailUrl,
    'sellerId':sellerDetails.id,
    'sellerPhone':sellerDetails.mobile,
    'sellerName':sellerDetails.companyName,
    'image':imageUrls,
    'brand': carBrandController.text,
    'modelName': carModelNameController.text,
    'color': carColorController.text,
    'year': carYearController.text,
    'price': carPriceController.text,
    'fuel': carFuelController.text,
    'kilometer': carKilometerController.text,
    'regNumber': regNumberController.text,
    'noOfOwners':numOfOwnerController.text,
    'transmission':transmissionController.text,
    'insurance':insuranceController.text,
    'seat':seatCapacityController.text,
    'milage':milageController.text,
    'sunroof':sunroofController.text,
    'bootspace':bootspaceController.text,
    'infotainment':infotainmentSystemController.text,
    'alloywheel':alloyWheelController.text,
    'carheight':carHeightController.text,
    'carwidth':carWidthController.text,
    'carlength':carLengthController.text,
    'groundclearance':groundClearanceController.text,
    'airbag':airBagController.text,
    'airconditioner':airConditionerController.text,
    'powerwindow':powerWindowController.text,
    'bodytype':bodyTypeController.text,
    'fueltank':fuelTankController.text,
    'overview':overViewController.text,
    'boughtPrice':boughtPriceController.text
  };
  if (postCarFormkey.currentState!.validate()){
    firebaseObject.add(data);
    Navigator.of(context).pop();
    snackbarWidget('Car Posted Successfully', context, Colors.green,Colors.white, SnackBarBehavior.floating);
    refreshAllCarToSellInstance.add(AllCarsTOSellEvent());   
  } else {
    snackbarWidget('Car details not completed', context, Colors.red,
        Colors.white, SnackBarBehavior.floating);
  }
  sellerHomeScreenBloc.add(PostingCarStopLoadingEvent());
}

deleteCarToSell(docId,context,sellerHomeScreenBloc,isFromCarDetailsAppBar)async {
 firebaseObject.doc(docId).delete();
 Navigator.of(context).pop();
 if(isFromCarDetailsAppBar==true){
  Navigator.of(context).pop();
 }
  sellerHomeScreenBloc.add(AllCarsTOSellEvent());
  snackbarWidget('Car details removed', context,Colors.red, Colors.white, SnackBarBehavior.floating);
}



Future<void> markSellerCarToSold({carData,markCarsoldBloc,context,screenSize,})async{
   Navigator.pop(context);
   Navigator.pop(context);
    markCarsoldBloc.add(MarkCarSoldLoadingEvent());
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('carstosell').doc(carData.id).get();
    if(documentSnapshot.exists){
      Map<String, dynamic>? carDataToDb = documentSnapshot.data() as Map<String, dynamic>?;
      if(carDataToDb != null){
        carDataToDb['soldAmount'] = soldAmountController.text;
        await FirebaseFirestore.instance.collection('soldcars').add(carDataToDb);
        soldAmountController.clear(); 
      }     
      await FirebaseFirestore.instance.collection('carstosell').doc(carData.id).delete();
      refreshAllCarToSellInstance.add(AllCarsTOSellEvent());
      refreshAllCarToSellInstance.add(MarkCarSoldStopLoadingEvent());
      await deleteExpiredFeaturedCar(carData['regNumber']);                
    }else{
      Navigator.pop(context);
    }
}

updateCarDetails(
   { context,
    docId,
    isFromCarDetailsAppBar,
    postCarFormkey,
    required TextEditingController carBrandController,
  required TextEditingController carModelNameController,
  required TextEditingController carColorController,
  required TextEditingController carYearController,
  required TextEditingController carPriceController,
  required TextEditingController carFuelController,
  required TextEditingController carKilometerController,
  required TextEditingController regNumberController,
  required TextEditingController numOfOwnerController,
  required TextEditingController transmissionController,
  required TextEditingController insuranceController,
  required TextEditingController seatCapacityController,
  required TextEditingController milageController,
  required TextEditingController sunroofController,
  required TextEditingController bootspaceController,
  required TextEditingController infotainmentSystemController,
  required TextEditingController alloyWheelController,
  required TextEditingController carHeightController,
  required TextEditingController carWidthController,
  required TextEditingController carLengthController,
  required TextEditingController groundClearanceController,
  required TextEditingController airBagController,
  required TextEditingController airConditionerController,
  required TextEditingController powerWindowController,
  required TextEditingController bodyTypeController,
  required TextEditingController fuelTankController,
  required TextEditingController overViewController,
  required TextEditingController boughtPriceController,
  } 
  )async {
    
  List<dynamic> imageUrls = await addMultiImagesToDb();
  String? thumbnailUrl = await addThumbnailToDb();
  final data = {
    'thumbnail':thumbnailUrl,
    'image':imageUrls,
    'brand': carBrandController.text,
    'modelName': carModelNameController.text,
    'color': carColorController.text,
    'year': carYearController.text,
    'price': carPriceController.text,
    'fuel': carFuelController.text,
    'kilometer': carKilometerController.text,
    'regNumber': regNumberController.text,
    'noOfOwners':numOfOwnerController.text,
    'transmission':transmissionController.text,
    'insurance':insuranceController.text,
    'seat':seatCapacityController.text,
    'milage':milageController.text,
    'sunroof':sunroofController.text,
    'bootspace':bootspaceController.text,
    'infotainment':infotainmentSystemController.text,
    'alloywheel':alloyWheelController.text,
    'carheight':carHeightController.text,
    'carwidth':carWidthController.text,
    'carlength':carLengthController.text,
    'groundclearance':groundClearanceController.text,
    'airbag':airBagController.text,
    'airconditioner':airConditionerController.text,
    'powerwindow':powerWindowController.text,
    'bodytype':bodyTypeController.text,
    'fueltank':fuelTankController.text,
    'overview':overViewController.text,
    'boughtPrice':boughtPriceController.text
  };
  if(postCarFormkey.currentState!.validate()){
    firebaseObject
      .doc(docId)
      .update(data);
    snackbarWidget('Car details updated', context,Colors.blue,Colors.white, SnackBarBehavior.floating); 
    Navigator.of(context).pop();
    refreshAllCarToSellInstance.add(AllCarsTOSellEvent());
    if(isFromCarDetailsAppBar== true){
      Navigator.of(context).pop();
    }                   
  }else{
    snackbarWidget('Car details not updated', context, Colors.red, Colors.white, SnackBarBehavior.floating);
  } 
}


// add car thumbnail
String? thumbnailImage;

addCarThumbnail({bloc})async{
  final file = await ImagePicker().pickImage(source: ImageSource.gallery);
  if(file == null){
    return;
  }
  thumbnailImage = file.path;
  bloc.add(ReloadPageAfterAddingImagesEvent());
}


Future<String?> addThumbnailToDb() async {
  if (thumbnailImage == null) {
    return null;
  }

  String fileName = DateTime.now().microsecondsSinceEpoch.toString();
  Reference referenceRoot = FirebaseStorage.instance.ref();
  Reference referenceDireImages = referenceRoot.child('images');
  Reference referenceImageToUpload = referenceDireImages.child(fileName);
  
  try {
    await referenceImageToUpload.putFile(File(thumbnailImage!));
    String imageUrl = await referenceImageToUpload.getDownloadURL();
    thumbnailImage==null;
    return imageUrl;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return null;
  }
}

// add multiple images
List<File> selectedImages = [];

addMultipleImages({bloc})async{
  final List<XFile> files = await ImagePicker().pickMultiImage();
  if (files.isEmpty) {
    return;
  }
  selectedImages = files.map((file) => File(file.path)).toList();
  bloc.add(ReloadPageAfterAddingImagesEvent());
}

Future<List<dynamic>> addMultiImagesToDb()async{
  List<String> imagesToDb= [];
  
  Reference referenceRoot = FirebaseStorage.instance.ref();
  Reference referenceDireImages = referenceRoot.child('images');
  
  for(int i=0;i<selectedImages.length;i++){
    String fileName = DateTime.now().microsecondsSinceEpoch.toString();
    Reference referenceImageToUpload = referenceDireImages.child(fileName);
    await referenceImageToUpload.putFile(selectedImages[i]);
     String url= await referenceImageToUpload.getDownloadURL();
    imagesToDb.add(url);
  }
  selectedImages.clear();
  return imagesToDb;
}


Future<List> getCarsBySellerId({sellerId}) async {
  List result=[];
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('carstosell')
        .where('sellerId', isEqualTo: sellerId)
        .get();
    
   result=querySnapshot.docs as List;
    return result;
  } catch (e) {
    return [];
  }
}


Future<void> addCarToFeatured({
  required DocumentSnapshot carDocumentSnapshot,
  context,screenSize
}) async {
  DateTime startDate = DateTime.now();
  DateTime endDate = startDate.add(const Duration(days: 30));
  try {
    Map<String, dynamic>? carData = carDocumentSnapshot.data() as Map<String, dynamic>?;
    CollectionReference featuredCars = FirebaseFirestore.instance.collection('featuredCars');
    carData!['startDate'] = startDate;
    carData['endDate'] = endDate;
    await featuredCars.add(carData);   
  } catch (e) {
    log(e.toString());
  }
}

Future<void> deleteExpiredFeaturedCar(String carNumber) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    QuerySnapshot querySnapshot = await firestore
        .collection('featuredCars')
        .where('regNumber', isEqualTo: carNumber)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      String docId = querySnapshot.docs.first.id;
      await firestore.collection('featuredCars').doc(docId).delete();
    } else {
      return;
    }
  } catch (e) {
    print('Error deleting document: $e');
  }
}
