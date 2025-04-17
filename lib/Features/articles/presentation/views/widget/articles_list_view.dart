import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/articles/presentation/manger/getAllArticle/get_all_article_cubit.dart';
import 'package:sehatak/Features/articles/presentation/views/widget/article_card.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';

class ArticlesListView extends StatelessWidget {
  const ArticlesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllArticleCubit, GetAllArticleState>(
      builder: (context, state) {
        if (state is GetAllArticleLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetAllArticleFailure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            customSnackBar(context, state.message);
          });
          return const SizedBox.shrink();
        } else if (state is GetAllArticleSuccess) {
          final articles = state.allArticle;
          return ListView.builder(
            itemCount: articles.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              final article = articles[index];
              return ArticleCard(article: article);
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
