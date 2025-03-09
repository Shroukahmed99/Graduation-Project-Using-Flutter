import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/auth/Presentation/manger/set%20password/set_password_cubit.dart';
import 'package:sehatak/Features/auth/Presentation/manger/set%20password/set_password_state.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_and_icon_arrowBack.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_field.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_button.dart';

class SetPasswordViewBody extends StatelessWidget {
  SetPasswordViewBody({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 25.h),
      child: ListView(
        children: [
          const CustomTextAndIconArrowback(
            text: 'Set Password',
          ),
          SizedBox(height: 20.h),
          const CustomText(
            subTitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          ),
          SizedBox(height: 60.h),
          CustomTextField(
            width: 320.w,
            controller: passwordController,
            title: 'Password',
            hintText: '*************',
            obscureText: true,
          ),
          SizedBox(height: 10.h),
          CustomTextField(
            width: 320.w,
            controller: confirmPasswordController,
            title: 'Confirm Password',
            hintText: '*************',
            obscureText: true,
          ),
          SizedBox(height: 90.h),
          BlocConsumer<SetPasswordCubit, SetPasswordState>(
            listener: (context, state) {
              if (state is SetPasswordSuccess) {
                customSnackBar(context, 'Password reset successful');
                GoRouter.of(context).push(AppRouter.kSetPasswordSuccess);
              } else if (state is SetPasswordFailure) {
                customSnackBar(context, state.errorMessage);
              }
            },
            builder: (context, state) {
              return CustomButton(
                text: state is SetPasswordLoading
                    ? 'Resetting...'
                    : 'Reset Password',
                onTap: state is SetPasswordLoading
                    ? null
                    : () {
                        String password = passwordController.text.trim();
                        String confirmPassword =
                            confirmPasswordController.text.trim();

                        if (password.isNotEmpty && confirmPassword.isNotEmpty) {
                          context.read<SetPasswordCubit>().setPassword(
                                password: password,
                                confirmPassword: confirmPassword,
                              );
                        } else {
                          customSnackBar(context, 'Please fill in all fields');
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
