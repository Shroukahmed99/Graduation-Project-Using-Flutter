import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/articles/data/models/get_article_home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleImage extends StatelessWidget {
  final GetArticleHome article;

  const ArticleImage({super.key, required this.article});

  String shortenTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length <= 3) return title;
    return '${words.sublist(0, 3).join(' ')}...';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      width: 157.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              context.push('/article/${article.id}');
            },
            child: Container(
              width: 157.w,
              height: 134.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                image: DecorationImage(
                  image: article.image != null
                      ? NetworkImage(article.image!)
                      : const AssetImage("assets/images/3.png")
                          as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            shortenTitle(article.title),
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
