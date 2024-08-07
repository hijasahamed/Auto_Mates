import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/homescreen/controllers/news_api_controllers/news_api_controllers.dart';
import 'package:auto_mates/user/homescreen/model/news_model.dart';
import 'package:auto_mates/user/homescreen/view/bloc/homescreen_bloc.dart';
import 'package:flutter/material.dart';

class LatestCarNewsBanners extends StatelessWidget {
  const LatestCarNewsBanners({super.key, required this.screenSize,required this.articleBannerNavBlocInstance});
  final Size screenSize;
  final HomescreenBloc articleBannerNavBlocInstance;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height/3.8,
      width: screenSize.width,
      child: FutureBuilder<List<NewsArticle>>(
        future: fetchNewsArticles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.blue,));
          } else if (snapshot.hasError) {
            return Center(
              child: MyTextWidget(text: 'Something Went Wrong', color: Colors.grey, size: screenSize.width/30, weight: FontWeight.bold),
            );
          } else{
            if(snapshot.hasData){
              final articles = snapshot.data!.take(2).toList();
              return Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: screenSize.width/120),
                      child: GestureDetector(
                        onTap: () {
                          articleBannerNavBlocInstance.add(NavigateLatestNewsBannerToReadScreenEvent(article: articles[0]));
                        },
                        child: buildNewsBanner(news: articles[0])
                      ),
                    )
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: screenSize.width/120),
                      child: GestureDetector(
                        onTap: () {
                          articleBannerNavBlocInstance.add(NavigateLatestNewsBannerToReadScreenEvent(article: articles[1]));
                        },
                        child: buildNewsBanner(news: articles[1])
                      ),
                    )
                  ),
                ],
              );
            }else{
              return Center(
              child: MyTextWidget(text: 'No News Found', color: Colors.grey, size: screenSize.width/30, weight: FontWeight.bold),
            );
            }
          }
        },
      ),
    );
  }

  Container buildNewsBanner({news}) => Container(
    decoration: BoxDecoration(
      border: Border.all(width: .3,color: Colors.grey),
      borderRadius: BorderRadius.circular(screenSize.width/100)
    ),
    child: Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(screenSize.width / 100),
                topRight: Radius.circular(screenSize.width / 100),
              ),
              border: Border.all(width: .2,color: Colors.grey)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(screenSize.width / 100),
                topRight: Radius.circular(screenSize.width / 100),
              ),
              child: Image.network(
                news.urlToImage,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(screenSize.width/100),
          child: MyTextWidget(text: news.title, color: Colors.grey, size: screenSize.width/30, weight: FontWeight.w400,maxline: true,),
        )
      ],
    ),
  );

}