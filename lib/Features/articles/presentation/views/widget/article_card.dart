import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/articles/data/models/get_all_article_model.dart';
import 'package:sehatak/const.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key, required this.article});
  final GetAllArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: () {
          context.push('/article/${article.id}');
        },
        child: Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: article.image != null
                  ? NetworkImage(article.image!)
                  : const AssetImage('assets/images/3.png') as ImageProvider,
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Positioned(
                  top: 8,
                  left: 8,
                  right: 8,
                  child: Text(
                    article.title,
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
