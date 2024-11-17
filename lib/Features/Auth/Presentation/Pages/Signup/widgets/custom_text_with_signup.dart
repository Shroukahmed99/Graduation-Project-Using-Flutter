import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class CustomTextWithSignup extends StatelessWidget {
  const CustomTextWithSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'By continuing, you agree to',
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontSize: 13,
            fontWeight: FontWeight.w300,
            height: 11.96 / 13,
            color: kPrimaryColor,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Terms of Use ',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 11.96 / 13,
                color: secondaryColor,
              ),
            ),
            Text(
              ' and ',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontSize: 13,
                fontWeight: FontWeight.w300,
                height: 11.96 / 13,
                color: kPrimaryColor,
              ),
            ),
            Text(
              'Privacy Policy.',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 11.96 / 13,
                color: secondaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
