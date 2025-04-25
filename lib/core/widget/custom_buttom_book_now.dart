import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class CustomButtomBookNow extends StatelessWidget {
  const CustomButtomBookNow({
    super.key,
    required this.text,
    this.onTap,
    this.color = kPrimaryColor,
    this.width = 190,
    this.height = 48,
    this.colorText = Colors.white,
    this.fontSize = 18,
  });

  final String text;
  final void Function()? onTap;
  final Color color;
  final double? width;
  final double? height;
  final Color colorText;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: backgroundColor,
              width: 0.5,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
              color: colorText,
            ),
          ),
        ),
      ),
    );
  }
}
