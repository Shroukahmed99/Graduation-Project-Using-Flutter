import 'package:flutter/material.dart';
import 'package:sehatak/Features/home/data/models/more_physical_model.dart';
import 'package:sehatak/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoDataPhysical extends StatelessWidget {
  final PhysicalTherapistMore physicalTherapistMore;
  const InfoDataPhysical({
    super.key,
    required this.physicalTherapistMore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 35.w, right: 22.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              SizedBox(width: 50.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    physicalTherapistMore.fullName,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    physicalTherapistMore.job,
                    style: TextStyle(color: accentColor),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 150.w),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/image 19.png',
                  width: 20.w,
                  height: 20.h,
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("COST", style: TextStyle(color: kPrimaryColor)),
                    Text(
                      "E£ ${physicalTherapistMore.priceRange} EGP",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 150.w),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/reviews.png',
                  width: 30.w,
                  height: 30.h,
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Rating", style: TextStyle(color: kPrimaryColor)),
                    Text(
                      physicalTherapistMore.ratingQuantity != 0
                          ? physicalTherapistMore.ratingQuantity
                              .toStringAsFixed(1)
                          : 'No ratings yet',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 150.w),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/Experience.png',
                  width: 20.w,
                  height: 20.h,
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Experience", style: TextStyle(color: kPrimaryColor)),
                    Text(
                      physicalTherapistMore.yearsOfExperience,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            "Bio",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Text(
            physicalTherapistMore.bio,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
