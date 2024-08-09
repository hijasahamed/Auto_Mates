import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:auto_mates/user/homescreen/model/news_model.dart';

Future<List<NewsArticle>> fetchNewsArticles() async {
    const String apiKey = '83a65d4e19834b0a967c9bfa9b72464f';
    final url = Uri.parse('https://newsapi.org/v2/everything?q=car&apiKey=$apiKey');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final articles = jsonResponse['articles'] as List;
        return articles.map((article) => NewsArticle.fromJson(article))
        .where((article) => 
          article.title.isNotEmpty && 
          (article.description != null && article.description!.isNotEmpty)
          && (article.title != '[Removed]' && article.description != '[Removed]')
        ).toList();
      } else {
        throw Exception('Failed to load news articles');
      }
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
}