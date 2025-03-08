import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_field.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';

class InsertDataViewBody extends StatelessWidget {
  const InsertDataViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.h, left: 24.w),
      child: Column(
        children: [
          const CustomArrowBack(text: 'Back'),
          CustomSizedBox(height: 25.h),
          const CustomQuestionAndAswer(
            question: 'Insert your Data',
            answer:
                'A service provider can be a Nutritionist, Physiotherapist, or Gym Coach',
          ),
          const CustomSizedBox(height: 54),
          const CustomTextField(
            title: 'years of experience',
            width: 77,
            hintText: '00',
          ),
          const CustomSizedBox(height: 16),
          const CustomTextField(
            title: 'Job Title',
            width: 146,
            hintText: 'Add Text',
          ),
          const CustomSizedBox(height: 16),
          const CustomTextField(
            title: 'Qualifications',
            width: 320,
            hintText: 'Add Text',
          ),
          const Spacer(),
          CustomButton(
            text: 'Continue',
            onTap: () {
              GoRouter.of(context).push(AppRouter.kPriceSelectionView);
            },
          ),
          CustomSizedBox(height: 40.h),
        ],
      ),
    );
  }
}
