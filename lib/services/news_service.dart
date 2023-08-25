import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    try {
      var response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=cf002dfe039744afbc5176b44e42a3fc&category=$category',
      );
      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articlemodels = [];

      for (var article in articles) {
        articlemodels.add(
          ArticleModel(
            image: article['urlToImage'],
            title: article['title'],
            subtitle: article['description'],
            url2news: article['url'],
          ),
        );
      }
      return articlemodels;
    } catch (e) {
      return [];
    }
  }
}
