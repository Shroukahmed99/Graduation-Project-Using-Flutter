import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/home/presentation/manger/coach%20more/coach_more_cubit.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/custom_app_bar_details.dart';
import 'package:sehatak/core/widget/custom_buttom_book_now.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/feedback_section_workout.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/info_data_workout.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';
import 'package:sehatak/core/utils/app_router.dart';

class DeteailsWorkoutViewBody extends StatelessWidget {
  final String coachesId;

  const DeteailsWorkoutViewBody({super.key, required this.coachesId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoachMoreCubit, CoachMoreState>(
      builder: (context, state) {
        if (state is CoachMoreLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CoachMoreSuccess) {
          final coaches = state.coachMoreId;

          return Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: Column(
              children: [
                const CustomAppBarDetails(
                  title: 'Workout',
                  image: 'assets/images/catgory1.png',
                ),
                SizedBox(height: 20.h),
                InfoDataWorkout(
                  coachMoreId: coaches,
                ),
                FeedbackSectionWorkout(reviews: coaches.reviews),
                const Spacer(),
                CustomButtomBookNow(
                  text: 'BOOK NOW',
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.kPaymentView,
                      extra: {
                        'priceRange': coaches.priceRange.toString(),
                        'id': coaches.id,
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 10.h,
                )
              ],
            ),
          );
        } else if (state is CoachMoreFailuer) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            customSnackBar(context, state.message);
          });
          return const SizedBox.shrink();
        } else {
          return const Center(child: Text('Unexpected error occurred.'));
        }
      },
    );
  }
}
