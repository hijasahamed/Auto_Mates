class NewsArticle {
  final String title;
  final String? description;
  final String? url;
  final String? urlToImage;

  NewsArticle.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String,
        description = json['description'] as String?,
        url = json['url'] as String?,
        urlToImage = json['urlToImage'] as String?;
}