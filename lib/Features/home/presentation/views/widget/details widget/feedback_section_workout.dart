import 'package:flutter/material.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widget%20feedbace/feedback_card.dart';

class FeedbackSectionWorkout extends StatelessWidget {
  final List<dynamic> reviews;

  const FeedbackSectionWorkout({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Feedback",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          reviews.isEmpty
              ? const Center(child: Text("No feedback yet."))
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: reviews.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
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
