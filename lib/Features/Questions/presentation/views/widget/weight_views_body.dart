import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/presentation/manger/weight%20cubit/weight_cubit.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_slider_widget.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';

class WeightViewsBody extends StatelessWidget {
  const WeightViewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeightCubit, WeightState>(
      builder: (context, state) {
        int selectedWeight = (state is WeightSelected) ? state.weight : 25;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32.h, left: 24.w),
              child: const CustomArrowBack(text: 'Back'),
            ),
            CustomSizedBox(height: 25.h),
            const CustomQuestionAndAswer(
              question: 'What Is Your Weight?',
              answer:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            ),
            CustomSizedBox(height: 35.h),
            CustomSliderWidget(
              dates: List.generate(
                  381, (index) => 20 + index), // توليد الأرقام من 20 إلى 400
              selectedDate: selectedWeight,
              unitSymbol: 'Kg',
              onDateSelected: (weight) {
                context.read<WeightCubit>().selectWeight(weight);
              },
            ),
            const Spacer(),
            CustomButton(
              text: 'Continue',
              onTap: () {
                GoRouter.of(context).push(AppRouter.kHieghtViews);
              },
            ),
            CustomSizedBox(height: 40.h),
          ],
        );
      },
    );
  }
}
