import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/home%20service/data/models/custmer_new_model.dart';
import 'package:sehatak/Features/home%20service/presentation/views/widget/accept_buttons.dart';
import 'package:sehatak/const.dart';

class CustomNewCustmers extends StatelessWidget {
  const CustomNewCustmers({super.key, required this.data});
  final ClientData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Container(
        padding: EdgeInsets.all(15.w),
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
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.client.fullName,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Goals',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 30.w),
              child: Text(
                data.goal,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13.sp,
                  height: 1.4,
                ),
              ),
            ),
            SizedBox(height: 18.h),
            Padding(
              padding: EdgeInsets.only(left: 30.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Age',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        data.client.age,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'weight',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        data.client.weight,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'length',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        data.client.height,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const AcceptButtons()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
