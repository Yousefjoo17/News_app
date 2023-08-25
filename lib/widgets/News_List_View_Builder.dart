import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/widgets/News_list_view.dart';
import '../services/news_service.dart';
import 'frequent_widgets.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.catergory});
  final String catergory;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    //rebuild بتتنادي مرة واحدة بس مهما اتعمل
    super.initState();
    future = NewsService(Dio()).getTopHeadlines(category: widget.catergory);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(articlemodels: snapshot.data!);
        } else if (snapshot.hasError) {
          return const ErrorMessage();
        } else {
          return const Loading();
        }
      },
    );
  }
}

/*
class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key});

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  List<ArticleModel> articlemodels = [];
  bool isloading = true;
  @override
  void initState() {
    //بتتنادي مرة واحدة بس مهما اتعمل rebuipld
    super.initState();
    getgeneralnews();
  }

  Future<void> getgeneralnews() async {
    articlemodels = await NewsService(Dio()).getnews();
    isloading = false;
    setState(() {}); //بتعمل rebuild
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? const Loading()
        : articlemodels.isNotEmpty
            ? NewsListView(articlemodels: articlemodels)
            : const ErrorMessage()
              );
  }
}
 */
