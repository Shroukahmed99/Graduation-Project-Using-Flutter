import 'package:flutter/material.dart';
import 'package:sehatak/Features/articles/presentation/views/widget/articles_view_body.dart';

class ArticlesListView extends StatelessWidget {
  const ArticlesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const ArticleCard();
      },
    );
  }
}
