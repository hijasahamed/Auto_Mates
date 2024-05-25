import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class BannerCardWidget extends StatelessWidget {
  const BannerCardWidget({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height / 5,
      width: screenSize.width,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage('assets/images/profile_png.png'),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 55,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
            SizedBox(
              width: screenSize.width/2.5,
              child: TextButton(
                  onPressed: () {
                    
                  },
                  child: Row(
                    children: [
                      const MyTextWidget(
                          text: 'Edit profile',
                          color: Colors.white,
                          size: 15,
                          weight: FontWeight.w500),
                      SizedBox(
                        width: screenSize.width / 75,
                      ),
                      const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 15,
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
