import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, required this.dotsIndex});
  final int? dotsIndex;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 490,
      left: 135,
      child: DotsIndicator(
        dotsCount: 3,
        position: dotsIndex ?? 0,
        decorator: DotsDecorator(
          activeSize: const Size(20, 4),
          size: const Size(20, 4),
          activeColor: secondaryColor,
          color: kPrimaryColor,
          spacing: const EdgeInsets.symmetric(horizontal: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
