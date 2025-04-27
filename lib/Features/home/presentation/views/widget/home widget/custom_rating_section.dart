import 'package:flutter/material.dart';
import 'package:sehatak/Features/home/presentation/views/widget/home%20widget/top_rating_list_view.dart';
import 'package:sehatak/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 393.w,
      color: kPrimaryColor,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: Text(
                "TOP RATING",
                style: TextStyle(
                  fontFamily: 'Radio Canada Big',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          const TopRatingListView(),
        ],
      ),
    );
  }
}
