import 'package:flutter/cupertino.dart';

import '../models/category_model.dart';
import 'Category_Card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  final List<CategoryModel> categorieslist = const [
    CategoryModel(
      image: 'assets/Business.jpg',
      categoryName: 'business',
    ),
    CategoryModel(
      image: 'assets/entertaiment.avif',
      categoryName: 'entertainment',
    ),
    CategoryModel(
      image: 'assets/general.jpg',
      categoryName: 'general',
    ),
    CategoryModel(
      image: 'assets/health.avif',
      categoryName: 'health',
    ),
    CategoryModel(
      image: 'assets/science.avif',
      categoryName: 'science',
    ),
    CategoryModel(
      image: 'assets/sports.jpg',
      categoryName: 'sports',
    ),
    CategoryModel(
      image: 'assets/technology.jpeg',
      categoryName: 'technology',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categorieslist.length,
        itemBuilder: (context, index) {
          return CategoryCard(categoryModel: categorieslist[index]);
        },
      ),
    );
  }
}
