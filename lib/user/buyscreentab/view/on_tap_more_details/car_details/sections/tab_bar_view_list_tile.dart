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
            padding: const EdgeInsets.all(2),
            child: Text(leading,style: TextStyle(fontWeight: FontWeight.w500,fontSize: screenSize.width/27,color: Colors.blueGrey)),
          )
        ),
        SizedBox(
          width: screenSize.width/3,
          height: screenSize.width/10,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Text(title,style: TextStyle(fontWeight: FontWeight.w500,fontSize: screenSize.width/27,color: Colors.blueGrey)),
          )
        ),
      ],
    );
  }
}