import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class FeedbackSectionPhysical extends StatelessWidget {
  final List<dynamic> reviews;

  const FeedbackSectionPhysical({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, top: 5, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Feedback",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 270,
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
                        margin: const EdgeInsets.only(bottom: 25),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: accentColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              username,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              reviewText,
                              style: const TextStyle(color: Colors.black),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: List.generate(5, (starIndex) {
                                return Icon(
                                  starIndex < rating
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: Colors.black,
                                  size: 18,
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
