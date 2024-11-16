import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, required this.dotsIndex});
  final int? dotsIndex;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: dotsIndex!,
      decorator: DotsDecorator(
        activeSize: const Size(20, 4),
        size: const Size(20, 4),
        activeColor: backgroundColor,
        color: secondaryColor,
        spacing: const EdgeInsets.symmetric(horizontal: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
