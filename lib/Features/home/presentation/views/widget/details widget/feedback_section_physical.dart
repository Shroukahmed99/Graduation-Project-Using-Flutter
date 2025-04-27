import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedbackSectionPhysical extends StatelessWidget {
  final List<dynamic> reviews;

  const FeedbackSectionPhysical({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 35.w, top: 5.h, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Feedback",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 270.h,
            child: reviews.isEmpty
                ? const Center(child: Text("No feedback yet."))
                : ListView.builder(
                    itemCount: reviews.length,
                    itemBuilder: (context, index) {
                      final review = reviews[index];
                      final reviewText = review['comment'] ?? '';
                      final rating = review['rating']?.toInt() ?? 0;
                      final username =
                          review['Client']?['fullName'] ?? 'Anonymous';

                      return Container(
                        margin: EdgeInsets.only(bottom: 25.h),
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: accentColor,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              username,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              reviewText,
                              style: const TextStyle(color: Colors.black),
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: List.generate(5, (starIndex) {
                                return Icon(
                                  starIndex < rating
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: Colors.black,
                                  size: 18.sp,
                                );
                              }),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
