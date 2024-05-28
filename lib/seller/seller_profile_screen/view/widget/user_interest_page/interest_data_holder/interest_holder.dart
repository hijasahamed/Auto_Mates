import 'package:auto_mates/seller/seller_profile_screen/controllers/functions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InterestHolder extends StatelessWidget {
  const InterestHolder(
      {super.key, required this.screenSize, required this.data});
  final Size screenSize;
  final DocumentSnapshot data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height / 6,
      width: screenSize.width,
      child: Card(
        color: const Color.fromARGB(255, 243, 243, 243),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
              
              child: FadeInImage(
                fadeInDuration: const Duration(milliseconds: 800),
                height: screenSize.height / 1,
                width: screenSize.width / 2.8,
                placeholder: const AssetImage(
                  'assets/images/image placeholder.jpeg',
                ),
                placeholderFit: BoxFit.cover,
                imageErrorBuilder: (context, error, stackTrace) {
                  return const CircularProgressIndicator(
                    color: Colors.blue,
                  );
                },
                image: NetworkImage(data['carImag']),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextWidget(text: data['userName'], color: Colors.black, size: 17, weight: FontWeight.bold),
                  MyTextWidget(text: data['userContact'], color: Colors.black, size: 14, weight: FontWeight.bold),
                  MyTextWidget(text: data['userLocation'], color: Colors.black, size: 14, weight: FontWeight.bold),
                  MyTextWidget(text: data['carName'], color: Colors.black, size: 14, weight: FontWeight.bold),
                  MyTextWidget(text: data['carNumber'], color: Colors.black, size: 14, weight: FontWeight.bold),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    
                  }, 
                  child: const MyTextWidget(text: 'Contact Customer', color: Colors.blue, size: 12, weight: FontWeight.bold)
                ),
                TextButton(
                  onPressed: () {
                    removeUsersInterest(context: context,docId: data.id);
                  }, 
                  child: const MyTextWidget(text: 'Remove Interest', color: Colors.red, size: 12, weight: FontWeight.bold)
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


