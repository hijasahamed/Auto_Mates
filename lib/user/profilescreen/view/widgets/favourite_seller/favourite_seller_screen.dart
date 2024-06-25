import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/commonwidgets/no_data_error_placeholder/no_data_error_placeholder.dart';
import 'package:auto_mates/user/commonwidgets/shimmer_effect/shimmer_effect.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/favourite_seller/favourite_seller_details_holder/favourite_seller_details_holder.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/favourite_seller/favourite_seller_image_holder/favourite_seller_image_holder.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/favourite_seller/favourite_seller_more_cars/favourite_seller_more_cars.dart';
import 'package:auto_mates/user/commonwidgets/animated_text/animated_text_widget.dart';
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
                        return Padding(
                          padding: const EdgeInsets.all(2),
                          child: GestureDetector(
                            onTap: () {
                              blocInstance.add(FavouriteSellerOnTappedEvent());
                            },
                            child: Card(
                              color: const Color.fromARGB(255, 238, 238, 238),
                              elevation: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FavouriteSellerImageHolder(data: data, screenSize: screenSize),
                                    FavouriteSellerDetailsHolder(data: data, screenSize: screenSize),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6),
                                      child: AnimatedTextWidget(textTitle: 'tap to see more cars from this seller', beginColor: Colors.black, endColor: Colors.blue,textSize: screenSize.width/50,),
                                    )
                                  ],
                                ),
                              ),
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
