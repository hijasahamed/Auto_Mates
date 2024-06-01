import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/commonwidgets/circular_indicator/circular_indicator_widget.dart';
import 'package:auto_mates/user/commonwidgets/no_data_error_placeholder/no_data_error_placeholder.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/interested_cars/car_details_holder/user_interested_details_holder.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/interested_cars/car_image_holder/user_interested_car_holder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InterestedCarsScreen extends StatelessWidget {
  const InterestedCarsScreen({super.key,required this.userContact,required this.screenSize});
  final String userContact;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50), 
        child: NormalAppBar(title: 'Interested Cars')
      ),
      body: StreamBuilder(
        stream: getInterestedCarsStream(userContact),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularIndicatorWidget();
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return NoDataErrorPlaceholder(screenSize: screenSize, titleText: 'No data found');
          }
          else{
            final cars= snapshot.data!.docs;
            return ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                var car = cars[index].data() as Map<String, dynamic>;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: const Color.fromARGB(255, 142, 142, 142),
                    child: Row(
                      children: [
                        UserInterestedCarHolder(screenSize: screenSize, car: car),
                        SizedBox(width: screenSize.width/50,),
                        UserInterestedDetailsHolder(screenSize: screenSize, car: car),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}