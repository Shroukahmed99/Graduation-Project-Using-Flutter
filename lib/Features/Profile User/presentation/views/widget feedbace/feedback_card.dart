import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';

class FeedbackCard extends StatelessWidget {
  final String name;
  final String feedbackText;
  final int rating;

  const FeedbackCard({
    super.key,
    required this.name,
    required this.feedbackText,
    this.rating = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: accentColor,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.message, size: 20.sp, color: Colors.black),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  feedbackText,
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(5, (index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Image.asset(
                    index < rating
                        ? IconPaths.selectStar
                        : IconPaths.star,
                    width: 16.w,
                    height: 16.h,
                    fit: BoxFit.contain,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
