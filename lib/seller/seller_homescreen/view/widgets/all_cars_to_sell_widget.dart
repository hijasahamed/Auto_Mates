import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/popup_menu_button_widget.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllCarsToSellWidget extends StatelessWidget {
  const AllCarsToSellWidget({super.key, required this.screenSize,required this.sellerHomeScreenBloc});
  final Size screenSize;
  final SellerHomeScreenBloc sellerHomeScreenBloc;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: firebaseObject.orderBy('brand').snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const SizedBox();
        }
        if (snapshot.hasData && snapshot.data.docs.isNotEmpty) {
          return GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: .99,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final DocumentSnapshot data = snapshot.data.docs[index];
              return GestureDetector(
                onTap: () {
                  sellerHomeScreenBloc.add(NavigateToSingleCarDetailsPageEvent(data: data));
                },
                child: Card(
                  color: const Color(0XFFDBEDF5),
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [                       
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FadeInImage(
                              fadeInDuration: const Duration(milliseconds: 750),
                              height: screenSize.height / 7,
                              width: screenSize.width,
                              placeholder: const AssetImage('assets/images/image placeholder.jpeg'),placeholderFit: BoxFit.fill,
                              imageErrorBuilder: (context, error, stackTrace) {
                                return const CircularProgressIndicator(color: Colors.blue,);
                              },
                              image: NetworkImage(data['image']),fit: BoxFit.cover,filterQuality: FilterQuality.high
                            ),
                          ),
                          Positioned(
                              right: 2,
                              top: 2, 
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.black12,
                                child: PopupMenuButtonWidget(screenSize: screenSize,data: data,sellerHomeScreenBloc: sellerHomeScreenBloc,)
                              ),
                            ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: MyTextWidget(text: data['brand'], color: const Color(0xFF424141), size: 15, weight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: MyTextWidget(text: data['modelName'], color: const Color(0xFF424141), size: 15, weight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: MyTextWidget(text: data['price'], color: const Color(0xFF424141), size: 15, weight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
         else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenSize.height / 4.5,
                width: screenSize.width / 1.2,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/no car to sell.avif',
                        ),
                        fit: BoxFit.cover)),
              ),
              const MyTextWidget(
                  text: 'No cars left for selling',
                  color: Colors.black,
                  size: 17,
                  weight: FontWeight.w500),
              const MyTextWidget(
                  text: 'Please post new cars by clicking the + button',
                  color: Colors.black,
                  size: 17,
                  weight: FontWeight.w500),
            ],
          );
        }
      },
    );
  }
}
