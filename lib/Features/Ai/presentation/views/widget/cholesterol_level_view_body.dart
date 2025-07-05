import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/core/Custom_button.dart';
import 'package:sehatak/core/custom_question_and_aswer.dart';
import 'package:sehatak/core/custom_snacbar.dart';

class CholesterolLevelViewBody extends StatefulWidget {
  const CholesterolLevelViewBody({super.key});

  @override
  State<CholesterolLevelViewBody> createState() =>
      _CholesterolLevelViewBodyState();
}

class _CholesterolLevelViewBodyState extends State<CholesterolLevelViewBody> {
  final TextEditingController _controller = TextEditingController();

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
              question: 'Please Enter cholesterol level',
            ),
          ),
          const Spacer(),
          Center(
            child: Column(
              children: [
                SizedBox(
                  width: 100.w,
                  child: TextFormField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '0',
                    ),
                  ),
                ),
                Text(
                  'Mg/dL',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          CustomButtom(
            text: 'Continue',
            onTap: () {
              final value = _controller.text.trim();
              if (value.isEmpty || double.tryParse(value) == null) {
                customSnackBar(
                    context, 'Please enter a valid blood sugar level');
              } else {
                // proceed to next screen or save value
                customSnackBar(context, 'Blood sugar level saved');
              }
            },
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
