import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/bloc/buy_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/car_holder/car_holder.dart';
import 'package:auto_mates/user/commonwidgets/my_snackbar/my_snackbar.dart';
import 'package:auto_mates/user/commonwidgets/no_data_error_placeholder/no_data_error_placeholder.dart';
import 'package:auto_mates/user/commonwidgets/shimmer_effect/shimmer_effect.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final BuyScreenBloc buyScreenBloc = BuyScreenBloc();

class BuyScreen extends StatelessWidget {
  const BuyScreen({
    super.key,
  });

  Future<void> refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final controller =  ScrollController();
    controller.addListener(() {
      if(controller.offset == controller.position.maxScrollExtent){
        snackbarWidget('End of the list', context, Colors.transparent, Colors.white, SnackBarBehavior.fixed);
      }
    },) ;
    return StreamBuilder(
      stream: firebaseObject.orderBy('brand').snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {        
          return Scaffold(body: SkelotonIndicatorGrid(screenSize: screenSize,),backgroundColor: Colors.white,);
        }
        if (snapshot.hasData && snapshot.data.docs.isNotEmpty) {
          return Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: refreshData,
                    color: Colors.blue,
                    backgroundColor: Colors.white,
                    child: SizedBox(
                      child: GridView.builder(
                        controller: controller,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: .75,
                          mainAxisSpacing: 3,
                          crossAxisSpacing: 3,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          final DocumentSnapshot data =
                              snapshot.data.docs[index];
                          return CarHolder(
                            screenSize: screenSize,
                            data: data,
                            isFromSeller: false,
                            isFromUser: true,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return NoDataErrorPlaceholder(
              screenSize: screenSize, titleText: 'No cars Available');
        }
      },
    );
  }
}
