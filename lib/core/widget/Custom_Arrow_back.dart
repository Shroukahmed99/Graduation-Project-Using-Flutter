import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/widget/Custom_Arrow_Icon.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomArrowIcon(),
          const CustomSizedBox(
            width: 6,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
