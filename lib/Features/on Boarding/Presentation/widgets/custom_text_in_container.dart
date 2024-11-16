import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class CustomTextInContainer extends StatelessWidget {
  const CustomTextInContainer({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: backgroundColor,
      ),
    );
  }
}
