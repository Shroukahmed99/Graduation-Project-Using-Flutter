import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';

class InsertCvViewBody extends StatelessWidget {
  const InsertCvViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.h, left: 24.w),
      child: Column(
        children: [
          const CustomArrowBack(text: 'Back'),
          CustomSizedBox(height: 25.h),
          const CustomQuestionAndAswer(
            question: 'Insert your cv and  certificates',
            answer: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          ),
          SizedBox(
            height: 105.h,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/cv.png',
                    width: 144,
                    height: 144,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          CustomButton(
            text: 'Continue',
            onTap: () {
              GoRouter.of(context).push(AppRouter.kInsertDataView);
            },
          ),
          CustomSizedBox(height: 40.h),
        ],
      ),
    );
  }
}
