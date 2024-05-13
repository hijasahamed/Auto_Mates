import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllCarsToSellWidget extends StatelessWidget {
  const AllCarsToSellWidget({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: firebaseObject.orderBy('brand').snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData && snapshot.data.docs.isNotEmpty) {
          return GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: .9,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final DocumentSnapshot data=snapshot.data.docs[index];
              return Card(
                color: const Color(0XFFDBEDF5),
                elevation: 5,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyTextWidget(text: data['brand'], color: Colors.black, size: 15, weight: FontWeight.bold),
                      MyTextWidget(text: data['modelName'], color: Colors.black, size: 15, weight: FontWeight.bold),
                      MyTextWidget(text: data['color'], color: Colors.black, size: 15, weight: FontWeight.bold),
                      MyTextWidget(text: data['year'], color: Colors.black, size: 15, weight: FontWeight.bold),
                      MyTextWidget(text: data['fuel'], color: Colors.black, size: 15, weight: FontWeight.bold),
                      MyTextWidget(text: data['kilometer'], color: Colors.black, size: 15, weight: FontWeight.bold),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return const Center(child: MyTextWidget(text: 'No car to sell', color: Colors.black, size: 25, weight: FontWeight.bold),);
      },
    );
  }
}
