import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/articles/presentation/manger/getHomeArticle/get_home_aricle_cubit.dart';
import 'package:sehatak/Features/home/presentation/views/widget/home%20widget/article_image.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticlesSection extends StatelessWidget {
  const ArticlesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Articles & Tips",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          BlocBuilder<GetHomeAricleCubit, GetHomeAricleState>(
            builder: (context, state) {
              if (state is GetHomeAricleLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetHomeAricleFailure) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  customSnackBar(context, state.message);
                });
                return const SizedBox.shrink();
              } else if (state is GetHomeAricleSuccess) {
                final articles = state.getarticle;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(articles.length, (index) {
                      final article = articles[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: ArticleImage(article: article),
                      );
                    }),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
