import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class CustomArrowIcon extends StatelessWidget {
  final Color colorArrowIcon;
  final bool flipToRight;
  final AlignmentGeometry alignment;
  final VoidCallback onTap;

  const CustomArrowIcon({
    super.key,
    this.colorArrowIcon = kPrimaryColor,
    this.flipToRight = false,
    this.alignment = Alignment.centerLeft,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Align(
        alignment: alignment,
        child: Transform(
          transform: flipToRight ? Matrix4.rotationY(3.14159) : Matrix4.identity(),
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/Arrow.png',
            color: colorArrowIcon,
            height: 11,
            width: 16,
          ),
        ),
      ),
    );
  }
}
