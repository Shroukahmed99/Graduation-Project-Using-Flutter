import 'package:flutter/material.dart';
import 'package:sehatak/core/widget/Custom_Arrow_Icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarDetails extends StatelessWidget {
  const CustomAppBarDetails({
    super.key,
    required this.title,
    required this.image,
  });
  final String title;
  final String image;

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
          SizedBox(
            width: 30.w,
            height: 30.h,
            child: Image.asset(
              image,
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
