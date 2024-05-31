import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/all_cars_to_sell/pop_up_button/popup_menu_button_widget.dart';
import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/buyscreentab/view/on_tap_more_details/on_tap_car_more_details.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/favourite_screen/controller/functions.dart';
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
    return GestureDetector(
      onTap: () {
        (isFromSeller == true)
            ? sellerHomeScreenBloc?.add(NavigateToSingleCarDetailsPageEvent(data: data))
            : Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return OnTapCarMoreDetailsCarScreen(
                    screenSize: screenSize,
                    data: data,
                  );
                },
              ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Card(
          elevation: 5,
          shadowColor: const Color(0xFFDBEDF5),
          color: Colors.white,
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
                              backgroundColor: Colors.black38,
                              child: PopupMenuButtonWidget(
                                  screenSize: screenSize,
                                  data: data,
                                  sellerHomeScreenBloc:
                                      sellerHomeScreenBloc))
                          : (isFromUser == true)
                              ? GestureDetector(
                                  onTap: () {
                                    addCarToUserFavourite(
                                        data: data, context: context);
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.black38,
                                    radius: 15,
                                    child: Icon(
                                       Icons.favorite_border_rounded,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ))
                              : GestureDetector(
                                  onTap: () {
                                    removeFavoriteCar(
                                        docId: data.id,
                                        context: context);
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.white70,
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
                        color: const Color(0XFF143A42),
                        size: 18,
                        weight: FontWeight.bold),
                    SizedBox(
                      width: screenSize.width / 100,
                    ),
                    Expanded(
                        child: MyTextWidget(
                            text: '${data['modelName']}',
                            color: const Color.fromARGB(255, 9, 87, 189),
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
                    size: 12,
                    weight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: MyTextWidget(
                    text: '${data['kilometer']} kilometers',
                    color: Colors.black,
                    size: 12,
                    weight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Row(
                  children: [
                    MyTextWidget(
                        text: 'Rs. ${data['price']}',
                        color: const Color.fromARGB(255, 10, 104, 12),
                        size: 15,
                        weight: FontWeight.bold),
                        SizedBox(width: screenSize.width/120,),
                    const MyTextWidget(text: 'Lakhs onwards', color: Colors.black, size: 12, weight: FontWeight.w500)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}