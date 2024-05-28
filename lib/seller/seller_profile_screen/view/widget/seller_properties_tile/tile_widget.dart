import 'package:auto_mates/seller/seller_profile_screen/view/widget/user_interest_page/user_interests_page.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  const TileWidget({super.key, required this.screenSize,required this.title,this.isUserInterest});
  final Size screenSize;
  final String title;
  final bool? isUserInterest;
  @override
  Widget build(BuildContext context) {
    return Ink(
      height: screenSize.height / 15,
      width: screenSize.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 195, 226, 239)),
      child: InkWell(
        onTap: () {
          if(isUserInterest==true){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return UserInterestsPage(screenSize: screenSize);
            },));
          }                  
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyTextWidget(
                  text: title,
                  color: const Color(0XFF424141),
                  size: 15,
                  weight: FontWeight.bold),
                  const Spacer(),
              (isUserInterest==true)? const CircleAvatar(backgroundColor: Colors.green,radius: 7,):const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
