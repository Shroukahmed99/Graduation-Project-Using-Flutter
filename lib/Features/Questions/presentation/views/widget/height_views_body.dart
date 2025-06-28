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

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 32.h),
                    const CustomArrowBack(text: 'Back'),
                    CustomSizedBox(height: 40.h),
                    const CustomQuestionAndAswer(
                      question: 'What Is Your Height?',
                    ),
                    CustomSizedBox(height: 30.h),
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
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
