import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SellersRating extends StatelessWidget {
  const SellersRating(
      {super.key, required this.screenSize, required this.sellerData});
  final Size screenSize;
  final dynamic sellerData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(
        children: [
          const Icon(Icons.star),
          SizedBox(
            width: screenSize.width / 75,
          ),
          StreamBuilder(
            stream: getAverageRating(documentId: sellerData.id,),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(color: Colors.blue,);
              } else if (snapshot.hasError) {
                return Center(child: MyTextWidget(text: 'No Rating', color: const Color(0xFF424141), size: screenSize.width/30, weight: FontWeight.w600));
              } else if (!snapshot.hasData) {
                return  Center(child: MyTextWidget(text: 'No Rating', color: const Color(0xFF424141), size: screenSize.width/30, weight: FontWeight.w600));
              } else {
                double averageRating = snapshot.data!;
                return Row(                
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextWidget(
                        text: averageRating.toString(),
                        color: const Color(0xFF424141),
                        size: screenSize.width / 30,
                        weight: FontWeight.w600
                    ),
                    RatingBarIndicator(
                      rating: averageRating,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: screenSize.width / 28,
                      direction: Axis.horizontal,
                    ),
                    StreamBuilder(
                      stream: getNumberOfRating(documentId: sellerData.id,), 
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const SizedBox.shrink();
                        } else if (snapshot.hasError) {
                          return Center(child: MyTextWidget(text: '0', color: const Color(0xFF424141), size: screenSize.width/30, weight: FontWeight.w600));
                        } else if (!snapshot.hasData) {
                          return  Center(child: MyTextWidget(text: '0', color: const Color(0xFF424141), size: screenSize.width/30, weight: FontWeight.w600));
                        }else{
                          dynamic numberOfRatings = snapshot.data!;
                          return MyTextWidget(
                            text: '(${numberOfRatings.toString()} rates)',
                            color: const Color(0xFF424141),
                            size: screenSize.width / 50,
                            weight: FontWeight.w600
                          );
                        }
                      },
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
