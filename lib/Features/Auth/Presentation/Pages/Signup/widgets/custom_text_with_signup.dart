import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';

class CustomTextWithSignup extends StatelessWidget {
  const CustomTextWithSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'By continuing, you agree to',
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontSize: 13.sp,
            fontWeight: FontWeight.w300,
            height: 11.96 / 13.h,
            color: kPrimaryColor,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Terms of Use ',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                height: 11.96 / 13.h,
                color: kPrimaryColor,
              ),
            ),
            Text(
              ' and ',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontSize: 13.sp,
                fontWeight: FontWeight.w300,
                height: 11.96 / 13.h,
                color: kPrimaryColor,
              ),
            ),
            Text(
              'Privacy Policy.',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                height: 11.96 / 13.h,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
