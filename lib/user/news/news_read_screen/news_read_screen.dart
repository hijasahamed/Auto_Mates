import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/homescreen/model/news_model.dart';
import 'package:flutter/material.dart';

class NewsReadScreen extends StatelessWidget {
  const NewsReadScreen(
      {super.key, required this.screenSize, required this.article});
  final Size screenSize;
  final NewsArticle article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Colors.grey,
              )),
          title: MyTextWidget(text: 'Article', color: Colors.grey, size: screenSize.width/25, weight: FontWeight.w500),
        ),
        body: Padding(
          padding: EdgeInsets.all(screenSize.width / 50),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: screenSize.height / 2.3,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                      border: Border.all(width: .2, color: Colors.grey),                      
                      borderRadius:
                      BorderRadius.circular(screenSize.width / 100)
                  ),
                  child: article.urlToImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(screenSize.width / 100),
                        child: Image.network(
                          article.urlToImage!,
                          fit: BoxFit.cover,
                          width: screenSize.width,
                          height: screenSize.height / 2.3,
                        ),
                      )
                    : Center(
                        child: MyTextWidget(
                          text: 'Image not available',
                          color: Colors.grey,
                          size: screenSize.width / 24,
                          weight: FontWeight.bold,
                          alignTextCenter: true,
                        ),
                      ),
                ),
                const Divider(),
                SizedBox(
                  height: screenSize.height / 80,
                ),
                MyTextWidget(
                  text: article.title,
                  color: Colors.black,
                  size: screenSize.width / 22,
                  weight: FontWeight.bold,
                  maxline: true,
                  alignTextCenter: true,
                ),
                const Divider(),
                SizedBox(
                  height: screenSize.height / 70,
                ),
                MyTextWidget(
                  text: article.description!,
                  color: Colors.grey,
                  size: screenSize.width / 26,
                  weight: FontWeight.bold,
                  maxline: true,
                )
              ],
            ),
          ),
        ));
  }
}
