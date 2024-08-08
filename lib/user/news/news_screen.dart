import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/commonwidgets/no_data_error_placeholder/no_data_error_placeholder.dart';
import 'package:auto_mates/user/homescreen/controllers/news_api_controllers/news_api_controllers.dart';
import 'package:auto_mates/user/homescreen/model/news_model.dart';
import 'package:auto_mates/user/news/news_read_screen/news_read_screen.dart';
import 'package:flutter/material.dart';


class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Future<List<NewsArticle>>? carNewsArticleList;

  @override
  void initState() {
    super.initState();
    carNewsArticleList = fetchNewsArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50), 
        child: NormalAppBar(title: 'Latest Car News Articles')
      ),
      body: Center(
        child: carNewsArticleList == null
            ? const CircularProgressIndicator()
            : buildNewsList(screenSize: widget.screenSize),
      ),
    );
  }

  

  Widget buildNewsList({screenSize}) {
    return FutureBuilder<List<NewsArticle>>(
      future: carNewsArticleList!,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final articles = snapshot.data!;
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return Card(
                color: Colors.white,
                elevation: 2,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return NewsReadScreen(screenSize: widget.screenSize,article: article,);
                    },));
                  },
                  child: ListTile(
                    title: MyTextWidget(text: article.title, color: Colors.blueGrey, size: screenSize.width/30, weight: FontWeight.bold,maxline: true,),
                    subtitle: MyTextWidget(text: article.description ?? 'No description', color: Colors.black, size: screenSize.width/27, weight: FontWeight.normal,maxline: true,),
                    trailing: article.urlToImage != null
                        ? Image.network(
                            article.urlToImage!,
                            width: screenSize.width/5,
                            height: screenSize.width/5,
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return NoDataErrorPlaceholder(screenSize: screenSize, titleText: 'No News Fetched');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}