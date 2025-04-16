import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.title,
  });
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title ?? '',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
