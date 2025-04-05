import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class CustomArrowIcon extends StatelessWidget {
  final Color colorArrowIcon;
  final bool flipToRight; // متغير لتغيير الاتجاه

  const CustomArrowIcon({
    super.key,
    this.colorArrowIcon = kPrimaryColor,
    this.flipToRight = false, // افتراضيًا الاتجاه يكون كما في الصورة
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        } else {
          debugPrint('Cannot go back, no previous page');
        }
      },
      child: Transform(
        transform: flipToRight ? Matrix4.rotationY(3.14159) : Matrix4.identity(), // عكس الاتجاه عند الحاجة
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/Arrow.png',
          color: colorArrowIcon,
          height: 11,
          width: 16,
        ),
      ),
    );
  }
}
