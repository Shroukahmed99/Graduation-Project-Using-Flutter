import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetAllComment extends StatelessWidget {
  const GetAllComment({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 16.r,
          backgroundImage: const AssetImage("assets/images/4.png"),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'kkkkkkkkkkkkk',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
              Text(
                'sssssssssssssss',
                style: TextStyle(fontSize: 12.sp),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
