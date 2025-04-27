import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/home/data/models/top_rating_model.dart';

class TopRating extends StatelessWidget {
  final TopProvider provider;

  const TopRating({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (provider.job.toLowerCase()) {
          case 'work out':
            context.push('/coaches/${provider.id}');
            break;
          case 'physical therapy':
            context.push('/physical/${provider.id}');
            break;
          case 'nutirion':
            context.push('/nutrition/${provider.id}');
            break;
        }
      },
      child: Container(
        width: 121.w,
        decoration: BoxDecoration(
          color: const Color(0xffFAF3E1),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(
                    'https://storage.googleapis.com/a1aa/image/11916b46-5965-4b4e-ae61-b3e9196b726b.jpg',
                    width: 25.w,
                    height: 25.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 5.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      provider.fullName,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      provider.job,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Divider(
              endIndent: 50,
              height: 1.h,
              color: const Color(0xFFD9D4C3),
              thickness: 1,
            ),
            SizedBox(height: 1.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      const TextSpan(text: 'Reviews '),
                      TextSpan(
                        text: provider.ratingQuantity.toStringAsFixed(0),
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9999),
                  ),
                  child: Row(
                    children: [
                      Text(
                        provider.ratingAverage.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 1.w),
                      const Icon(
                        Icons.star,
                        color: Color(0xFFFBBF24),
                        size: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
