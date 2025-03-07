import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_and_icon_arrowBack.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_question.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/otp_form.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_button.dart';

class OtpViewBody extends StatelessWidget {
  const OtpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 25.h),
      child: ListView(
        children: [
          const CustomTextAndIconArrowback(
            text: 'OTP Verification',
          ),
          SizedBox(
            height: 20.h,
          ),
          const CustomText(
            subTitle:
                'Yorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie,',
          ),
          SizedBox(
            height: 43.h,
          ),
          const OtpForm(),
          SizedBox(
            height: 43.h,
          ),
          CustomButton(
            text: 'Verify',
            onTap: () {
              GoRouter.of(context).push(AppRouter.kOtpSuccess);
            },
          ),
          SizedBox(
            height: 28.h,
          ),
          const CustomTextQuestion(
              text: ' Resend OTP', title: 'Didn’t you receive the OTP?')
        ],
      ),
    );
  }
}
