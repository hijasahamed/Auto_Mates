import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final CollectionReference firebaseObject= FirebaseFirestore.instance.collection('carstosell');


postNewCar(
    {context,
    postCarFormkey,
    carBrandController,
    carModelNameController,
    carColorController,
    carYearController,
    carPriceController,
    carFuelController,
    carKilometerController}) {

     final data={
      'brand':carBrandController.text,
      'modelName':carModelNameController.text,
      'color':carColorController.text,
      'year':carYearController.text,
      'price':carPriceController.text,
      'fuel':carFuelController.text,
      'kilometer':carKilometerController.text,
     };

     if(postCarFormkey.currentState!.validate()){
      firebaseObject.add(data).then((value) {
        Navigator.of(context).pop();
      },).then(snackbarWidget('Car Posted Successfully', context, Colors.blue, Colors.white, SnackBarBehavior.floating));
     }else{
      snackbarWidget('Car details not completed', context, Colors.blue, Colors.white, SnackBarBehavior.floating);
      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Car details not completed'),
      ),
    );
     }
      
}
