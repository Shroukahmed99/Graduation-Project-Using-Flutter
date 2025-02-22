import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/Age%20Selection/pages/age_selection_screen.dart';
import 'package:sehatak/Features/Questions/Gender%20Selection/widgets/circle_icon_text_widget.dart';
import 'package:sehatak/Features/Questions/widgets/custom_question_and_aswer.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  _GenderSelectionScreenState createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 32.h,
          left: 24.w,
        ),
        child: Column(
          children: [
            const CustomArrowBack(text: 'Back'),
            CustomSizedBox(
              height: 25.h,
            ),
            const CustomQuestionAndAswer(
              question: 'What’s Your Gender',
              answer:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
            ),
            const CustomSizedBox(
              height: 15,
            ),
            CircleImageTextWidget(
              images: [AssetImage('assets/images/male.png')],
              text: 'Male',
              isSelected: isMaleSelected,
              onTap: () {
                setState(() {
                  isMaleSelected = !isMaleSelected;
                  if (isMaleSelected) {
                    isFemaleSelected = false;
                  }
                });
              },
            ),
            CustomSizedBox(
              height: 15.h,
            ),
            CircleImageTextWidget(
              images: [AssetImage('assets/images/female.png')],
              text: 'Female',
              isSelected: isFemaleSelected,
              onTap: () {
                setState(() {
                  isFemaleSelected = !isFemaleSelected;
                  if (isFemaleSelected) {
                    isMaleSelected = false;
                  }
                });
              },
            ),
            const Spacer(),
            CustomButton(
              text: 'Countinue',
              onTap: () {
                GoRouter.of(context).push(AppRouter.kAgeSelectionScreen);
              },
            ),
            CustomSizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
