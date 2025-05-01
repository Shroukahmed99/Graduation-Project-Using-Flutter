import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sehatak/Features/chat/data/models/all_chat.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/utils/app_router.dart';

class CustomAllChat extends StatelessWidget {
  final BookingData data;

  const CustomAllChat({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    String formattedPaidAt = DateFormat('yyyy-MM-dd').format(data.paidAt);

    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: const Color(0xff222222),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(60.r),
                  child: Image.asset(
                    'assets/images/2.png',
                    width: 35.w,
                    height: 35.h,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  data.serviceProvider.fullName,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 45.w, top: 4.h),
              child: Text(
                data.serviceProvider.jobTitle,
                style: TextStyle(color: Colors.white70, fontSize: 13.sp),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 42.w),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/data.png',
                    height: 20.h,
                  ),
                  SizedBox(width: 5.w),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      formattedPaidAt,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      data.duration.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kChatView);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        height: 17.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Center(
                          child: Text(
                            "OPEN",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
