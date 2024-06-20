import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/commonwidgets/no_data_error_placeholder/no_data_error_placeholder.dart';
import 'package:auto_mates/user/commonwidgets/shimmer_effect/shimmer_effect.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/favourite_seller/favourite_seller_more_cars/favourite_seller_more_cars.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/favourite_seller/favourite_seller_animated_text/favourite_seller_animated_text.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/favourite_seller/favourite_seller_remove_button/favourite_seller_remove_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteSellerScreen extends StatelessWidget {
  const FavouriteSellerScreen(
      {super.key,
      required this.screenSize,
      required this.userContact,});
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
                body: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    ProfileScreenBloc blocInstance = ProfileScreenBloc();
                    final DocumentSnapshot data = snapshot.data.docs[index];
                    return BlocConsumer<ProfileScreenBloc, ProfileScreenState>(
                      bloc: blocInstance,
                      listener: (context, state) {
                        if(state is FavouriteSellerOnTappedState){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FavouriteSellerMoreCars(sellerData: data,screenSize: screenSize,)
                          ));
                        }
                      },
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            blocInstance.add(FavouriteSellerOnTappedEvent());
                          },
                          child: Card(
                            color: const Color.fromARGB(255, 173, 224, 246),
                            elevation: 5,
                            shadowColor: Colors.blueGrey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FavouriteSellerRemoveButton(
                                  data: data,
                                  screenSize: screenSize,
                                ),
                                MyTextWidget(
                                    text: data['sellerName'],
                                    color:
                                        const Color.fromARGB(255, 83, 84, 85),
                                    size: 19,
                                    weight: FontWeight.bold),
                                MyTextWidget(
                                    text: data['sellerLocation'],
                                    color:
                                        const Color.fromARGB(255, 83, 84, 85),
                                    size: 18,
                                    weight: FontWeight.bold),
                                MyTextWidget(
                                    text: 'Phone:${data['sellerMobile']}',
                                    color:
                                        const Color.fromARGB(255, 83, 84, 85),
                                    size: 18,
                                    weight: FontWeight.bold),
                                const Spacer(),
                                const FavouriteSellerAnimatedText()
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
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
