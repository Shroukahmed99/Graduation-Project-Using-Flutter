import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/core/Custom_button.dart';
import 'package:sehatak/core/custom_question_and_aswer.dart';
import 'package:sehatak/core/custom_select_activity.dart';
import 'package:sehatak/core/custom_snacbar.dart';
import 'package:sehatak/core/page.dart';

class DiabetesViewBody extends StatefulWidget {
  const DiabetesViewBody({super.key});

  @override
  State<DiabetesViewBody> createState() => _DiabetesViewBodyState();
}

class _DiabetesViewBodyState extends State<DiabetesViewBody> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          const Padding(
            padding: EdgeInsets.all(65),
            child: CustomQuestionAndAswer(
              question: 'Do You Suffer from Diabetes?',
            ),
          ),
          SizedBox(height: 120.h),
          CustomSelectActivity(
            options: const [
              'NO',
              'YES',
            ],
            onSelect: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          const Spacer(),
          CustomButtom(
            text: 'Continue',
            onTap: () {
              if (selectedIndex == null) {
                customSnackBar(context,
                    'Please select an answer about your diabetes condition');
              } else {
                if (selectedIndex == 1) {
                  GoRouter.of(context).push(AppRouter.kBloodSugarView);
                } else {
                  GoRouter.of(context).push(AppRouter.kHeartDiseaseView);
                }
              }
            },
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
