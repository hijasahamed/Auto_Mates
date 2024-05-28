import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/car_holder/car_holder.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllCarsToSellWidget extends StatelessWidget {
  const AllCarsToSellWidget({super.key, required this.screenSize,required this.sellerHomeScreenBloc});
  final Size screenSize;
  final SellerHomeScreenBloc sellerHomeScreenBloc;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: firebaseObject.orderBy('brand').snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const SizedBox();
        }
        if (snapshot.hasData && snapshot.data.docs.isNotEmpty) {
          return GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: .72,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final DocumentSnapshot data = snapshot.data.docs[index];
              return CarHolder(screenSize: screenSize, data: data,isFromSeller:true,sellerHomeScreenBloc: sellerHomeScreenBloc,);
            },
          );
        }
         else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenSize.height / 4.5,
                width: screenSize.width / 1.2,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/no car to sell.avif',
                        ),
                        fit: BoxFit.cover)),
              ),
              const MyTextWidget(
                  text: 'No cars left for selling',
                  color: Colors.black,
                  size: 17,
                  weight: FontWeight.w500),
              const MyTextWidget(
                  text: 'Please post new cars by clicking the + button',
                  color: Colors.black,
                  size: 17,
                  weight: FontWeight.w500),
            ],
          );
        }
      },
    );
  }
}
