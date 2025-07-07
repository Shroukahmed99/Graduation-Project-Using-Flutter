import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/utils/cache_helper.dart'; // ✅ تم إضافته
import 'package:sehatak/core/widget/Custom_button.dart';

class DiastolicBloodPressureViewBody extends StatefulWidget {
  const DiastolicBloodPressureViewBody({super.key});

  @override
  State<DiastolicBloodPressureViewBody> createState() =>
      _DiastolicBloodPressureViewBodyState();
}

class _DiastolicBloodPressureViewBodyState
    extends State<DiastolicBloodPressureViewBody> {
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
              question: 'Enter diastolic blood pressure',
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
                  'DIA',
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
                    context, 'Please enter a valid diastolic pressure');
              } else {
                CacheHelper.saveData(
                    key: 'diastolicPressure', value: int.parse(value));

                GoRouter.of(context).push(AppRouter.kHypertensionView);
              }
            },
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
