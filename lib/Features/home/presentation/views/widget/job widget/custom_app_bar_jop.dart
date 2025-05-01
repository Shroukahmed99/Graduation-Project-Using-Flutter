import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/widget/Custom_Arrow_Icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarJob extends StatelessWidget {
  const CustomAppBarJob({
    super.key,
    required this.title,
    this.image,
  });

  final String title;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h, right: 24.w, left: 24.w),
      child: Row(
        children: [
          CustomArrowIcon(
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          if (image != null) ...[
            SizedBox(width: 10.w),
            SizedBox(
              width: 30.w,
              height: 30.h,
              child: Image.asset(image!),
            ),
          ],
          SizedBox(width: 10.w),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
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
              Icons.notifications,
              size: 24.sp,
            ),
          ),
        ],
      ),
    );
  }
}
