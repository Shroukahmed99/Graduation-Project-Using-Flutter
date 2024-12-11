import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Questions/Age%20Selection/widgets/custom_slider_widget.dart';
import 'package:sehatak/Features/Questions/widgets/custom_question_and_aswer.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';

class AgeSelectionScreen extends StatefulWidget {
  const AgeSelectionScreen({super.key});

  @override
  _AgeSelectionScreenState createState() => _AgeSelectionScreenState();
}

class _AgeSelectionScreenState extends State<AgeSelectionScreen> {
  int selectedDate = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 32.h,
              left: 24.w,
            ),
            child: const CustomArrowBack(text: 'Back'),
          ),
          SizedBox(
            height: 50.h,
          ),
          const CustomQuestionAndAswer(
            question: 'What’s Your Age?',
            answer:
                'Lorem ipsum dolor sit amet,consectetur adipiscing elit consectetur adipiscing elit',
          ),
          CustomSizedBox(height: 35.h),
          CustomSliderWidget(
            dates: List.generate(125, (index) => index + 8),
            selectedDate: selectedDate,
            onDateSelected: (date) {
              setState(() {
                selectedDate = date;
              });
            },
          ),
          const Spacer(),
          CustomButton(text: 'Continue', onTap: () {}),
          CustomSizedBox(height: 40.h),
        ],
      ),
    );
  }
}
