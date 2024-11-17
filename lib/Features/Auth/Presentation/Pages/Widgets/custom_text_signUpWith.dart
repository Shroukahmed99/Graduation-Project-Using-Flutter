import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class CustomTextSignupwith extends StatelessWidget {
  const CustomTextSignupwith({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'or sign up with',
        style: TextStyle(
          fontFamily: 'League Spartan',
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: secondaryColor,
          height: 1.0,
        ),
      ),
    );
  }
}
