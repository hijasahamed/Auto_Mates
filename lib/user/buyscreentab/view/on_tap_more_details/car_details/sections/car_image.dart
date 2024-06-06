
import 'package:auto_mates/user/buyscreentab/view/buy_screen/car_holder/fav_icon/favourite_icon.dart';
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
    return Stack(
      children: [        
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)),
          child: FadeInImage(
              fadeInDuration: const Duration(milliseconds: 500),
              height: screenSize.height / 4,
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
        (isUserFavScreen==true)? const SizedBox()
        : (fromSeller==false)
        ? Positioned(
                top: 5,
                right: 5,
                child: FavouriteIcon(data: data,isFromSearch: isFromSearch,)
              )
        : const SizedBox()
      ],
    );
  }
}
