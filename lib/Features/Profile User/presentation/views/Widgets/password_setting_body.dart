import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/password%20change%20cubit/password_change_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/password%20change%20cubit/password_change_state.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/custom_bottom.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/text_field_profile.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/setting_profile_view.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/buttom_text_forget_password.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_and_icon_arrowBack.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';
import 'package:sehatak/core/function/validate_function.dart';

class PasswordSettingBody extends StatelessWidget {
  PasswordSettingBody({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PasswordChangeCubit, PasswordChangeState>(
      listener: (context, state) {
        if (state is PasswordChangeSuccess) {
          customSnackBar(context, 'Password changed successfully');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingProfileView()),
          );
        } else if (state is PasswordChangeFailure) {
          customSnackBar(context, state.errMessage);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 25.h),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const CustomTextAndIconArrowback(
                text: 'Password Settings',
                colorText: usedColor,
                colorArrowIcon: usedColor,
              ),
              SizedBox(height: 60.h),
              TextFieldProfile(
                width: 320.w,
                title: 'Current Password',
                hintText: '*************',
                controller: passwordController,
                validator: validatePassword,
                hintTextColor: kPrimaryColor,
                isPassword: true,
              ),
              SizedBox(height: 20.h),
              const ButtomTextForgetPassword(),
              SizedBox(height: 25.h),
              TextFieldProfile(
                width: 320.w,
                title: 'New Password',
                hintText: '*************',
                controller: newPasswordController,
                validator: validatePassword,
                hintTextColor: kPrimaryColor,
                isPassword: true,
              ),
              SizedBox(height: 25.h),
              TextFieldProfile(
                width: 320.w,
                title: 'Confirm New Password',
                hintText: '*************',
                controller: confirmNewPasswordController,
                validator: (value) {
                  if (value != newPasswordController.text) {
                    return 'Passwords do not match';
                  }
                  return validatePassword(value);
                },
                hintTextColor: kPrimaryColor,
                isPassword: true,
              ),
              SizedBox(height: 80.h),
              Center(
                child: BlocBuilder<PasswordChangeCubit, PasswordChangeState>(
                  builder: (context, state) {
                    if (state is PasswordChangeLoading) {
                      return const CircularProgressIndicator(
                          color: kPrimaryColor);
                    }
                    return CustomButtomProfile(
                      text: "Change Password",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<PasswordChangeCubit>().changePassword(
                                currentPassword: passwordController.text,
                                newPassword: newPasswordController.text,
                                passwordConfirm:
                                    confirmNewPasswordController.text,
                              );
                        }
                      },
                      backgroundColor: kPrimaryColor,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
