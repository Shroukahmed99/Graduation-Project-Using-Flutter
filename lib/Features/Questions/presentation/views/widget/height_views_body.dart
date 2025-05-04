import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/presentation/manger/height%20cubit/height_cubit.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_slider_height.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';

class HeightViewsBody extends StatelessWidget {
  const HeightViewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeightCubit, HeightState>(
      builder: (context, state) {
        int selectedHeight = (state is HeightSelected) ? state.height : 145;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32.h, left: 24.w),
              child: const CustomArrowBack(text: 'Back'),
            ),
            CustomSizedBox(height: 40.h),
            const CustomQuestionAndAswer(
              question: 'What Is Your Height?',
            ),
            CustomSizedBox(height: 100.h),
            CustomSliderHeight(
              unitSymbol: "cm",
              dates: List.generate(181, (index) => 70 + index),
              selectedDate: selectedHeight,
              onDateSelected: (height) {
                context.read<HeightCubit>().selectHeight(height);
              },
            ),
            const Spacer(),
            CustomButtom(
              text: 'Continue',
              onTap: () {
                GoRouter.of(context).push(AppRouter.kWhatGoalViews);
              },
            ),
            CustomSizedBox(height: 40.h),
          ],
        );
      },
    );
  }
}
