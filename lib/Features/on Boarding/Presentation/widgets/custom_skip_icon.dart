import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';

class CustomSkipIcon extends StatelessWidget {
  const CustomSkipIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 65.h, left: 270.w),
      child: Row(
        children: [
          Text(
            'Skip',
            style: TextStyle(
              fontSize: 20.sp,
              fontFamily: 'LeagueSpartan',
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
          SizedBox(width: 3.w),
          Image.asset(
            'assets/images/v.png',
            height: 11.h,
            width: 16.w,
          ),
        ],
      ),
    );
  }
}
