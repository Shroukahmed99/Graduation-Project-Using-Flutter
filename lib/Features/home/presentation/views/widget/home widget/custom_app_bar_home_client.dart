import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sehatak/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarHomeClient extends StatelessWidget {
  const CustomAppBarHomeClient({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, right: 24.w, left: 24.w),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              color: accentColor,
              FontAwesomeIcons.magnifyingGlass,
              size: 20.sp,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              color: accentColor,
              Icons.chat_bubble,
              size: 24.sp,
            ),
          ),
        ],
      ),
    );
  }
}
