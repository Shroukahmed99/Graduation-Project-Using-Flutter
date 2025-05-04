import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/widget/Custom_Arrow_Icon.dart';

class CustomTextAndIconArrowback extends StatelessWidget {
  const CustomTextAndIconArrowback({
    super.key,
    required this.text,
    this.colorText = kPrimaryColor,
    this.colorArrowIcon = kPrimaryColor,
    this.spacing = 8.0,
  });

  final String text;
  final Color colorText;
  final Color colorArrowIcon;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomArrowIcon(
          colorArrowIcon: colorArrowIcon,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        SizedBox(width: spacing.w),
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colorText,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              height: 30 / 20.h,
            ),
          ),
        ),
      ],
    );
  }
}
