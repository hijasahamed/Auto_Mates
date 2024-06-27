// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:io';

import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/seller/seller_appbar_bottombar/controllers/functions.dart';
import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/seller/seller_profile_screen/view/widget/sold_cars_page/sold_cars.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final CollectionReference firebaseObject =
    FirebaseFirestore.instance.collection('carstosell');

SellerHomeScreenBloc refreshAllCarToSellInstance = SellerHomeScreenBloc();

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
    'overview':overViewController.text
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

getCarSoldPrice(){
  
}

Future<void> markSellerCarToSold({carData,markCarsoldBloc,context,screenSize,})async{
   Navigator.pop(context);
   Navigator.pop(context);
    markCarsoldBloc.add(MarkCarSoldLoadingEvent());
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('carstosell').doc(carData.id).get();
    if(documentSnapshot.exists){
      Map<String, dynamic>? carDataToDb = documentSnapshot.data() as Map<String, dynamic>?;
      if(carDataToDb != null){
        await FirebaseFirestore.instance.collection('soldcars').add(carDataToDb); 
      }     
      await FirebaseFirestore.instance.collection('carstosell').doc(carData.id).delete();
      refreshAllCarToSellInstance.add(AllCarsTOSellEvent());
      refreshAllCarToSellInstance.add(MarkCarSoldStopLoadingEvent());                
    }else{
      Navigator.pop(context);
    }
}

updateCarDetails(
   { context,
    docId,
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
  }
    
  ) {
  final data = {
    'image':'',
    'brand': carBrandController.text,
    'modelName': carModelNameController.text,
    'color': carColorController.text,
    'year': carYearController.text,
    'price': carPriceController.text,
    'fuel': carFuelController.text,
    'kilometer': carKilometerController.text,
    'reg.number': regNumberController.text,
    'no.of.owners':numOfOwnerController.text,
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
    'overview':overViewController.text
  };
  if(postCarFormkey.currentState!.validate()){
    firebaseObject
      .doc(docId)
      .update(data)
      .then(
        (value) => Navigator.of(context).pop(),
      )
      .then(snackbarWidget('Car details updated', context, Colors.blue,
          Colors.white, SnackBarBehavior.floating));
  }else{
    snackbarWidget('Car details not updated', context, Colors.blue, Colors.white, SnackBarBehavior.floating);
  } 
}


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
