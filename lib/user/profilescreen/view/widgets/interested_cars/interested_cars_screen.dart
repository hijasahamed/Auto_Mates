// ignore_for_file: use_build_context_synchronously

import 'package:auto_mates/seller/seller_profile_screen/controllers/functions.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/on_tap_car_more_details.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/commonwidgets/no_data_error_placeholder/no_data_error_placeholder.dart';
import 'package:auto_mates/user/commonwidgets/shimmer_effect/shimmer_effect.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/interested_cars/car_details_holder/user_interested_details_holder.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/interested_cars/car_image_holder/user_interested_car_holder.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/interested_cars/car_remove_button/user_interested_car_remove_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InterestedCarsScreen extends StatelessWidget {
  const InterestedCarsScreen(
      {super.key,
      required this.userContact,
      required this.screenSize,
      required this.userId,
      required this.profileScreenBloc});
  final String userContact;
  final String userId;
  final Size screenSize;
  final ProfileScreenBloc profileScreenBloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: NormalAppBar(title: 'Interested Cars')),
      body: BlocConsumer<ProfileScreenBloc, ProfileScreenState>(
        bloc: profileScreenBloc,
        listener: (context, state) {
          if (state is InterestedCarOnTapActionState) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => OnTapCarMoreDetailsCarScreen(
                  screenSize: screenSize, data: state.data,isFrominterestedCars: true,),
            ));
          }
        },
        builder: (context, state) {
          return StreamBuilder(
            stream: getUsersInterestedCars(userContact),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                
                return Scaffold(
                  backgroundColor: Colors.white,
                  body: SkelotonIndicatorList(
                      screenSize: screenSize, itemCount: 6),
                );
              }
              if (snapshot.hasError) {
                return const SizedBox();
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return NoDataErrorPlaceholder(
                    screenSize: screenSize, titleText: 'No data found');
              } else {
                final cars = snapshot.data!.docs;
                return Scaffold(
                  backgroundColor: Colors.white,
                  body: BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
                    bloc: profileScreenBloc,
                    builder: (context, state) {
                      return ListView.builder(
                        itemCount: cars.length,
                        itemBuilder: (context, index) {
                          var car = cars[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 6,
                              color: const Color.fromARGB(255, 231, 231, 231),
                              child: InkWell(
                                onTap: () async{
                                  final carDetails= await getCarDetailFromInterestedCarsList(carNumber: car['carNumber']);                                  
                                  if(carDetails != null){                              
                                    profileScreenBloc.add(InterestedCarOnTapEvent(data: carDetails));
                                  }else{                                    
                                    removeUsersInterestedCar(context: context,docId: car.id,noData: true,);
                                  }
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        UserInterestedCarHolder(
                                            screenSize: screenSize, car: car),
                                        SizedBox(
                                          width: screenSize.width / 40,
                                        ),
                                        UserInterestedDetailsHolder(
                                            screenSize: screenSize, car: car),
                                        const Spacer(),
                                        UserInterestedCarRemoveButton(
                                          data: car,
                                          screenSize: screenSize,
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5,bottom: 4),
                                      child: StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                            .collection('userInterestMarked')
                                            .doc(car.id)
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                            return const SizedBox.shrink();
                                          } else if (snapshot.hasError) {
                                            return const SizedBox.shrink();
                                          } else if (!snapshot.hasData || !snapshot.data!.exists) {
                                            return const SizedBox.shrink();
                                          } else {
                                            var sellerViewed = snapshot.data!['sellerViewed'];
                                            return MyTextWidget(
                                              text: sellerViewed == 'no'
                                                  ? 'Waiting for the seller to see your interest'
                                                  : 'Seller viewed your interest',
                                              color: sellerViewed == 'no' ? Colors.grey:Colors.blueGrey,
                                              size: screenSize.width / 40,
                                              weight: FontWeight.bold,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
