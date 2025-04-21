import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/widget/Custom_Arrow_Icon.dart';

class CustomTextAndIconInlineProfile extends StatelessWidget {
  const CustomTextAndIconInlineProfile({
    super.key,
    required this.text,
    this.colorText = kPrimaryColor,
    this.colorArrowIcon = kPrimaryColor,
    this.spacing = 8.0,
    required this.onTap,
  });

  final String text;
  final Color colorText;
  final Color colorArrowIcon;
  final double spacing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomArrowIcon(
          colorArrowIcon: colorArrowIcon,
          onTap: onTap,
        ),
        SizedBox(width: spacing.w),
        Text(
          text,
          style: TextStyle(
            color: colorText,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            height: 30 / 20.h,
          ),
        ),
      ],
    );
  }
}
