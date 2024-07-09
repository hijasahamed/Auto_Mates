import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class AllCarsToSelectHolder extends StatelessWidget {
  const AllCarsToSelectHolder(
      {super.key,
      required this.screenSize,
      required this.carContainerColor,
      required this.car,
      required this.isSelected});
  final Size screenSize;
  final Color carContainerColor;
  final dynamic car;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height / 7,
      decoration: BoxDecoration(
          color: carContainerColor, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: FadeInImage(
                  fadeInDuration: const Duration(milliseconds: 750),
                  width: screenSize.width / 2.5,
                  height: screenSize.height,
                  placeholder: const AssetImage(
                    'assets/images/image placeholder.jpeg',
                  ),
                  placeholderFit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return const CircularProgressIndicator(
                      color: Colors.blue,
                    );
                  },
                  image: NetworkImage(car['thumbnail']),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high),
            ),
          ),
          Row(
            children: [
              MyTextWidget(
                  text: car['brand'],
                  color: const Color(0xff424141),
                  size: screenSize.width / 30,
                  weight: FontWeight.bold),
              SizedBox(
                width: screenSize.width / 100,
              ),
              MyTextWidget(
                  text: car['modelName'],
                  color: const Color(0xff424141),
                  size: screenSize.width / 30,
                  weight: FontWeight.bold),
            ],
          ),
          const Spacer(),
          Visibility(
              visible: isSelected,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: screenSize.width / 35,
                ),
              ))
        ],
      ),
    );
  }
}
