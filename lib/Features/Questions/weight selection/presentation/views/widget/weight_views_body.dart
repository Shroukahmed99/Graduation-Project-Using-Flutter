import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Questions/Age%20Selection/widgets/custom_slider_widget.dart';
import 'package:sehatak/Features/Questions/widgets/custom_question_and_aswer.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';

class WeightViewsBody extends StatefulWidget {
  const WeightViewsBody({super.key});

  @override
  State<WeightViewsBody> createState() => _WeightViewsBodyState();
}

class _WeightViewsBodyState extends State<WeightViewsBody> {
  int selectedDate = 25;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomArrowBack(text: 'Back'),
        const SizedBox(height: 50),
        const CustomQuestionAndAswer(
            question: 'What Is Your Weight?',
            answer:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '),
        CustomSizedBox(height: 35.h),
        CustomSliderWidget(
          unitSymbol: 'Kg',
          dates: List.generate(125, (index) => index + 8),
          selectedDate: selectedDate,
          onDateSelected: (date) {
            setState(() {
              selectedDate = date;
            });
          },
        ),
        const Spacer(),
        CustomButton(
            text: 'Continue',
            onTap: () {
              // GoRouter.of(context).push(AppRouter.kWieghtViews);
            }),
        CustomSizedBox(height: 40.h),
      ],
    );
  }
}
