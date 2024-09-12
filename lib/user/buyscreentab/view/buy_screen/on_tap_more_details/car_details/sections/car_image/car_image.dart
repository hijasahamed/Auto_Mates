import 'package:auto_mates/user/buyscreentab/view/buy_screen/car_holder/fav_icon/favourite_icon.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/on_tap_more_details/car_details/sections/car_image/car_details_image_holder/car_details_image_holder.dart';
import 'package:auto_mates/user/buyscreentab/view/buy_screen/on_tap_more_details/car_details/sections/car_image/image_count/car_image_count.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarImage extends StatelessWidget {
  const CarImage(
      {super.key,
      required this.screenSize,
      required this.data,
      this.isUserFavScreen,
      this.isFromSearch,
      this.fromSeller});
  final Size screenSize;
  final dynamic data;
  final bool? fromSeller;
  final bool? isFromSearch;
  final bool? isUserFavScreen;
  @override
  Widget build(BuildContext context) {
    bool isImagesNotAvailable = false;
    CarouselController carouselController = CarouselController();
    List<String> imageUrls = List<String>.from(data['image']);
    return Stack(
      children: [
        CarDetailsImageHolder(
            screenSize: screenSize,
            carouselController: carouselController,
            imageUrls: imageUrls),
        (isImagesNotAvailable == true)
            ? const SizedBox()
            : CarImageCount(screenSize: screenSize, data: data),
        (isUserFavScreen == true)
            ? const SizedBox()
            : (fromSeller == false)
                ? Positioned(
                    top: 5,
                    right: 5,
                    child:
                        FavouriteIcon(data: data, isFromSearch: isFromSearch))
                : const SizedBox()
      ],
    );
  }
}
