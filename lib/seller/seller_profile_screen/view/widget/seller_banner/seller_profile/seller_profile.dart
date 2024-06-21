import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SellerProfileWidget extends StatelessWidget {
  const SellerProfileWidget(
      {super.key, required this.screenSize, required this.data});
  final Size screenSize;
  final SellerData data;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: screenSize.height / 17.5,
      backgroundColor: Colors.green,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: screenSize.height / 18,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: data.sellerProfile,
            placeholder: (context, url) => const CircularProgressIndicator(
              color: Colors.blue,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
