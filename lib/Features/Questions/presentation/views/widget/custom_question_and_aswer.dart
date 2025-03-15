import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';

class CustomQuestionAndAswer extends StatelessWidget {
  const CustomQuestionAndAswer({
    super.key,
    required this.question,
  });

  final String question;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
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
        ),
      ],
    );
  }
}
