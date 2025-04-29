import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Community/presentation/views/widget/community_all_post_list_view.dart';
import 'package:sehatak/Features/Community/presentation/views/widget/create_post.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/features/home/presentation/views/widget/home%20widget/custom_app_bar_home.dart';

class CommunityViewBody extends StatelessWidget {
  const CommunityViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const CustomAppBarHome(title: 'Community'),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                ' Posts',
                style: TextStyle(
                  color: accentColor,
                  fontSize: 20.sp,
                ),
              ),
            ),
          ),
          SizedBox(height: 15.h),
          const CreatePost(),
          const CommunityAllPostListView(),
        ],
      ),
    );
  }
}
