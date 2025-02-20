import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Questions/widgets/custom_question_and_aswer.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';

class CircleIconTextWidget extends StatefulWidget {
  const CircleIconTextWidget(
      {super.key,
      required this.icon,
      required this.typeOfGender,
      required this.isSelected,
      required this.onTap});

  final IconData icon;
  final String typeOfGender;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  _CircleIconTextWidgetState createState() => _CircleIconTextWidgetState();
}

class _CircleIconTextWidgetState extends State<CircleIconTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: 140.w,
            height: 140.h,
            decoration: BoxDecoration(
              color: widget.isSelected ? kPrimaryColor : backgroundColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 8),
                  spreadRadius: 2,
                  blurRadius: 3,
                ),
              ],
            ),
            child: Icon(
              widget.icon,
              size: 90.sp,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          widget.typeOfGender,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: accentColor,
          ),
        ),
      ],
    );
  }
}

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
      backgroundColor: backgroundColor,
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
            CircleIconTextWidget(
              icon: Icons.male,
              typeOfGender: 'Male',
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
            CircleIconTextWidget(
              icon: Icons.female,
              typeOfGender: 'Female',
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
                  //Get.to(() => const GenderSelectionScreen());
                }),
            CustomSizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
