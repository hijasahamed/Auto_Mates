import 'package:auto_mates/user/homescreen/model/news_model.dart';
import 'package:flutter/material.dart';

class NewsReadScreen extends StatelessWidget {
  const NewsReadScreen({super.key,required this.screenSize,required this.article});
  final Size screenSize;
  final NewsArticle article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(), 
          icon: const Icon(Icons.arrow_back_ios_new_sharp,color: Colors.grey,)
        ),
      ),
      body: const Center(
        child: Text('News'),
      ),
    );
  }
}