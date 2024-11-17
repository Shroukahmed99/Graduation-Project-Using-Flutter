import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, this.title, this.subTitle});
  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title ?? '',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          subTitle ?? "",
          textAlign: TextAlign.center,
          style: const TextStyle(
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
