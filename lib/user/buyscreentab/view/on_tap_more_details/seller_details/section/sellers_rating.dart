import 'package:auto_mates/user/buyscreentab/controller/functions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

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
            stream: getAverageRating(sellerData.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(color: Colors.blue,);
              } else if (snapshot.hasError) {
                return Center(child: MyTextWidget(text: 'No Rating', color: const Color(0xFF424141), size: screenSize.width/30, weight: FontWeight.w600));
              } else if (!snapshot.hasData) {
                return  Center(child: MyTextWidget(text: 'No Rating', color: const Color(0xFF424141), size: screenSize.width/30, weight: FontWeight.w600));
              } else {
                double averageRating = snapshot.data!;
                return MyTextWidget(
                    text: averageRating.toString(),
                    color: const Color(0xFF424141),
                    size: screenSize.width / 30,
                    weight: FontWeight.w600);
              }
            },
          ),
        ],
      ),
    );
  }
}
