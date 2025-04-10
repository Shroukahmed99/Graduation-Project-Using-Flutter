import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/home/presentation/manger/workout/workout_cubit.dart';
import 'package:sehatak/features/home/presentation/views/widget/job%20widget/information_workout.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';

class WorkoutListView extends StatelessWidget {
  const WorkoutListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoachCubit, CoachState>(
      builder: (context, state) {
        if (state is CoachLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CoachFailure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            customSnackBar(context, state.message);
          });
          return const SizedBox.shrink();
        } else if (state is CoachSuccess) {
          final coaches = state.coaches;
          return ListView.builder(
            itemCount: coaches.length,
            itemBuilder: (context, index) {
              final coach = coaches[index];
              return InformationWorkout(coaches: coach);
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
