import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Welcome',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: accentColor,
            fontSize: 14,
            fontWeight: FontWeight.w300,
            fontFamily: 'League Spartan',
            height: 14 / 14,
            decoration: TextDecoration.none,
          ),
        )
      ],
    );
  }
}
