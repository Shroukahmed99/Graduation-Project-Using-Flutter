import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';

class CustomQuestionAndAswer extends StatelessWidget {
  const CustomQuestionAndAswer(
      {super.key, required this.question, required this.answer});
  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          question,
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
            height: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 50.h,
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              answer,
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: usedColor.withOpacity(0.6),
                height: 1.0,
              ),
              textAlign: TextAlign.center,
            )),
      ],
    );
  }
}
