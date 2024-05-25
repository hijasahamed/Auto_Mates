import 'dart:io';

import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

final CollectionReference firebaseObject =
    FirebaseFirestore.instance.collection('carstosell');

String imageUrl = '';


postNewCar(
    {required BuildContext context,
  postCarFormkey,
  required TextEditingController carBrandController,
  required TextEditingController carModelNameController,
  required TextEditingController carColorController,
  required TextEditingController carYearController,
  required TextEditingController carPriceController,
  required TextEditingController carFuelController,
  required TextEditingController carKilometerController,}){
  final data = {
    'image':imageUrl,
    'brand': carBrandController.text,
    'modelName': carModelNameController.text,
    'color': carColorController.text,
    'year': carYearController.text,
    'price': carPriceController.text,
    'fuel': carFuelController.text,
    'kilometer': carKilometerController.text,
  };

  if (postCarFormkey.currentState!.validate()){
    firebaseObject.add(data);
    Navigator.of(context).pop();   
    snackbarWidget('Car Posted Successfully', context, Colors.white,const Color(0xFF424141), SnackBarBehavior.floating);
    imageUrl='';
  } else {
    snackbarWidget('Car details not completed', context, Colors.white,
        const Color(0xFF424141), SnackBarBehavior.floating);
  }
}

deleteCarToSell(docId,context)async {
 firebaseObject.doc(docId).delete();
  Navigator.of(context).pop();
  snackbarWidget('Car details removed', context,Colors.blue, Colors.white, SnackBarBehavior.floating);
}

updateCarDetails(
    context,
    docId,
    postCarFormkey,
    carBrandController,
    carModelNameController,
    carColorController,
    carYearController,
    carPriceController,
    carFuelController,
    carKilometerController) {
  final data = { 
    'image':imageUrl,   
    'brand': carBrandController.text,
    'modelName': carModelNameController.text,
    'color': carColorController.text,
    'year': carYearController.text,
    'price': carPriceController.text,
    'fuel': carFuelController.text, 
    'kilometer': carKilometerController.text,
  };
  if(postCarFormkey.currentState!.validate()){
    firebaseObject
      .doc(docId)
      .update(data)
      .then(
        (value) => Navigator.of(context).pop(),
      )
      .then(snackbarWidget('Car details updated', context, Colors.white,
          const Color(0xFF424141), SnackBarBehavior.floating));
    imageUrl='';
  }else{
    snackbarWidget('Car details not updated', context, Colors.white, const Color(0xFF424141), SnackBarBehavior.floating);
  } 
}

addImage() async {
  final file = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (file == null) {
    return;
  }
  String fileName = DateTime.now().microsecondsSinceEpoch.toString();
  Reference referenceRoot = FirebaseStorage.instance.ref();
  Reference referenceDireImages = referenceRoot.child('images');
  Reference referenceImageToUpload = referenceDireImages.child(fileName);
  try {
    await referenceImageToUpload.putFile(File(file.path));
    imageUrl = await referenceImageToUpload.getDownloadURL();
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
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
                    deleteCarToSell(docId,context,);
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
