import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/home/presentation/manger/coach%20more/coach_more_cubit.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/custom_app_bar_details.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/custom_buttom_book_now.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/feedback_section.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/info_data_workout.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';

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

          return Column(
            children: [
              const CustomAppBarDetails(
                title: 'Workout',
                image: 'assets/images/catgory1.png',
              ),
              const SizedBox(height: 20),
              InfoDataWorkout(
                coachMoreId: coaches,
              ),
              const FeedbackSection(),
              const SizedBox(height: 40),
              const CustomButtomBookNow(text: 'BOOK NOW')
            ],
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
