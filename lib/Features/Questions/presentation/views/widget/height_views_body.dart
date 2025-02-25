import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_slider_height.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';

class HeightViewsBody extends StatefulWidget {
  const HeightViewsBody({super.key});

  @override
  State<HeightViewsBody> createState() => _HeightViewsBodyState();
}

class _HeightViewsBodyState extends State<HeightViewsBody> {
  int selectedDate = 25;

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
            question: 'What Is Your height?',
            answer:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '),
        CustomSizedBox(height: 35.h),
        CustomSliderHeight(
          dates:
              List.generate(50, (index) => 120 + index), // أرقام من 120 إلى 169
          selectedDate: 145, // القيمة الافتراضية في المنتصف
          unitSymbol: "cm",
        ),
        const Spacer(),
        CustomButton(
            text: 'Continue',
            onTap: () {
              GoRouter.of(context).push(AppRouter.kWhatGoalViews);
            }),
        CustomSizedBox(height: 40.h),
      ],
    );
  }
}
