import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, this.title, this.subTitle});
  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title ?? '',
          style:  TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
         SizedBox(
          height: 15.h,
        ),
        Text(
          subTitle ?? "",
          textAlign: TextAlign.center,
          style:  TextStyle(
            color: usedColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w300,
            fontFamily: 'League Spartan',
            height: 14 / 14 .h,
            decoration: TextDecoration.none,
          ),
        )
      ],
    );
  }
}
