import 'package:flutter/foundation.dart';
import 'package:news_app_mvvm/models/news_article.dart';
import 'package:news_app_mvvm/services/api_service.dart';
import 'package:news_app_mvvm/viewmodels/news_article_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class NewsArticleListViewModel with ChangeNotifier {

  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<NewsArticleViewModel> articles = [];

  void topHeadlines() async {

    List<NewsArticle> newsArticles = await ApiService().fetchTopHeadlines();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.articles = newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();

    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}