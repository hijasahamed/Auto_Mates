import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/homescreen/controllers/news_api_controllers/news_api_controllers.dart';
import 'package:auto_mates/user/homescreen/model/news_model.dart';
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
            : buildNewsList(),
      ),
    );
  }

  

  Widget buildNewsList() {
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
                child: ListTile(
                  title: Text(article.title),
                  subtitle: Text(article.description ?? 'No description'),
                  trailing: article.urlToImage != null
                      ? Image.network(
                          article.urlToImage!,
                          width: 50.0,
                          height: 50.0,
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}