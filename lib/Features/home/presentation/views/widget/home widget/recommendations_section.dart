import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Ai/data/models/workout_recommendation.dart';
import 'package:sehatak/Features/Ai/presentation/manger/ai/workout_recommended_cubit.dart';
import 'package:sehatak/Features/Ai/presentation/manger/ai/workout_recommended_state.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';

class RecommendationsSection extends StatelessWidget {
  const RecommendationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recommendations",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          BlocBuilder<WorkoutCubit, WorkoutState>(
            builder: (context, state) {
              if (state is WorkoutLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is WorkoutFailure) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  customSnackBar(context, state.error);
                });
                return const SizedBox.shrink();
              } else if (state is WorkoutSuccess) {
                final workouts = state.workouts;

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: workouts.map((workout) {
                      return RecommendationCard(workout: workout);
                    }).toList(),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}

class RecommendationCard extends StatefulWidget {
  final WorkoutRecommendation workout;

  const RecommendationCard({super.key, required this.workout});

  @override
  State<RecommendationCard> createState() => _RecommendationCardState();
}

class _RecommendationCardState extends State<RecommendationCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 180.w,
      margin: EdgeInsets.only(right: 12.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.workout.exercisePlan,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            maxLines: isExpanded ? null : 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),
          if (isExpanded) ...[
            Text('Muscle: ${widget.workout.targetMuscleGroup}',
                style: TextStyle(fontSize: 12.sp)),
            Text('Calories: ${widget.workout.caloriesBurned}',
                style: TextStyle(fontSize: 12.sp)),
            Text('Duration: ${widget.workout.totalPlanDuration} min',
                style: TextStyle(fontSize: 12.sp)),
            Text('Impact: ${widget.workout.impactLevel}',
                style: TextStyle(fontSize: 12.sp)),
            SizedBox(height: 6.h),
            GestureDetector(
              onTap: () => setState(() => isExpanded = false),
              child: Text('Less',
                  style: TextStyle(color: Colors.orange, fontSize: 12.sp)),
            )
          ] else ...[
            GestureDetector(
              onTap: () => setState(() => isExpanded = true),
              child: Text('More ....',
                  style: TextStyle(color: kPrimaryColor, fontSize: 12.sp)),
            )
          ]
        ],
      ),
    );
  }
}
