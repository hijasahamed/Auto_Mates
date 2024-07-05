import 'package:auto_mates/user/buyscreentab/view/buy_screen/car_holder/fav_icon/favourite_icon.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
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
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CarouselSlider.builder(
            carouselController: carouselController,
            itemCount: imageUrls.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              String imageUrl = imageUrls[index];
              return SizedBox(
                width: screenSize.width,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return const Center(child: Text('No Image'));
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if(loadingProgress==null){
                      return child;
                    }else{
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    }
                  },
                ),
              );
            },
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              viewportFraction: 1,
              height: screenSize.height / 4,
              autoPlay: true,
              enlargeCenterPage: false,
              enableInfiniteScroll: imageUrls.length > 1,
            ),
          ),
        ),
        (isImagesNotAvailable==true)?const SizedBox()
        :  Positioned(
            bottom: 7,
            right: 7,
            child: Container(
              height: screenSize.height / 25,
              width: screenSize.width / 7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black38),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.filter,
                    color: Colors.white,
                  ),
                  MyTextWidget(
                      text: data['image'].length.toString(),
                      color: Colors.white,
                      size: 15,
                      weight: FontWeight.w500),
                ],
              ),
            )),
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
