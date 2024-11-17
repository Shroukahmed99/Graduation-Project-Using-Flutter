import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/widget/Custom_Arrow_Icon.dart';

class CustomTextAndIconArrowback extends StatelessWidget {
  const CustomTextAndIconArrowback({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CustomArrowIcon(),
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 30 / 20,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }
}
