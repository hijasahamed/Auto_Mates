import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/homescreen/view/widgets/featuredcars/featured_cars_list/featured_cars_list.dart';
import 'package:auto_mates/user/homescreen/view/widgets/featuredcars/featured_list_title_and_view_more_button/featured_list_title_and_view_more_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeaturedCarsWidget extends StatelessWidget {
  const FeaturedCarsWidget({super.key,required this.screenSize});
  final Size screenSize;  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: SizedBox(
          height: screenSize.height/4,
          width: screenSize.width, 
          child: Column(
                children: [
                  FeaturedListTitleAndViewMoreButton(screenSize: screenSize),
                  FeaturedCarsList(screenSize: screenSize),
                ],
              ),
        ),
      ),
    );
  }
}