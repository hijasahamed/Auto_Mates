import 'package:auto_mates/user/buyscreentab/view/buy_screen/car_holder/fav_icon/favourite_icon.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
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
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: FadeInImage(
              fadeInDuration: const Duration(milliseconds: 500),
              height: screenSize.height / 4,
              width: screenSize.width,
              placeholder: const AssetImage(
                'assets/images/image placeholder.jpeg',
              ),
              placeholderFit: BoxFit.cover,
              imageErrorBuilder: (context, error, stackTrace) {
                isImagesNotAvailable==true;
                return Container(
                  height: screenSize.height / 4,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey,width: 1),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                  ),
                  child: const Center(
                    child: MyTextWidget(text: 'No Images', color: Colors.grey, size: 15, weight: FontWeight.w600),
                  ),
                );
              },
              image: NetworkImage(data['image'][0]),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high),
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
