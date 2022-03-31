
import 'dart:convert';

import 'package:news_app_mvvm/models/news_article.dart';
import 'package:http/http.dart' as http;

class ApiService {

  Future<List<NewsArticle>> fetchTopHeadlines() async {

    String url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=adb54f67e6f34cfbb22f0d52d21e05e1';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      
      Map<String, dynamic> data = json.decode(response.body);

      Iterable list = data['articles'];
      print('List_Count: ${list.length}');

      return list.map((article) => NewsArticle.fromJSON(article)).toList();

    } else {
      throw Exception('Failed to  fetch top headlines');
    }

  }
}