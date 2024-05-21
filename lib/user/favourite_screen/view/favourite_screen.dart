import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/car_holder/car_holder.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50), 
        child: NormalAppBar(title: 'My Favourites')
      ),
      body: StreamBuilder(
        stream: userFavouriteCars.orderBy('brand').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(color: Colors.blue,));
          }
          if(snapshot.hasData && snapshot.data.docs.isNotEmpty){
            return GridView.builder(
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
                    return CarHolder(screenSize: screenSize, data: data,isFromFavorites: true,);
                  },
                );
          }
          else{
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              body: SizedBox(
                height: screenSize.height,
                width: screenSize.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: screenSize.height/6,
                      width: screenSize.width/1.5,
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/no data.avif')),
                      ),
                    ),
                    const MyTextWidget(text: 'No Favourite Cars Found', color: Colors.black, size: 15, weight: FontWeight.bold)
                  ],
                ),
              ),
            );
          }
        },
        )
    );
  }
}