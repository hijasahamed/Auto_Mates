import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:flutter/material.dart';


Future<void> removeFavoriteCar({docId,context})async{
  userFavouriteCars.doc(docId).delete();
  snackbarWidget('Car Removed from favourites', context,Colors.blue, Colors.white, SnackBarBehavior.floating);
}