import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/auth/Presentation/manger/otp/otp_cubit.dart';
import 'package:sehatak/Features/auth/Presentation/manger/otp/otp_state.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_and_icon_arrowBack.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_question.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/otp_form.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_button.dart';

class OtpViewBody extends StatelessWidget {
  const OtpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 50.h),
      child: ListView(
        children: [
          const CustomTextAndIconArrowback(
            text: 'OTP Verification',
          ),
          SizedBox(height: 40.h),
          const CustomText(),
          SizedBox(height: 45.h),
          OtpForm(),
          SizedBox(height: 43.h),
          BlocConsumer<OtpCubit, OtpState>(
            listener: (context, state) {
              if (state is OtpSuccess) {
                GoRouter.of(context).push(AppRouter.kOtpSuccess);
              } else if (state is OtpFailure) {
                customSnackBar(context, state.errorMessage);
              }
            },
            builder: (context, state) {
              return CustomButton(
                text: state is OtpLoading ? 'Verifying...' : 'Verify',
                onTap: state is OtpLoading
                    ? null
                    : () {
                        context.read<OtpCubit>().verifyOtp();
                      },
              );
            },
          ),
          SizedBox(height: 28.h),
          const CustomTextQuestion(
              text: ' Resend OTP', title: 'Didn’t you receive the OTP?')
        ],
      ),
    );
  }
}
