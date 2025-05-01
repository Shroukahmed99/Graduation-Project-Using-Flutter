import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/articles/presentation/views/widget/article_input_card.dart';
import 'package:sehatak/Features/articles/presentation/views/widget/articles_list_view.dart';
import 'package:sehatak/core/widget/custom_app_bar_home.dart';
import 'package:sehatak/const.dart';

class ArticlesViewBody extends StatelessWidget {
  const ArticlesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const CustomAppBarHome(title: 'Articles'),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                ' Articles',
                style: TextStyle(
                  color: accentColor,
                  fontSize: 20.sp,
                ),
              ),
            ),
          ),
          SizedBox(height: 15.h),
          const ArticleInputCard(),
          SizedBox(height: 25.h),
          Text(
            'Your Articles',
            style: TextStyle(
              color: accentColor,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 25.h),
          const ArticlesListView(),
        ],
      ),
    );
  }
}
