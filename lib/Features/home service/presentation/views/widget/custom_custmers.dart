import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sehatak/Features/home%20service/data/models/custmer_model.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/widget/custom_stack_honty.dart';

class CustomCustmers extends StatelessWidget {
  final PaymentData data;

  const CustomCustmers({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    String formattedPaidAt = DateFormat('MMM dd, yyyy').format(data.paidAt);

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
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  data.client.fullName,
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
                data.goal,
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
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
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
                        Positioned(
                          top: -10.h,
                          right: -10.w,
                          child: ClipPath(
                            clipper: CustomStackHonty(),
                            child: Container(
                              height: 16.h,
                              width: 16.w,
                              color: accentColor,
                              child: Center(
                                child: Text(
                                  '5',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
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
          ],
        ),
      ),
    );
  }
}
