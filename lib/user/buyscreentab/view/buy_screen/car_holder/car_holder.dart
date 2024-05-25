import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/popup_menu_button_widget.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/single_car_details/single_car_details_screen.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/seller_details/seller_details_screen.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class CarHolder extends StatelessWidget {
  const CarHolder(
      {super.key,
      required this.screenSize,
      required this.data,
      this.sellerHomeScreenBloc,
      this.isFromUser,
      this.isFromSeller});
  final Size screenSize;
  final dynamic data;
  final bool? isFromSeller;
  final SellerHomeScreenBloc? sellerHomeScreenBloc;
  final bool? isFromUser;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          (isFromSeller == true)
              ? Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SingleCarDetailsScreen(
                        screenSize: screenSize,
                        data: data,
                        sellerHomeScreenBloc: sellerHomeScreenBloc,
                      )))
              : Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return SellerDetailsScreen(
                      screenSize: screenSize,
                      data: data,
                    );
                  },
                ));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: .3)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: FadeInImage(
                        fadeInDuration: const Duration(milliseconds: 750),
                        height: screenSize.height / 5,
                        width: screenSize.width,
                        placeholder: const AssetImage(
                          'assets/images/image placeholder.jpeg',
                        ),
                        placeholderFit: BoxFit.cover,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return const CircularProgressIndicator(
                            color: Colors.blue,
                          );
                        },
                        image: NetworkImage(data['image']),
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high),
                  ),
                  Positioned(
                      top: 5,
                      right: 5,
                      child: (isFromSeller == true)
                          ? CircleAvatar(
                              backgroundColor: Colors.black54,
                              child: PopupMenuButtonWidget(
                                  screenSize: screenSize,
                                  data: data,
                                  sellerHomeScreenBloc: sellerHomeScreenBloc))
                          : (isFromUser == true)
                              ? GestureDetector(
                                  onTap: () {
                                    addCarToUserFavourite(
                                        data: data, context: context);
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 15,
                                    child: Icon(
                                      Icons.favorite_rounded,
                                      size: 20,
                                      color: Colors.red,
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    removeFavoriteCar(
                                        docId: data.id, context: context);
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 15,
                                    child: Icon(
                                      Icons.delete,
                                      size: 20,
                                      color: Colors.red,
                                    ),
                                  ),
                                ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Row(
                  children: [
                    MyTextWidget(
                        text: '${data['brand']}',
                        color: Colors.black,
                        size: 15,
                        weight: FontWeight.bold),
                    SizedBox(
                      width: screenSize.width / 100,
                    ),
                    Expanded(
                        child: MyTextWidget(
                            text: '${data['modelName']}',
                            color: Colors.black,
                            size: 15,
                            weight: FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: MyTextWidget(
                    text: '${data['year']} model',
                    color: Colors.black,
                    size: 15,
                    weight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: MyTextWidget(
                    text: '${data['kilometer']} kilometers',
                    color: Colors.black,
                    size: 15,
                    weight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: MyTextWidget(
                    text: 'Rs. ${data['price']} onwards',
                    color: Colors.black,
                    size: 15,
                    weight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
