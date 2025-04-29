import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 20.r),
                SizedBox(width: 8.w),
                const Text(
                  "MOHAMED KHALED",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            const TextField(
              maxLines: null,
              decoration: InputDecoration(
                hintText: "Enter Text...",
                hintStyle: TextStyle(color: accentColor),
                border: InputBorder.none,
              ),
              style: TextStyle(color: accentColor),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                const Icon(
                  Icons.image,
                  color: kPrimaryColor,
                  size: 34,
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(kPrimaryColor),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Share",
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                      SizedBox(width: 6.w),
                      const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
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
