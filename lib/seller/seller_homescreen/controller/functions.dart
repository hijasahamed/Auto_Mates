// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/seller/seller_appbar_bottombar/controllers/functions.dart';
import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

final CollectionReference firebaseObject =
    FirebaseFirestore.instance.collection('carstosell');


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
    return;
  }
  List<dynamic> imageUrls = await addMultiImagesToDb();
  print('images to add in db ===$imageUrls');
  String? thumbnailUrl = await addThumbnailToDb();
  final data = {
    'thumbnail':thumbnailUrl,
    'sellerId':sellerDetails.id,
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
    sellerHomeScreenBloc.add(AllCarsTOSellEvent());   
    Navigator.of(context).pop();
    snackbarWidget('Car Posted Successfully', context, Colors.blue,Colors.white, SnackBarBehavior.floating);
  } else {
    snackbarWidget('Car details not completed', context, Colors.blue,
        Colors.white, SnackBarBehavior.floating);
  }
}

deleteCarToSell(docId,context,sellerHomeScreenBloc)async {
 firebaseObject.doc(docId).delete();
  Navigator.of(context).pop();
  sellerHomeScreenBloc.add(AllCarsTOSellEvent());
  snackbarWidget('Car details removed', context,Colors.red, Colors.white, SnackBarBehavior.floating);
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
  String fileName = DateTime.now().microsecondsSinceEpoch.toString();
  Reference referenceRoot = FirebaseStorage.instance.ref();
  Reference referenceDireImages = referenceRoot.child('images');
  Reference referenceImageToUpload = referenceDireImages.child(fileName);
  for(int i=0;i<selectedImages.length;i++){
    await referenceImageToUpload.putFile(selectedImages[i]);
     String url= await referenceImageToUpload.getDownloadURL();
    imagesToDb.add(url);
  }
  selectedImages.clear();
  return imagesToDb;
}

deleteAlertDialogwidget(
   {
  context,
  sellerhomescreenbloc ,
  docId,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return BlocBuilder<SellerHomeScreenBloc, SellerHomeScreenState>(
        builder: (context, state) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const MyTextWidget(
                text: 'Remove Car',
                color: Color(0xFF424141),
                size: 25,
                weight: FontWeight.bold),
            content: const MyTextWidget(
                text: 'Do you want to remove this car',
                color: Color(0xFF424141),
                size: 15,
                weight: FontWeight.w500),
            actions: [
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.black12)),
                  onPressed: () {
                    sellerhomescreenbloc?.add(BackArrowClickedEvent());
                  },
                  child: const MyTextWidget(
                      text: 'Back',
                      color: Colors.white,
                      size: 12,
                      weight: FontWeight.bold)),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red)),
                  onPressed: () {
                    deleteCarToSell(docId,context,sellerhomescreenbloc);
                  },
                  child: const MyTextWidget(
                      text: 'Delete',
                      color: Colors.white,
                      size: 12,
                      weight: FontWeight.bold)),
            ],
          );
        },
      );
    },
  );
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
