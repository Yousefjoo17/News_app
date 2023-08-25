import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/News_List_View_Builder.dart';

class CatergoryView extends StatelessWidget {
  const CatergoryView({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NewsListViewBuilder(catergory: category,),
        ],
      ),
    );
  }
}
