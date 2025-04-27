import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';

class CustomStorBy extends StatelessWidget {
  const CustomStorBy({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 56.w, right: 35.w),
      child: Row(
        children: [
          Text(
            "Sort By",
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: accentColor),
          ),
          SizedBox(width: 10.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 3.h),
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              "Price",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          SizedBox(width: 15.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 3.h),
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              "Rating",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          SizedBox(width: 15.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 3.h),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              "All",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
