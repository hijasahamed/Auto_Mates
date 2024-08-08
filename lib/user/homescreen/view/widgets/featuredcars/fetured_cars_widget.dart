import 'package:auto_mates/user/homescreen/view/bloc/homescreen_bloc.dart';
import 'package:auto_mates/user/homescreen/view/widgets/featuredcars/featured_cars_list/featured_cars_list.dart';
import 'package:auto_mates/user/homescreen/view/widgets/featuredcars/featured_list_title_and_view_more_button/featured_list_title_and_view_more_button.dart';
import 'package:auto_mates/user/homescreen/view/widgets/featuredcars/featured_list_title_and_view_more_button/featured_section_all_cars_screen/featured_section_all_cars_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedCarsWidget extends StatelessWidget {
  const FeaturedCarsWidget({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    HomescreenBloc featuredSectionBlocInstance = HomescreenBloc();
    return BlocConsumer<HomescreenBloc, HomescreenState>(
      bloc: featuredSectionBlocInstance,
      listener: (context, state) {
        if(state is FeaturedCarsAllListNavigationState){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FeaturedSectionAllCarsScreen(screenSize: screenSize,)
          ));
        }
      },
      builder: (context, state) {
        return Card(
          elevation: 5,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: SizedBox(
              height: screenSize.height / 4,
              width: screenSize.width,
              child: Column(
                children: [
                  FeaturedListTitleAndViewMoreButton(screenSize: screenSize,featuredSectionBlocInstance: featuredSectionBlocInstance,),
                  FeaturedCarsList(screenSize: screenSize),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
