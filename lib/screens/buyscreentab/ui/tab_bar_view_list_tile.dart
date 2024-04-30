import 'package:flutter/material.dart';

class TabBarViewListTile extends StatelessWidget {
  const TabBarViewListTile({super.key,required this.leading,required this.title,required this.screenSize});
  final String leading;
  final String title;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: screenSize.width/3,
          height: screenSize.width/10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(leading,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Color.fromARGB(255, 118, 118, 118))),
              ],
            ),
          )
        ),
        SizedBox(
          width: screenSize.width/3,
          height: screenSize.width/10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Color.fromARGB(255, 118, 118, 118))),
              ],
            ),
          )
        ),
      ],
    );
  }
}