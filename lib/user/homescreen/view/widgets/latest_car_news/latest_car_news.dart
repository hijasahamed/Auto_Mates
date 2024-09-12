import 'package:auto_mates/user/homescreen/view/bloc/homescreen_bloc.dart';
import 'package:auto_mates/user/homescreen/view/widgets/latest_car_news/latest_car_news_banners/latest_car_news_banners.dart';
import 'package:auto_mates/user/homescreen/view/widgets/latest_car_news/latest_car_news_title_and_more_button/latest_car_news_title_and_more_button.dart';
import 'package:auto_mates/user/news/news_read_screen/news_read_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LatestCarNews extends StatelessWidget {
  const LatestCarNews({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    HomescreenBloc articleBannerNavBlocInstance = HomescreenBloc();
    return BlocConsumer<HomescreenBloc, HomescreenState>(
      bloc: articleBannerNavBlocInstance,
      listener: (context, state) {
        if(state is NavigateLatestNewsBannerToReadScreenState){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return NewsReadScreen(screenSize: screenSize, article: state.article);
          },));
        }
      },
      builder: (context, state) {
        return Card(
          elevation: 5,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(screenSize.width/100),
            child: SizedBox(
              height: screenSize.height/3.1,
              width: screenSize.width,
              child: Column(
                children: [
                  LatestCarNewsTitleAndMoreButton(screenSize: screenSize),
                  LatestCarNewsBanners(
                    screenSize: screenSize,
                    articleBannerNavBlocInstance: articleBannerNavBlocInstance,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
