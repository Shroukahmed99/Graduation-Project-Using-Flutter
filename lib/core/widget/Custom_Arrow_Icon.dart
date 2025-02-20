import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/const.dart';

class CustomArrowIcon extends StatelessWidget {
  const CustomArrowIcon({super.key, this.colorArrowIcon = kPrimaryColor});
  final Color colorArrowIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (context.canPop()) {
          context.pop();
        } else {
          debugPrint('Cannot go back, no previous page');
        }
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
