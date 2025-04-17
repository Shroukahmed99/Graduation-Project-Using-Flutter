import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/articles/data/models/get_article_home.dart';

class ArticleImage extends StatelessWidget {
  final GetArticleHome article;
  const ArticleImage({super.key, required this.article});

  String formatTitle(String title) {
    List<String> words = title.split(' ');
    StringBuffer formattedTitle = StringBuffer();
    for (int i = 0; i < words.length; i++) {
      formattedTitle.write(words[i] + ' ');
      if ((i + 1) % 5 == 0) {
        formattedTitle.write('\n');
      }
    }

    return formattedTitle.toString().trim();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            context.push('/article/${article.id}');
          },
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            width: 157,
            height: 134,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: article.image != null
                    ? NetworkImage(article.image!)
                    : const AssetImage("assets/images/3.png") as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          formatTitle(article.title),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
