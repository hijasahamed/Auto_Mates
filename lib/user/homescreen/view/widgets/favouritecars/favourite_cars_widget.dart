
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/homescreen/controllers/functions/functions.dart';
import 'package:auto_mates/user/homescreen/view/widgets/favouritecars/Fav_car_image_holder/fav_car_image_holder.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/favourite_screen/favourite_screen/favourite_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FavouriteCarsWidget extends StatefulWidget {
  const FavouriteCarsWidget({super.key, required this.screenSize});
  final Size screenSize;

  @override
  State<FavouriteCarsWidget> createState() => _FavouriteCarsWidgetState();
}

class _FavouriteCarsWidgetState extends State<FavouriteCarsWidget> {
  late CarouselController carouselController;
  @override
  void initState() {    
    super.initState();
    carouselController = CarouselController();
  }

  

  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();
    return FutureBuilder(
      future: fetchUserDetails(), 
      builder: (context, snapshot) {
        final user =snapshot.data;
        return StreamBuilder(
            stream: getfavouriteCars(userContact: (user!=null)? user.mobile : '12345'), 
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) { 
                return const SizedBox.shrink();
              }
              if (snapshot.hasError) {
                return const SizedBox.shrink();
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const SizedBox.shrink();
              }
              else{
                final cars = snapshot.data!.docs;
                return cars.isNotEmpty?
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return FavouriteScreen(screenSize: widget.screenSize, userContact: user!.mobile);
                    },));
                  },
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    child: SizedBox(
                      height: widget.screenSize.height/4,
                      width: widget.screenSize.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5,right: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyTextWidget(text: 'My Favourites', color: const Color(0xff424141), size: widget.screenSize.width/16.5, weight: FontWeight.bold), 
                            Stack(
                              alignment: Alignment.center,
                              children: [ 
                                FavCarImageHolder(carouselController: carouselController, cars: cars, screenSize: widget.screenSize),
                                if (cars.length > 1) ...[
                                      Positioned(
                                        left: 10,
                                        child: GestureDetector(
                                          onTap: () {
                                            carouselController.previousPage(curve: Curves.easeIn);
                                          },
                                          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
                                        ),
                                      ),
                                      Positioned(
                                        right: 2,
                                        child: GestureDetector(
                                          onTap: () {
                                            carouselController.nextPage(curve: Curves.easeIn);
                                          },
                                          child: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                                        ),
                                      ),
                                    ],
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                : const SizedBox.shrink();
              }
            },
          );
      },
    );
  }
}