import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34.4,
      height: 34.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13.13),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 24,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
