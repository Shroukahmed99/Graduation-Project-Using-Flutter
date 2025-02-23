import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/What%20Goal/views/widget/custom_select_activity.dart';
import 'package:sehatak/Features/Questions/widgets/custom_question_and_aswer.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';

class WhatGoalViewsBody extends StatelessWidget {
  const WhatGoalViewsBody({super.key});

  @override
  Widget build(BuildContext context) {
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
        CustomSizedBox(
          height: 25.h,
        ),
        const CustomQuestionAndAswer(
            question: 'What Is Your Goal?',
            answer:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '),
        CustomSizedBox(height: 35.h),
        const CustomSelectGoal(
          options: [
            'Lose Weight',
            'Gain Weight',
            'Muscle Mass Gain',
            'Shape Body',
            'Others'
          ],
        ),
        const Spacer(),
        CustomButton(
            text: 'Continue',
            onTap: () {
              GoRouter.of(context).push(AppRouter.kPhysicalActivityView);
            }),
        CustomSizedBox(height: 40.h),
      ],
    );
  }
}
