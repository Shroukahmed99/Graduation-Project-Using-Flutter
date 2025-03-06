import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';

class CustomTextQuestion extends StatelessWidget {
  const CustomTextQuestion(
      {super.key, this.onPress, required this.text, required this.title});
  final void Function()? onPress;
  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'League Spartan',
            fontSize: 14.sp,
            fontWeight: FontWeight.w300,
            height: 1.h,
            decoration: TextDecoration.none,
          ),
        ),
        TextButton(
          onPressed: onPress,
          child: Text(
            text,
            style: TextStyle(
              color: kPrimaryColor,
              fontFamily: 'League Spartan',
              fontSize: 14.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
