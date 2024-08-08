import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/homescreen/view/bloc/homescreen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedListTitleAndViewMoreButton extends StatelessWidget {
  const FeaturedListTitleAndViewMoreButton(
      {super.key, required this.screenSize,required this.featuredSectionBlocInstance});
  final Size screenSize;
  final HomescreenBloc featuredSectionBlocInstance;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: screenSize.width/150),
          child: Row(
            children: [
              MyTextWidget(
                  text: 'Featured Cars',
                  color: const Color(0xff424141),
                  size: screenSize.width / 16.5,
                  weight: FontWeight.bold),
              SizedBox(
                width: screenSize.width / 40,
              ),
              GlitterContainer(screenSize: screenSize),
            ],
          ),
        ),
        TextButton(
            onPressed: () {
              featuredSectionBlocInstance.add(FeaturedCarsAllListNavigationEvent());
            },
            child: MyTextWidget(
                text: 'See More',
                color: Colors.blue,
                size: screenSize.width / 38,
                weight: FontWeight.bold))
      ],
    );
  }
}


class GlitterContainer extends StatelessWidget {
  const GlitterContainer({super.key, required this.screenSize});

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.green,
          highlightColor: Colors.lightGreenAccent,
          child: Container(
            height: screenSize.height / 40,
            width: screenSize.width / 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.green,
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: MyTextWidget(
              text: 'Promoted',
              color: Colors.white,
              size: screenSize.width / 45,
              weight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}