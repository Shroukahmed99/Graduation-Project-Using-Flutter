import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';

class CommunityAllPost extends StatelessWidget {
  final VoidCallback onCommentTap;

  const CommunityAllPost({super.key, required this.onCommentTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 35.w, right: 35.w, bottom: 14.h),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: kPrimaryColor),
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: const AssetImage("assets/images/4.png"),
                ),
                SizedBox(width: 8.w),
                const Text(
                  "KHALED",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            const Text(
              "Lorem ipsum dolor sit amet consectetur. Tortor aenean suspendisse pretium nunc non facilisi.",
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite, color: kPrimaryColor, size: 18.sp),
                    SizedBox(width: 4.w),
                    const Text(
                      "30,254",
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: onCommentTap,
                  child: Row(
                    children: [
                      Icon(Icons.sms, color: kPrimaryColor, size: 18.sp),
                      SizedBox(width: 4.w),
                      const Text(
                        "1,254",
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
