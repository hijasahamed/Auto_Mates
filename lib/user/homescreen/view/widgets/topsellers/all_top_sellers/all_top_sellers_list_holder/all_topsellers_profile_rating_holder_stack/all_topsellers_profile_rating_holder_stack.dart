import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class AllTopsellersProfileRatingHolderStack extends StatelessWidget {
  const AllTopsellersProfileRatingHolderStack({super.key,required this.rating,required this.screenSize,required this.sellerData});
  final Size screenSize;
  final dynamic sellerData;
  final dynamic rating;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          child: FadeInImage(
              fadeInDuration: const Duration(milliseconds: 500),
              height: screenSize.height / 6.2,
              width: screenSize.width,
              placeholder: const AssetImage(
                'assets/images/image placeholder.jpeg',
              ),
              placeholderFit: BoxFit.cover,
              imageErrorBuilder: (context, error, stackTrace) {
                return SizedBox(
                  height: screenSize.height / 6.2,
              width: screenSize.width,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
                );
              },
              image: NetworkImage(sellerData['sellerProfile']),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high),
        ),
        Positioned(
          top: screenSize.width/50,
          left: screenSize.width/50,
          child: Container(
            height: screenSize.height/32,
            width: screenSize.width/8,
            decoration: BoxDecoration(
              color: const Color(0xFF1888FE),
              borderRadius: BorderRadius.circular(5)
            ),
            child: Row(
              children: [
                Icon(Icons.star,color: Colors.white,size: screenSize.width/24,),                            
                MyTextWidget(text: rating.toString(), color: Colors.white, size: screenSize.width/24, weight: FontWeight.bold)
              ],
            ),
          )
        )
      ],
    );
  }
}