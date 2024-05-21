import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/car_holder/car_holder.dart';
import 'package:auto_mates/user/buyscreentab/view/seller_details_screen.dart';
import 'package:auto_mates/user/buyscreentab/view/widgets/sorting_filter_widget.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BuyScreen extends StatelessWidget {
  const BuyScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;   
      return StreamBuilder(
        stream: firebaseObject.orderBy('brand').snapshots(), 
        builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(color: Colors.blue,));
          }
          if(snapshot.hasData && snapshot.data.docs.isNotEmpty){
            return Column(
              children: [
                SortingFilteringWidget(screenSize: screenSize),
                Expanded(
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: .75,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      final DocumentSnapshot data = snapshot.data.docs[index];
                      return CarHolder(screenSize: screenSize, data: data,isFromFavorites: false,);
                    },
                  ),
                ),
              ],
            );
          }else{
            const Center(
              child: MyTextWidget(text: 'No Data', color: Colors.blue, size: 15, weight: FontWeight.bold),
            );
          }
          return const SizedBox();
        },
      );
  }
}