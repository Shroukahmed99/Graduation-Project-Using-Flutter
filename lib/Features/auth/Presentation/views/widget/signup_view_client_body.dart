import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_with_signup.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_icon_buttom.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_and_icon_arrowBack.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_field.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_question.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_signUpWith.dart';
import 'package:sehatak/core/function/validate_function.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/utils/cache_helper.dart'; // ✅ استيراد CacheHelper

class SignupViewClientBody extends StatelessWidget {
  SignupViewClientBody({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();
  final GlobalKey<FormState> signupKey = GlobalKey();

  Future<void> saveData(BuildContext context) async {
    await CacheHelper.saveData(key: 'fullName', value: fullNameController.text);
    await CacheHelper.saveData(key: 'email', value: emailController.text);
    await CacheHelper.saveData(key: 'mobileNumber', value: mobileNumberController.text);
    await CacheHelper.saveData(key: 'password', value: passwordController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Sign-up successful! ✅")),
    );

    // ✅ تنظيف الحقول بعد التسجيل
    fullNameController.clear();
    emailController.clear();
    mobileNumberController.clear();
    passwordController.clear();
    passwordConfirmController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 25.h),
      child: Form(
        key: signupKey,
        child: ListView(
          children: [
            const CustomTextAndIconArrowback(text: 'Create Account'),
            SizedBox(height: 12.h),
            const CustomText(title: "Let's start!"),
            CustomTextField(
              width: 320.w,
              title: 'Full name',
              hintText: 'Enter your name',
              controller: fullNameController,
              validator: validateFullName,
            ),
            SizedBox(height: 5.h),
            CustomTextField(
              width: 320.w,
              title: 'Email',
              hintText: 'Enter your email',
              controller: emailController,
              validator: validateEmail,
            ),
            SizedBox(height: 5.h),
            CustomTextField(
              width: 320.w,
              title: 'Mobile number',
              hintText: 'Enter your number',
              controller: mobileNumberController,
              validator: validatePhone,
            ),
            SizedBox(height: 5.h),
            CustomTextField(
              width: 320.w,
              title: 'Password',
              hintText: '*************',
              obscureText: true,
              controller: passwordController,
              validator: validatePassword,
            ),
            SizedBox(height: 5.h),
            CustomTextField(
              width: 320.w,
              title: 'Confirm Password',
              hintText: '*************',
              obscureText: true,
              controller: passwordConfirmController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password confirmation is required';
                }
                if (value != passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            SizedBox(height: 18.h),
            const CustomTextWithSignup(),
            SizedBox(height: 18.h),
            CustomButton(
              text: 'Sign Up',
              onTap: () {
                if (signupKey.currentState!.validate()) {
                  saveData(context);
                  GoRouter.of(context).push(AppRouter.kGenderSelectionViewClient);
                }
              },
            ),
            SizedBox(height: 15.h),
            const CustomTextSignupwith(),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.w),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(icon: FontAwesomeIcons.google),
                  CustomIconButton(icon: Icons.facebook),
                ],
              ),
            ),
            CustomTextQuestion(
              title: 'Already have an account?',
              text: 'Login In',
              onPress: () {
                GoRouter.of(context).push(AppRouter.kLoginView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
