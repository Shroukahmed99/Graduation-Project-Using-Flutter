import 'package:flutter/material.dart';
import 'package:sehatak/Features/home/data/models/more_workout_model.dart';
import 'package:sehatak/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoDataWorkout extends StatelessWidget {
  final CoachMoreId coachMoreId;
  const InfoDataWorkout({super.key, required this.coachMoreId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة المدرب و الاسم و الوظيفة
          Row(
            children: [
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: kPrimaryColor, width: 3.w),
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coachMoreId.fullName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      coachMoreId.job,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: accentColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // السعر
          Row(
            children: [
              Image.asset(
                'assets/images/image 19.png',
                width: 20.w,
                height: 20.h,
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("COST", style: TextStyle(color: kPrimaryColor)),
                    Text(
                      "E£ ${coachMoreId.priceRange} EGP",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),

          // التقييم
          Row(
            children: [
              Image.asset(
                'assets/images/reviews.png',
                width: 30.w,
                height: 30.h,
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Rating",
                        style: TextStyle(color: kPrimaryColor)),
                    Text(
                      coachMoreId.ratingQuantity != 0
                          ? coachMoreId.ratingQuantity.toStringAsFixed(1)
                          : 'No ratings yet',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),

          // عدد سنوات الخبرة
          Row(
            children: [
              Image.asset(
                'assets/images/Experience.png',
                width: 20.w,
                height: 20.h,
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Experience",
                        style: TextStyle(color: kPrimaryColor)),
                    Text(
                      coachMoreId.yearsOfExperience,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // البايو
          Text(
            "Bio",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Text(
            coachMoreId.bio,
            style: const TextStyle(color: Colors.black),
            // Optional:
            // maxLines: 5,
            // overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
