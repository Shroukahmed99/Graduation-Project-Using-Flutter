import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';

class CircleImageTextWidget extends StatelessWidget {
  const CircleImageTextWidget({
    super.key,
    this.images,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final List<ImageProvider>? images;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 140.w,
            height: 140.h,
            decoration: BoxDecoration(
              color: isSelected ? kPrimaryColor : backgroundColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 8),
                  spreadRadius: 2,
                  blurRadius: 3,
                ),
              ],
            ),
            child: images != null && images!.length == 3
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      // الصورة العلوية (التغذية)
                      Positioned(
                        bottom: 20.h,
                        child: Image(
                          image: images![0],
                          width: 40.w,
                          height: 40.h,
                          color: isSelected ? Colors.white : kPrimaryColor,
                        ),
                      ),
                      // الصورة السفلية اليسرى (العلاج الطبيعي)
                      Positioned(
                        top: 25.h,
                        left: 20.w,
                        child: Image(
                          image: images![1],
                          width: 40.w,
                          height: 40.h,
                          color: isSelected ? Colors.white : kPrimaryColor,
                        ),
                      ),
                      // الصورة السفلية اليمنى (الجيم)
                      Positioned(
                        top: 25.h,
                        right: 20.w,
                        child: Image(
                          image: images![2],
                          width: 40.w,
                          height: 40.h,
                          color: isSelected ? Colors.white : kPrimaryColor,
                        ),
                      ),
                    ],
                  )
                : images != null && images!.isNotEmpty
                    ? Center(
                        child: Image(
                          image: images!.first,
                          width: 90.w,
                          height: 90.h,
                          color: isSelected ? Colors.white : kPrimaryColor,
                        ),
                      )
                    : Container(), // في حالة عدم تمرير أي صورة
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
