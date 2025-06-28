import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/articles/presentation/manger/getAllArticle/get_all_article_cubit.dart';
import 'package:sehatak/Features/home/presentation/manger/cubit/save_name_cubit.dart';
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
          final providerState = context.read<SaveNameCubit>().state;
          String? myId;

          if (providerState is SaveNameProviderLoaded) {
            myId = providerState.provider.id;
          }

          final filteredArticles = myId != null
              ? state.allArticle
                  .where((article) => article.serviceProvider?.id == myId)
                  .toList()
              : [];

          if (filteredArticles.isEmpty) {
            return Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: const Center(
                child: Text(
'No articles added by you yet.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: filteredArticles.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemBuilder: (context, index) {
              final article = filteredArticles[index];
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
