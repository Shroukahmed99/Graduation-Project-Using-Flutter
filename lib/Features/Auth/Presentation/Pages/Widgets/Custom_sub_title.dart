import 'package:flutter/material.dart';

class CustomSubTitle extends StatelessWidget {
  const CustomSubTitle({super.key, required this.subTitle});
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        subTitle,
        style: const TextStyle(
          fontFamily: 'League Spartan',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          height: 16.56 / 18,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
