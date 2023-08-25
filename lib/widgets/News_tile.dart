import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Newstile extends StatelessWidget {
  const Newstile({super.key, required this.articleModel});
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {

    Future<void> LaunchmyURL() async {
      final Uri myUrl = Uri.parse(articleModel.url2news);
      if (!await launchUrl(myUrl)) {
        throw Exception('Could not launch $myUrl');
      }
    }

    return GestureDetector(
      onTap: () {
        LaunchmyURL();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            // to make the the edges of the photo round directly
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              articleModel.image ??
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/300px-No_image_available.svg.png?20221208232400',
              errorBuilder:
                  (BuildContext context, Object exeption, stackTrace) =>
                      Image.network(
                'https://howfix.net/wp-content/uploads/2018/02/sIaRmaFSMfrw8QJIBAa8mA-article.png',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            articleModel.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            articleModel.subtitle ?? " ", //لو بنل حطلي تيكست فاضي
            maxLines: 2,
            style: const TextStyle(color: Colors.grey, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
