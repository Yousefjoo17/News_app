import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/widgets/News_tile.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articlemodels;
  const NewsListView({super.key, required this.articlemodels});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articlemodels.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Newstile(articleModel: articlemodels[index]),
          );
        },
      ),
    );
  }
}
