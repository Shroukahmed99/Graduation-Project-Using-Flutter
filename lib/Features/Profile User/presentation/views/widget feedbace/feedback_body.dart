import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/review%20cubit/review_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/review%20cubit/review_state.dart';
import 'feedback_card.dart';

class FeedbackBody extends StatelessWidget {
  const FeedbackBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    'assets/images/Arrow.png',
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  "My Feed Back",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: BlocBuilder<ReviewCubit, ReviewState>(
                builder: (context, state) {
                  if (state is ReviewLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ReviewSuccess) {
                    if (state.reviews.isEmpty) {
                      return const Center(child: Text("No feedback yet."));
                    }
                    return ListView.builder(
                      itemCount: state.reviews.length,
                      itemBuilder: (context, index) {
                        final review = state.reviews[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
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
