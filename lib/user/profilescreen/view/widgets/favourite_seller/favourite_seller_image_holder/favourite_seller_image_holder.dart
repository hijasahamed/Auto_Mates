import 'package:auto_mates/user/profilescreen/view/widgets/favourite_seller/favourite_seller_remove_button/favourite_seller_remove_button.dart';
import 'package:flutter/material.dart';

class FavouriteSellerImageHolder extends StatelessWidget {
  const FavouriteSellerImageHolder(
      {super.key, required this.data, required this.screenSize});
  final dynamic data;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          child: FadeInImage(
              fadeInDuration: const Duration(milliseconds: 500),
              height: screenSize.height / 8,
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
              image: NetworkImage(data['sellerProfile']),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high),
        ),
        Positioned(
            top: 0,
            right: 0,
            child: FavouriteSellerRemoveButton(
                data: data, screenSize: screenSize)),
      ],
    );
  }
}
