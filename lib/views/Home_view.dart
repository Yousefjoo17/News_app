import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/News_List_View_Builder.dart';
import '../widgets/Categories_List_viewt.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //centerTitle: true,  if there was only text without row I would use it
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'News',
                style: TextStyle(color: Colors.black),
              ),
              Text("Cloud",
                  style: TextStyle(
                    color: Colors.orange,
                  )),
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
               child: CategoriesListView(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 30),
              ),
               NewsListViewBuilder(catergory :'general'),
            ],
          ),
        ));
  }
}
