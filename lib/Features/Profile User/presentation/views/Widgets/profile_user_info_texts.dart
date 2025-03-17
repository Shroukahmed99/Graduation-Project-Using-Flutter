import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';

class ProfileUserInfoTexts extends StatelessWidget {
  const ProfileUserInfoTexts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Full Name',
          style: TextStyle(
            fontSize: 23.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'email@example.com',
          style: TextStyle(
            fontSize: 14.sp,
            color: secondaryColor,
          ),
        ),
        Text(
          "Birthday: Jan 1st",
          style: TextStyle(
            fontSize: 12.sp,
            color: secondaryColor,
          ),
        ),
      ],
    );
  }
}
