import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/presentation/manger/age%20cubit/age_cubit.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_slider_widget.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';

class AgeSelectionProviderScreen extends StatelessWidget {
  const AgeSelectionProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AgeCubit(),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomArrowBack(text: 'Back'),
            CustomSizedBox(height: 40.h),
            const CustomQuestionAndAswer(
              question: 'What’s Your Age?',
            ),
            CustomSizedBox(height: 130.h),
            BlocBuilder<AgeCubit, AgeState>(
              builder: (context, state) {
                int selectedAge = state is AgeSelected ? state.age : 25;

                return CustomSliderWidget(
                  initialValue: 10, // القيمة الابتدائية
                  step: 1, // قيمة التزايد
                  maxValue: 60, // القيمة النهائية
                  selectedDate: selectedAge,
                  onDateSelected: (date) {
                    context.read<AgeCubit>().updateSelectedAge(date);
                  },
                );
              },
            ),
            const Spacer(),
            BlocBuilder<AgeCubit, AgeState>(
              builder: (context, state) {
                return CustomButton(
                  text: 'Continue',
                  onTap: () async {
                    final ageCubit = context.read<AgeCubit>();
                    await ageCubit.saveSelectedAge();

                    GoRouter.of(context).push(AppRouter.kInsertDataView);
                  },
                );
              },
            ),
            CustomSizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
