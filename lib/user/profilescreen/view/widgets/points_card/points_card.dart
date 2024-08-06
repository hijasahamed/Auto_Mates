import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/points_card/info_button/info_button.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/points_card/point_count/point_count.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PointsCard extends StatelessWidget {
  const PointsCard({super.key, required this.screenSize,required this.user});
  final Size screenSize;
  final UserData user;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
      elevation: 4,
      child: Container(
        width: screenSize.width,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 238, 238, 238),
            borderRadius: BorderRadius.circular(screenSize.width / 60),
            border: Border.all(width: 0.01)),
        child: Padding(
          padding: EdgeInsets.all(screenSize.width / 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextWidget(
                text: 'AutoMates Coins',
                color: Colors.blueGrey,
                size: screenSize.width / 25,
                weight: FontWeight.bold
              ),
              Expanded(
                child: Row(
                  children: [
                    FaIcon(FontAwesomeIcons.coins,color: Colors.green,size: screenSize.width/10,),
                    SizedBox(width: screenSize.width/25,),
                    PointCount(screenSize: screenSize, user: user),
                    const Spacer(),
                    InfoButton(screenSize: screenSize),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}