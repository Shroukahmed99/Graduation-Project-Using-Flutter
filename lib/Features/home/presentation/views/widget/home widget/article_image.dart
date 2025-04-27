import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/articles/data/models/get_article_home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            margin: EdgeInsets.only(right: 8.w),
            width: 157.w,
            height: 134.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(
                image: article.image != null
                    ? NetworkImage(article.image!)
                    : const AssetImage("assets/images/3.png") as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          formatTitle(article.title),
          style: TextStyle(
            fontSize: 14.sp,
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
