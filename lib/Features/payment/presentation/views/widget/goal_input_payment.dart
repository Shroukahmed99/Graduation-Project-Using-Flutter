import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoalInputWidget extends StatelessWidget {
  final TextEditingController controller;

  const GoalInputWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: TextField(
        controller: controller,
        maxLines: 5,
        style: TextStyle(
          fontSize: 16.sp,
        ),
        decoration: const InputDecoration(
          hintText: 'Add text...',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
