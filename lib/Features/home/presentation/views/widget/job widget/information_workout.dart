import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/home/data/models/workout_model.dart';
import 'package:sehatak/const.dart';

class InformationWorkout extends StatelessWidget {
  final CoachModel coaches;
  const InformationWorkout({super.key, required this.coaches});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 10.h),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
            decoration: BoxDecoration(
              color: const Color(0xff222222),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        coaches.fullName,
                        style: TextStyle(
                          fontSize: 15.sp, // قللت الحجم شويه
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffFF9F5B),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.r),
                        child: Image.asset(
                          'assets/images/3.png',
                          width: 45.w, // قللت الحجم شويه
                          height: 45.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    coaches.bio,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13.sp,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/image 19.png',
                          width: 18.w,
                          height: 18.h,
                        ),
                        SizedBox(width: 5.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("COST",
                                style: TextStyle(color: Colors.white)),
                            Text("E£ ${coaches.priceRange} EGP",
                                style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 15.w),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/reviews.png',
                          width: 24.w,
                          height: 24.h,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Rating",
                                style: TextStyle(color: Colors.white)),
                            Text(
                              coaches.ratingAverage != null
                                  ? coaches.ratingAverage!.toStringAsFixed(1)
                                  : 'No ratings yet',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        context.push('/coaches/${coaches.id}');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 5.h,
                        ),
                        minimumSize: Size(60.w, 30.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                      child: Text(
                        "MORE...",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
