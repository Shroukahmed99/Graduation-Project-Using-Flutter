import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_slider_widget.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeightViewsBody extends StatefulWidget {
  const WeightViewsBody({super.key});

  @override
  State<WeightViewsBody> createState() => _WeightViewsBodyState();
}

class _WeightViewsBodyState extends State<WeightViewsBody> {
  Future<void> saveData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setString('weight', selectedDate.toString as String);

    print("Data Saved Successfully ✅");
  }

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
              saveData();
              GoRouter.of(context).push(AppRouter.kHieghtViews);
            }),
        CustomSizedBox(height: 40.h),
      ],
    );
  }
}
