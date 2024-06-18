import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/commonwidgets/no_data_error_placeholder/no_data_error_placeholder.dart';
import 'package:auto_mates/user/commonwidgets/shimmer_effect/shimmer_effect.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FavouriteSellerScreen extends StatelessWidget {
  const FavouriteSellerScreen(
      {super.key, required this.screenSize, required this.userContact});
  final Size screenSize;
  final String userContact;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: NormalAppBar(title: 'Favourite Seller')),
        body: StreamBuilder(
          stream: getUsersFavouriteSellers(userContact: userContact),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                  backgroundColor: Colors.white,
                  body: SkelotonIndicatorGrid(
                    screenSize: screenSize,
                  ));
            }
            if (snapshot.hasData && snapshot.data.docs.isNotEmpty) {
              return Scaffold(
                backgroundColor: Colors.white,
                body: Padding(
                  padding: const EdgeInsets.all(4),
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.2,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      final DocumentSnapshot data = snapshot.data.docs[index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Card(
                          color: Color.fromARGB(255, 245, 4, 4),
                          elevation: 5,
                          child: Container(
                            decoration: BoxDecoration(
                              
                            ),
                            child: Column(
                              children: [
                                MyTextWidget(
                                    text: data['sellerName'],
                                    color: const Color(0xFF424141),
                                    size: 15,
                                    weight: FontWeight.bold)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            } else {
              return NoDataErrorPlaceholder(
                  screenSize: screenSize,
                  titleText: 'No sellers in Favourite list');
            }
          },
        ));
  }
}
