import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:flutter/material.dart';

class CarImage extends StatelessWidget {
  const CarImage(
      {super.key,
      required this.screenSize,
      required this.data,
      this.fromSeller});
  final Size screenSize;
  final dynamic data;
  final bool? fromSeller;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: screenSize.height / 4,
          width: screenSize.width,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              image: DecorationImage(
                  image: NetworkImage(data['image']), fit: BoxFit.cover)),
        ),
        (fromSeller == false)
            ? Positioned(
                top: 5,
                right: 5,
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.black45,
                  child: IconButton(
                  onPressed: () {
                    addCarToUserFavourite(data: data, context: context);
                  }, 
                  icon: const Icon(Icons.favorite_rounded,color: Colors.white,size: 18,)
                ),
            ))
            : const SizedBox()
      ],
    );
  }
}
