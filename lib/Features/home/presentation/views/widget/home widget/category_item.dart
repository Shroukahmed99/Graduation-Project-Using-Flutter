import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String? title;
  final VoidCallback? onTap;

  const CategoryItem({
    super.key,
    required this.imagePath,
    this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 40.w,
            height: 40.h,
            color: kPrimaryColor,
          ),
          Text(
            title!,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                color: kPrimaryColor),
          ),
        ],
      ),
    );
  }
}
