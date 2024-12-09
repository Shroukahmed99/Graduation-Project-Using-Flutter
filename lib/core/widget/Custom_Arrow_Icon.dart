import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class CustomArrowIcon extends StatelessWidget {
  const CustomArrowIcon({super.key, this.colorArrowIcon = kPrimaryColor});
  final Color colorArrowIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Image.asset(
        'assets/images/Arrow.png',
        color: colorArrowIcon,
        height: 11,
        width: 16,
      ),
    );
  }
}
