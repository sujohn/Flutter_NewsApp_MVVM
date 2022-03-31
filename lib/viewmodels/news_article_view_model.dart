import 'package:news_app_mvvm/models/news_article.dart';

class NewsArticleViewModel {

  NewsArticle _newsArticle;

  NewsArticleViewModel({ required NewsArticle article}) : _newsArticle = article;

  String get title {
    return _newsArticle.title ?? "";
  }
}