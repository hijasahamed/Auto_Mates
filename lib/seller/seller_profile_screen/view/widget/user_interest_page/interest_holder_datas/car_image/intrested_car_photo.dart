import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class IntrestedCarPhoto extends StatelessWidget {
  const IntrestedCarPhoto(
      {super.key, required this.screenSize, required this.data});
  final Size screenSize;
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenSize.width/100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextWidget(text: data['sellerViewed'] == 'yes' ? '' : 'New', color: Colors.green, size: screenSize.width/35, weight: FontWeight.bold),
          ClipRRect(
            borderRadius: BorderRadius.circular(screenSize.width/100),
            child: FadeInImage(
                fadeInDuration: const Duration(milliseconds: 800),
                width: screenSize.width / 2.8,
                placeholder: const AssetImage(
                  'assets/images/image placeholder.jpeg',
                ),
                placeholderFit: BoxFit.cover,
                imageErrorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                },
                image: NetworkImage(data['carImage']),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high),
          ),
        ],
      ),
    );
  }
}
