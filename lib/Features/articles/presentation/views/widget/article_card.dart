import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/articles/data/models/get_all_article_model.dart';
import 'package:sehatak/const.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key, required this.article});
  final GetAllArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: GestureDetector(
        onTap: () {
          context.push('/article/${article.id}');
        },
        child: Container(
          height: 180.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            image: DecorationImage(
              image: article.image != null
                  ? NetworkImage(article.image!)
                  : const AssetImage('assets/images/3.png') as ImageProvider,
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Stack(
              children: [
                Positioned(
                  top: 8.h,
                  left: 8.w,
                  right: 8.w,
                  child: Text(
                    article.title,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
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
