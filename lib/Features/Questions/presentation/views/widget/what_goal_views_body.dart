import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/presentation/manger/what%20goal%20cubit/goal_cubit.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_select_goal.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';

class WhatGoalViewsBody extends StatelessWidget {
  const WhatGoalViewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalCubit, GoalState>(
      builder: (context, state) {
        String? selectedGoal = (state is GoalSelected && state.goal.isNotEmpty)
            ? state.goal
            : null;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 32.h,
                left: 24.w,
              ),
              child: const CustomArrowBack(text: 'Back'),
            ),
            CustomSizedBox(height: 40.h),
            const CustomQuestionAndAswer(
              question: 'What Is Your Goal?',
            ),
            CustomSizedBox(height: 120.h),
            CustomSelectGoal(
              options: const [
                'Lose Weight',
                'Gain Weight',
                'Muscle Mass Gain',
                'Shape Body',
                'Others',
              ],
              selectedOption: selectedGoal,
              onSelect: (goal) => context.read<GoalCubit>().selectGoal(goal),
            ),
            const Spacer(),
            CustomButtom(
              text: 'Continue',
              onTap: () {
                if (selectedGoal == null) {
                  customSnackBar(
                      context, 'Please choose a goal before continuing!');
                } else {
                  GoRouter.of(context).push(AppRouter.kPhysicalActivityView);
                }
              },
            ),
            CustomSizedBox(height: 40.h),
          ],
        );
      },
    );
  }
}
