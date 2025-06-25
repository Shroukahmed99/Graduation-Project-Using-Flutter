import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widget%20feedbace/feedback_card.dart';

class FeedbackSectionNutririon extends StatelessWidget {
  final List<dynamic> reviews;

  const FeedbackSectionNutririon({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Feedback",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.h),
          reviews.isEmpty
              ? const Center(child: Text("No feedback yet."))
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: reviews.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final review = reviews[index];
                    final name = review['Client']?['fullName'] ?? 'Anonymous';
                    final comment = review['comment'] ?? '';
                    final rating = review['rating']?.toInt() ?? 0;

                    return FeedbackCard(
                      name: name,
                      feedbackText: comment,
                      rating: rating,
                    );
                  },
                ),
        ],
      ),
    );
  }
}
