import 'package:flutter/material.dart';
import 'feedback_card.dart';

class FeedbackBody extends StatelessWidget {
  const FeedbackBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),

            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/images/Arrow.png',
                    width: 20,
                    height: 20,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  "My Feed Back",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: FeedbackCard(
                      name: "Ahmed talat",
                      feedbackText:
                          "Lorem ipsum dolor sit amet consectetur. Tortor aenean suspendisse.",
                      rating: 3,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
