import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/widget/Custom_Arrow_Icon.dart';

class CustomTextAndIconArrowback extends StatelessWidget {
  const CustomTextAndIconArrowback({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CustomArrowIcon(),
        SizedBox(
          width: 100,
        ),
        Text(
          'Log In',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 30 / 20,
            decoration: TextDecoration.none,
          ),
        )
      ],
    );
  }
}
