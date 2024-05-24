import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class NoDataInFavourites extends StatelessWidget {
  const NoDataInFavourites({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: screenSize.height / 6,
              width: screenSize.width / 1.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/no data.avif')),
              ),
            ),
            const MyTextWidget(
                text: 'No Favourite Cars Found',
                color: Colors.black,
                size: 15,
                weight: FontWeight.bold)
          ],
        ),
      ),
    );
  }
}
