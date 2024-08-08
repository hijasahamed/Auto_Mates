import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/car_holder/car_holder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeaturedSectionAllCarsScreen extends StatelessWidget {
  const FeaturedSectionAllCarsScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50), 
        child: NormalAppBar(title: 'Featured Cars')
      ),
      body: Padding(
        padding: EdgeInsets.all(screenSize.width/120),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('featuredCars').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No Featured Cars'));
            }
            var featuredCars = snapshot.data!.docs;
            return GridView.builder(
              controller: controller,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: featuredCars.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: .75,
                mainAxisSpacing: 3,
                crossAxisSpacing: 3,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final DocumentSnapshot data =
                    featuredCars[index];
                return CarHolder(
                  screenSize: screenSize,
                  data: data,
                  isFromSeller: false,
                  isFromUser: true,
                  isFeaturedCars: true,
                );
              },
            );
          },
        ),
      )
    );
  }
}