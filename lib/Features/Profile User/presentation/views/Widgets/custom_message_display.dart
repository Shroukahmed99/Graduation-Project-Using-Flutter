import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMessageDisplay extends StatelessWidget {
  final String message;

  const CustomMessageDisplay({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'League Spartan',
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.none,
      ),
      softWrap: true,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
