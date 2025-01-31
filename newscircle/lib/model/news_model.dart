import 'package:get/get.dart';

// list to store top-headlines data
   RxList topHeadlinesData = [].obs;
  // list to store recent viewed data
   RxList recentViewedNewsData = [].obs;
  // list to store category news data
   RxList categoryNewsData = [].obs;


class NewsModel {
  final String? sourceName;
  final String? title;
  final String? author;
  final String? publishedAt;
  final String? description;
  final String? url;
  final String? content;
  final String? urlToImage;

  
  NewsModel({
    required this.sourceName,
    required this.title,
    required this.author,
    required this.publishedAt,
    required this.description,
    required this.url,
    required this.content,
    required this.urlToImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'sourceName': sourceName,
      'title': title,
      'author': author,
      'publishedAt': publishedAt,
      'description': description,
      'url': url,
      'content': content,
      'urlToImage': urlToImage,
    };
  }
}
