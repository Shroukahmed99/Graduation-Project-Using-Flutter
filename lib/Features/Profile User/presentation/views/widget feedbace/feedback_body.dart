import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/review%20cubit/review_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/review%20cubit/review_state.dart';
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
                  onTap: () => Navigator.pop(context),
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
              child: BlocBuilder<ReviewCubit, ReviewState>(
                builder: (context, state) {
                  if (state is ReviewLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ReviewSuccess) {
                    return ListView.builder(
                      itemCount: state.reviews.length,
                      itemBuilder: (context, index) {
                        final review = state.reviews[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: FeedbackCard(
                            name: review.clientName,
                            feedbackText: review.comment,
                            rating: review.rating.toInt(),
                          ),
                        );
                      },
                    );
                  } else if (state is ReviewFailure) {
                    return Center(child: Text(state.error));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
