import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/car_holder/car_holder.dart';
import 'package:auto_mates/user/commonwidgets/shimmer_effect/shimmer_effect.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/favourite_screen/no_data_in_favourites/no_data_in_favourites.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key,required this.screenSize,required this.userContact});
  final Size screenSize;
  final String userContact; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50), 
        child: NormalAppBar(title: 'My Favourites')
      ),
      body: StreamBuilder(
        stream: getUsersFavouriteCars(userContact: userContact),
        builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
          return Scaffold( backgroundColor: Colors.white,body: SkelotonIndicatorGrid(screenSize: screenSize,));
          }
          if(snapshot.hasData && snapshot.data.docs.isNotEmpty){
            return Scaffold(
              backgroundColor: Colors.white,
              body: GridView.builder(
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
                      return CarHolder(screenSize: screenSize, data: data,isUserFavScreen: true,);
                    },
                  ),
            );
          }
          else{
            return NoDataInFavourites(screenSize: screenSize);
          }
        },
        )
    );
  }
}