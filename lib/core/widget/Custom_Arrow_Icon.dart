import 'package:flutter/material.dart';

class CustomArrowIcon extends StatelessWidget {
  const CustomArrowIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Image.asset(
        'assets/images/Arrow.png',
        height: 11,
        width: 16,
      ),
    );
  }
}
