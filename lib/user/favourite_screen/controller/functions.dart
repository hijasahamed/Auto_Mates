import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';


Future<void> removeFavoriteCar({docId,context})async{
  userFavouriteCars.doc(docId).delete();
  snackbarWidget('Car Removed from favourites', context,Colors.blue, Colors.white, SnackBarBehavior.floating);
}