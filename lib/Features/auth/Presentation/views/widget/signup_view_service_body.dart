import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/auth/Presentation/views/login_view.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_icon_buttom.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_and_icon_arrowBack.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_field.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_question.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_signUpWith.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_with_signup.dart';
import 'package:sehatak/core/function/validate_function.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_button.dart';

class SignupViewServiceBody extends StatelessWidget {
  const SignupViewServiceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 25.h),
      child: Form(
        //key: signupKey,
        child: ListView(
          children: [
            const CustomTextAndIconArrowback(text: 'Create Account'),
            SizedBox(height: 12.h),
            const CustomText(title: "Let's start!"),
            CustomTextField(
              width: 320.w,
              title: 'Full name',
              hintText: 'Enter your name',
            ),
            SizedBox(height: 5.h),
            CustomTextField(
              width: 320.w,
              title: 'Email',
              hintText: 'Enter your email',
            ),
            SizedBox(height: 5.h),
            CustomTextField(
              width: 320.w,
              title: 'Mobile number',
              hintText: 'Enter your number',
            ),
            SizedBox(height: 5.h),
            CustomTextField(
              width: 320.w,
              title: 'Password',
              hintText: '*************',
              obscureText: true,
            ),
            SizedBox(height: 5.h),
            CustomTextField(
              width: 320.w,
              title: 'Confirm Password',
              hintText: '*************',
            ),
            SizedBox(height: 18.h),
            const CustomTextWithSignup(),
            SizedBox(height: 18.h),
            CustomButton(
              text: 'Sign Up',
              onTap: () {
                GoRouter.of(context).push(AppRouter.kJopSelectionView);
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
