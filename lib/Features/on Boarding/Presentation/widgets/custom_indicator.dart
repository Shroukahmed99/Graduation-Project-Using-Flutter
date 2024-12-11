import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, required this.dotsIndex});
  final int? dotsIndex;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 550.h,
      left: 150.w,
      child: DotsIndicator(
        dotsCount: 3,
        position: dotsIndex ?? 0,
        decorator: DotsDecorator(
          activeSize: Size(20.w, 4.h),
          size: Size(20.w, 4.h),
          activeColor: secondaryColor,
          color: kPrimaryColor,
          spacing: EdgeInsets.symmetric(horizontal: 4.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    );
  }
}
