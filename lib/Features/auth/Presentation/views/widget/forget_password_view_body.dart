import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/auth/Presentation/manger/forgetpassword/forget_password_cubit.dart';
import 'package:sehatak/Features/auth/Presentation/manger/forgetpassword/forget_password_state.dart';
import 'package:sehatak/Features/auth/Presentation/views/otp_view.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_and_icon_arrowBack.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_field.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';
import 'package:sehatak/core/function/validate_function.dart';
import 'package:sehatak/core/widget/Custom_button.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  ForgetPasswordViewBody({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 25.h),
      child: ListView(
        children: [
          const CustomTextAndIconArrowback(
            text: 'Forgotten Password',
          ),
          SizedBox(height: 60.h),
          const CustomText(
            title: "Forgot Password?",
            subTitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          ),
          SizedBox(height: 60.h),
          CustomTextField(
            width: 320.w,
            controller: emailController,
            title: 'Enter your email address',
            hintText: 'example@example.com',
          ),
          SizedBox(height: 140.h),
          BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if (state is ForgetPasswordSuccess) {
                customSnackBar(context, state.message);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OtpView()),
                );
              } else if (state is ForgetPasswordFailure) {
                customSnackBar(context, state.errorMessage);
              }
            },
            builder: (context, state) {
              return CustomButton(
                text:
                    state is ForgetPasswordLoading ? 'Sending...' : 'Send code',
                onTap: state is ForgetPasswordLoading
                    ? null
                    : () {
                        String email = emailController.text.trim();
                        if (email.isNotEmpty) {
                          context
                              .read<ForgetPasswordCubit>()
                              .sendResetPasswordEmail(email);
                        } else {
                          customSnackBar(context, 'Please enter your email');
                        }
                      },
              );
            },
          ),
        ],
      ),
    );
  }
}
